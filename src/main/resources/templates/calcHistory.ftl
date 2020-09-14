<#import "parts/common.ftl" as common>

<@common.page "Calculator">

    <table class="table table-striped table-bordered mt-3">
        <thead>
        <tr>
            <th scope="col"> Success calculations</th>
        </tr>
        </thead>
        <tbody>

        <#list messages as message>
            <tr>
                <#if message.text??>
                    <th> ${message.text} </th>
                <#else>
                    <th> some error </th>
                </#if>
            </tr>
        <#else>
            <tr>
                <th><p>No Messages</p></th>
            </tr>
        </#list>
        </tbody>
    </table>

    <p> <a href="/home/math/calc" class="btn btn-primary calc_history" > Go Back </a> </p>

</@common.page>
