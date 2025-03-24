$version: "2.0"

namespace com.consentframework.consenthistory.api.models

use aws.api#service
use aws.apigateway#requestValidator
use aws.protocols#restJson1
use com.consentframework.consenthistory.api.models.operations#GetHistoryForServiceUserConsent

@aws.apigateway#integration(
    httpMethod: "POST",
    type: "aws_proxy",
    // This URI includes placeholders that must be replaced in CDK code before deployment
    uri: "arn:${AWS::Partition}:apigateway:${AWS::Region}:lambda:path/2015-03-31/functions/${LambdaFunction.Arn}/invocations"
)
@requestValidator("full")
@restJson1
@title("Consent History API")
@service(
    sdkId: "ConsentHistory",
    arnNamespace: "execute-api"
)
service ConsentHistoryApi {
    version: "2025-03-23"
    operations: [
        GetHistoryForServiceUserConsent
    ]
}
