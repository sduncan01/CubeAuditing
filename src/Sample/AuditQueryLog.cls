Class Sample.AuditQueryLog Extends %Persistent
{

Property queryDateTime As %TimeStamp;

Property username As %String(MAXLEN = 100);

Property cubeName As %String(MAXLEN = 200);

Property queryText As %String(MAXLEN = 30000);

Property processId As %String(MAXLEN = 20);

Property queryKey As %String(MAXLEN = 50);

Parameter DSTIME = "AUTO";

/// Usage: set ^DeepSee.AuditQueryCode = "do ##class(Sample.AuditQueryLog).InsertQuery(.%dsResultSet,%dsQueryText,%dsCubeName)"
ClassMethod InsertQuery(resultSet As %DeepSee.ResultSet, queryText As %String, cubeName As %String) As %Status
{
	set queryDateTime = $zdt($h,3)
	set queryKey = resultSet.%GetQueryKey()
	set processId = $job
	set username = $get(%dsUserName,$username)
	set cubeName = $zconvert(cubeName,"l")
	
	set currQuery = ..%New()
	set currQuery.queryDateTime = queryDateTime
	set currQuery.username = username
	set currQuery.cubeName = cubeName
	set currQuery.queryText = queryText
	set currQuery.processId = processId
	set currQuery.queryKey = queryKey
	
	set sc = currQuery.%Save()
	
	return sc
}

Storage Default
{
<Data name="AuditQueryLogDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>queryDateTime</Value>
</Value>
<Value name="3">
<Value>username</Value>
</Value>
<Value name="4">
<Value>cubeName</Value>
</Value>
<Value name="5">
<Value>queryText</Value>
</Value>
<Value name="6">
<Value>processId</Value>
</Value>
<Value name="7">
<Value>queryKey</Value>
</Value>
</Data>
<DataLocation>^Sample.AuditQueryLogD</DataLocation>
<DefaultData>AuditQueryLogDefaultData</DefaultData>
<IdLocation>^Sample.AuditQueryLogD</IdLocation>
<IndexLocation>^Sample.AuditQueryLogI</IndexLocation>
<StreamLocation>^Sample.AuditQueryLogS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
