<#import "parts/common.ftl" as common>

<@common.page "Main">
    <p> Hello, ${name} !"  </p>

    <a href="/bye"> GO NEXT ;) </a>

    <div>
        <p>If you want to calculate something, click <a href="/hi/calc"> here </a> </p>
    </div>

    <div>
        <p> GO to the <a href="/hi/MyDB"> DataBase </a> </p>
    </div>

    <div class="picture">
        <img src="/static/pictures/smile.jpeg" width= "300px" alt="упсь( Картинка не найдена">
    </div>

</@common.page>

