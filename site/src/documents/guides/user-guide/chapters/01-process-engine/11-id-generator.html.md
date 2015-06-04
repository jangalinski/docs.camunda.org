---

title: 'Id Generators'
category: 'Process Engine'

---

All persistent entities managed by the process engine (Process Instances, Tasks, ...) have unique
IDs. These Ids uniquely identify an individual task, process instance etc. When these entities are
persisted to the database, the ids are used as primary keys in the corresponding database tables.

Out of the box, the process engine provides two Id generator implementations.

### The Database Id Generator

The Database Id Generator  is implemented using a sequence Generator on top of the `ACT_RU_PROPERTY`
table.

This id generator is good for debugging and testing since it generates human readable ids.

> The Databse Id Generator should *never* be used in production since it cannot handle high levels
> of concurrency.

### The UUID Generator

The StrongUuidGenerator uses a UUID generator which uses the [Java Uuid Generator (JUG)][1] library
internally.

> Always use the StrongUuidGenerator for production setups.

In the [Camunda BPM Full Distributions](ref:#introduction-download-full-distribution), the
StrongUuidGenerator is preconfigured and the default Id Generator used by the process engine.

If you use an embedded process engine configuration and configure the process engine using Spring,
you need to add the follwing lines to the Spring configuration in order to enable the
`StrongUuidGenerator`:

```xml
<bean id="processEngineConfiguration" class="org.camunda.bpm.engine.impl.cfg.StandaloneInMemProcessEngineConfiguration">

  [...]

  <property name="idGenerator">
    <bean class="org.camunda.bpm.engine.impl.persistence.StrongUuidGenerator" />
  </property>

</bean>
```

In addition, you need the following maven dependency:

```xml
<dependency>
  <groupId>com.fasterxml.uuid</groupId>
  <artifactId>java-uuid-generator</artifactId>
  <scope>provided</scope>
  <version>3.1.2</version>
</dependency>
```

[1]: http://wiki.fasterxml.com/JugHome
