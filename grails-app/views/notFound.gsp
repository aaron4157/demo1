<%--
  Created by IntelliJ IDEA.
  User: aaron
  Date: 2022/4/6
  Time: 下午 07:49
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
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
    <asset:link rel="stylesheet" href="vertical-layout-light/style.css"/>
    <!-- endinject -->
    <asset:link rel="shortcut icon" href="favicon.png" />
</head>

<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center text-center error-page bg-primary">
            <div class="row flex-grow">
                <div class="col-lg-7 mx-auto text-white">
                    <div class="row align-items-center d-flex flex-row">
                        <div class="col-lg-6 text-lg-right pr-lg-4">
                            <h1 class="display-1 mb-0">404</h1>
                        </div>
                        <div class="col-lg-6 error-page-divider text-lg-left pl-lg-4">
                            <h2>SORRY!</h2>
                            <h3 class="font-weight-light">The page you're looking for was not found.</h3>
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
