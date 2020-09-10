<#import "parts/common.ftl" as common>


<@common.page "Users List">

<table class="table table-striped table-bordered mt-3">
    <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Roles</th>
        </tr>
    </thead>
    <tbody>
        <#list users as user>
            <tr>
                <th> ${user.getUsername()} </th>
                <th> <#list user.getRoles() as userRoles>${userRoles}<#sep>, </#list></th>
                <th><a class="btn btn-dark" href="${user.id}"> edit user</a></th>
            </tr>
        </#list>
    </tbody>

</@common.page>
