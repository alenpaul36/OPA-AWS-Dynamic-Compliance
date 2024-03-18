package security_group_custom_rule

default compliant = false

compliant = true {
    input.resourceType == "AWS::EC2::SecurityGroup"
    count(input.configuration.inUseBy) > 0
}

compliant = false {
    input.resourceType == "AWS::EC2::SecurityGroup"
    count(input.configuration.inUseBy) == 0
}