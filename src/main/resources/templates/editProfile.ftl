<#import "parts/common.ftl" as common>
<#import "parts/forms.ftl" as forms>

<@common.profilePage "Edit profile">

    <h4>${user.username}</h4>

    <@forms.editProfile/>

</@common.profilePage>
