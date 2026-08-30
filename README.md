# SAA Flight Booking System — MDB622 PM-02

Database design and manipulation practical for CTU Training Solutions, OCC: Software Engineer Year 2.

## Important note on database technology

The official assessment (PM-02) specifies Microsoft SQL Server and SSMS. This implementation
uses PostgreSQL instead, with Npgsql as the ADO.NET-compatible provider for the C# console
application. The database structure, keys, relationships, and business logic exactly match the
required ERD — only the SQL dialect and connectivity provider differ from the assessment's
literal wording.

## Structure

- `Database/` — one SQL script per task (Tasks 3–4, 6–10)
- `SAAFlightBookingApp/` — C# console application (Task 5)
- `Documentation/` — ERD, business requirements, user stories
- `Screenshots/` — evidence per task, plus Azure DevOps evidence
