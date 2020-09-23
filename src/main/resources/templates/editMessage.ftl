<#import "parts/common.ftl" as common>
<#import "parts/forms.ftl" as forms>

<@common.commonPage "Edit message">

    <div><h5> message Id</h5><p>${message.id}</p></div>
    <div><h5> message Text</h5><p>${message.text}</p></div>
    <div><h5> message Tag</h5><p>${message.tag}</p></div>
    <div><h5> message authorEmail</h5><p>${message.authorEmail}</p></div>
    <div><h5> message authorName</h5><p>${message.authorName}</p></div>


    <div class="input_container" >
        <@forms.editMessage message/>
    </div>

</@common.commonPage>
