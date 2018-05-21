<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login"  action="${url.loginAction}" method="post">
            <div class="row">
                <div class="${properties.kcFormGroupClass!}">
                    <div>
                        <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    </div>

                    <div class="${properties.kcInputWrapperClass!}"  >
                        <#if usernameEditDisabled??>
                            <input id="username" class="${properties.kcInputClass!} form-control" name="username" value="${(login.username!'')?html}" type="text" disabled  style="border-bottom: 1px solid #fff!important;"/>
                        <#else>
                            <input id="username" class="${properties.kcInputClass!} form-control" name="username" value="${(login.username!'')?html}" type="text" autofocus autocomplete="off" style="border-bottom: 1px solid #fff!important;"/>
                        </#if>
                    </div>
                </div>

                </div>
                <br>
  <div class="row">
                <div class="${properties.kcFormGroupClass!}" >
                    <div >
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>

                    <div class="${properties.kcInputWrapperClass!}" >
                        <input id="password" class="${properties.kcInputClass!} form-control" name="password" type="password" autocomplete="off" style="border-bottom: 1px solid #fff!important;" />
                    </div>
                </div>
</div>
                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a href="http://localhost:4200/forgotpassword">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                    </div>
<br>
                    <div class="${properties.kcFormGroupClass!}" >
                        <div class="${properties.kcInputWrapperClass!}">
                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} form-control ${properties.kcInputClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}" style="border-radius:10px;"/>
                        </div>
                     </div>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
