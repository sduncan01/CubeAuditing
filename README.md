# CubeAuditing
Samples for auditing queries on IRIS BI cubes and analyzing audit data

## Setup
1. Import classes the namespace where you want to audit BI query activity and compile them.
2. Enable logging by running the following command in that namespace: `set ^DeepSee.AuditQueryCode = "do ##class(Sample.AuditQueryLog).InsertQuery(.%dsResultSet,%dsQueryText,%dsCubeName)"`
3. Register AuditQueryLogCube in the Cube Registry for the namespace, schedule build and synchronize tasks as appropriate, and build it once from the Cube Registry (it may not yet have any data, unless you first run an MDX query).
