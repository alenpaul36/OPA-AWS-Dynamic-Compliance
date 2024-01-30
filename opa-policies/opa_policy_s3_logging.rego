package s3_bucket_logging

default compliant = false

compliant = true {
    input.resourceType == "AWS::S3::Bucket"
    input.supplementaryConfiguration.LoggingConfiguration.loggingEnabled == true
}
