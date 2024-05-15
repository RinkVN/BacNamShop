<%-- 
    Document   : list-product
    Created on : Mar 12, 2024, 9:48:30 PM
    Author     : datla
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>All Products</title>
        <link rel="shortcut icon" type="image/png" href="css/favicon.png"/>
        <!-- GOOGLE FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet"/>
        <!-- BOXICONS -->
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/js/bootstrap/bootstrap.min.js" />
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="preload" href="https://d24ouiz0dt1p4y.cloudfront.net/assets/css/theme.css" data-hs-appearance="default" as="style" />  
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />

        <link rel="stylesheet" href="css/theme.min.css" />

        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/css/tom-select.bootstrap5.css" />
    </head>

    <body>

        <%@ include file="sidebar.jsp"%>

        <c:choose>
            <c:when test="${userobj.name != 'Admin'}">
                <c:redirect url="../index.jsp"/>
            </c:when>
        </c:choose>

        <c:if test="${not empty succMess}">
            <div class="position-relative mb-4" aria-live="polite" aria-atomic="true" >
                <div class="toast show ">
                    <div class="toast-header ">
                        <strong class="me-auto">Chúc Mừng</strong>
                        <small class="text-body-secondary"><i class="fas fa-check"></i></small>
                        <button class="btn ms-2 p-0" type="button" data-bs-dismiss="toast" aria-label="Close"><span class="uil uil-times fs-7"></span></button>
                    </div>
                    <div class="toast-body">${succMess}</div>
                </div>
            </div>
            <c:remove var="succMess" scope="session"/>
        </c:if>

        <c:if test="${not empty failMess}">
            <div class="position-relative mb-4" aria-live="polite" aria-atomic="true" >
                <div class="toast show ">
                    <div class="toast-header ">
                        <strong class="me-auto">Lỗi</strong>
                        <small class="text-body-secondary"><i class="fa-solid fa-xmark"></i></small>
                        <button class="btn ms-2 p-0" type="button" data-bs-dismiss="toast" aria-label="Close"><span class="uil uil-times fs-7"></span></button>
                    </div>
                    <div class="toast-body">${failMess}</div>
                </div>
            </div>
            <c:remove var="failMess" scope="session"/>
        </c:if>
        <!-- MAIN CONTENT -->
        <main id="content" role="main" class="main">
            <!-- Content -->
            <div class="content @@layoutBuilder.header.containerMode">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="align-items-center mb-3">
                        <div class="col-sm mb-2 mb-sm-0">
                            <h1 class="page-header-title">
                                Sản phẩm
                                <span class="badge bg-soft-dark text-dark ms-2">72,031</span>
                            </h1>

                            <!-- End Col -->
                            <!-- Nav Scroller -->
                            <div class="js-nav-scroller hs-nav-scroller-horizontal">
                                <span class="hs-nav-scroller-arrow-prev" style="display: none">
                                    <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                                        <i class="bi-chevron-left"></i>
                                    </a>
                                </span>

                                <span class="hs-nav-scroller-arrow-next" style="display: none">
                                    <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                                        <i class="bi-chevron-right"></i>
                                    </a>
                                </span>

                                <!-- Nav -->
                                <ul
                                    class="nav nav-tabs page-header-tabs"
                                    id="pageHeaderTab"
                                    role="tablist"
                                    >
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">Tất cả sản phẩm</a>
                                    </li>
                                    <li class="nav-item">
                                        <a
                                            class="nav-link disabled"
                                            href="#"
                                            tabindex="-1"
                                            aria-disabled="true"
                                            >Archived</a
                                        >
                                    </li>
                                    <li class="nav-item">
                                        <a
                                            class="nav-link disabled"
                                            href="#"
                                            tabindex="-1"
                                            aria-disabled="true"
                                            >Publish</a
                                        >
                                    </li>
                                    <li class="nav-item">
                                        <a
                                            class="nav-link disabled"
                                            href="#"
                                            tabindex="-1"
                                            aria-disabled="true"
                                            >Unpublish</a
                                        >
                                    </li>
                                </ul>
                                <!-- End Nav -->
                            </div>
                            <!-- End Nav Scroller -->

                            <!-- End Col -->
                        </div>
                        <!-- End Row -->



                        <div class="align-items-center mb-3 btn-add-books">
                            <button type="submit" class="btn btn-primary" >
                                <a href="add-product.jsp">Thêm sản phẩm</a>
                            </button>
                        </div>
                    </div>


                </div>
                <!-- End Page Header -->

                <div class="row justify-content-end mb-3">
                    <div class="col-lg">
                        <!-- Datatable Info -->
                        <div id="datatableCounterInfo" style="display:"">
                            <div
                                class="d-sm-flex justify-content-lg-end align-items-sm-center"
                                >
                                <span class="d-block d-sm-inline-block fs-5 me-3 mb-2 mb-sm-0">
                                    <span id="datatableCounter">0</span>
                                    Chọn
                                </span>

                                <a
                                    class="btn btn-outline-danger btn-sm mb-2 mb-sm-0 me-2"
                                    href="#"
                                    >
                                    <i class="bi-trash"></i> Delete
                                </a>
                                <a
                                    class="btn btn-white btn-sm mb-2 mb-sm-0 me-2"
                                    href="javascript:;"
                                    >
                                    <i class="bi-archive"></i> Archive
                                </a>
                                <a
                                    class="btn btn-white btn-sm mb-2 mb-sm-0 me-2"
                                    href="javascript:;"
                                    >
                                    <i class="bi-upload"></i> Publish
                                </a>
                                <a
                                    class="btn btn-white btn-sm mb-2 mb-sm-0"
                                    href="javascript:;"
                                    >
                                    <i class="bi-x-lg"></i> Unpublish
                                </a>
                            </div>
                        </div>
                        <!-- End Datatable Info -->
                    </div>
                </div>
                <!-- End Row -->

                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header card-header-content-md-between">
                        <div class="mb-2 mb-md-0">
                            <form>
                                <!-- Search -->
                                <div class="input-group input-group-merge input-group-flush">
                                    <div class="input-group-prepend input-group-text">
                                        <i class="bi-search"></i>
                                    </div>
                                    <input
                                        id="datatableSearch"
                                        type="search"
                                        class="form-control"
                                        placeholder="Search Book"
                                        aria-label="Search users"
                                        />
                                </div>
                                <!-- End Search -->
                            </form>
                        </div>

                        <div class="d-grid d-sm-flex gap-2">
                            <button
                                class="btn btn-white"
                                type="button"
                                data-bs-toggle="offcanvas"
                                data-bs-target="#offcanvasEcommerceProductFilter"
                                aria-controls="offcanvasEcommerceProductFilter"
                                >
                                <i class="bi-filter me-1"></i> Lọc
                            </button>

                            <!-- Dropdown -->
                            <div class="dropdown">
                                <button
                                    type="button"
                                    class="btn btn-white w-100"
                                    id="showHideDropdown"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    data-bs-auto-close="outside"
                                    >
                                    <i class="bi-table me-1"></i> Cột
                                    <span class="badge bg-soft-dark text-dark rounded-circle ms-1"
                                          >6</span
                                    >
                                </button>

                                <div
                                    class="dropdown-menu dropdown-menu-end dropdown-card"
                                    aria-labelledby="showHideDropdown"
                                    style="width: 15rem"
                                    >
                                    <div class="card card-sm">
                                        <div class="card-body">
                                            <div class="d-grid gap-3">
                                                <!-- Form Switch -->
                                                <label
                                                    class="row form-check form-switch"
                                                    for="toggleColumn_product"
                                                    >
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Sản Phẩm</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input
                                                            type="checkbox"
                                                            class="form-check-input"
                                                            id="toggleColumn_product"
                                                            checked
                                                            />
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->
                                                <!-- Form Switch -->
                                                <label
                                                    class="row form-check form-switch"
                                                    for="toggleColumn_status"
                                                    >
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Type</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input
                                                            type="checkbox"
                                                            class="form-check-input"
                                                            id="toggleColumn_type"
                                                            checked
                                                            />
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->
                                                <!-- Form Switch -->
                                                <label
                                                    class="row form-check form-switch"
                                                    for="toggleColumn_empty"
                                                    >
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Empty</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input
                                                            type="checkbox"
                                                            class="form-check-input"
                                                            id="toggleColumn_variants"
                                                            checked
                                                            />
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->
                                                <!-- Form Switch -->
                                                <label
                                                    class="row form-check form-switch"
                                                    for="toggleColumn_status"
                                                    >
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Trạng Thái</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input
                                                            type="checkbox"
                                                            class="form-check-input"
                                                            id="toggleColumn_type"
                                                            checked
                                                            />
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label
                                                    class="row form-check form-switch"
                                                    for="toggleColumn_sku"
                                                    >
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">SKU</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input
                                                            type="checkbox"
                                                            class="form-check-input"
                                                            id="toggleColumn_vendor"
                                                            />
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label
                                                    class="row form-check form-switch"
                                                    for="toggleColumn_price"
                                                    >
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Giá</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input
                                                            type="checkbox"
                                                            class="form-check-input"
                                                            id="toggleColumn_stocks"
                                                            checked
                                                            />
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label
                                                    class="row form-check form-switch"
                                                    for="toggleColumn_quantity"
                                                    >
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Số Lượng</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input
                                                            type="checkbox"
                                                            class="form-check-input"
                                                            id="toggleColumn_sku"
                                                            checked
                                                            />
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label
                                                    class="row form-check form-switch"
                                                    for="toggleColumn_categories"
                                                    >
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Danh Mục</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input
                                                            type="checkbox"
                                                            class="form-check-input"
                                                            id="toggleColumn_price"
                                                            checked
                                                            />
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label
                                                    class="row form-check form-switch"
                                                    for="toggleColumn_Actions"
                                                    >
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Hành Động</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input
                                                            type="checkbox"
                                                            class="form-check-input"
                                                            id="toggleColumn_quantity"
                                                            />
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
                        <table
                            id="datatable"
                            class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                            data-hs-datatables-options='{
                            "columnDefs": [{
                            "targets": [0, 4, 9],
                            "width": "5%",
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
                            }'
                            >
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col" class="table-column-pe-0">
                                        <div class="form-check">
                                            <input
                                                class="form-check-input"
                                                type="checkbox"
                                                value=""
                                                id="datatableCheckAll"
                                                />
                                            <label class="form-check-label"> </label>
                                        </div>
                                    </th>
                                    <th class="table-column-ps-0">Sản Phẩm</th>
                                    <th>Type</th>
                                    <th>Empty</th>  
                                    <th>Trạng Thái</th>
                                    <th>SKU</th>
                                    <th>Giá</th>
                                    <th>Số Lượng</th>
                                    <th>Danh Mục</th>
                                    <th>Hành Động</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    ProductDAOimpl d = new ProductDAOimpl(DBContext.getConn());
                                    List<ProductInfo> list = d.getAllProduct();
                                    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                                    for (ProductInfo p : list) {
                                        double price = Double.parseDouble(p.getPrice());

                                        String formattedPrice = currencyFormat.format(price);
                                %>
                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input
                                                class="form-check-input"
                                                type="checkbox"
                                                value=""
                                                id="datatableCheckAll1"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="datatableCheckAll1"
                                                ></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a
                                            class="d-flex align-items-center"
                                            href="edit-book.jsp?id=<%= p.getProductID()%>"
                                            >
                                            <div class="flex-shrink-0">
                                                <img
                                                    class="avatar avatar-lg"
                                                    src="../img/<%= p.getProductPhoto()%>"
                                                    alt="Products"
                                                    />
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <h5 class="text-inherit mb-0">
                                                    <%= p.getProductName()%>
                                                </h5>
                                            </div>
                                        </a>
                                    </td>
                                    <td>a</td>
                                    <td>2 </td>
                                    <td>
                                        <div class="form-check form-switch" style="padding: 0;">
                                            <label
                                                class="form-check-label"
                                                for="stocksCheckbox1"><%= p.getStatus()%>
                                            </label>
                                        </div>
                                    </td>
                                    <td><%= p.getSku()%></td>
                                    <td><%= formattedPrice%></td>
                                    <td><%= p.getUnitsInStock()%></td>
                                    <td><%= p.getNewCategory()%></td>

                                    <td>
                                        <div class="btn-group" role="group">
                                            <a
                                                class="btn btn-white btn-sm"
                                                href="edit-product.jsp?id=<%= p.getProductID()%>"
                                                >
                                                <i class="bi-pencil-fill me-1"></i> Edit
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button
                                                    type="button"
                                                    class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty"
                                                    id="productsEditDropdown1"
                                                    data-bs-toggle="dropdown"
                                                    aria-expanded="false"
                                                    ></button>

                                                <div
                                                    class="dropdown-menu dropdown-menu-end mt-1"
                                                    aria-labelledby="productsEditDropdown1"
                                                    >
                                                    <a class="dropdown-item" href="../deleteproduct?id=<%= p.getProductID()%>">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                    <a class="dropdown-item" href="edit-variant.jsp?id=<%= p.getProductID()%>">
                                                        <i class="bi-trash dropdown-item-icon"></i> Edit Variant
                                                    </a>
                                                    <a class="dropdown-item" href="#">
                                                        <i class="bi-archive dropdown-item-icon"></i>
                                                        Archive
                                                    </a>
                                                    <a class="dropdown-item" href="#">
                                                        <i class="bi-upload dropdown-item-icon"></i> Publish
                                                    </a>
                                                    <a class="dropdown-item" href="#">
                                                        <i class="bi-x-lg dropdown-item-icon"></i> Unpublish
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Button Group -->
                                        </div>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <!-- End Table -->

                    <!-- Footer -->
                    <div class="card-footer">
                        <div
                            class="row justify-content-center justify-content-sm-between align-items-sm-center"
                            >
                            <div class="col-sm mb-2 mb-sm-0">
                                <div
                                    class="d-flex justify-content-center justify-content-sm-start align-items-center"
                                    >
                                    <span class="me-2">Showing:</span>

                                    <!-- Select -->
                                    <div class="tom-select-custom">
                                        <select
                                            id="datatableEntries"
                                            class="js-select form-select form-select-borderless w-auto"
                                            autocomplete="off"
                                            data-hs-tom-select-options='{
                                            "searchInDropdown": false,
                                            "hideSearch": true
                                            }'
                                            >
                                            <option value="12">12</option>
                                            <option value="20" selected>20</option>
                                            <option value="50">50</option>

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
                                <div
                                    class="d-flex justify-content-center justify-content-sm-end"
                                    >
                                    <!-- Pagination -->
                                    <nav
                                        id="datatablePagination"
                                        aria-label="Activity pagination"
                                        ></nav>
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
        <!-- END MAIN CONTENT -->

        <div class="overlay"></div>

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

                $('#toggleColumn_product').change(function (e) {
                    datatable.columns(1).visible(e.target.checked)
                })

                datatable.columns(2).visible(false)

                $('#toggleColumn_type').change(function (e) {
                    datatable.columns(2).visible(e.target.checked)
                })

                datatable.columns(3).visible(false)

                $('#toggleColumn_empty').change(function (e) {
                    datatable.columns(3).visible(e.target.checked)
                })

                $('#toggleColumn_status').change(function (e) {
                    datatable.columns(4).visible(e.target.checked)
                })

                $('#toggleColumn_sku').change(function (e) {
                    datatable.columns(5).visible(e.target.checked)
                })

                $('#toggleColumn_price').change(function (e) {
                    datatable.columns(6).visible(e.target.checked)
                })

                $('#toggleColumn_quantity').change(function (e) {
                    datatable.columns(7).visible(e.target.checked)
                })


                $('#toggleColumn_categories').change(function (e) {
                    datatable.columns(8).visible(e.target.checked)
                })

                $('#toggleColumn_actions').change(function (e) {
                    datatable.columns(9).visible(e.target.checked)
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


                    // INITIALIZATION OF DROPZONE
                    // =======================================================
                    HSCore.components.HSDropzone.init('.js-dropzone')
                }
            })()
        </script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var deleteLink = document.querySelector(".deleteLink");

                deleteLink.addEventListener("click", function (event) {
                    event.preventDefault();

                    var checkedCheckboxes = document.querySelectorAll('.productCheckbox:selected');
                    var queryString = '';

                    for (var i = 0; i < checkedCheckboxes.length; i++) {
                        queryString += 'BookID=' + checkedCheckboxes[i].value;

                        // Thêm dấu & nếu chưa phải là giá trị cuối cùng
                        if (i < checkedCheckboxes.length - 1) {
                            queryString += '&';
                        }
                    }

                    var newUrl = "deleteBook?" + queryString; // Thay thế 'deleteProducts' bằng đường dẫn của servlet hoặc trang xử lý

                    window.location.href = newUrl;
                });
            });
        </script>

    </body>
</html>

