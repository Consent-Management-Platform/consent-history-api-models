$version: "2.0"

namespace com.consentframework.consenthistory.api.models.operations

use com.consentframework.consenthistory.api.models.exceptions#InternalServiceException
use com.consentframework.consenthistory.api.models.exceptions#NotFoundException
use com.consentframework.consenthistory.api.models.types#ConsentChangeEventList
use com.consentframework.consenthistory.api.models.types#ConsentId
use com.consentframework.consenthistory.api.models.types#ServiceId
use com.consentframework.consenthistory.api.models.types#UserId

@documentation("Retrieve history for a given ServiceUserConsent.")
@readonly
@http(method: "GET", uri: "/v1/consent-history/services/{serviceId}/users/{userId}/consents/{consentId}", code: 200)
operation GetHistoryForServiceUserConsent {
    input: GetHistoryForServiceUserConsentInput
    output: GetHistoryForServiceUserConsentOutput
    errors: [
        InternalServiceException,
        NotFoundException
    ]
}

@input
structure GetHistoryForServiceUserConsentInput {
    @required
    @httpLabel
    consentId: ConsentId

    @required
    @httpLabel
    serviceId: ServiceId

    @required
    @httpLabel
    userId: UserId
}

@output
structure GetHistoryForServiceUserConsentOutput {
    data: ConsentChangeEventList
}
