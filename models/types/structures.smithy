$version: "2.0"

namespace com.consentframework.consenthistory.api.models.types

use com.consentframework.shared.models.consent#Consent
use com.consentframework.shared.models.consent#ConsentId

@documentation("A user consent change event.")
structure ConsentChangeEvent {
    @required
    consentId: ConsentId

    @required
    eventId: ConsentEventId

    @documentation("Consent event timestamp, using the ISO 8601 format.")
    @required
    eventTime: DateTime

    @required
    eventType: ConsentEventType

    @documentation("Old consent data from before the change.")
    oldImage: Consent

    @documentation("New consent data after the change.")
    newImage: Consent
}

@documentation("List of user consent change events.")
list ConsentChangeEventList {
    member: ConsentChangeEvent
}

@documentation("A specific consent's ID and associated consent change events.")
structure ConsentHistory {
    @required
    consentId: ConsentId,

    history: ConsentChangeEventList
}

@documentation("List of consent histories.")
list ConsentHistoryList {
    member: ConsentHistory
}
