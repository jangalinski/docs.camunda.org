---

title: 'Patch SQL Scripts'
category: 'SQL Scripts'

---

## Patch level scripts

When our customers or community users discover SQL schema related problems during a minor version, we create so called SQL patch level scripts.
These scripts apply the necessary fixes for the bug, nothing more. `Patch-level` and `upgrade` scripts have *no intersection*, meaning they do not contain the same statement/s.
They are released in a patch level version for a specific minor version.

### Development
To create a patch level scripts, first, identify which database and Camunda BPM minor versions are affected. 

- Add the patch level script to the list of [available SQL Patch scripts](ref:/guides/migration-guide/#patch-level-upgrade-upgrade-your-database-available-sql-patch-scripts) in the migration guide.


Complete example for creating a patch level script:
 
The context of this example:
* Camunda BPM minor version 7.1 and 7.2 are affected, together with the currently developed version 7.3
* Affected database is DB2.
 
Steps:

1. Identify database and Camunda BPM minor version: done
2. 

### Naming convention
The naming convention when creating a patch level script is:

* `${database_type}_${purpose}_${minor_version}_patch_${patch_version_with_bug}_to_${fix_patch_version}.sql`

where
 
* `${database_type}` describes the affected database, eg. db2, mysql and so on. The placeholder `${purpose}` denotes what is affected when you execute the script. Currently there is only `engine` as purpose. 
* `${minor version}` is the version of the current branch you are on, eg. it is `7.2` on `7.2` branch.
* `${patch_version_with_bug}` describes the patch level version affected by the bug and `${fix_patch_version}` describes the fix patch version.

Example: `db2_engine_7.2_patch_7.2.4_to_7.2.5.sql` or `mssql_engine_7.1_patch_7.1.9_to_7.1.10.sql`

### Testing
The patch level scripts are tested using the same mechanism as the [upgrade](ref:/guides/developer-guide/#sql-scripts-upgrade-sql-scripts-testing) scripts.


### Location
The files can be found [here](https://github.com/camunda/camunda-bpm-platform/tree/master/distro/sql-script/upgrade) together with the `upgrade` scripts.