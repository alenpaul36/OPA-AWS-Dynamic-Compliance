package iam_least_privileges

default compliant = false

# Check if the user has only the 's3:ListBucket' and 's3:GetObject' permissions
compliant = true {
    input.resourceType == "AWS::IAM::User"
    count(input.configuration.attachedManagedPolicies) == 1
    input.configuration.attachedManagedPolicies[_].policyName == "AmazonS3ReadOnlyAccess"
}

# If the user has any other permissions, they are non-compliant
compliant = false {
    input.resourceType == "AWS::IAM::User"
    count(input.configuration.attachedManagedPolicies) != 1
}

compliant = false {
    input.resourceType == "AWS::IAM::User"
    input.configuration.attachedManagedPolicies[_].policyName != "AmazonS3ReadOnlyAccess"
}