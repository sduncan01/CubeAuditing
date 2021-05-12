# CubeAuditing
Samples for auditing queries on IRIS BI cubes and analyzing audit data

## Setup
1. Import classes into the namespace where you want to audit BI query activity and compile them.
2. Enable logging by running the following command in that namespace: `do ##class(Sample.AuditQueryLog).Init()`. This will set ^DeepSee.AuditQueryCode so that Sample.AuditQueryLog:InsertQuery() will run (and create a new Sample.AuditQueryLog record) each time an MDX query is run in this namespace.
3. Register AuditQueryLogCube in the Cube Registry for the namespace, schedule build and synchronize tasks as appropriate, and build it once from the Cube Registry (it may not yet have any data, unless you first run an MDX query).

## Background
For more information on monitoring queries on IRIS BI cubes and cleaning up unused cubes based on this monitoring, see [this InterSystems Developer Community article](https://community.intersystems.com/post/monitoring-bi-cube-usage-and-cleaning-unused-cubes).
