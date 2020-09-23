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

<#macro editMessageLink message>
    <form action="/DataBase/editMessage/{message}" method="get">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <input type="hidden" name="id" value="${message}" />
        <input type="submit" class="btn btn-secondary" value="Edit"/>
    </form>
</#macro>

<#macro deleteMessage message>
    <form action="/DataBase/deleteMessage" method="post">
        <input type="hidden" name="_method" value="DELETE">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <input type="hidden" name="id" value="${message.id}" />
        <input type="submit" class="btn btn-danger" value="Delete"/>
    </form>
</#macro>

<#macro editMessage message>
    <form method="post" action="/DataBase/editMessage">
        <input type="hidden" name="_csrf" value="${_csrf.token}" >
        <input type="hidden" name="_method" value="PUT">
        <input type="hidden" name="id" value="${message.id}" />
        <div>
            <input type="text" class="mb-1 form-control ${(textError??)?string('is-invalid', '')}"
                   value="<#if message??>${message.text}</#if>" name = "text"  placeholder=" Enter text " >
            <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
            </#if>
            <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}"
                   value="<#if message??>${message.tag}</#if>" name = "tag" placeholder=" Enter tag " >
            <#if tagError??>
                <div class="invalid-feedback">
                    ${tagError}
                </div>
            </#if>
        </div>
        <div class="form_btns">
            <p class="form_btns form_p"> Action </p>
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="reset" class="btn btn-secondary"> reset </button>
        </div>
    </form>
</#macro>