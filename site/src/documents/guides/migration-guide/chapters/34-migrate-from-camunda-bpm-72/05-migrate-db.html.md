---

title: 'Migrate your Database'
category: 'Migrate from Camunda BPM 7.2 to 7.3'

---

For migration from **Camunda BPM 7.2** to **Camunda BPM 7.3**, the provided upgrade scripts that match your database have to be executed. With a pre-built distribution, the upgrade scripts are located in the folder `$DISTRIBUTION_PATH/sql/upgrade`.

If you migrate from a version < 7.2.5 and use DB2 or Microsoft SQL Server, you have to execute the SQL script `$DATABASE_engine_7.2_patch_7.2.4_to_7.2.5.sql`, where `$DATABASE` corresponds to the database platform you use.

<div class="alert alert-warning">
<strong>Note</strong>: If you previously migrated from 7.1 to 7.2 you may have already executed the patch script <code>$DATABASE_engine_7.1_patch_7.1.9_to_7.1.10.sql</code>. This script is the same as patch <code>$DATABASE_engine_7.2_patch_7.2.4_to_7.2.5.sql</code> which need not be executed then.
</div>

Check [available SQL patch scripts](ref:/guides/migration-guide/#patch-level-upgrade-upgrade-your-database-available-sql-patch-scripts) for an overview of available SQL patch scripts for your current version.

Regardless of the version you are migrating from, the main upgrade script is `$DATABASE_engine_7.2_to_7.3.sql` and has to be executed next.
