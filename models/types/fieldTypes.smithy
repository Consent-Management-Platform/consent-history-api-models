$version: "2.0"

namespace com.consentframework.consenthistory.api.models.types

// Allow alphanumeric characters as well as '-', '_', and '.'.
// For now excluding any characters that may be encoded when passed through request path parameters.
@mixin
@pattern("^[\\w\\-\\.]{3,128}$")
string UniqueId

@documentation("Unique identifier for a Consent.")
string ConsentId with [UniqueId]

@documentation("Unique identifier for a service.")
string ServiceId with [UniqueId]

@documentation("Unique identifier for a user.")
string UserId with [UniqueId]

@documentation("Consent type.")
string ConsentType with [UniqueId]

@documentation("Unique identifier for a consent change event.")
string ConsentEventId with [UniqueId]

@documentation("Current status of a Consent.")
enum ConsentStatus {
    ACTIVE,
    EXPIRED,
    REVOKED
}

@documentation("Date time string, using the ISO 8601 format.")
@timestampFormat("date-time")
timestamp DateTime
