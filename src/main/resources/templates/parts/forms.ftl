<#macro editProfile>
    <form method="post" action="/profile/edit">
        <H3> Change person information</H3>
        <div class="form-group row">
            <label> Password: <input type="password" name="oldPassword"
                                     class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                     placeholder="Old password" />
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </label>
        </div>
        <div class="form-group row">
            <label> Password: <input type="password" name="password"
                                     class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                     placeholder="New password" />
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </label>
        </div>
        <div class="form-group row">
            <label> Email: <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                                  value="<#if user?? && user.email??>${user.email}</#if>"
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
</#macro>