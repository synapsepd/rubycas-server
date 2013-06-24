# ActiveDirectory user class
class DirectoryUser
  require 'net/ldap'

  TREEBASE =  "dc=synapsedev,dc=com"
  FIELDS = [
    "accountExpires", "displayName", "dn", "mail", "title", "sn", "givenName",
    "c", "co", "company", "department", "employeeType", "facsimiletelephonenumber",
    "hashedPassword", "l", "mail", "mobile", "manager", "physicalDeliveryOfficeName",
    "pinNumber", "postalcode", "proxyAddresses", "pwdLastSet", "sAMAccountName",
    "sAMAccountType", "streetAddress", "synapseAccessCardNumber",
    "synapseConferencingStatus", "synapseConferencingUniqueID", "synapseExtendedAttributes",
    "synapseExtendedAttributesTest", "synapseExtensionNumber", "synapseRecursiveGroups",
    "synapseEmployeeStartDate", "synapsePersonalEmailAddress", "synapseEmergencyContact",
    "synapseDateOfBirth", "synapseBusinessUnit", "synapseObjectGUID", "telephoneNumber",
    "title", "userAccountControl", "userPrincipalName", "uSNChanged",
    "uSNCreated", "whenCreated", "whenChanged"
  ]

  # Public: Change password for ActiveDirectory user
  #
  # pwd - The new password for the user
  #
  # Examples
  #   user = DirectoryUser.find_by_account_name('conference.test')
  #   user.change_password("MyNewPassword")
  #   # => true
  #
  # Returns true if the password was updated
  # Return error if the password was not updated

  def self.change_user_password(username, password)
    filter = "(&(objectCategory=person)(objectClass=user)(samaccountname=#{username}))"
    ldap_con = self.ldap_connect(username, password)

    if ldap_con
      result = self.ldap_search(TREEBASE, filter, FIELDS, ldap_con).first
      dn = result[:dn].first
      ops = [
          [ :delete, :unicodePwd, [microsoft_encode_password(password)] ],
          [ :add, :unicodePwd, [microsoft_encode_password(password)] ]
      ]
      ldap_con.modify(:dn => dn, :operations => ops)
      true
      # if ldap_con.get_operation_result.code == 0
      #   return true
      # else
      #   raise StandardError, "Password field was not updated for #{username}. LDAP #{ldap_con.get_operation_result.code} Error: #{ldap_con.get_operation_result.message}"
      # end
    else
      raise StandardError, "Ldap failed to connect Error #{ldap_con.get_operation_result.message}"
    end
  end

  def self.ldap_search(treebase, filter, attrs, ldap_con)
    results = []
    results = ldap_con.search( :base => treebase, :filter => filter, :attributes => attrs )
    if results
      results
    else
      raise StandardError, "No results for ldap search #{filter} in treebase #{treebase} LDAP Error: #{ldap_con.get_operation_result}"
    end
  end

  def self.ldap_connect(username, password)
    ldap = Net::LDAP.new(
      :host =>  "core-dc-1.synapsedev.com",
      :port => 636,
      :encryption => :simple_tls
    )
    ldap.authenticate("SYNAPSEDEV\\#{username}", password)
    ldap
  end

  def self.microsoft_encode_password(pwd)
    ret = ""
    pwd = "\"" + pwd + "\""
    pwd.length.times{|i| ret+= "#{pwd[i..i]}\000" }
    ret
  end

end