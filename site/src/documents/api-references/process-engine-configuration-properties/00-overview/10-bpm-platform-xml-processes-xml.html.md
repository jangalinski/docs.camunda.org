---

title: 'Location of bpm-platform.xml and processes.xml'
category: 'Overview'

keywords: 'overview configuration properties bpm-platform.xml processes.xml'

---

Depending on which version of the Camunda BPM platform you are using, the `bpm-platform.xml` file can be located on different paths:

Please note that you can also configure a different location for the <code>bpm-platform.xml</code> file. See <a href="ref:/api-references/deployment-descriptors/#descriptors-bpm-platformxml-configure-location-of-the-bpm-platformxml-file">this section</a> for more details.

<div class="alert alert-warning">
  <p>
    <strong>JBoss Application Server 7 / Wildfly 8</strong>
  </p>
  <p>The <code>bpm-platform.xml</code> file is not used in the camunda BPM distribution for JBoss Application Server 7 / Wildfly 8. There, the configuration is added to the central application server configuration file (<code>standalone.xml</code> or <code>domain.xml</code>). The XML schema is the same (i.e. the same elements and properties can be used). See the <a href="ref:/guides/user-guide/#runtime-container-integration-the-camunda-jboss-subsystem">The camunda JBoss Subsystem</a> section of the <a href="ref:/guides/user-guide/">User Guide</a> for more details.
  </p>
</div>

<table class="table table-striped">
  <tr>
    <th>Application Server</th>
    <th>Path</th>
  </tr>
  <tr>
    <td>Apache Tomcat</td>
    <td><code>\$SERVER_HOME\server\apache-tomcat-$VERSION\conf</code></td>
  </tr>
  <tr>
  	<td>Glassfish</td>
  	<td><code>\$SERVER_HOME\server\glassfish3\glassfish\domains\domain1\applications\camunda-bpm-platform\camunda-glassfish-service-$VERSION_jar\META-INF</code></td>
  </tr>
  <tr>
  	<td>
</table>

<div class="alert alert-warning">
 <p><strong>Enterprise Feature</strong></p>
 Please note that this feature is only included in the enterprise edition of the Camunda BPM platform, it is not available in the community edition.
 <p style="margin-top:10px">Check the <a href="http://camunda.com/bpm/enterprise/ ">Camunda enterprise homepage</a> for more information or get your <a href="http://camunda.com/bpm/enterprise/trial/">free trial version.</a></p></div>

<table class="table table-striped">
  <tr>
    <th>Application Server</th>
    <th>Path</th>
  </tr>
  <tr>
    <td>IBM WebSphere</td>
    <td><code>\$SERVER_HOME\modules\camunda-ibm-websphere-ear-$VERSION.ear\camunda-ibm-websphere-service.jar\META-INF\</code></td>
  </tr>
  <tr>
  	<td>Oracle WebLogic</td>
  	<td><code>\$SERVER_HOME\modules\camunda-oracle-weblogic-ear-$VERSION.ear\camunda-oracle-weblogic-service.jar\META-INF\</code></td>
  </tr>
  <tr>
  	<td>
</table>