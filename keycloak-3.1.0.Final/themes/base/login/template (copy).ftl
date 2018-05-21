<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

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





      var currentLocation = window.location;
      var response;
      var res=currentLocation.toString().split("/",6);
      //var domain="http://"+res[5]+".dhi-edu.com"+"/"+res[5]+"apiserver/";
    //  var domain="http://mite"+".dhi-edu.com"+"/"+"mite"+"apiserver/";
var domain="http://88.99.215.104:8090/paceapiserver/"
      var backgroundImage=domain+"api/backgroundimageconfig/collegeloginpageinfo";


         var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function() {

               if (this.readyState == 4 && this.status == 200) {

response=JSON.parse(xhttp.responseText);
      img.src = "data:image/png;base64," + response.collegeBackgroundImage;
      var bodyTag=document.getElementById('colbgimg');
      document.body.style.backgroundImage= "url("+img.src+")";
      document.body.style.backgroundRepeat="no-repeat";

 logo.src="data:image/png;base64," + response.collegeLogo;

var logoImage=document.getElementById('collegelogo');

  logo.style.backgroundRepeat="no-repeat";


var element = document.getElementById("logoId");

if(element!=null){

 element.remove();
}

          logoImage.append(logo);
          var collegeName=document.getElementById('kc-header-wrapper');
          collegeName.innerHTML=response.collegeName;


          var collegeName=document.getElementById('copyrights');
          collegeName.innerHTML=  '&copy; '+response.collegeName;


    };
  };


     xhttp.open("GET", backgroundImage.toString(), true);


          xhttp.send();

    }


    </script>


</head>

<body id="colbgimg" onload="getBackgroundimage();" style="
background-position: center center;
background-attachment: fixed;
background-size: cover;">
    <!-- <div id="kc-logo"><a href="${properties.kcLogoLink!'#'}"><div id="collegelogo"></div> <div  id="kc-header-wrapper" ></div></a></div> -->
<div class="row">

<div class="col-md-4">
    <div id="kc-logo"><div id="collegelogo"></div> </div> <div  id="kc-header-wrapper" ></div>
</div>


<div class="col-md-4">
    <div id="kc-container" class="${properties.kcContainerClass!}">
        <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">

            <!-- <div id="kc-header" class="${properties.kcHeaderClass!}">
                <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}"></div>
            </div> -->

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

                    <div id="kc-form" class="${properties.kcFormAreaClass!} pull-right">

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
        </div>
    </div>
  </div>
</div>
<div class="row">
    <div class="row footer hidden-sm hidden-xs">

              <div class="col-md-4 col-sm-4">

                <a style="color:#fff;" target="_blank" href={{util.APP_LINK}}><img src="./images/playStoreIcon.png" class="footer-img">
                </a>

        </div>
        <div  id="copyrights" class="col-md-4 col-sm-4 text-center college-name">

        </div>
        <div class="col-md-offset-1 col-md-3  text-center">
            <p class="login-footer-font "> <img src="./images/spaneos1.png" class="footer-img" />
            </p>
        </div>


    </div>
</div>
</body>

</html>
</#macro>
