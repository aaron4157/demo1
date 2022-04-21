<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Skydash Admin</title>
    <!-- plugins:css -->
    <asset:stylesheet href="vendors/feather/feather.css"/>
    <asset:stylesheet href="vendors/ti-icons/css/themify-icons.css"/>
    <asset:stylesheet href="vendors/css/vendor.bundle.base.css"/>
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    <g:else>
    <asset:link rel="stylesheet" href="vertical-layout-light/style.css"/>
    </g:else>
    <!-- endinject -->
    <asset:link rel="shortcut icon" href="favicon.png" />
</head>

<body>
<g:if env="development">
    <g:if test="${Throwable.isInstance(exception)}">
        <g:renderException exception="${exception}" />
    </g:if>
    <g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
        <g:renderException exception="${request.getAttribute('javax.servlet.error.exception')}" />
    </g:elseif>
    <g:else>
        <ul class="errors">
            <li>An error has occurred</li>
            <li>Exception: ${exception}</li>
            <li>Message: ${message}</li>
            <li>Path: ${path}</li>
        </ul>
    </g:else>
</g:if>
<g:else>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center text-center error-page bg-info">
            <div class="row flex-grow">
                <div class="col-lg-7 mx-auto text-white">
                    <div class="row align-items-center d-flex flex-row">
                        <div class="col-lg-6 text-lg-right pr-lg-4">
                            <h1 class="display-1 mb-0">500</h1>
                        </div>
                        <div class="col-lg-6 error-page-divider text-lg-left pl-lg-4">
                            <h2>SORRY!</h2>
                            <h3 class="font-weight-light">Internal server error!</h3>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-12 text-center mt-xl-2">
                            <a class="text-white font-weight-medium" href="${createLink(controller: 'home')}">Back to home</a>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-12 mt-xl-2">
                            <p class="text-white font-weight-medium text-center">Copyright &copy; 2021  All rights reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
</g:else>
<!-- container-scroller -->
<!-- plugins:js -->
<asset:javascript src="vendors/js/vendor.bundle.base.js"/>
<!-- endinject -->
<!-- Plugin js for this page -->
<!-- End plugin js for this page -->
<!-- inject:js -->
<asset:javascript src="off-canvas.js"/>
<asset:javascript src="hoverable-collapse.js"/>
<asset:javascript src="template.js"/>
<asset:javascript src="settings.js"/>
<asset:javascript src="todolist.js"/>
<!-- endinject -->
</body>

</html>
