<%--
  Created by IntelliJ IDEA.
  User: aaron
  Date: 2022/2/27
  Time: 下午 09:45
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
%{--    <style type="text/css" media="screen">--}%
%{--    #login {--}%
%{--        margin: 15px 0px;--}%
%{--        padding: 0px;--}%
%{--        text-align: center;--}%
%{--    }--}%

%{--    #login .inner {--}%
%{--        width: 340px;--}%
%{--        padding-bottom: 6px;--}%
%{--        margin: 60px auto;--}%
%{--        text-align: left;--}%
%{--        border: 1px solid #aab;--}%
%{--        background-color: #f0f0fa;--}%
%{--        -moz-box-shadow: 2px 2px 2px #eee;--}%
%{--        -webkit-box-shadow: 2px 2px 2px #eee;--}%
%{--        -khtml-box-shadow: 2px 2px 2px #eee;--}%
%{--        box-shadow: 2px 2px 2px #eee;--}%
%{--    }--}%

%{--    #login .inner .fheader {--}%
%{--        padding: 18px 26px 14px 26px;--}%
%{--        background-color: #f7f7ff;--}%
%{--        margin: 0px 0 14px 0;--}%
%{--        color: #2e3741;--}%
%{--        font-size: 18px;--}%
%{--        font-weight: bold;--}%
%{--    }--}%

%{--    #login .inner .cssform p {--}%
%{--        clear: left;--}%
%{--        margin: 0;--}%
%{--        padding: 4px 0 3px 0;--}%
%{--        padding-left: 105px;--}%
%{--        margin-bottom: 20px;--}%
%{--        height: 1%;--}%
%{--    }--}%

%{--    #login .inner .cssform input[type="text"] {--}%
%{--        width: 120px;--}%
%{--    }--}%

%{--    #login .inner .cssform label {--}%
%{--        font-weight: bold;--}%
%{--        float: left;--}%
%{--        text-align: right;--}%
%{--        margin-left: -105px;--}%
%{--        width: 110px;--}%
%{--        padding-top: 3px;--}%
%{--        padding-right: 10px;--}%
%{--    }--}%

%{--    #login #remember_me_holder {--}%
%{--        padding-left: 120px;--}%
%{--    }--}%

%{--    #login #submit {--}%
%{--        margin-left: 15px;--}%
%{--    }--}%

%{--    #login #remember_me_holder label {--}%
%{--        float: none;--}%
%{--        margin-left: 0;--}%
%{--        text-align: left;--}%
%{--        width: 200px--}%
%{--    }--}%

%{--    #login .inner .login_message {--}%
%{--        padding: 6px 25px 20px 25px;--}%
%{--        color: #c33;--}%
%{--    }--}%

%{--    #login .inner .text_ {--}%
%{--        width: 120px;--}%
%{--    }--}%

%{--    #login .inner .chk {--}%
%{--        height: 12px;--}%
%{--    }--}%
%{--    </style>--}%
</head>

<body>
%{--<div id="login">--}%
%{--    <div class="inner">--}%
%{--        <div class="fheader"><g:message code='springSecurity.login.header'/></div>--}%

%{--        <g:if test='${flash.message}'>--}%
%{--            <div class="login_message">${flash.message}</div>--}%
%{--        </g:if>--}%

%{--        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">--}%
%{--            <p>--}%
%{--                <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>--}%
%{--                <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>--}%
%{--            </p>--}%

%{--            <p>--}%
%{--                <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>--}%
%{--                <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>--}%
%{--            </p>--}%

%{--            <p id="remember_me_holder">--}%
%{--                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>--}%
%{--                <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>--}%
%{--            </p>--}%

%{--            <p>--}%
%{--                <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>--}%
%{--                <input type="button" id="signin" value="${message(code: 'default.button.signin.label')}" onclick="window.location.replace('${createLink(action: 'signin')}')"/>--}%
%{--                <input type="button" id="reset" value="${message(code: 'auth.button.reset.label')}" onclick="window.location.replace('${createLink(action: 'resetPassword')}')"/>--}%
%{--            </p>--}%
%{--        </form>--}%
%{--    </div>--}%
%{--</div>--}%
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth px-0">
            <div class="row w-100 mx-0">
                <div class="col-lg-4 mx-auto">
                    <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                        <div class="brand-logo">
                            <asset:image src="logo.svg" alt="logo"/>
                        </div>
                        <h4>Hello! let's get started</h4>
                        <h6 class="font-weight-light">Sign in to continue.</h6>
                        <form class="pt-3" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" >
                            <div class="form-group">
                                <input type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Username"/>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="mt-3">
                                <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
%{--                                <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../../index.html">SIGN IN</a>--}%
                            </div>
                            <div class="my-2 d-flex justify-content-between align-items-center">
                                <div class="form-check">
                                    <label class="form-check-label text-muted">
                                        <input type="checkbox" class="form-check-input">
                                        Keep me signed in
                                    </label>
                                </div>
                                <a href="${createLink(action: 'resetPassword')}" class="auth-link text-black">Forgot password?</a>
                            </div>
                            <div class="mb-2">
                                <button type="button" class="btn btn-block btn-facebook auth-form-btn">
                                    <i class="typcn typcn-social-facebook-circular mr-2"></i>Connect using facebook
                                </button>
                            </div>
                            <div class="text-center mt-4 font-weight-light">
                                Don't have an account? <a href="${createLink(action: 'signin')}" class="text-primary">Create</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>