package security_group_custom_rule

default compliant = false

compliant = true {
    input.resourceType == "AWS::EC2::SecurityGroup"
    not anyTrue(input.configuration.ipPermissions)
}

compliant = false {
    input.resourceType == "AWS::EC2::SecurityGroup"
    anyTrue(input.configuration.ipPermissions)
}

anyTrue(ipPermissions) {
    ipPermission := ipPermissions[_]
    ipRange := ipPermission.ipRanges[_]
    ipRange.cidrIp == "0.0.0.0/0"
    ipPermission.fromPort == 22
}

anyTrue(ipPermissions) {
    ipPermission := ipPermissions[_]
    ipRange := ipPermission.ipRanges[_]
    ipRange.cidrIp == "0.0.0.0/0"
    ipPermission.fromPort == 3389
}