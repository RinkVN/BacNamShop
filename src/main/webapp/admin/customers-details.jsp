<%-- 
    Document   : customers-details
    Created on : Mar 15, 2024, 9:41:43 AM
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
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/quill/dist/quill.snow.css">
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/leaflet/dist/leaflet.css">


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
        <!--Block access to admin/add_books.jsp-->
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"/>
        </c:if>
        <main id="content" role="main" class="main">
            <!-- Content -->
            <div class="content @@layoutBuilder.header.containerMode">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col-sm mb-2 mb-sm-0">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb breadcrumb-no-gutter">
                                    <li class="breadcrumb-item"><a class="breadcrumb-link" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customers.html">Customers</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Customer details</li>
                                </ol>
                            </nav>

                            <h1 class="page-header-title">Anne Richard</h1>
                        </div>
                        <!-- End Col -->

                        <div class="col-sm-auto">
                            <div class="d-flex gap-2">
                                <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm rounded-circle" data-bs-toggle="tooltip" data-bs-placement="right" title="Previous customer">
                                    <i class="bi-arrow-left"></i>
                                </button>
                                <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm rounded-circle" data-bs-toggle="tooltip" data-bs-placement="right" title="Next customer">
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
                    <div class="col-lg-8">
                        <!-- Card -->
                        <div class="card mb-3 mb-lg-5">
                            <!-- Body -->
                            <div class="card-body">
                                <!-- Media -->
                                <div class="d-flex align-items-center mb-5">
                                    <div class="flex-shrink-0">
                                        <div class="avatar avatar-lg avatar-circle">
                                            <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img9.jpg" alt="Image Description">
                                        </div>
                                    </div>

                                    <div class="flex-grow-1 mx-3">
                                        <div class="d-flex mb-1">
                                            <h3 class="mb-0 me-3">Anne Richard</h3>

                                            <!-- Dropdown -->
                                            <div class="dropdown" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit">
                                                <button type="button" class="btn btn-white btn-icon btn-xs rounded-circle" id="editDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="bi-pencil-fill"></i>
                                                </button>

                                                <div class="dropdown-menu dropdown-card mt-1" aria-labelledby="editDropdown" style="min-width: 20rem;">
                                                    <!-- Card -->
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row gx-3">
                                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                                    <label for="firstNameLabel" class="form-label">First name</label>
                                                                    <input type="text" class="form-control" name="firstName" id="firstNameLabel" placeholder="Clarice" aria-label="Clarice" value="Anna">
                                                                </div>
                                                                <!-- End Col -->

                                                                <div class="col-sm-6">
                                                                    <label for="lastNameLabel" class="form-label">Last name</label>
                                                                    <input type="text" class="form-control" name="lastName" id="lastNameLabel" placeholder="Boone" aria-label="Boone" value="Richard">
                                                                </div>
                                                                <!-- End Col -->
                                                            </div>
                                                            <!-- End Row -->

                                                            <div class="d-flex justify-content-end gap-2 mt-3">
                                                                <button type="button" class="btn btn-white btn-sm">Cancel</button>
                                                                <button type="button" class="btn btn-primary btn-sm">Save</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- End Body -->
                                                </div>
                                            </div>
                                            <!-- End Dropdown -->
                                        </div>

                                        <span class="fs-6">Customer for 3 months</span>
                                    </div>

                                    <div class="d-none d-sm-inline-block ms-auto text-end">
                                        <!-- Dropdown -->
                                        <div class="dropdown">
                                            <button type="button" class="btn btn-white btn-sm" id="actionsDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                                Actions <i class="bi-chevron-down"></i>
                                            </button>

                                            <div class="dropdown-menu mt-1" aria-labelledby="actionsDropdown">
                                                <a class="dropdown-item" href="#">
                                                    <i class="bi-envelope dropdown-item-icon"></i> Email
                                                </a>
                                                <a class="dropdown-item" href="#">
                                                    <i class="bi-telephone dropdown-item-icon"></i> Call
                                                </a>
                                                <a class="dropdown-item" href="#">
                                                    <i class="bi-arrow-repeat dropdown-item-icon"></i> Merge
                                                </a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item text-danger" href="#">
                                                    <i class="bi-trash dropdown-item-icon text-danger"></i>
                                                    Delete
                                                </a>
                                            </div>
                                        </div>
                                        <!-- End Dropdown -->
                                    </div>
                                </div>
                                <!-- End Media -->

                                <label class="form-label">Customer note</label>

                                <!-- Quill -->
                                <div class="quill-custom">
                                    <div class="js-quill" style="height: 15rem;"
                                         data-hs-quill-options='{
                                         "placeholder": "Type your description...",
                                         "modules": {
                                         "toolbar": [
                                         ["bold", "italic", "underline", "strike", "link", "image", "blockquote", "code", {"list": "bullet"}]
                                         ]
                                         }
                                         }'>
                                    </div>
                                </div>
                                <!-- End Quill -->
                            </div>
                            <!-- Body -->

                            <!-- Footer -->
                            <div class="card-footer">
                                <div class="d-flex justify-content-end gap-3">
                                    <button type="submit" class="btn btn-white">Discard</button>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                            <!-- End Footer -->
                        </div>
                        <!-- End Card -->

                        <!-- Card -->
                        <div class="card mb-3 mb-lg-5">
                            <!-- Header -->
                            <div class="card-header card-header-content-sm-between">
                                <div class="d-grid gap-2 mb-2 mb-sm-0">
                                    <h4 class="card-header-title">Orders placed</h4>

                                    <!-- Datatable Info -->
                                    <div id="datatableCounterInfo" style="display: none;">
                                        <div class="d-flex align-items-center">
                                            <span class="fs-5 me-3">
                                                <span id="datatableCounter">0</span>
                                                Selected
                                            </span>
                                            <a class="btn btn-outline-danger btn-sm" href="javascript:;">
                                                <i class="bi-trash"></i> Delete
                                            </a>
                                        </div>
                                    </div>
                                    <!-- End Datatable Info -->
                                </div>

                                <!-- Nav Scroller -->
                                <div class="js-nav-scroller hs-nav-scroller-horizontal">
                                    <span class="hs-nav-scroller-arrow-prev" style="display: none;">
                                        <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                                            <i class="bi-chevron-left"></i>
                                        </a>
                                    </span>

                                    <span class="hs-nav-scroller-arrow-next" style="display: none;">
                                        <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                                            <i class="bi-chevron-right"></i>
                                        </a>
                                    </span>

                                    <!-- Nav -->
                                    <ul class="nav nav-segment nav-fill">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="#">All orders</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Open</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Unfulfilled</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Unpaid</a>
                                        </li>
                                    </ul>
                                    <!-- End Nav -->
                                </div>
                                <!-- End Nav Scroller -->
                            </div>
                            <!-- End Header -->

                            <!-- Body -->
                            <div class="card-body">
                                <!-- Input Group -->
                                <div class="input-group input-group-merge">
                                    <div class="input-group-prepend input-group-text">
                                        <i class="bi-search"></i>
                                    </div>

                                    <input id="datatableSearch" type="search" class="form-control" placeholder="Search orders" aria-label="Search orders">
                                </div>
                                <!-- End Input Group -->
                            </div>
                            <!-- End Body -->

                            <!-- Table -->
                            <div class="table-responsive datatable-custom">
                                <table id="datatable" class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                                       data-hs-datatables-options='{
                                       "columnDefs": [{
                                       "targets": [0, 5],
                                       "orderable": false
                                       }],
                                       "order": [],
                                       "info": {
                                       "totalQty": "#datatableWithPaginationInfoTotalQty"
                                       },
                                       "search": "#datatableSearch",
                                       "entries": "#datatableEntries",
                                       "pageLength": 12,
                                       "isResponsive": false,
                                       "isShowPaging": false,
                                       "pagination": "datatablePagination"
                                       }'>
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col" class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input id="datatableCheckAll" type="checkbox" class="form-check-input">
                                                    <label class="form-check-label" for="datatableCheckAll"></label>
                                                </div>
                                            </th>
                                            <th class="table-column-ps-0">Order</th>
                                            <th>Date</th>
                                            <th>Payment status</th>
                                            <th>Total</th>
                                            <th>Invoice</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck1">
                                                    <label class="form-check-label" for="ordersCheck1"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#35463</a>
                                            </td>
                                            <td>Aug 17, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-success text-success">
                                                    <span class="legend-indicator bg-success"></span>Paid
                                                </span>
                                            </td>
                                            <td>$256.39</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck2">
                                                    <label class="form-check-label" for="ordersCheck2"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#23513</a>
                                            </td>
                                            <td>Aug 17, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-success text-success">
                                                    <span class="legend-indicator bg-success"></span>Paid
                                                </span>
                                            </td>
                                            <td>$2,125.00</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck3">
                                                    <label class="form-check-label" for="ordersCheck3"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#62311</a>
                                            </td>
                                            <td>Aug 03, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-success text-success">
                                                    <span class="legend-indicator bg-success"></span>Paid
                                                </span>
                                            </td>
                                            <td>$532.99</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck4">
                                                    <label class="form-check-label" for="ordersCheck4"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#12453</a>
                                            </td>
                                            <td>July 29, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-warning text-warning">
                                                    <span class="legend-indicator bg-warning"></span>Pending
                                                </span>
                                            </td>
                                            <td>$1,035.02</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck5">
                                                    <label class="form-check-label" for="ordersCheck5"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#84223</a>
                                            </td>
                                            <td>July 11, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-success text-success">
                                                    <span class="legend-indicator bg-success"></span>Paid
                                                </span>
                                            </td>
                                            <td>$68.53</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck6">
                                                    <label class="form-check-label" for="ordersCheck6"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#46542</a>
                                            </td>
                                            <td>July 04, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-success text-success">
                                                    <span class="legend-indicator bg-success"></span>Paid
                                                </span>
                                            </td>
                                            <td>$100.00</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck7">
                                                    <label class="form-check-label" for="ordersCheck7"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a class="text-danger" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#35378</a>
                                                <i class="tio-warning text-warning"></i>
                                            </td>
                                            <td>June 27, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-warning text-warning">
                                                    <span class="legend-indicator bg-warning"></span>Pending
                                                </span>
                                            </td>
                                            <td class="text-danger">$89.46</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck8">
                                                    <label class="form-check-label" for="ordersCheck8"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a class="text-danger" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#24562</a>
                                                <i class="tio-warning text-warning"></i>
                                            </td>
                                            <td>June 15, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-warning text-warning">
                                                    <span class="legend-indicator bg-warning"></span>Pending
                                                </span>
                                            </td>
                                            <td class="text-danger">$3,535.46</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck9">
                                                    <label class="form-check-label" for="ordersCheck9"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#78531</a>
                                            </td>
                                            <td>June 12, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-success text-success">
                                                    <span class="legend-indicator bg-success"></span>Paid
                                                </span>
                                            </td>
                                            <td>$23.89</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck10">
                                                    <label class="form-check-label" for="ordersCheck10"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#34634</a>
                                            </td>
                                            <td>June 02, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-success text-success">
                                                    <span class="legend-indicator bg-success"></span>Paid
                                                </span>
                                            </td>
                                            <td>$77.00</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck11">
                                                    <label class="form-check-label" for="ordersCheck11"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a class="text-danger" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#93817</a>
                                                <i class="tio-warning text-warning"></i>
                                            </td>
                                            <td>May 30, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-warning text-warning">
                                                    <span class="legend-indicator bg-warning"></span>Pending
                                                </span>
                                            </td>
                                            <td class="text-danger">$77.00</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck12">
                                                    <label class="form-check-label" for="ordersCheck12"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#43113</a>
                                            </td>
                                            <td>May 25, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-success text-success">
                                                    <span class="legend-indicator bg-success"></span>Paid
                                                </span>
                                            </td>
                                            <td>$1,421.47</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="table-column-pe-0">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="ordersCheck13">
                                                    <label class="form-check-label" for="ordersCheck13"></label>
                                                </div>
                                            </td>
                                            <td class="table-column-ps-0">
                                                <a href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-order-details.html">#12412</a>
                                            </td>
                                            <td>May 16, 2020</td>
                                            <td>
                                                <span class="badge bg-soft-success text-success">
                                                    <span class="legend-indicator bg-success"></span>Paid
                                                </span>
                                            </td>
                                            <td>$45.00</td>
                                            <td>
                                                <a class="btn btn-white btn-sm" href="javascript:;" data-bs-toggle="modal" data-bs-target="#accountInvoiceReceiptModal">
                                                    <i class="bi-receipt me-1"></i> Invoice
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- End Table -->

                            <!-- Footer -->
                            <div class="card-footer">
                                <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                                    <div class="col-sm mb-2 mb-sm-0">
                                        <div class="d-flex justify-content-center justify-content-sm-start align-items-center">
                                            <span class="me-2">Showing:</span>

                                            <!-- Select -->
                                            <div class="tom-select-custom">
                                                <select id="datatableEntries" class="js-select form-select form-select-borderless w-auto" autocomplete="off"
                                                        data-hs-tom-select-options='{
                                                        "searchInDropdown": false,
                                                        "hideSearch": true
                                                        }'>
                                                    <option value="12">12</option>
                                                    <option value="14" selected>14</option>
                                                    <option value="16">16</option>
                                                    <option value="18">18</option>
                                                </select>
                                            </div>
                                            <!-- End Select -->

                                            <span class="text-secondary me-2">of</span>

                                            <!-- Pagination Quantity -->
                                            <span id="datatableWithPaginationInfoTotalQty"></span>
                                        </div>
                                    </div>
                                    <!-- End Col -->

                                    <div class="col-sm-auto">
                                        <div class="d-flex justify-content-center justify-content-sm-end">
                                            <!-- Pagination -->
                                            <nav id="datatablePagination" aria-label="Activity pagination"></nav>
                                        </div>
                                    </div>
                                    <!-- End Col -->
                                </div>
                                <!-- End Row -->
                            </div>
                            <!-- End Footer -->
                        </div>
                        <!-- End Card -->

                        <!-- Card -->
                        <div class="card mb-3 mb-lg-5">
                            <!-- Header -->
                            <div class="card-header card-header-content-between">
                                <h4 class="card-header-title">Timeline</h4>

                                <!-- Checkbox -->
                                <div class="form-check">
                                    <input id="showCommentsCheckbox" type="checkbox" class="form-check-input" checked>
                                    <label class="form-check-label" for="showCommentsCheckbox">Show comments</label>
                                </div>
                                <!-- End Checkbox -->
                            </div>
                            <!-- End Header -->

                            <!-- Body -->
                            <div class="card-body">
                                <!-- Step -->
                                <ul class="step step-icon-sm">
                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-icon step-icon-soft-primary">A</span>

                                            <!-- Quill -->
                                            <div class="quill-custom">
                                                <div class="js-quill-step" style="height: 15rem;"
                                                     data-hs-quill-options='{
                                                     "placeholder": "Type your description...",
                                                     "modules": {
                                                     "toolbar": [
                                                     ["bold", "italic", "underline", "strike", "link", "image", "blockquote", "code", {"list": "bullet"}]
                                                     ]
                                                     }
                                                     }'>
                                                </div>
                                            </div>
                                            <!-- End Quill -->
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <small class="step-divider">Wednesday, 19 August</small>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                            <div class="step-content">
                                                <h5 class="mb-0">You submitted a customer data request.</h5>
                                                <p class="fs-5 mb-0">10:19 AM</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                            <div class="step-content">
                                                <h5 class="mb-0">You added the email anne@gmail.com to this customer.</h5>
                                                <p class="fs-5 mb-0">10:18 AM</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->

                                    <!-- Step Item -->
                                    <li class="step-item">
                                        <div class="step-content-wrapper">
                                            <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                            <div class="step-content">
                                                <h5 class="mb-0">You created this customer.</h5>
                                                <p class="fs-5 mb-0">10:18 AM</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- End Step Item -->
                                </ul>
                                <!-- End Step -->
                            </div>
                            <!-- End Body -->
                        </div>
                        <!-- End Card -->

                        <div class="d-none d-lg-block">
                            <button type="button" class="btn btn-danger">Delete customer</button>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <!-- Card -->
                        <div class="card mb-3 mb-lg-5">
                            <!-- Body -->
                            <div class="card-body">
                                <!-- List Group -->
                                <ul class="list-group list-group-flush list-group-no-gutters">
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

                                        <!-- Leaflet (Map) -->
                                        <div id="map" class="leaflet-custom rounded mt-1 mb-3" style="min-height: 10rem;"
                                             data-hs-leaflet-options='{
                                             "map": {
                                             "scrollWheelZoom": false,
                                             "coords": [37.4040344, -122.0289704]
                                             },
                                             "marker": [
                                             {
                                             "coords": [37.4040344, -122.0289704],
                                             "icon": {
                                             "iconUrl": "https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/map-pin.svg",
                                             "iconSize": [50, 45]
                                             },
                                             "popup": {
                                             "text": "153 Williamson Plaza, Maggieberg"
                                             }
                                             }
                                             ]
                                             }'></div>
                                        <!-- End Leaflet (Map) -->

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

                        <!-- Card -->
                        <div class="card mb-3 mb-lg-5">
                            <!-- Header -->
                            <div class="card-header card-header-content-between">
                                <h5>Email marketing</h5>
                                <a class="link" href="javascript:;">Edit status</a>
                            </div>
                            <!-- End Header -->

                            <!-- Body -->
                            <div class="card-body">
                                <span class="h3">
                                    <span class="badge bg-soft-dark text-dark rounded-pill">Subscribed</span>
                                </span>
                            </div>
                            <!-- Body -->
                        </div>
                        <!-- End Card -->

                        <!-- Card -->
                        <div class="card mb-3 mb-lg-5">
                            <!-- Header -->
                            <div class="card-header">
                                <h4 class="card-header-title">Website activity</h4>
                            </div>
                            <!-- End Header -->

                            <!-- Body -->
                            <div class="card-body">
                                <p>Website activity shows you how many times a contact has visited your site and viewed your pages.</p>

                                <!-- Bar Chart -->
                                <div class="chartjs-custom my-5" style="height: 12rem;">
                                    <canvas id="ecommerce-customer-details" class="js-chart"
                                            data-hs-chartjs-options='{
                                            "type": "line",
                                            "data": {
                                            "labels": ["Aug 1", "Aug 2", "Aug 3", "Aug 4", "Aug 5"],
                                            "datasets": [{
                                            "data": [10, 9, 14, 5, 10],
                                            "backgroundColor": "transparent",
                                            "borderColor": "@@themeAppearance.styles.colors.primary",
                                            "borderWidth": 3,
                                            "pointRadius": 0,
                                            "hoverBorderColor": "@@themeAppearance.styles.colors.primary",
                                            "pointBackgroundColor": "@@themeAppearance.styles.colors.primary",
                                            "pointBorderColor": "#fff",
                                            "pointHoverRadius": 0,
                                            "tension": 0.4
                                            },
                                            {
                                            "data": [15, 13, 18, 7, 26],
                                            "backgroundColor": "transparent",
                                            "borderColor": "#e7eaf3",
                                            "borderWidth": 3,
                                            "pointRadius": 0,
                                            "hoverBorderColor": "#e7eaf3",
                                            "pointBackgroundColor": "#e7eaf3",
                                            "pointBorderColor": "#fff",
                                            "pointHoverRadius": 0,
                                            "tension": 0.4
                                            }]
                                            },
                                            "options": {
                                            "scales": {
                                            "y": {
                                            "grid": {
                                            "color": "#e7eaf3",
                                            "drawBorder": false,
                                            "zeroLineColor": "#e7eaf3"
                                            },
                                            "ticks": {
                                            "stepSize": 10,
                                            "color": "#97a4af",
                                            "font": {
                                            "size": 12,
                                            "family": "Open Sans, sans-serif"
                                            },
                                            "padding": 10
                                            }
                                            },
                                            "x": {
                                            "display": false
                                            }
                                            },
                                            "plugins": {
                                            "tooltip": {
                                            "hasIndicator": true,
                                            "mode": "index",
                                            "intersect": false,
                                            "lineMode": true,
                                            "lineWithLineColor": "rgba(19, 33, 68, 0.075)"
                                            }
                                            },
                                            "hover": {
                                            "mode": "nearest",
                                            "intersect": true
                                            }
                                            }
                                            }'>
                                    </canvas>
                                </div>
                                <!-- End Bar Chart -->

                                <div class="row justify-content-center">
                                    <div class="col-auto">
                                        <span class="legend-indicator"></span> Yesterday
                                    </div>
                                    <!-- End Col -->

                                    <div class="col-auto">
                                        <span class="legend-indicator bg-primary"></span> Today
                                    </div>
                                    <!-- End Col -->
                                </div>
                                <!-- End Row -->
                            </div>
                            <!-- Body -->
                        </div>
                        <!-- End Card -->
                    </div>
                </div>
                <!-- End Row -->

                <div class="d-lg-none">
                    <button type="button" class="btn btn-danger">Delete customer</button>
                </div>
            </div>
            <!-- End Content -->

        </main>
        <!-- JS Global Compulsory @@deleteLine:build -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery/dist/jquery.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery-migrate/dist/jquery-migrate.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JS Implementing Plugins -->
        <!-- bundlejs:vendor [https://d24ouiz0dt1p4y.cloudfront.net] -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-navbar-vertical-aside/dist/hs-navbar-vertical-aside.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-form-search/dist/hs-form-search.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-nav-scroller/dist/hs-nav-scroller.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/js/tom-select.complete.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/quill/dist/quill.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/dropzone/dist/min/dropzone.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/datatables.net.extensions/select/select.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/chart.js/dist/Chart.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/chartjs-chart-matrix/dist/chartjs-chart-matrix.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/leaflet/dist/leaflet.js"></script>

        <!-- JS Front -->
        <!-- bundlejs:theme [https://d24ouiz0dt1p4y.cloudfront.net] -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.core.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.bs-dropdown.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.tom-select.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.quill.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.dropzone.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.datatables.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.chartjs.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.leaflet.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.theme-appearance-charts.js"></script>


        <!-- JS Plugins Init. -->
        <script>
            $(document).on('ready', function () {
                // INITIALIZATION OF DATATABLES
                // =======================================================
                HSCore.components.HSDatatables.init($('#datatable'), {
                    select: {
                        style: 'multi',
                        selector: 'td:first-child input[type="checkbox"]',
                        classMap: {
                            checkAll: '#datatableCheckAll',
                            counter: '#datatableCounter',
                            counterInfo: '#datatableCounterInfo'
                        }
                    },
                    language: {
                        zeroRecords: `<div class="text-center p-4">
                    <img class="mb-3" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-error.svg" alt="Image Description" style="width: 10rem;" data-hs-theme-appearance="default">
                    <img class="mb-3" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations-light/oc-error.svg" alt="Image Description" style="width: 10rem;" data-hs-theme-appearance="dark">
                  <p class="mb-0">No data to show</p>
                  </div>`
                    }
                });

                const datatable = HSCore.components.HSDatatables.getItem(0)

                $('.js-datatable-filter').on('change', function () {
                    var $this = $(this),
                            elVal = $this.val(),
                            targetColumnIndex = $this.data('target-column-index');

                    datatable.column(targetColumnIndex).search(elVal).draw();
                });
            });
        </script>

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


                    // INITIALIZATION OF NAV SCROLLER
                    // =======================================================
                    new HsNavScroller('.js-nav-scroller')


                    // INITIALIZATION OF SELECT
                    // =======================================================
                    HSCore.components.HSTomSelect.init('.js-select')


                    // INITIALIZATION OF CHARTJS
                    // =======================================================
                    HSCore.components.HSChartJS.init('.js-chart')


                    // INITIALIZATION OF QUILLJS EDITOR
                    // =======================================================
                    HSCore.components.HSQuill.init('.js-quill')
                    HSCore.components.HSQuill.init('.js-quill-step')


                    // INITIALIZATION OF LEAFLET
                    // =======================================================
                    const leaflet = HSCore.components.HSLeaflet.init(document.getElementById('map'))

                    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
                        id: 'mapbox/light-v9'
                    }).addTo(leaflet)
                }
            })()
        </script>

    </body>
</html>
