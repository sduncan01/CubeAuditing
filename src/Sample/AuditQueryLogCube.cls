/// Cube based on MDX query auditing data from Sample.AuditQueryLog
Class Sample.AuditQueryLogCube Extends %DeepSee.CubeDefinition [ DependsOn = Sample.AuditQueryLog, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="AuditQueryLogCube" displayName="AuditQueryLogCube" disabled="false" abstract="false" sourceClass="Sample.AuditQueryLog" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false">
  <dimension name="cube" disabled="false" hasAll="false" allCaption="All cube" allDisplayName="cube" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="cube" disabled="false" sourceProperty="cubeName" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="username" disabled="false" hasAll="false" allCaption="All username" allDisplayName="username" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="username" disabled="false" sourceProperty="username" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="queryDate" disabled="false" hasAll="false" allCaption="All queryDate" allDisplayName="queryDate" sourceProperty="queryDateTime" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="query year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="query month year" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="query DMY" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="queryTime" disabled="false" hasAll="false" allCaption="All endTime" allDisplayName="endTime" sourceProperty="queryDateTime" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="false">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="hour" disabled="false" timeFunction="HourNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
    <hierarchy name="H2" disabled="false" hidden="false">
      <level name="minute" disabled="false" timeFunction="MinuteNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="queryKey" disabled="false" hasAll="false" allCaption="All queryKey" allDisplayName="queryKey" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="queryKey" disabled="false" sourceProperty="queryKey" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Filters" disabled="false" hasAll="false" allCaption="All isSelectFrom" allDisplayName="isSelectFrom" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="false">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="isDrillthrough" disabled="false" sourceExpression="$SELECT($$$UPPER(%source.queryText) [ &quot;DRILLTHROUGH&quot;:1,1:0)" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <calculatedMember name="Distinct Query Keys" disabled="false" dimension="Measures" valueExpression="%KPI(&quot;%DeepSee.Distinct&quot;,&quot;DISTINCT&quot;,1,&quot;%level&quot;,&quot;[queryKey].[H1].[queryKey]&quot;,&quot;%CONTEXT&quot;)" hidden="false">
  </calculatedMember>
  <listing name="AuditQueryLog Details" disabled="false" listingType="table" fieldList="%ID,cubeName,queryDateTime,username,queryText,processId">
  </listing>
</cube>
}

Parameter DOMAIN;

}
