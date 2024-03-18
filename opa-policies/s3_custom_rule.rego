package s3_custom_rule

default compliant = false

compliant = true {
    input.resourceType == "AWS::S3::Bucket"
    input.configuration.VersioningConfiguration.Status == "Enabled"
    input.configuration.AccessControlList.Grants[_].Grantee.URI == null
    input.configuration.ServerSideEncryptionConfiguration.Rules[_].ApplyServerSideEncryptionByDefault.SSEAlgorithm != null
}

compliant = false {
    input.resourceType == "AWS::S3::Bucket"
    input.configuration.VersioningConfiguration.Status != "Enabled"
}

compliant = false {
    input.resourceType == "AWS::S3::Bucket"
    input.configuration.AccessControlList.Grants[_].Grantee.URI != null
}

compliant = false {
    input.resourceType == "AWS::S3::Bucket"
    input.configuration.ServerSideEncryptionConfiguration.Rules[_].ApplyServerSideEncryptionByDefault.SSEAlgorithm == null
}