$version: "2.0"

namespace com.consentframework.consenthistory.api.models.types

@documentation("Unique identifier for a consent change event.")
string ConsentEventId

@documentation("Type of consent change event.")
enum ConsentEventType {
    INSERT,
    MODIFY,
    REMOVE
}

@documentation("Date time string, using the ISO 8601 format.")
@timestampFormat("date-time")
timestamp DateTime
