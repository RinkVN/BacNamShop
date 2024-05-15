<%-- 
    Document   : customers
    Created on : Mar 15, 2024, 9:19:34 AM
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
                <div class="page-header">
                    <div class="row align-items-center mb-3">
                        <div class="col-md mb-2 mb-md-0">
                            <h1 class="page-header-title">Customers <span class="badge bg-soft-dark text-dark ms-2">97,524</span></h1>

                        </div>
                        <!-- End Col -->

                        <div class="col-md-auto">
                            <a class="btn btn-primary" href="add-csustomers.jsp">Add customers</a>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->

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
                        <ul class="nav nav-tabs page-header-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">All</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">New</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Returning</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Abandoned checkouts</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Email subscribers</a>
                            </li>
                        </ul>
                        <!-- End Nav -->
                    </div>
                    <!-- End Nav Scroller -->
                </div>
                <!-- End Page Header -->

                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header card-header-content-sm-between">
                        <div class="mb-2 mb-sm-0">
                            <form>
                                <!-- Search -->
                                <div class="input-group input-group-merge input-group-flush">
                                    <div class="input-group-prepend input-group-text">
                                        <i class="bi-search"></i>
                                    </div>
                                    <input id="datatableSearch" type="search" class="form-control" placeholder="Search orders" aria-label="Search orders">
                                </div>
                                <!-- End Search -->
                            </form>
                        </div>

                        <div class="d-grid d-sm-flex justify-content-sm-end align-items-sm-center gap-2">
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

                            <!-- Dropdown -->
                            <div class="dropdown">
                                <button type="button" class="btn btn-white w-100" id="showHideDropdown" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                                    <i class="bi-table me-1"></i> Columns <span class="badge bg-soft-dark text-dark rounded-circle ms-1">5</span>
                                </button>

                                <div class="dropdown-menu dropdown-menu-end dropdown-card" aria-labelledby="showHideDropdown" style="width: 15rem;">
                                    <div class="card card-sm">
                                        <div class="card-body">
                                            <div class="d-grid gap-3">
                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_name">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Name</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_name" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_email">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">E-mail</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_email" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_phone">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Phone</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_phone">
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_country">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Country</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_country" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_account_status">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Account status</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_account_status">
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_orders">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Orders</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_orders" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_total_spent">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Total spent</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_total_spent" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_last_activity">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Last activity</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_last_activity">
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Dropdown -->
                        </div>
                    </div>
                    <!-- End Header -->

                    <!-- Table -->
                    <div class="table-responsive datatable-custom">
                        <table id="datatable" class="table table-lg table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                               data-hs-datatables-options='{
                               "columnDefs": [{
                               "targets": [0],
                               "orderable": false
                               }],
                               "order": [],
                               "info": {
                               "totalQty": "#datatableWithPaginationInfoTotalQty"
                               },
                               "search": "#datatableSearch",
                               "entries": "#datatableEntries",
                               "pageLength": 15,
                               "isResponsive": false,
                               "isShowPaging": false,
                               "pagination": "datatablePagination"
                               }'>
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col" class="table-column-pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="datatableCheckAll">
                                            <label class="form-check-label" for="datatableCheckAll"></label>
                                        </div>
                                    </th>
                                    <th class="table-column-ps-0">Name</th>
                                    <th>E-mail</th>
                                    <th>Phone</th>
                                    <th>Country</th>
                                    <th>Account status</th>
                                    <th>Orders</th>
                                    <th>Total spent</th>
                                    <th>Last activity</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck1">
                                            <label class="form-check-label" for="usersDataCheck1"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-circle">
                                                    <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img10.jpg" alt="Image Description">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Amanda Harvey <i class="bi-patch-check-fill text-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Top endorsed"></i></span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>amanda@site.com</td>
                                    <td>+1-202-555-0140</td>
                                    <td>United Kingdom</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>3</td>
                                    <td>$3,511.01</td>
                                    <td>Aug 17, 2020, 5:48 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck2">
                                            <label class="form-check-label" for="usersDataCheck2"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-primary avatar-circle">
                                                    <span class="avatar-initials">A</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Anne Richard</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>anne@site.com</td>
                                    <td>+1-752-235-2353</td>
                                    <td>United States</td>
                                    <td>
                                        <span class="legend-indicator bg-danger"></span>Disabled
                                    </td>
                                    <td>1</td>
                                    <td>$235.00</td>
                                    <td>Aug 17, 2020, 2:01 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck3">
                                            <label class="form-check-label" for="usersDataCheck3"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-circle">
                                                    <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img3.jpg" alt="Image Description">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">David Harrison</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>david@site.com</td>
                                    <td>+1-235-364-2611</td>
                                    <td>United States</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>53 <span class="badge bg-soft-dark text-dark ms-1">+3 today</span></td>
                                    <td>$346,410.12</td>
                                    <td>Aug 17, 2020, 1:55 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck4">
                                            <label class="form-check-label" for="usersDataCheck4"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-circle">
                                                    <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img5.jpg" alt="Image Description">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Finch Hoot</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>finch@site.com</td>
                                    <td>+1-743-632-9574</td>
                                    <td>Argentina</td>
                                    <td>
                                        <span class="legend-indicator bg-danger"></span>Disabled
                                    </td>
                                    <td>12 <span class="badge bg-soft-dark text-dark ms-1">+1 today</span></td>
                                    <td>$1,350.04</td>
                                    <td>Aug 17, 2020, 1:54 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck5">
                                            <label class="form-check-label" for="usersDataCheck5"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-dark avatar-circle">
                                                    <span class="avatar-initials">B</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Bob Dean</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>bob@site.com</td>
                                    <td>+1-854-235-9755</td>
                                    <td>Austria</td>
                                    <td>
                                        <span class="legend-indicator bg-danger"></span>Disabled
                                    </td>
                                    <td>8</td>
                                    <td>$912.13</td>
                                    <td>Aug 17, 2020, 1:04 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck6">
                                            <label class="form-check-label" for="usersDataCheck6"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-circle">
                                                    <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img9.jpg" alt="Image Description">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Ella Lauda <i class="bi-patch-check-fill text-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Top endorsed"></i></span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>ella@site.com</td>
                                    <td>+1-846-157-2423</td>
                                    <td>United Kingdom</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>5</td>
                                    <td>$451.66</td>
                                    <td>Aug 17, 2020, 1:01 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck7">
                                            <label class="form-check-label" for="usersDataCheck7"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-info avatar-circle">
                                                    <span class="avatar-initials">L</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Lori Hunter</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>hunter@site.com</td>
                                    <td>+1-844-235-4378</td>
                                    <td>Estonia</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>11 <span class="badge bg-soft-dark text-dark ms-1">+4 today</span></td>
                                    <td>$3,582.46</td>
                                    <td>Aug 17, 2020, 12:56 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck16">
                                            <label class="form-check-label" for="usersDataCheck16"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-primary avatar-circle">
                                                    <span class="avatar-initials">M</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Mark Colbert</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>mark@site.com</td>
                                    <td>+1-235-235-7482</td>
                                    <td>Canada</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>4</td>
                                    <td>$481.00</td>
                                    <td>Aug 17, 2020, 12:54 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck9">
                                            <label class="form-check-label" for="usersDataCheck9"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-circle">
                                                    <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img6.jpg" alt="Image Description">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Costa Quinn</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>costa@site.com</td>
                                    <td>+1-543-346-6343</td>
                                    <td>France</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>9</td>
                                    <td>$2,591.00</td>
                                    <td>Aug 17, 2020, 12:48 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck10">
                                            <label class="form-check-label" for="usersDataCheck10"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-danger avatar-circle">
                                                    <span class="avatar-initials">R</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Rachel Doe <i class="bi-patch-check-fill text-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Top endorsed"></i></span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>rachel@site.com</td>
                                    <td>+1-232-643-3643</td>
                                    <td>United States</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>21</td>
                                    <td>$5,219.18</td>
                                    <td>Aug 17, 2020, 12:41 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck11">
                                            <label class="form-check-label" for="usersDataCheck11"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-circle">
                                                    <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img8.jpg" alt="Image Description">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Linda Bates</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>linda@site.com</td>
                                    <td>+1-123-523-5433</td>
                                    <td>United Kingdom</td>
                                    <td>
                                        <span class="legend-indicator bg-danger"></span>Disabled
                                    </td>
                                    <td>32 <span class="badge bg-soft-dark text-dark ms-1">+1 today</span></td>
                                    <td>$8,281.99</td>
                                    <td>Aug 17, 2020, 12:36 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck12">
                                            <label class="form-check-label" for="usersDataCheck12"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-info avatar-circle">
                                                    <span class="avatar-initials">B</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Brian Halligan</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>brian@site.com</td>
                                    <td>+1-141-463-1512</td>
                                    <td>France</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>1</td>
                                    <td>$100.00</td>
                                    <td>Aug 17, 2020, 12:25 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck13">
                                            <label class="form-check-label" for="usersDataCheck13"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-dark avatar-circle">
                                                    <span class="avatar-initials">C</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Chris Mathew</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>chris@site.com</td>
                                    <td>+1-253-463-1242</td>
                                    <td>Switzerland</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>1</td>
                                    <td>$26.00</td>
                                    <td>Aug 16, 2020, 4:31 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck14">
                                            <label class="form-check-label" for="usersDataCheck14"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-circle">
                                                    <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img7.jpg" alt="Image Description">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Clarice Boone <i class="bi-patch-check-fill text-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Top endorsed"></i></span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>clarice@site.com</td>
                                    <td>+1-532-325-3253</td>
                                    <td>United Kingdom</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>2</td>
                                    <td>$274.28</td>
                                    <td>Aug 16, 2020, 3:26 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck15">
                                            <label class="form-check-label" for="usersDataCheck15"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-dark avatar-circle">
                                                    <span class="avatar-initials">L</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Lewis Clarke</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>lewis@site.com</td>
                                    <td>+1-235-235-2355</td>
                                    <td>Switzerland</td>
                                    <td>
                                        <span class="legend-indicator bg-danger"></span>Disabled
                                    </td>
                                    <td>4</td>
                                    <td>$999.00</td>
                                    <td>Aug 16, 2020, 2:54 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck8">
                                            <label class="form-check-label" for="usersDataCheck8"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-circle">
                                                    <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img4.jpg" alt="Image Description">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Sam Kart</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>sam@site.com</td>
                                    <td>+1-457-745-7555</td>
                                    <td>Canada</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>62 <span class="badge bg-soft-dark text-dark ms-1">+9 today</span></td>
                                    <td>$9,281.58</td>
                                    <td>Aug 16, 2020, 2:48 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck17">
                                            <label class="form-check-label" for="usersDataCheck17"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-danger avatar-circle">
                                                    <span class="avatar-initials">J</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Johnny Appleseed</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>johnny@site.com</td>
                                    <td>+1-457-734-4544</td>
                                    <td>United States</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>30</td>
                                    <td>$23,291.37</td>
                                    <td>Aug 16, 2020, 2:40 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck18">
                                            <label class="form-check-label" for="usersDataCheck18"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-danger avatar-circle">
                                                    <span class="avatar-initials">P</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Phileas Fogg</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>phileas@site.com</td>
                                    <td>+1-065-084-8658</td>
                                    <td>Spain</td>
                                    <td>
                                        <span class="legend-indicator bg-danger"></span>Disabled
                                    </td>
                                    <td>10</td>
                                    <td>$82.39</td>
                                    <td>Aug 16, 2020, 1:59 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck19">
                                            <label class="form-check-label" for="usersDataCheck19"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-circle">
                                                    <img class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img6.jpg" alt="Image Description">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Mark Williams <i class="bi-patch-check-fill text-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Top endorsed"></i></span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>mark@site.com</td>
                                    <td>+1-340-055-4733</td>
                                    <td>United Kingdom</td>
                                    <td>
                                        <span class="legend-indicator bg-danger"></span>Disabled
                                    </td>
                                    <td>7</td>
                                    <td>$343.93</td>
                                    <td>Aug 16, 2020, 1:55 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck20">
                                            <label class="form-check-label" for="usersDataCheck20"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-dark avatar-circle">
                                                    <span class="avatar-initials">T</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Timothy Silva</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>timothy@site.com</td>
                                    <td>+1-083-642-4673</td>
                                    <td>Italy</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>9</td>
                                    <td>$2,238.29</td>
                                    <td>Aug 16, 2020, 1:15 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck21">
                                            <label class="form-check-label" for="usersDataCheck21"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-dark avatar-circle">
                                                    <span class="avatar-initials">G</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Gary Bishop <i class="bi-patch-check-fill text-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Top endorsed"></i></span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>gary@site.com</td>
                                    <td>+1-325-547-5683</td>
                                    <td>Latvia</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>6 <span class="badge bg-soft-dark text-dark ms-1">+1 today</span></td>
                                    <td>$2,120.29</td>
                                    <td>Aug 16, 2020, 1:15 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck22">
                                            <label class="form-check-label" for="usersDataCheck22"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-dark avatar-circle">
                                                    <span class="avatar-initials">Y</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Yorker Scogings</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>yorker@site.com</td>
                                    <td>+1-954-236-3235</td>
                                    <td>Norway</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>3</td>
                                    <td>$882.00</td>
                                    <td>Aug 16, 2020, 1:15 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck23">
                                            <label class="form-check-label" for="usersDataCheck23"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-info avatar-circle">
                                                    <span class="avatar-initials">F</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Frank Phillips</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>frank@site.com</td>
                                    <td>+1-253-574-3422</td>
                                    <td>Norway</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>1</td>
                                    <td>$92.00</td>
                                    <td>Aug 16, 2020, 1:15 (ET)</td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="usersDataCheck24">
                                            <label class="form-check-label" for="usersDataCheck24"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="d-flex align-items-center" href="customers-details.jsp">
                                            <div class="flex-shrink-0">
                                                <div class="avatar avatar-soft-primary avatar-circle">
                                                    <span class="avatar-initials">E</span>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <span class="h5 text-inherit">Elizabeth Carter</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>eliz@site.com</td>
                                    <td>+1-800-724-3303</td>
                                    <td>United States</td>
                                    <td>
                                        <span class="legend-indicator bg-success"></span>Active
                                    </td>
                                    <td>2</td>
                                    <td>$50.00</td>
                                    <td>Aug 16, 2020, 1:15 (ET)</td>
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
                                            <option value="10">10</option>
                                            <option value="15" selected>15</option>
                                            <option value="20">20</option>
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
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/datatables.net.extensions/select/select.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/dropzone/dist/min/dropzone.min.js"></script>

        <!-- JS Front -->
        <!-- bundlejs:theme [https://d24ouiz0dt1p4y.cloudfront.net] -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.core.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.bs-dropdown.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.tom-select.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.datatables.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.dropzone.js"></script>


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

                const datatable = HSCore.components.HSDatatables.getItem('datatable')

                $('.js-datatable-filter').on('change', function () {
                    var $this = $(this),
                            elVal = $this.val(),
                            targetColumnIndex = $this.data('target-column-index');

                    datatable.column(targetColumnIndex).search(elVal).draw();
                });

                $('#datatableSearch').on('mouseup', function (e) {
                    var $input = $(this),
                            oldValue = $input.val();

                    if (oldValue == "")
                        return;

                    setTimeout(function () {
                        var newValue = $input.val();

                        if (newValue == "") {
                            // Gotcha
                            datatable.search('').draw();
                        }
                    }, 1);
                });

                $('#toggleColumn_name').change(function (e) {
                    datatable.columns(1).visible(e.target.checked)
                })

                $('#toggleColumn_email').change(function (e) {
                    datatable.columns(2).visible(e.target.checked)
                })

                datatable.columns(3).visible(false)

                $('#toggleColumn_phone').change(function (e) {
                    datatable.columns(3).visible(e.target.checked)
                })

                $('#toggleColumn_country').change(function (e) {
                    datatable.columns(4).visible(e.target.checked)
                })

                datatable.columns(5).visible(false)

                $('#toggleColumn_account_status').change(function (e) {
                    datatable.columns(5).visible(e.target.checked)
                })

                $('#toggleColumn_orders').change(function (e) {
                    datatable.columns(6).visible(e.target.checked)
                })

                datatable.columns(8).visible(false)

                $('#toggleColumn_last_activity').change(function (e) {
                    datatable.columns(8).visible(e.target.checked)
                })

                $('#toggleColumn_total_spent').change(function (e) {
                    datatable.columns(7).visible(e.target.checked)
                })
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


                // INITIALIZATION OF SELECT
                // =======================================================
                HSCore.components.HSTomSelect.init('.js-select')


                // INITIALIZATION OF NAV SCROLLER
                // =======================================================
                new HsNavScroller('.js-nav-scroller')


                // INITIALIZATION OF MODAL ON PAGE LOAD
                // =======================================================
                new bootstrap.Modal(document.getElementById('exportCustomersGuideModal')).show()


                // INITIALIZATION OF DROPZONE
                // =======================================================
                HSCore.components.HSDropzone.init('.js-dropzone')
                }
            })()
        </script>

    </body>
</html>
