<#import "parts/common.ftl" as common>
<#include "parts/security.ftl">


<@common.commonPage "Users List">

<table class="table table-striped table-bordered mt-3">
    <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <#if isAdmin>
                <th scope="col">isActive</th>
                <th scope="col">Roles</th>
                <th scope="col">Action</th>
            </#if>
            <th scope="col">Person profile</th>
        </tr>
    </thead>
    <tbody>
        <#list users as user>
            <tr>
                <th> ${user.getUsername()} </th>
                <th> <#if user.email??> ${user.getEmail()}<#else> No email(</#if> </th>
                <#if isAdmin>
                    <th> <#if user.active> YES <#else> NO </#if></th>
                    <th> <#list user.getRoles() as userRoles>${userRoles}<#sep>, </#list></th>
                    <th><div class="btn-group" role="group" aria-label="Basic example">
                            <a class="btn btn-dark" href="${user.id}"> edit user</a>
                            <form action="/userControl/deleteUser" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <input type="hidden" name="id" value="${user.id}" />
                                <input type="submit" class="btn btn-danger" value="Delete"/>
                            </form>
                        </div></th>
                </#if>
                <th> <a class="btn btn-primary" href="/profile/${user.id}"> See</a></th>
            </tr>
        </#list>
    </tbody>

</@common.commonPage>
