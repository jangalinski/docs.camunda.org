---

title: 'User Management'
category: 'Admin'

---

## Users Menu

<div class="row">
  <div class="col-xs-6 col-sm-6 col-md-3">
    <img data-img-thumb src="ref:asset:/assets/img/implementation-admin/admin-start-page-view.png" />
  </div>
  <div class="col-xs-6 col-sm-6 col-md-9">
    <p>The Users menu allows you to add, edit and delete user profiles. Furthermore, you can manage group membership and change passwords.</p>
      </div>
</div>

## My Profile

By clicking on your user name in the Users menu, you can access the My Profile menu. In the My Profile menu you can edit your personal account settings, such as:

  * Profile: Change your name or email address. You cannot change the user account ID!
  * Account: Change your password or delete your account. Be careful, deletion cannot be undone.
  * Groups: This menu lists all groups of which you are member. With administrator rights you can assign your account to the available groups.

You can also access the My Profile menu from any of the web applications by clicking on your user name at the top right and selecting _My Profile_.


## Initial User Setup

<div class="row">
  <div class="col-xs-6 col-sm-6 col-md-3">
    <img data-img-thumb src="ref:asset:/assets/img/implementation-admin/admin-initial-user-setup.png" />
  </div>
  <div class="col-xs-6 col-sm-6 col-md-9">
    <p>If no administrator account is configured, a setup screen will be shown on first access of a process engine through Cockpit or Tasklist . This screen allows you to configure an initial user account with administrator rights.</p> 
    <p>Administrator users are not global but per engine. Thus, you will need to set up an admin user for each separate engine.</p>
  </div> 
</div>

## Administrator Account

Users who belong to the group _camunda-admin_ (default set by the invoice receipt demo process application) have administrator privileges. There must be at least one member in this group, otherwise the [initial setup screen](ref:#admin-user-management-initial-user-setup) appears. Besides user- and groupmanagement, as administrator you are able to define authorization rules for a variety of resources. See the chapter on [Authorizations](ref:#admin-authorization-management) for more details.