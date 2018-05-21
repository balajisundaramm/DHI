<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"></title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>


  <script type="text/javascript">
     var response = new getBackgroundimage();
     function getBackgroundimage(){
       var img = document.createElement("img");
    var logo=document.createElement("img");
    logo.setAttribute("id","logoId");
       var response;
       var tenantId=window.location.search.split("&")[0].split("=")[1];
          var xhttp = new XMLHttpRequest();
         xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
       response=JSON.parse(xhttp.responseText);
    logo.src="data:image/png;base64," + response.collegeLogo;
    var logoImage=document.getElementById('collegelogo');
    logo.style.backgroundRepeat="no-repeat";
    var element = document.getElementById("logoId");
    if(element!=null){
    element.remove();
    }
           logoImage.append(logo);
           // var collegeName=document.getElementById('kc-header-wrapper');
           // collegeName.innerHTML=response.collegeName;
           // var collegeName=document.getElementById('copyrights');
           // collegeName.innerHTML=  '&copy; '+response.collegeName;
     };
    };
      xhttp.open("GET", "https://"+window.location.search.split("&")[1].split("%2F")[2]+"/dhiapiserver/api/backgroundimageconfig/collegeloginpageinfo", true);
    xhttp.setRequestHeader("tenant-id",tenantId);
           xhttp.send();
          }

     function redirectToSingleRegistrationForm() {
     var tenantId=window.location.search.split("&")[0].split("=")[1];
     
       var studentRegFormUrl="https://"+window.location.search.split("&")[1].split("%2F")[2]+"/"+tenantId+"/#/studentregistration/registrationlink/"+tenantId;
   
     studentRegFormUrl = "http://localhost:4200/#/studentregistration/registrationlink/dhi_local"+ tenantId;
      document.getElementById("studentRegistrationFormRedirectUrl").href = studentRegFormUrl;
   }

  </script>

</head>

<body class="${properties.kcBodyClass!}" >
    <div id="kc-logo"><div id="collegelogo" style="position: absolute;left: 16%; top: 30%;"></div></div>

    <div id="kc-container" class="${properties.kcContainerClass!}">
        <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">

            <div id="kc-header" class="${properties.kcHeaderClass!}">
                <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}"><#nested "header"></div>
            </div>

            <#if realm.internationalizationEnabled>
                <div id="kc-locale" class="${properties.kcLocaleClass!}">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div class="kc-dropdown" id="kc-locale-dropdown">
                            <a href="#" id="kc-current-locale-link">${locale.current}</a>
                            <ul>
                                <#list locale.supported as l>
                                    <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </#if>

            <div id="kc-content" class="${properties.kcContentClass!}">
                <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">

                    <#if displayMessage && message?has_content>
                        <div class="${properties.kcFeedbackAreaClass!}">
                            <div class="alert alert-${message.type}">
                                <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                                <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                <span class="kc-feedback-text">${message.summary}</span>
                            </div>
                        </div>
                    </#if>

                    <div id="kc-form" class="${properties.kcFormAreaClass!}">
                        <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                            <#nested "form">
                        </div>
                    </div>

                    <#if displayInfo>
                        <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                            <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
<div class="row pull-left" style="margin-left: 20%; cursor:pointer;">
  <a style="color:#fff;" id="studentRegistrationFormRedirectUrl" onClick="redirectToSingleRegistrationForm()">
  New Student? Register here
  </a>
</div>
        </div>

    </div>

</body>
</html>
</#macro>
