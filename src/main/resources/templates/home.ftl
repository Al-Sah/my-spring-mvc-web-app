<#import "parts/common.ftl" as common>

<@common.page "Main">
    <#include "parts/security.ftl">
    <p> Hello, ${name} !"  </p>
    <a href="/bye"> GO NEXT ;) </a>

    <div>
        <p>If you want to calculate something, click <a href="/home/math/calc"> here </a> </p>
    </div>

    <div>
        <p> GO to the <a href="/home/MyDB"> DataBase </a> </p>
    </div>

    <div class="picture">
        <img src="/static/pictures/smile.jpeg" width= "300px" alt="упсь( Картинка не найдена">
    </div>

    <#if isAdmin>
        <div >
            <p> GO to the <a href="/userControl/uL"> user List </a> </p>
        </div>
    </#if>




</@common.page>

