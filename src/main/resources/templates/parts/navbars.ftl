
<#macro logRegNavbar title>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">My Best App</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <#if title != "Registration">
                <form action="/registration" method="get">
                    <input type="submit" class="btn btn-primary" value="Registration"/>
                </form>
            </#if>
            <#if title == "Registration">
                <a href="/login" class="btn btn-primary"> Go Back </a>
            </#if>
        </div>
    </nav>
</#macro>

<#macro mainNavbar>
    <#include "security.ftl">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ">
                    <a class="nav-link" href="/home"> Home </a>
                </li>
            </ul>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/DataBase/showMessage"> DataBase </a>
                </li>
            </ul>

            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/home/math/calc"> Math </a>
                </li>
            </ul>

            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/userControl/uL"> Users </a>
                </li>
            </ul>

            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/profile"> Profile </a>
                </li>
            </ul>
            <div class="navbar-text mr-2">${name}</div>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <input type="submit" value="Sign Out">
            </form>
        </div>

    </nav>
</#macro>

<#macro leftNavbar>
    <div class="col-12 col-md-3 col-xl-2 bd-sidebar">
        <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
            <div id="navbarSupportedContent">
                <h3>Navbar will be here</h3>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><h5>something</h5></li>
                </ul>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><h5>something</h5></li>
                </ul>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><h5>something</h5></li>
                </ul>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><h5>something</h5></li>
                </ul>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><h5>something</h5></li>
                </ul>
            </div>
        </nav>
    </div>
</#macro>