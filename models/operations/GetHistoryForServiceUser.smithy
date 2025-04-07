$version: "2.0"

namespace com.consentframework.consenthistory.api.models.operations

use com.consentframework.consenthistory.api.models.types#ConsentHistoryList
use com.consentframework.shared.models.consent#ServiceId
use com.consentframework.shared.models.consent#UserId
use com.consentframework.shared.models.exceptions#InternalServiceException
use com.consentframework.shared.models.exceptions#NotFoundException

@documentation("Retrieve history for a given service user.")
@readonly
@http(method: "GET", uri: "/v1/consent-history/services/{serviceId}/users/{userId}/consents", code: 200)
operation GetHistoryForServiceUser {
    input: GetHistoryForServiceUserInput
    output: GetHistoryForServiceUserOutput
    errors: [
        InternalServiceException,
        NotFoundException
    ]
}

@input
structure GetHistoryForServiceUserInput {
    @required
    @httpLabel
    serviceId: ServiceId

    @required
    @httpLabel
    userId: UserId
}

@output
structure GetHistoryForServiceUserOutput {
    data: ConsentHistoryList
}
