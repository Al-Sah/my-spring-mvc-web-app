<#import "parts/common.ftl" as common>
<#include "parts/security.ftl">


<@common.commonPage "Users List">

<table class="table table-striped table-bordered mt-3">
    <thead>
        <tr>
            <th scope="col">Name</th>
            <#if isAdmin>
                <th scope="col">Roles</th>
                <th scope="col">Action</th>
            </#if>
        </tr>
    </thead>
    <tbody>
        <#list users as user>
            <tr>
                <th> ${user.getUsername()} </th>
                <#if isAdmin>
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
            </tr>
        </#list>
    </tbody>

</@common.commonPage>
