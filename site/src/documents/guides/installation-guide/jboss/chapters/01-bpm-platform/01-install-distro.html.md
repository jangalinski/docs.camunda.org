---

title: 'Install the pre-built distro'
category: 'BPM Platform'

---


1. Download the pre-packaged distribution for JBoss AS 7 from http://camunda.org/release/camunda-bpm/jboss/ or Wildfly 8 from http://camunda.org/release/camunda-bpm/wildfly/.
2. Unpack the distro to a directory.
3. Adjust the datasource according to your needs (see below).
4. Startup the server by running `camunda-welcome.bat` or by using the `$JBOSS_HOME/bin/standalone.{bat/sh}` script.


## Accessing the H2 console

In JBoss/Wildfly you can easily access the H2 console to inspect your local H2 database (used in demo/evaluation scenarios):

1.  Go to http://localhost:8080/h2/h2
2.  Login with the following data:
    *   jdbc:h2:./camunda-h2-dbs/process-engine
    *   User: sa
    *   Password: sa