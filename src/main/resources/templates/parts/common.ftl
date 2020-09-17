<#import "navbars.ftl" as navs>
<#import "heads.ftl" as h>
<#import "scripts.ftl" as scr>


<#macro commonPage title>
    <!DOCTYPE html>
    <html lang="en">
        <@h.mainHead title=title/>
    <body>

        <@navs.mainNavbar/>
        <div class="container">
            <#nested >
        </div>
        <@scr.boostrapScripts/>
    </body>
    </html>
</#macro>

<#macro loginPage title>
    <!DOCTYPE html>
    <html lang="en">
        <@h.mainHead title=title/>
    <body>

        <@navs.logRegNavbar title=title/>
        <div class="container">
            <#nested >
        </div>
        <@scr.boostrapScripts/>
    </body>
    </html>
</#macro>

<#macro profilePage title>
    <!DOCTYPE html>
    <html lang="en">
    <@h.mainHead title=title/>
    <body>
    <@navs.mainNavbar/>
    <div class="container-fluid mt-2">
        <div class="row flex-xl-nowrap">
            <@navs.leftNavbar/>
            <div class="container">
                <#nested >
            </div>
        </div>
    </div>
    <@scr.boostrapScripts/>
    </body>
    </html>
</#macro>


<#macro form_btn >
    <div class="form_btns">
        <p class="form_btns form_p"> Action </p>
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-secondary"> reset </button>
    </div>
</#macro>



