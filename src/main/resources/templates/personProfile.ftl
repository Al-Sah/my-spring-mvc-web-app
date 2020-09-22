<#import "parts/common.ftl" as common>

<@common.profilePage "Profile">

    <h4>${user.username}</h4>
    <h3><#if user?? && user.email??>${user.email}<#else > No email </#if></h3>



</@common.profilePage>
