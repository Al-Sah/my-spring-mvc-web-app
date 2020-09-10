<#import "parts/common.ftl" as common>


<@common.page "bye">

    <form action="/userControl/edited" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <input type="hidden" value="${user.id}" name = "userID" />

        <input type="text" name="username" value="${user.username}">

        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked","")}> ${role}</label>
            </div>
        </#list>

        <input type="submit" class="btn btn-primary" value="Save changes"/>
    </form>


</@common.page>
