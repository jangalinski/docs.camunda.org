---

title: 'Introduction'
category: 'Overview'

keywords: 'overview configuration properties'

---

In this chapter we will show which configuration properties can be set for the Camunda BPM Process Engine, the existing Process Engine Plugins and process applications.

<div class="alert alert-info">
  Please note that within this chapter we will use the variables <code>$SERVER_HOME</code> to denote the main directory of the application server and <code>$VERSION</code> to denote a variable version name.
</div>

These configuration properties can be set in multiple ways:

* Using the Java API
* Using the [Spring Framework](ref:/guides/user-guide/#spring-framework-integration)
* For the process engine: In the `bpm-platform.xml` [Deployment Descriptor](ref:/api-references/deployment-descriptors/#descriptors-bpm-platformxml)
* For process applications: In the `processes.xml` [Deployment Descriptor](ref:/api-references/deployment-descriptors/#descriptors-processesxml), located in `\WEB-INF\classes\META-INF\` of the process application

<div class="alert alert-info">
  Please note that configuration properties with primitive type variables (byte, short, int, long, char, float, double, boolean) can be set in the <a href="ref:/api-references/deployment-descriptors/">Deployment Descriptors</a>. Most configuration properties with reference type variables can only be set by using the Java API or the <a href="ref:/guides/user-guide/#spring-framework-integration">Spring Framework</a>.
</div>

### Default values

Several configuration properties have a default value, marked with an asterisk(*). This value is applied when:

* The configuration property is not set
* The `processes.xml` file is left empty. See [this section](ref:/guides/user-guide/#process-applications-the-processesxml-deployment-descriptor-empty-processesxml) of the User Guide for more information about an empty `processes.xml` file.