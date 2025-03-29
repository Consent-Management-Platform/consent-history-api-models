$version: "2.0"

namespace com.consentframework.consenthistory.api.models.operations

use com.consentframework.consenthistory.api.models.types#ConsentChangeEventList
use com.consentframework.shared.models.consent#ConsentId
use com.consentframework.shared.models.consent#ServiceId
use com.consentframework.shared.models.consent#UserId
use com.consentframework.shared.models.exceptions#InternalServiceException
use com.consentframework.shared.models.exceptions#NotFoundException

@documentation("Retrieve history for a given service user consent.")
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
