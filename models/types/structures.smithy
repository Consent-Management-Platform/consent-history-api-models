$version: "2.0"

namespace com.consentframework.consenthistory.api.models.types

@documentation("Consent data represented by string key-value pairs. Keys must be between 1-64 characters long, values must be between 1-256 characters long, and up to 32 key-value pairs may be provided.")
@length(max: 32)
map ConsentData {
    @length(min: 1, max: 64)
    key: String

    @length(min: 1, max: 256)
    value: String
}

@documentation("Record of user consent.")
structure Consent {
    @required
    consentId: ConsentId

    @required
    consentVersion: Integer

    @required
    userId: UserId

    @required
    serviceId: ServiceId

    @required
    status: ConsentStatus

    consentType: ConsentType

    consentData: ConsentData

    expiryTime: DateTime
}

@documentation("A user consent change event.")
structure ConsentChangeEvent {
    @required
    consentId: ConsentId

    @required
    eventId: ConsentEventId

    @documentation("Consent event timestamp, using the ISO 8601 format.")
    @required
    eventTime: DateTime

    @documentation("Time when the Consent automatically expires, using the ISO 8601 format.")
    expiryTime: DateTime

    @documentation("Old consent data from before the change.")
    oldImage: Consent

    @documentation("New consent data after the change.")
    newImage: Consent
}

@documentation("List of user consent change events.")
list ConsentChangeEventList {
    member: ConsentChangeEvent
}
