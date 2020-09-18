<#import "parts/common.ftl" as common>

<@common.loginPage "Registration">

    <div class="container mt-3">

        <form action="/registration" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />

            <div class="form-group">
                <label> Create your Name
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                        class="form-control ${(usernameError??)?string('is-invalid', '')}"
                        placeholder="User name " />
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
                </label>
                <#if UserError??>
                    <p>${UserError}</p>
                </#if>
            </div>

            <div class="form-group">
                <label> Email: <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                                      value="<#if user??>${user.email}</#if>"
                                      name="email" placeholder="example@some.com "/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </label>
            </div>

            <div class="form-group">
                <label> Password: <input type="password" name="password"
                                         class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                         placeholder="Password" />
                    <#if passwordError??>
                        <div class="invalid-feedback">
                            ${passwordError}
                        </div>
                    </#if>
                </label>
            </div>

            <div class="form-group">
                <label> Confirm password: <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                                 name="confirmPassword" placeholder="Your password again)"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
                </label>
                <#if PasswordError??>
                <p>${PasswordError}</p>
                </#if>
            </div>

            <input type="submit" class="btn btn-primary" value="Add me"/>
        </form>
    </div>

</@common.loginPage>