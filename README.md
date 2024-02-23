# CubeAuditing
Samples for auditing queries on IRIS BI cubes and analyzing audit data

## Setup
1. Import classes into the namespace where you want to audit BI query activity and compile them.
2. Enable logging by running the following command in that namespace: 
   ```
   do ##class(Sample.AuditQueryLog).Init()
   ``` 
   This will set ^DeepSee.AuditQueryCode so that Sample.AuditQueryLog:InsertQuery() will run (and create a new Sample.AuditQueryLog record) each time an MDX query is run in this namespace.
3. Register AuditQueryLogCube in the Cube Registry for the namespace, schedule build and synchronize tasks as appropriate, and build it once from the Cube Registry (it may not yet have any data, unless you first run an MDX query).

## ZPM Setup
Run `zpm "install CubeAuditing"` from a Terminal session in the namespace where you want to install the samples. Then proceed to step 3 of the setup instructions above.

## Background
For more information on monitoring queries on IRIS BI cubes and cleaning up unused cubes based on this monitoring, see [this InterSystems Developer Community article](https://community.intersystems.com/post/monitoring-bi-cube-usage-and-cleaning-unused-cubes).

## DOCKER Support

### Prerequisites   
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.    
### Installation    
Clone/git pull the repo into any local directory
```
$ git clone https://github.com/sduncan01/CubeAuditing.git  
```
Open the terminal in this directory and run:
```
$ docker-compose build
```
Run IRIS container with your project:
```
$ docker-compose up -d
```
Test from docker console
```
$ docker-compose exec iris1 iris session iris
USER>
```
or using **WebTerminal**
```
http://localhost:42773/terminal/
```
## Documentation and Discussion
See the [Article on InterSystems Developer Community](https://community.intersystems.com/post/monitoring-bi-cube-usage-and-cleaning-unused-cubes)
