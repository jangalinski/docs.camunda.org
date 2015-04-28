---

title: 'Core Engine Configuration Properties'
category: 'Process Engine'

keywords: 'core'

---

Here you can see the properties that you can configure for the core settings of the Camunda BPM process engine.

## AuthorizationEnabled

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      AuthorizationEnabled
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    No
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description:
  </dt>
  <dd>
    This property functions as a switch to determine whether the process engine performs authorization checks or not.
  </dd>
  <dt>
    Values:
  </dt>
  <dd>
    <code>true</code>, <code>false</code>*
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## CreateIncidentOnFailedJobEnabled 

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      CreateIncidentOnFailedJobEnabled
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    IS THIS PROPERTY REQUIRED? IF SO, WHEN?
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    This property functions as a switch to determine whether the process engine creates incidents when a job fails or not.
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## Classloader

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      Classloader
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    IS THIS PROPERTY REQUIRED? IF SO, WHEN?
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    Sets the classloader
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
N/A
```

## DatabaseSchemaUpdate

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      DatabaseSchemaUpdate
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    IS THIS PROPERTY REQUIRED? IF SO, WHEN?
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    <a href="ref:#process-engine-core-engine-configuration-properties-datasourcejndiname">DatasourceJndiName</a>, <a href="ref:#process-engine-core-engine-configuration-properties-databasetype">DatabaseType</a>, <a href="ref:#process-engine-core-engine-configuration-properties-datasource">datasource</a>, ...
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    Determines if an update of the database schema is performed after the database tables are checked.
  </dd>
  <dt>
    Values
  </dt>
  <dd>
    <code>true</code>, <code>false</code>, <code>Update_Create_Drop</code>
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## DataBaseType

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      DataBaseType
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Yes.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    <a href="ref:#process-engine-core-engine-configuration-properties-datasource">datasource</a>, ...
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    Determines which database is used.
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## Datasource

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      datasource
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Only if <a href="ref:#process-engine-core-engine-configuration-properties-jdbcurl">jdbcUrl</a> is <strong>not</strong> set.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    <a href="ref:#process-engine-core-engine-configuration-properties-jdbcurl">jdbcUrl</a>, ...
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    Here you can configure the datasource for your database.
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## DataSourceJndiName

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      DataSourceJndiName
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    IS THIS PROPERTY REQUIRED? IF SO, WHEN?
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    <a href="ref:#process-engine-core-engine-configuration-properties-datasource">datasource</a>, ...
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    Sets the JNDI name of the datasource.
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## DefaultNumberOfRetries

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      DefaultNumberOfRetries
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    IS THIS PROPERTY REQUIRED? IF SO, WHEN?
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    Sets the default number of retries for a failed job.
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## HintJobExecutor

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      HintJobExecutor
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    IS THIS PROPERTY REQUIRED? IF SO, WHEN?
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## History

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      History
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    IS THIS PROPERTY REQUIRED? IF SO, WHEN?
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    Sets the history level
  </dd>
  <dt>
    Values
  </dt>
  <dd>
    Activity, Audit, Full, None
  </dd>
</dl>

#### Examples

Java
```java
ProcessEngine processEngine = ProcessEngineConfiguration
  .createProcessEngineConfigurationFromResourceDefault()
  .setHistory(ProcessEngineConfiguration.HISTORY_FULL)
  .buildProcessEngine();
```

Spring XML
```xml
<property name="history">audit</property>
```

Camunda Deployment Descriptor XML
```xml
<property name="history">audit</property>
```

## IdBlockSize

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      IdBlockSize
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    IS THIS PROPERTY REQUIRED? IF SO, WHEN?
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## JdbcDriver

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      JdbcDriver
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Only if <a href="ref:#process-engine-core-engine-configuration-properties-jdbcurl">jdbcUrl</a> is set.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    <a href="ref:#process-engine-core-engine-configuration-properties-datasource">datasource</a>, ...
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## JdbcMaxActiveConnections

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      JdbcMaxActiveConnections
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Only if <a href="ref:#process-engine-core-engine-configuration-properties-jdbcurl">jdbcUrl</a> is set.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## JdbcMaxWaitTime

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      JdbcMaxWaitTime
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Only if <a href="ref:#process-engine-core-engine-configuration-properties-jdbcurl">jdbcUrl</a> is set.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## JdbcPassword

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      JdbcPassword
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Only if <a href="ref:#process-engine-core-engine-configuration-properties-jdbcurl">jdbcUrl</a> is set.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    <a href="ref:#process-engine-core-engine-configuration-properties-datasource">datasource</a>, ...
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## JdbcPingConnectionNotUsedFor

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      JdbcPingConnectionNotUsedFor
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Only if <a href="ref:#process-engine-core-engine-configuration-properties-jdbcurl">jdbcUrl</a> is set.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## JdbcPingEnabled

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      JdbcPingEnabled
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Only if <a href="ref:#process-engine-core-engine-configuration-properties-jdbcurl">jdbcUrl</a> is set.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## JdbcPingQuery

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      JdbcPingQuery
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Only if <a href="ref:#process-engine-core-engine-configuration-properties-jdbcurl">jdbcUrl</a> is set.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## jdbcUrl

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      jdbcUrl
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Only if <a href="ref:#process-engine-core-engine-configuration-properties-datasource">datasource</a> is <strong>not</strong> set.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    jdbcPassword, jdbcUsername, <a href="ref:#process-engine-core-engine-configuration-properties-datasource">datasource</a>, ...
  </dd>
  <dt>
    Description
  <dt>
  <dd>
    Here you can set the URL of the JDBC driver(?)
  </dd>
</dl>


#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## JdbcUserName

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      JdbcUserName
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    Only if <a href="ref:#process-engine-core-engine-configuration-properties-jdbcurl">jdbcUrl</a> is set.
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    <a href="ref:#process-engine-core-engine-configuration-properties-datasource">datasource</a>, ...
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```

## JobExecutorActivate

<dl>
  <dt>Name:</dt>
  <dd>
    <code>
      JobExecutorActivate
    </code>
  </dd>
  <dt>
    Required:
  </dt>
  <dd>
    IS THIS PROPERTY REQUIRED? IF SO, WHEN?
  </dd>
  <dt>
    Related to:
  </dt>
  <dd>
    OTHER PROPERTIES THAT ARE RELATED TO THIS ONE
  </dd>
  <dt>
    Description
  </dt>
  <dd>
    BRIEF DESCRIPTION OF THE PROPERTY
  </dd>
</dl>

#### Examples

Java
```java
INSERT JAVA CODE SNIPPET
```

Spring XML
```xml
INSERT XML CODE SNIPPET
```

Camunda Deployment Descriptor XML
```xml
INSERT XML CODE SNIPPET
```