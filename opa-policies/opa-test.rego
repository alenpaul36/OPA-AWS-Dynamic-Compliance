package mfa_existence

default compliant = false

compliant = true {
    input.resourceType == "AWS::IAM::Account"
    input.configuration.mfaEnabled == true
}

