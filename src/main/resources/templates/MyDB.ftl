<#import "parts/common.ftl" as common>

<@common.page "MyDB">
    <div class="input_container" >

        <h4> Add new message to the data base</h4>

    <form method="post" action="add-message">
        <input type="hidden" name="_csrf" value="${_csrf.token}" >
        <div>
            <input type="text" name = "text"  placeholder=" Enter text " >
            <input type="text" name = "tag" placeholder=" Enter tag " >
        </div>
        <@common.form_btn></@common.form_btn>
    </form>
    </div>


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
            <th scope="col">Author</th>
        </tr>
        </thead>
        <tbody>

        <#list messages as message>
            <tr>
                <th> ${message.id} </th>
                <th> ${message.text} </th>
                <th> <i> ${message.tag} </i> </th>
                <th>  ${message.authorName}  </th>
            </tr>
        <#else>
            <tr>
                <th><p>No Messages</p></th>
            </tr>
        </#list>

        </tbody>
    </table>


    </div>
</@common.page>

