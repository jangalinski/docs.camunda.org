---

title: 'Multi-Tenancy'
category: 'Process Engine'

---

Sometimes it is desired to share one Camunda installation between multiple independent parties, also referred to as *tenants*. While sharing an installation means sharing computational resources, the tenants' data should be separated from each other. This tutorial shows how to work with the [one process engine per tenant approach](ref:/guides/user-guide/#process-engine-multi-tenancy-one-process-engine-per-tenant).

In detail it explains how to:

* configure one process engine per tenant on a JBoss Application Server such that data is isolated by database schemas
* develop a process application with tenant-specific deployments
* access the correct process engine from a REST resource based on a tenant identifier

See the [user guide](ref:/guides/user-guide/#process-engine-multi-tenancy) for a general introduction on multi-tenancy and the different options Camunda offers.

## Before Starting

Before starting, make sure to download the [Camunda BPM JBoss distribution](http://camunda.org/download/) and extract it to a folder. We will call this folder `$CAMUNDA_HOME` in the following explanations.

## Configuring the Database

Before configuring process engines, we have to set up a database schema for every tenant. In general, you can use the camunda database setup scripts. Nevertheless, you may have to adapt the creation scripts to point to the correct schemas. In this tutorial, we have prepared these scripts for you.

Start up JBoss by running `$CAMUNDA_HOME/start-camunda.{bat/sh}`. After startup, open your browser and go to `http://localhost:8080/h2/h2`. Enter the following configuration before connecting:

* **Driver Class**: org.h2.Driver
* **JDBC URL**: jdbc:h2:./camunda-h2-dbs/process-engine
* **User Name**: sa
* **Password**: sa

Download the [database creation script for tenant 1](https://github.com/camunda/camunda-bpm-examples/blob/master/multi-tenancy/schema-isolation/camunda.h2.create.engine.tenant1.sql) and paste it into the SQL script execution window. Hit *Run*. A new schema `TENANT_1` should have been created and it should contain the process engine database tables. Perform the same procedure with the [database script for tenant 2](https://github.com/camunda/camunda-bpm-examples/blob/master/multi-tenancy/schema-isolation/camunda.h2.create.engine.tenant2.sql). A new schema `TENANT_2` should appear.

Stop JBoss.

## Configuring Process Engines

In this step, we configure a process engine for each tenant. We ensure that these engines access the database schemas we have previously created. This way, process data of tenant cannot interfere with that of another.

Open the file `$CAMUNDA_HOME/server/jboss-as-{version}/standalone/configuration/standalone.xml`. In that file, navigate to the configuration of the camunda jboss subsystem, declared in an XML element `<subsystem xmlns="urn:org.camunda.bpm.jboss:1.1">`. In this file, add two entries to the `<process-engines>` section (do *not* remove default engine configuration):

The configuration of the process engine for tenant 1:

```xml
<process-engine name="tenant1">
  <datasource>java:jboss/datasources/ProcessEngine</datasource>
  <history-level>none</history-level>
  <properties>
      <property name="databaseTablePrefix">TENANT_1.</property>
      <property name="jobExecutorAcquisitionName">default</property>

      <property name="isAutoSchemaUpdate">false</property>
      <property name="authorizationEnabled">true</property>
      <property name="jobExecutorDeploymentAware">true</property>
  </properties>
  <plugins>
    <!-- plugin enabling Process Application event listener support -->
    <plugin>
      <class>org.camunda.bpm.application.impl.event.ProcessApplicationEventListenerPlugin</class>
    </plugin>
  </plugins>
</process-engine>
```

The configuration of the process engine for tenant 2:

```xml
<process-engine name="tenant2">
  <datasource>java:jboss/datasources/ProcessEngine</datasource>
  <history-level>none</history-level>
  <properties>
      <property name="databaseTablePrefix">TENANT_2.</property>
      <property name="jobExecutorAcquisitionName">default</property>

      <property name="isAutoSchemaUpdate">false</property>
      <property name="authorizationEnabled">true</property>
      <property name="jobExecutorDeploymentAware">true</property>
  </properties>
  <plugins>
    <!-- plugin enabling Process Application event listener support -->
    <plugin>
      <class>org.camunda.bpm.application.impl.event.ProcessApplicationEventListenerPlugin</class>
    </plugin>
  </plugins>
</process-engine>
```

(find the complete `standalone.xml` [here](https://github.com/camunda/camunda-bpm-examples/blob/master/multi-tenancy/schema-isolation/standalone.xml))

By having a look at the `datasource` configuration, you will notice that the data source is shared between all engines. The property `databaseTablePrefix` points the engines to different database schemas. This makes it possible to shares resources like a database connection pool between both engines. Also have a look at the entry `jobExecutorAcquisitionName`. The job acquisition is part of the job executor, a component responsible for executing asynchronous tasks in the process engine (cf. the `job-executor` element in the subsystem configuration). Again, the `jobExecutorAcquisitionName` configuration enables reuse of one acquisition thread for all engines.

The approach of configuring multiple engines also allows you to differ engine configurations apart from the database-related parameters. For example, you can activate process engine plugins for some tenants but not for all.

## Develop a Tenant-Aware Process Application

In this step, we describe a process application that deploys different processes for the two tenants. It also exposes a REST resource that uses CDI to transparently interact with the correct process engine based on a tenant identifier.

<div class="alert alert-info">
  <p>
    <p>The following descriptions highlight the concepts related to implementing multi-tenancy but are not a step-by-step explanation to develop along. Instead, make sure to checkout the <a href="https://github.com/camunda/camunda-bpm-examples/tree/master/multi-tenancy/schema-isolation">code on github</a>. The code can be built and deployed to JBoss right away and contains all the snippets explained in the following.</p>
  </p>
</div>


### Setup the process application

In the project, we have set up a plain camunda EJB process application.

In [pom.xml](https://github.com/camunda/camunda-bpm-examples/blob/master/multi-tenancy/schema-isolation/pom.xml), the `camunda-engine-cdi` and `camunda-ejb-client` dependencies are added:

```xml
<dependency>
  <groupId>org.camunda.bpm</groupId>
  <artifactId>camunda-engine-cdi</artifactId>
</dependency>

<dependency>
  <groupId>org.camunda.bpm.javaee</groupId>
  <artifactId>camunda-ejb-client</artifactId>
</dependency>
```

These are required to inject process engines via CDI.

### Configure a tenant-specific deployment

In the folder `src/main/resources`, we have added a folder `processes` and two subfolders `tenant1` and `tenant2`. These folder contain a [process for tenant 1](https://github.com/camunda/camunda-bpm-examples/tree/master/multi-tenancy/schema-isolation/src/main/resources/processes/tenant1) and a [process for tenant 2](https://github.com/camunda/camunda-bpm-examples/tree/master/multi-tenancy/schema-isolation/src/main/resources/processes/tenant2) respectively.

In order to deploy the two definitions to the two different engines, we have added a file `src/main/resources/META-INF/processes.xml` with the following content:

```xml
<process-application
  xmlns="http://www.camunda.org/schema/1.0/ProcessApplication"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

  <process-archive name="tenant1-archive">
    <process-engine>tenant1</process-engine>
    <properties>
      <property name="resourceRootPath">classpath:processes/tenant1/</property>

      <property name="isDeleteUponUndeploy">false</property>
      <property name="isScanForProcessDefinitions">true</property>
    </properties>
  </process-archive>

  <process-archive name="tenant2-archive">
    <process-engine>tenant2</process-engine>
    <properties>
      <property name="resourceRootPath">classpath:processes/tenant2/</property>

      <property name="isDeleteUponUndeploy">false</property>
      <property name="isScanForProcessDefinitions">true</property>
    </properties>
  </process-archive>

</process-application>
```

This file declares two *process archives*. By the `process-engine` element, we can specify the engine to which an archive should be deployed. By the `resourceRootPath`, we can assign different portions of the contained process definitions to different process archives.

### Build a Simple JAXRS Resource

To showcase the programming model for multi-tenancy with CDI, we have added a simple REST resource that returns all deployed process definitions for a process engine. The resource has the following [source](https://github.com/camunda/camunda-bpm-examples/blob/master/multi-tenancy/schema-isolation/src/main/java/org/camunda/bpm/tutorial/multitenancy/ProcessDefinitionResource.java):

```java
@Path("/process-definition")
public class ProcessDefinitionResource {

  @Inject
  protected ProcessEngine processEngine;

  @GET
  @Produces(MediaType.APPLICATION_JSON)
  public List<ProcessDefinitionDto> getProcessDefinitions() {
    List<ProcessDefinition> processDefinitions =
        processEngine.getRepositoryService().createProcessDefinitionQuery().list();

    return ProcessDefinitionDto.fromProcessDefinitions(processDefinitions);
  }
}
```

Note that the distinction between tenants is not made in this resource.

### Make CDI Injection Tenant-aware

We want the injected process engine to always be the one that matches the current tenant making a REST request. For this matter, we have added a request-scoped [tenant bean](https://github.com/camunda/camunda-bpm-examples/blob/master/multi-tenancy/schema-isolation/src/main/java/org/camunda/bpm/tutorial/multitenancy/Tenant.java):

```java
@RequestScoped
public class Tenant {

  protected String id;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }
}
```

To populate this bean with the tenant ID for the current user, we add a [RestEasy interceptor](https://github.com/camunda/camunda-bpm-examples/blob/master/multi-tenancy/schema-isolation/src/main/java/org/camunda/bpm/tutorial/multitenancy/TenantInterceptor.java). This interceptor is called before a REST request is dispatched to the `ProcessDefinitionResource`. It has the following contents:

```java
@Provider
@ServerInterceptor
public class TenantInterceptor implements PreProcessInterceptor {

  protected static final Map<String, String> USER_TENANT_MAPPING = new HashMap<String, String>();

  static {
    USER_TENANT_MAPPING.put("kermit", "tenant1");
    USER_TENANT_MAPPING.put("gonzo", "tenant2");
  }

  @Inject
  protected Tenant tenant;

  public ServerResponse preProcess(HttpRequest request, ResourceMethod method) throws Failure, WebApplicationException {
    List<String> user = request.getUri().getQueryParameters().get("user");

    if (user.size() != 1) {
      throw new WebApplicationException(Status.BAD_REQUEST);
    }

    String tenantForUser = USER_TENANT_MAPPING.get(user.get(0));
    tenant.setId(tenantForUser);

    return null;
  }
}
```

Note that the tenant ID is determined based on a simple static map. Of course, in real-world applications one would implement a more sophisticated lookup procedure here.

To resolve the process engine based on the tenant, we have [specialized the process engine producer](https://github.com/camunda/camunda-bpm-examples/blob/master/multi-tenancy/schema-isolation/src/main/java/org/camunda/bpm/tutorial/multitenancy/TenantAwareProcessEngineServicesProducer.java) bean as follows:

```java
@Specializes
public class TenantAwareProcessEngineServicesProducer extends ProcessEngineServicesProducer {

  @Inject
  private Tenant tenant;

  @Override
  @Named
  @Produces
  @RequestScoped
  public ProcessEngine processEngine() {
    String processEngineName = tenant.getId();

    if (processEngineName != null) {
      ProcessEngine processEngine = BpmPlatform.getProcessEngineService().getProcessEngine(processEngineName);

      if (processEngine != null) {
        return processEngine;
      } else {
        throw new ProcessEngineException("No process engine found for tenant id '" + processEngineName + "'.");
      }

    } else {
      throw new ProcessEngineException("No tenant id specified. A process engine can only be retrieved based on a tenant.");
    }
  }

  @Override
  @Produces
  @Named
  @RequestScoped
  public RuntimeService runtimeService() {
    return processEngine().getRuntimeService();
  }

  ...
}
```

The producer determines the engine based on the current tenant. It encapsulates the logic of accessing the process engine for the current tenant entirely. Any bean accessing this engine can simply declare `@Inject ProcessEngine` without specifying which specific engine is addressed.

## Deploy the Application on JBoss

Start up JBoss. Build the process application and deploy the resulting war file on JBoss.

Make a GET request against the following URL to get all process definitions deployed to tenant 1's engine: http://localhost:8080/multi-tenancy-tutorial/process-definition?user=kermit

Only the process for tenant 1 is returned.

Make a GET request against the following URL to get all process definitions deployed to tenant 2's engine:
http://localhost:8080/multi-tenancy-tutorial/process-definition?user=gonzo

Only the process for tenant 2 is returned.

Go to Camunda Cockpit and switch the engine to `tenant1` on the following URL (you may be asked to create an admin user first):
http://localhost:8080/camunda/app/cockpit/tenant1

Only the process for tenant 1 shows up. You can check the same for tenant 2 by switching to engine `tenant2`.

And you're done! :)