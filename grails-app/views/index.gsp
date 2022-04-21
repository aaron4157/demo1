<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <asset:javascript src="tabs.js"/>
    <asset:javascript src="popper.min.js"/>
    <asset:javascript src="popover.js"/>
    <!-- css for this page-->
    <asset:stylesheet src="vendors/typicons.font/font/typicons.css"/>
    <!-- end css for this page-->
</head>
<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html top -->
    <g:render template="/partials/navbar_0"/>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_settings-panel.html -->
        <g:render template="/partials/settings-panel"/>
        <!-- partial -->
        <!-- partial:partials/_sidebar.html -->
%{--        <g:render template="/partials/sidebar"/>--}%
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="#page0" data-url="${createLink(controller: 'home', action: 'page0')}" data-toggle="ajax">
                        <i class="icon-grid menu-icon"></i>
                        <span class="menu-title">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                        <i class="icon-layout menu-icon"></i>
                        <span class="menu-title">UI Elements</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="ui-basic">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#buttons" data-url="${createLink(controller: 'home', action: 'a1')}" data-toggle="ajax">Buttons</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#dropdowns" data-url="${createLink(controller: 'home', action: 'a2')}" data-toggle="ajax">Dropdowns</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#typography" data-url="${createLink(controller: 'home', action: 'a3')}" data-toggle="ajax">Typography</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
                        <i class="icon-columns menu-icon"></i>
                        <span class="menu-title">Form elements</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="form-elements">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="#basicElements" data-url="${createLink(controller: 'home', action: 'b1')}" data-toggle="ajax">Basic Elements</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
                        <i class="icon-bar-graph menu-icon"></i>
                        <span class="menu-title">Charts</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="charts">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#chartjs" data-url="${createLink(controller: 'home', action: 'c1')}" data-toggle="ajax">ChartJs</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
                        <i class="icon-grid-2 menu-icon"></i>
                        <span class="menu-title">Tables</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="tables">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#basicTable" data-url="${createLink(controller: 'home', action: 'd1')}" data-toggle="ajax">Basic table</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
                        <i class="icon-contract menu-icon"></i>
                        <span class="menu-title">Icons</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="icons">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#mdi" data-url="${createLink(controller: 'home', action: 'e1')}" data-toggle="ajax">Mdi icons</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                        <i class="icon-head menu-icon"></i>
                        <span class="menu-title">User Pages</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="auth">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="${createLink(controller: 'home', action: 'f1')}"> Login </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${createLink(controller: 'home', action: 'f2')}"> Register </a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
                        <i class="icon-ban menu-icon"></i>
                        <span class="menu-title">Error pages</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="error">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="${createLink(controller: 'home', action: 'f3')}"> 404 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="${createLink(controller: 'home', action: 'f4')}"> 500 </a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pages/documentation/documentation.html">
                        <i class="icon-paper menu-icon"></i>
                        <span class="menu-title">Documentation</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper tab-content">
                <div class="tab-pane active" id="page0">
                    <g:include controller="home" action="page0"/>
                </div>
                <div class="tab-pane" id="buttons"></div>
                <div class="tab-pane" id="dropdowns"></div>
                <div class="tab-pane" id="typography"></div>
                <div class="tab-pane" id="basicElements"></div>
                <div class="tab-pane" id="chartjs"></div>
                <div class="tab-pane" id="basicTable"></div>
                <div class="tab-pane" id="mdi"></div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <g:render template="/partials/footer"/>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
%{--<div class="row" id="proBanner">--}%
%{--    <div class="col-12">--}%
%{--        <span class="d-flex align-items-center purchase-popup">--}%
%{--            <p>Get tons of UI components, Plugins, multiple layouts, 20+ sample pages, and more!</p>--}%
%{--            <a href="" target="_blank" class="btn download-button purchase-button ml-auto">Upgrade To Pro</a>--}%
%{--            <i class="typcn typcn-delete-outline" id="bannerClose"></i>--}%
%{--        </span>--}%
%{--    </div>--}%
%{--</div>--}%

<!-- Plugin js for this page -->
<asset:javascript src="vendors/chart.js/Chart.min.js"/>
<asset:javascript src="vendors/datatables.net/jquery.dataTables.js"/>
<asset:javascript src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"/>
<asset:javascript src="js/dataTables.select.min.js"/>

<!-- End plugin js for this page -->

<!-- Custom js for this page-->
<asset:javascript src="dashboard.js"/>
<asset:javascript src="Chart.roundedBarCharts.js"/>
<asset:javascript src="my-patch.js"/>
<!-- End custom js for this page-->

</body>
</html>
