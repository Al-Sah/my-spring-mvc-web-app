<#import "parts/common.ftl" as common>

<@common.profilePage "Profile">



    <h4>${user.username}</h4>

    <form method="post" action="/profile/edit">
        <div class="form-group row">
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
        <div class="form-group row">
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
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Save</button>
    </form>

</@common.profilePage>
