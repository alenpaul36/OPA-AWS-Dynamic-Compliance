package ec2_custom_rule

default compliant = false

compliant = true {
    input.resourceType == "AWS::EC2::Instance"
    input.configuration.instanceType == "t2.micro"
    input.configuration.vpcId == "vpc-abc123"
    tag := input.configuration.tags[_]
    tag.key == "Environment"
    tag.value == "Production"
}

compliant = false {
    input.resourceType == "AWS::EC2::Instance"
    input.configuration.instanceType != "t2.micro"
}

compliant = false {
    input.resourceType == "AWS::EC2::Instance"
    input.configuration.vpcId != "vpc-abc123"
}

compliant = false {
    input.resourceType == "AWS::EC2::Instance"
    not anyTrue(input.configuration.tags)
}

anyTrue(tags) {
    tag := tags[_]
    tag.key == "Environment"
    tag.value == "Production"
}