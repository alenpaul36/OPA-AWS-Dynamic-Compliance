package lambda_tracing

default compliant = false

compliant = true {
    input.resourceType == "AWS::Lambda::Function"
    input.configuration.tracingConfig.mode == "Active"
}

compliant = false {
    input.resourceType == "AWS::Lambda::Function"
    not input.configuration.tracingConfig
}

compliant = false {
    input.resourceType == "AWS::Lambda::Function"
    input.configuration.tracingConfig.mode != "Active"
}