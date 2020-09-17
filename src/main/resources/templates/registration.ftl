<#import "parts/common.ftl" as common>

<@common.loginPage "Registration">

    <div class="container mt-3">

        <form action="/registration" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />

            <div class="form-group">
                <label> Create your Name <input type="text" class="form-control" name="username" placeholder="Who are you?"/> </label>
                <#if errorUserMessage??>
                    <p>${errorUserMessage}</p>
                </#if>
            </div>
            <div class="form-group">
                <label> Email: <input type="email" class="form-control" name="email" placeholder=" example@some.com "/> </label>
            </div>

            <div class="form-group">
                <label> Password: <input type="password" class="form-control" name="password" placeholder="Your password"/> </label>
            </div>

            <div class="form-group">
                <label> Confirm password: <input type="password" class="form-control" name="confirmPassword" placeholder="Your password"/> </label>
                <#if errorPswdMessage??>
                    <p>${errorPswdMessage}</p>
                </#if>
            </div>



            <input type="submit" class="btn btn-primary" value="Add me"/>
            <#--<button type="submit" class="btn btn-primary">Submit</button>-->
        </form>
    </div>

</@common.loginPage>