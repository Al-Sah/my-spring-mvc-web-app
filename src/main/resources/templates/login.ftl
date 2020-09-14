<#import "parts/common.ftl" as common>
<@common.page "Login">

    <#if message??>
        <p>${message}</p>
    </#if>

    <form action="/login" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="form-group">
            <label> User Name : <input type="text" class="form-control" name="username" placeholder="Who are you?"/> </label>
        </div>
        <div class="form-group">
            <label> Password: <input type="password" class="form-control" name="password" placeholder="Your password"/> </label>
        </div>
        <input type="submit" class="btn btn-primary" value="Sign In"/>
    </form>

</@common.page>