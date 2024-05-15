<%-- 
    Document   : order-details
    Created on : Mar 15, 2024, 9:10:23 AM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Apex Admin</title>
        <link rel="shortcut icon" href="https://d24ouiz0dt1p4y.cloudfront.net/images/logo-mb.png" type="image/png" />
        <!-- GOOGLE FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet"
            />
        <!-- BOXICONS -->
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/js/bootstrap/bootstrap.min.js" />

        <link
            rel="stylesheet"
            href="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.css"
            />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link
            rel="preload"
            href="https://d24ouiz0dt1p4y.cloudfront.net/assets/css/theme.css"
            data-hs-appearance="default"
            as="style"
            />  
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/css/theme.min.css" />

        <link
            rel="stylesheet"
            href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/css/tom-select.bootstrap5.css"
            />

    </head>
    <body>

        <%@ include file="sidebar.jsp"%>

        <main id="content" role="main" class="main">
            <!-- Content -->
            <div class="content @@layoutBuilder.header.containerMode">
                <!-- Page Header -->
                <div class="page-header d-print-none">
                    <div class="row align-items-center">
                        <div class="col-sm mb-2 mb-sm-0">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb breadcrumb-no-gutter">
                                    <li class="breadcrumb-item"><a class="breadcrumb-link" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-orders.html">Orders</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Order details</li>
                                </ol>
                            </nav>

                            <div class="d-sm-flex align-items-sm-center">
                                <h1 class="page-header-title">Order #32543</h1>
                                <span class="badge bg-soft-success text-success ms-sm-3">
                                    <span class="legend-indicator bg-success"></span>Paid
                                </span>
                                <span class="badge bg-soft-info text-info ms-2 ms-sm-3">
                                    <span class="legend-indicator bg-info"></span>Fulfilled
                                </span>
                                <span class="ms-2 ms-sm-3">
                                    <i class="bi-calendar-week"></i> Aug 17, 2020, 5:48 (ET)
                                </span>
                            </div>

                            <div class="mt-2">
                                <div class="d-flex gap-2">
                                    <a class="text-body me-3" href="javascript:;" onclick="window.print(); return false;">
                                        <i class="bi-printer me-1"></i> Print order
                                    </a>

                                    <!-- Dropdown -->
                                    <div class="dropdown">
                                        <a class="text-body" href="javascript:;" id="moreOptionsDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                            More options <i class="bi-chevron-down"></i>
                                        </a>

                                        <div class="dropdown-menu mt-1" aria-labelledby="moreOptionsDropdown">
                                            <a class="dropdown-item" href="#">
                                                <i class="bi-clipboard dropdown-item-icon"></i> Duplicate
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="bi-x dropdown-item-icon"></i> Cancel order
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="bi-archive dropdown-item-icon"></i> Archive
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="bi-eye dropdown-item-icon"></i> View order status page
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="bi-pencil dropdown-item-icon"></i> Edit order
                                            </a>
                                        </div>
                                    </div>
                                    <!-- End Dropdown -->
                                </div>
                            </div>
                        </div>
                        <!-- End Col -->

                        <div class="col-sm-auto">
                            <div class="d-flex gap-2">
                                <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm rounded-circle" data-bs-toggle="tooltip" data-bs-placement="right" title="Previous order">
                                    <i class="bi-arrow-left"></i>
                                </button>
                                <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm rounded-circle" data-bs-toggle="tooltip" data-bs-placement="right" title="Next order">
                                    <i class="bi-arrow-right"></i>
                                </button>
                            </div>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>
                <!-- End Page Header -->

                <div class="row">
                    <div class="col-lg-8 mb-3 mb-lg-0">
                        <!-- Card -->
                        <div class="card mb-3 mb-lg-5">
                            <!-- Header -->
                            <div class="card-header card-header-content-between">
                                <h4 class="card-header-title">Order details <span class="badge bg-soft-dark text-dark rounded-circle ms-1">4</span></h4>
                                <a class="link" href="javascript:;">Edit</a>
                            </div>
                            <!-- End Header -->

                            <!-- Body -->
                            <div class="card-body">
                                <!-- Media -->
                                <div class="d-flex">
                                    <div class="flex-shrink-0">
                                        <div class="avatar avatar-xl">
                                            <img class="img-fluid" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/400x400/img26.jpg" alt="Image Description">
                                        </div>
                                    </div>

                                    <div class="flex-grow-1 ms-3">
                                        <div class="row">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <a class="h5 d-block" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-product-details.html">Topman shoe in green</a>

                                                <div class="fs-6 text-body">
                                                    <span>Gender:</span>
                                                    <span class="fw-semibold">Women</span>
                                                </div>
                                                <div class="fs-6 text-body">
                                                    <span>Color:</span>
                                                    <span class="fw-semibold">Green</span>
                                                </div>
                                                <div class="fs-6 text-body">
                                                    <span>Size:</span>
                                                    <span class="fw-semibold">UK 7</span>
                                                </div>
                                            </div>
                                            <!-- End Col -->

                                            <div class="col col-md-2 align-self-center">
                                                <h5>$21.00</h5>
                                            </div>
                                            <!-- End Col -->

                                            <div class="col col-md-2 align-self-center">
                                                <h5>2</h5>
                                            </div>
                                            <!-- End Col -->

                                            <div class="col col-md-2 align-self-center text-end">
                                                <h5>$42.00</h5>
                                            </div>
                                            <!-- End Col -->
                                        </div>
                                        <!-- End Row -->
                                    </div>
                                </div>
                                <!-- End Media -->

                                <hr>

                                <!-- Media -->
                                <div class="d-flex">
                                    <div class="flex-shrink-0">
                                        <div class="avatar avatar-xl">
                                            <img class="img-fluid" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/400x400/img22.jpg" alt="Image Description">
                                        </div>
                                    </div>

                                    <div class="flex-grow-1 ms-3">
                                        <div class="row">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <a class="h5 d-block" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-product-details.html">Office Notebook</a>

                                                <div class="fs-6 text-body">
                                                    <span>Color:</span>
                                                    <span class="fw-semibold">Gray</span>
                                                </div>
                                            </div>
                                            <!-- End Col -->

                                            <div class="col col-md-2 align-self-center">
                                                <h5>$9</h5>
                                            </div>
                                            <!-- End Col -->

                                            <div class="col col-md-2 align-self-center">
                                                <h5>1</h5>
                                            </div>
                                            <!-- End Col -->

                                            <div class="col col-md-2 align-self-center text-end">
                                                <h5>$9.00</h5>
                                            </div>
                                            <!-- End Col -->
                                        </div>
                                        <!-- End Row -->
                                    </div>
                                </div>
                                <!-- End Media -->

                                <hr>

                                <!-- Media -->
                                <div class="d-flex">
                                    <div class="flex-shrink-0">
                                        <div class="avatar avatar-xl">
                                            <img class="img-fluid" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/400x400/img15.jpg" alt="Image Description">
                                        </div>
                                    </div>

                                    <div class="flex-grow-1 ms-3">
                                        <div class="row">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <a class="h5 d-block" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-product-details.html">RayBan sunglasses</a>

                                                <div class="fs-6 text-body">
                                                    <span>Gender:</span>
                                                    <span class="fw-semibold">Unisex</span>
                                                </div>
                                                <div class="fs-6 text-body">
                                                    <span>Color:</span>
                                                    <span class="fw-semibold">Black</span>
                                                </div>
                                                <div class="fs-6 text-body">
                                                    <span>Size:</span>
                                                    <span class="fw-semibold">One size</span>
                                                </div>
                                            </div>
                                            <!-- End Col -->

                                            <div class="col col-md-2 align-self-center">
                                                <h5>$14.00</h5>
                                            </div>
                                            <!-- End Col -->

                                            <div class="col col-md-2 align-self-center">
                                                <h5>1</h5>
                                            </div>
                                            <!-- End Col -->

                                            <div class="col col-md-2 align-self-center text-end">
                                                <h5>$14.00</h5>
                                            </div>
                                            <!-- End Col -->
                                        </div>
                                        <!-- End Row -->
                                    </div>
                                </div>
                                <!-- End Media -->

                                <hr>

                                <div class="row justify-content-md-end mb-3">
                                    <div class="col-md-8 col-lg-7">
                                        <dl class="row text-sm-end">
                                            <dt class="col-sm-6">Subtotal:</dt>
                                            <dd class="col-sm-6">$65.00</dd>
                                            <dt class="col-sm-6">Shipping fee:</dt>
                                            <dd class="col-sm-6">$0.00</dd>
                                            <dt class="col-sm-6">Tax:</dt>
                                            <dd class="col-sm-6">$7.00</dd>
                                            <dt class="col-sm-6">Total:</dt>
                                            <dd class="col-sm-6">$65.00</dd>
                                            <dt class="col-sm-6">Amount paid:</dt>
                                            <dd class="col-sm-6">$65.00</dd>
                                        </dl>
                                        <!-- End Row -->
                                    </div>
                                    <!-- End Col -->
                                </div>
                                <!-- End Row -->
                            </div>
                            <!-- End Body -->
                        </div>
                        <!-- End Card -->

                        <!-- Card -->
                        <div class="card">
                            <!-- Header -->
                            <div class="card-header">
                                <h4 class="card-header-title">
                                    Shipping activity
                                    <span class="badge bg-soft-dark text-dark ms-1">
                                        <span class="legend-indicator bg-dark"></span>Marked as fulfilled
                                    </span>
                                </h4>
                            </div>
                            <!-- End Header -->

                            <!-- Body -->
                            <div class="card-body">
                                <!-- Step -->
                                <ul class="step step-icon-xs">
                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-divider">Wednesday, 19 August</span>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                            <div class="step-content">
                                                <h5 class="mb-1">
                                                    <a class="text-dark" href="#">Delivered</a>
                                                </h5>

                                                <p class="fs-6 mb-0">4:17 AM</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                            <div class="step-content">
                                                <h5 class="mb-1">
                                                    <a class="text-dark" href="#">Out for delivery</a>
                                                </h5>

                                                <p class="fs-6 mb-0">2:38 AM</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                            <div class="step-content">
                                                <h5 class="mb-1">
                                                    <a class="text-dark" href="#">Package arrived at the final delivery station</a>
                                                </h5>

                                                <p class="fs-6 mb-0">2:00 AM</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-divider">Tuesday, 18 August</span>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                            <div class="step-content">
                                                <h5 class="mb-1">
                                                    <a class="text-dark" href="#">Tracking number</a>
                                                </h5>

                                                <a href="#">3981241023109293</a>
                                                <p class="fs-6 mb-0">6:29 AM</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                            <div class="step-content">
                                                <h5 class="mb-1">
                                                    <a class="text-dark" href="#">Package has dispatched</a>
                                                </h5>

                                                <p class="fs-6 mb-0">6:29 AM</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                            <div class="step-content">
                                                <h5 class="mb-1">
                                                    <a class="text-dark" href="#">Order was placed</a>
                                                </h5>

                                                <p class="fs-6 mb-0">Order #32543</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->
                                </ul>
                                <!-- End Step -->

                                <span class="small">Times are shown in the local time zone.</span>
                            </div>
                            <!-- End Body -->
                        </div>
                        <!-- End Card -->
                    </div>

                    <div class="col-lg-4">
                        <!-- Card -->
                        <div class="card">
                            <!-- Header -->
                            <div class="card-header">
                                <h4 class="card-header-title">Customer</h4>
                            </div>
                            <!-- End Header -->

                            <!-- Body -->
                            <div class="card-body">
                                <!-- List Group -->
                                <ul class="list-group list-group-flush list-group-no-gutters">
                                    <li class="list-group-item">
                                        <a class="d-flex align-items-center" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">
                                            <div class="avatar avatar-circle">
                                                <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img10.jpg" alt="Image Description">
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="text-body text-inherit">Amanda Harvey</span>
                                            </div>
                                            <div class="flex-grow-1 text-end">
                                                <i class="bi-chevron-right text-body"></i>
                                            </div>
                                        </a>
                                    </li>

                                    <li class="list-group-item">
                                        <a class="d-flex align-items-center" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">
                                            <div class="icon icon-soft-info icon-circle">
                                                <i class="bi-basket"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="text-body text-inherit">7 orders</span>
                                            </div>
                                            <div class="flex-grow-1 text-end">
                                                <i class="bi-chevron-right text-body"></i>
                                            </div>
                                        </a>
                                    </li>

                                    <li class="list-group-item">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5>Contact info</h5>
                                            <a class="link" href="javascript:;">Edit</a>
                                        </div>

                                        <ul class="list-unstyled list-py-2 text-body">
                                            <li><i class="bi-at me-2"></i>ella@site.com</li>
                                            <li><i class="bi-phone me-2"></i>+1 (609) 972-22-22</li>
                                        </ul>
                                    </li>

                                    <li class="list-group-item">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5>Shipping address</h5>
                                            <a class="link" href="javascript:;">Edit</a>
                                        </div>

                                        <span class="d-block text-body">
                                            45 Roker Terrace<br>
                                            Latheronwheel<br>
                                            KW5 8NW, London<br>
                                            UK <img class="avatar avatar-xss avatar-circle ms-1" src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/flag-icon-css/flags/1x1/gb.svg" alt="Great Britain Flag">
                                        </span>
                                    </li>

                                    <li class="list-group-item">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5>Billing address</h5>
                                            <a class="link" href="javascript:;">Edit</a>
                                        </div>

                                        <span class="d-block text-body">
                                            45 Roker Terrace<br>
                                            Latheronwheel<br>
                                            KW5 8NW, London<br>
                                            UK <img class="avatar avatar-xss avatar-circle ms-1" src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/flag-icon-css/flags/1x1/gb.svg" alt="Great Britain Flag">
                                        </span>

                                        <div class="mt-3">
                                            <h5 class="mb-0">Mastercard</h5>
                                            <span class="d-block text-body">Card Number: ************4291</span>
                                        </div>
                                    </li>
                                </ul>
                                <!-- End List Group -->
                            </div>
                            <!-- End Body -->
                        </div>
                        <!-- End Card -->
                    </div>
                </div>
                <!-- End Row -->
            </div>
            <!-- End Content -->

            <!-- Footer -->
          
            <!-- End Footer -->
        </main>
        <!-- ========== END MAIN CONTENT ========== -->

        <!-- ========== SECONDARY CONTENTS ========== -->
       

        <!-- JS Global Compulsory @@deleteLine:build -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery/dist/jquery.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery-migrate/dist/jquery-migrate.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JS Implementing Plugins -->
        <!-- bundlejs:vendor [https://d24ouiz0dt1p4y.cloudfront.net] -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-navbar-vertical-aside/dist/hs-navbar-vertical-aside.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-form-search/dist/hs-form-search.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.js"></script>
        <!-- JS Front -->
        <!-- bundlejs:theme [https://d24ouiz0dt1p4y.cloudfront.net] -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.core.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.bs-dropdown.js"></script>


        <!-- JS Plugins Init. -->
        <script>
                                        (function () {
                                            window.onload = function () {
                                                @@if (layoutBuilder.header.layoutMode !== 'default') {
                                                    // INITIALIZATION OF MEGA MENU
                                                    // =======================================================
                                                    new HSMegaMenu('.js-mega-menu', {
                                                        desktop: {
                                                            position: 'left'
                                                        }
                                                    })
                                                }

                                                // INITIALIZATION OF NAVBAR VERTICAL ASIDE
                                                // =======================================================
                                                new HSSideNav('.js-navbar-vertical-aside').init()


                                                // INITIALIZATION OF FORM SEARCH
                                                // =======================================================
                                                new HSFormSearch('.js-form-search')


                                                // INITIALIZATION OF BOOTSTRAP DROPDOWN
                                                // =======================================================
                                                HSBsDropdown.init()
                                            }
                                        })()
        </script>
    </body>
</html>
