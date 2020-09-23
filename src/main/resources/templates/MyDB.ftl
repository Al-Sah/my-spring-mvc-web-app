<#import "parts/common.ftl" as common>
<#import "parts/forms.ftl" as forms>

<@common.commonPage "MyDB">
    <#include "parts/security.ftl">
    <div class="input_container" >

        <h4> Add new message to the data base</h4>

    <form method="post" action="/DataBase/addMessage">
        <input type="hidden" name="_csrf" value="${_csrf.token}" >
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
        <@common.form_btn/>
    </form>
    </div>

<#if !textError?? || !tagError??>
    <div class="myDB">
        <h4> Messages in DataBase: </h4>

        <form method="get">
            <div>
                <span><input type="text" name = "filter"  placeholder=" Enter tag for searching " > </span>
                <button type="submit"> search </button>
            </div>
        </form>



        <table class="table table-striped table-bordered mt-3">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Text</th>
            <th scope="col">Tag</th>
            <th scope="col">Email</th>
            <th scope="col">Author</th>
        </tr>
        </thead>
        <tbody>

        <#list messages as message>
            <tr>
                <th> ${message.id} </th>
                <th> ${message.text} </th>
                <th> <i> ${message.tag} </i> </th>
                <th>  ${message.authorEmail}  </th>
                <th>  ${message.authorName}  </th>
                <#if isAdmin>
                    <th>  <@forms.deleteMessage message/>  </th>
                    <#--<th>  <@forms.editMessageLink message/></th>-->
                    <th> <a class="btn btn-secondary" href="/DataBase/editMessage/${message.id}"> Edit</a></th>
                </#if>
            </tr>
        <#else>
            <tr>
                <th><p>No Messages</p></th>
            </tr>
        </#list>

        </tbody>
    </table>


    </div>
    </#if>
</@common.commonPage>

