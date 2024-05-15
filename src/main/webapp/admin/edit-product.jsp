<%-- 
    Document   : edit_book
    Created on : Mar 14, 2024, 4:09:27 PM
    Author     : datla
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Edit Product</title>
        <link rel="shortcut icon" href="https://d24ouiz0dt1p4y.cloudfront.net/images/logo-mb.png" type="image/png" />
        <!-- GOOGLE FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet" />
        <!-- BOXICONS -->
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/js/bootstrap/bootstrap.min.js" />
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="preload" href="https://d24ouiz0dt1p4y.cloudfront.net/assets/css/theme.css" data-hs-appearance="default" as="style" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/theme.min.css" />
        <link rel="stylesheet" href="css/browers-file.css" />
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/css/tom-select.bootstrap5.css" />
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/quill/dist/quill.snow.css" />
        <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
        <script src="https://cdn.quilljs.com/1.3.7/quill.js"></script>
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/daterangepicker/daterangepicker.css">
        <link href="css/flowbite.css" rel="stylesheet"/>



    </head>
    <body>

        <%@ include file="sidebar.jsp"%>
        <!-- ========== MAIN CONTENT ========== -->


        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"/>
        </c:if>
          <c:choose>
            <c:when test="${userobj.name != 'Admin'}">
                <c:redirect url="../index.jsp"/>
            </c:when>
        </c:choose>
        <main id="content" role="main" class="main">
            <!-- Content -->
            <div class="content @@layoutBuilder.header.containerMode">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col-sm mb-2 mb-sm-0">
                            <!--                            <nav aria-label="breadcrumb">
                                                            <ol class="breadcrumb breadcrumb-no-gutter">
                                                                <li class="breadcrumb-item"><a class="breadcrumb-link" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-products.html">Products</a></li>
                                                                <li class="breadcrumb-item active" aria-current="page">Add Books</li>
                                                            </ol>
                                                        </nav>-->

                            <h1 class="page-header-title">Edit Product</h1>

                            <div class="mt-2">
                                <!--                                <a class="text-body me-3" href="javascript:;">
                                                                    <i class="bi-clipboard me-1"></i> Duplicate
                                                                </a>-->
                                <a class="text-body preview" href="javascript:;">
                                    <i class="bi-eye me-1"></i> Preview
                                </a>
                            </div>

                            <c:if test="${not empty succMess}">
                                <p style="padding: 10px" class="text-center text-success">${succMess}</p>
                                <c:remove var="succMess" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failMess}">
                                <p style="padding: 10px" class="text-center text-danger">${failMess}</p>
                                <c:remove var="failMess" scope="session"/>
                            </c:if>


                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>
                <!-- End Page Header -->
                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    ProductDAOimpl dao = new ProductDAOimpl(DBContext.getConn());
                    ProductInfo p = dao.getProductById(id);
                %>  
                <form action="../editproduct" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="<%= p.getProductID()%>">

                    <div class="row">
                        <div class="col-lg-8 mb-3 mb-lg-0">
                            <!-- Card -->
                            <div class="card mb-3 mb-lg-5">
                                <!-- Header -->
                                <div class="card-header">
                                    <h4 class="card-header-title">Thông tin sản phẩm</h4>
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">
                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="productNameLabel" class="form-label">Tên sản phẩm 
                                            <i class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Product's Name."></i></label>
                                        <input
                                            name="pname"
                                            type="text"
                                            class="form-control"
                                            id="exampleInputEmail1"
                                            aria-describedby="emailHelp"
                                            value="<%= p.getProductName()%>"
                                            >
                                    </div>
                                    <!-- End Form -->

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- Form -->
                                            <div class="mb-4">
                                                <label for="SKULabel" class="form-label">SKU</label>

                                                <input 
                                                    type="text" 
                                                    class="form-control" 
                                                    name="sku" id="SKULabel" 
                                                    placeholder="eg. 348121032" 
                                                    aria-label="eg. 348121032"
                                                    value="<%= p.getSku()%>"
                                                    >
                                            </div>
                                            <!-- End Form -->
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-sm-6">
                                            <!-- Form -->
                                            <div class="mb-4">
                                                <label for="weightLabel" class="form-label">...</label>

                                                <div class="input-group">
                                                    <input
                                                        name="author"
                                                        type="text"
                                                        class="form-control"
                                                        id="exampleInputEmail1"
                                                        aria-describedby="emailHelp"
                                                        >
                                                </div>

                                                <!--<small class="form-text">Used to calculate shipping rates at checkout and label prices during fulfillment.</small>-->
                                            </div>
                                            <!-- End Form -->
                                        </div>
                                        <!-- End Col -->
                                    </div>
                                    <!-- End Row -->

                                    <label class="form-label">Mô tả <span class="form-label-secondary">(Optional)</span></label>

                                    <!-- Quill -->
                                    <div class="quill-custom">

                                        <div class="w-full mb-4 border border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-700 dark:border-gray-600">
                                            <div class="flex items-center justify-between px-3 py-2 border-b dark:border-gray-600">
                                                <div class="flex flex-wrap items-center divide-gray-200 sm:divide-x sm:rtl:divide-x-reverse dark:divide-gray-600">
                                                    <div class="flex items-center space-x-1 rtl:space-x-reverse sm:pe-4">
                                                        <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                                                            <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 12 20">
                                                            <path stroke="currentColor" stroke-linejoin="round" stroke-width="2" d="M1 6v8a5 5 0 1 0 10 0V4.5a3.5 3.5 0 1 0-7 0V13a2 2 0 0 0 4 0V6"/>
                                                            </svg>
                                                            <span class="sr-only">Attach file</span>
                                                        </button>
                                                        <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                                                            <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 20">
                                                            <path d="M14.066 0H7v5a2 2 0 0 1-2 2H0v11a1.97 1.97 0 0 0 1.934 2h12.132A1.97 1.97 0 0 0 16 18V2a1.97 1.97 0 0 0-1.934-2ZM10.5 6a1.5 1.5 0 1 1 0 2.999A1.5 1.5 0 0 1 10.5 6Zm2.221 10.515a1 1 0 0 1-.858.485h-8a1 1 0 0 1-.9-1.43L5.6 10.039a.978.978 0 0 1 .936-.57 1 1 0 0 1 .9.632l1.181 2.981.541-1a.945.945 0 0 1 .883-.522 1 1 0 0 1 .879.529l1.832 3.438a1 1 0 0 1-.031.988Z"/>
                                                            <path d="M5 5V.13a2.96 2.96 0 0 0-1.293.749L.879 3.707A2.98 2.98 0 0 0 .13 5H5Z"/>
                                                            </svg>
                                                            <span class="sr-only">Upload image</span>
                                                        </button>
                                                        <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                                                            <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 20">
                                                            <path d="M8 0a7.992 7.992 0 0 0-6.583 12.535 1 1 0 0 0 .12.183l.12.146c.112.145.227.285.326.4l5.245 6.374a1 1 0 0 0 1.545-.003l5.092-6.205c.206-.222.4-.455.578-.7l.127-.155a.934.934 0 0 0 .122-.192A8.001 8.001 0 0 0 8 0Zm0 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6Z"/>
                                                            </svg>
                                                            <span class="sr-only">Embed map</span>
                                                        </button>
                                                        <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                                                            <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 20">
                                                            <path d="M5 5V.13a2.96 2.96 0 0 0-1.293.749L.879 3.707A2.96 2.96 0 0 0 .13 5H5Z"/>
                                                            <path d="M14.067 0H7v5a2 2 0 0 1-2 2H0v11a1.969 1.969 0 0 0 1.933 2h12.134A1.97 1.97 0 0 0 16 18V2a1.97 1.97 0 0 0-1.933-2ZM6.709 13.809a1 1 0 1 1-1.418 1.409l-2-2.013a1 1 0 0 1 0-1.412l2-2a1 1 0 0 1 1.414 1.414L5.412 12.5l1.297 1.309Zm6-.6-2 2.013a1 1 0 1 1-1.418-1.409l1.3-1.307-1.295-1.295a1 1 0 0 1 1.414-1.414l2 2a1 1 0 0 1-.001 1.408v.004Z"/>
                                                            </svg>
                                                            <span class="sr-only">Format code</span>
                                                        </button>
                                                        <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                                                            <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                                            <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM13.5 6a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm-7 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm3.5 9.5A5.5 5.5 0 0 1 4.6 11h10.81A5.5 5.5 0 0 1 10 15.5Z"/>
                                                            </svg>
                                                            <span class="sr-only">Add emoji</span>
                                                        </button>
                                                    </div>
                                                    <div class="flex flex-wrap items-center space-x-1 rtl:space-x-reverse sm:ps-4">
                                                        <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                                                            <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 21 18">
                                                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.5 3h9.563M9.5 9h9.563M9.5 15h9.563M1.5 13a2 2 0 1 1 3.321 1.5L1.5 17h5m-5-15 2-1v6m-2 0h4"/>
                                                            </svg>
                                                            <span class="sr-only">Add list</span>
                                                        </button>
                                                        <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                                                            <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                                            <path d="M18 7.5h-.423l-.452-1.09.3-.3a1.5 1.5 0 0 0 0-2.121L16.01 2.575a1.5 1.5 0 0 0-2.121 0l-.3.3-1.089-.452V2A1.5 1.5 0 0 0 11 .5H9A1.5 1.5 0 0 0 7.5 2v.423l-1.09.452-.3-.3a1.5 1.5 0 0 0-2.121 0L2.576 3.99a1.5 1.5 0 0 0 0 2.121l.3.3L2.423 7.5H2A1.5 1.5 0 0 0 .5 9v2A1.5 1.5 0 0 0 2 12.5h.423l.452 1.09-.3.3a1.5 1.5 0 0 0 0 2.121l1.415 1.413a1.5 1.5 0 0 0 2.121 0l.3-.3 1.09.452V18A1.5 1.5 0 0 0 9 19.5h2a1.5 1.5 0 0 0 1.5-1.5v-.423l1.09-.452.3.3a1.5 1.5 0 0 0 2.121 0l1.415-1.414a1.5 1.5 0 0 0 0-2.121l-.3-.3.452-1.09H18a1.5 1.5 0 0 0 1.5-1.5V9A1.5 1.5 0 0 0 18 7.5Zm-8 6a3.5 3.5 0 1 1 0-7 3.5 3.5 0 0 1 0 7Z"/>
                                                            </svg>
                                                            <span class="sr-only">Settings</span>
                                                        </button>
                                                        <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                                                            <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                                            <path d="M18 2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2ZM2 18V7h6.7l.4-.409A4.309 4.309 0 0 1 15.753 7H18v11H2Z"/>
                                                            <path d="M8.139 10.411 5.289 13.3A1 1 0 0 0 5 14v2a1 1 0 0 0 1 1h2a1 1 0 0 0 .7-.288l2.886-2.851-3.447-3.45ZM14 8a2.463 2.463 0 0 0-3.484 0l-.971.983 3.468 3.468.987-.971A2.463 2.463 0 0 0 14 8Z"/>
                                                            </svg>
                                                            <span class="sr-only">Timeline</span>
                                                        </button>
                                                        <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                                                            <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                                            <path d="M14.707 7.793a1 1 0 0 0-1.414 0L11 10.086V1.5a1 1 0 0 0-2 0v8.586L6.707 7.793a1 1 0 1 0-1.414 1.414l4 4a1 1 0 0 0 1.416 0l4-4a1 1 0 0 0-.002-1.414Z"/>
                                                            <path d="M18 12h-2.55l-2.975 2.975a3.5 3.5 0 0 1-4.95 0L4.55 12H2a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2Zm-3 5a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z"/>
                                                            </svg>
                                                            <span class="sr-only">Download</span>
                                                        </button>
                                                    </div>
                                                </div>
                                                <button type="button" data-tooltip-target="tooltip-fullscreen" class="p-2 text-gray-500 rounded cursor-pointer sm:ms-auto hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                                                    <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 19 19">
                                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 1h5m0 0v5m0-5-5 5M1.979 6V1H7m0 16.042H1.979V12M18 12v5.042h-5M13 12l5 5M2 1l5 5m0 6-5 5"/>
                                                    </svg>
                                                    <span class="sr-only">Full screen</span>
                                                </button>
                                                <div id="tooltip-fullscreen" role="tooltip" class="absolute z-10 invisible inline-block px-3 py-2 text-sm font-medium text-white transition-opacity duration-300 bg-gray-900 rounded-lg shadow-sm opacity-0 tooltip dark:bg-gray-700">
                                                    Show full screen
                                                    <div class="tooltip-arrow" data-popper-arrow></div>
                                                </div>
                                            </div>
                                            <div class="px-4 py-2 bg-white rounded-b-lg dark:bg-gray-800">
                                                <label for="editor" class="sr-only">Publish post</label>
                                                <textarea 
                                                    name="description" id="editor" rows="8" 
                                                    class="block w-full px-0 text-sm text-gray-800 bg-white border-0 dark:bg-gray-800 focus:ring-0 dark:text-white dark:placeholder-gray-400" placeholder="Write an article..."  
                                                    /><%= p.getDescription()%>
                                                </textarea>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- End Quill -->
                                </div>
                                <!-- Body -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div class="card mb-3 mb-lg-5">
                                <!-- Header -->
                                <div class="card-header card-header-content-between">
                                    <h4 class="card-header-title">Ảnh Bìa</h4>

                                    <!-- Dropdown -->
                                    <div class="dropdown">
                                        <a class="btn btn-ghost-secondary btn-sm" href="#!" id="mediaDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                            Thêm từ URL <i class="bi-chevron-down"></i>
                                        </a>

                                        <div class="dropdown-menu dropdown-menu-end mt-1">
                                            <a class="dropdown-item" href="javascript:;" data-bs-toggle="modal" data-bs-target="#addImageFromURLModal">
                                                <i class="bi-link dropdown-item-icon"></i> Thêm hình ảnh từ URL
                                            </a>
                                            <a class="dropdown-item" href="javascript:;" data-bs-toggle="modal" data-bs-target="#embedVideoModal">
                                                <i class="bi-youtube dropdown-item-icon"></i> Nhúng Video
                                            </a>
                                        </div>
                                    </div>
                                    <!-- End Dropdown -->
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">
                                    <!-- Dropzone -->
                                    <div class="drop-section">
                                        <div class="js-dropzone dz-dropzone dz-dropzone-card col">
                                            <div class="dz-message">
                                                <img class="avatar avatar-xl avatar-4x3 mb-3" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-browse.svg" alt="Image Description" data-hs-theme-appearance="default" />

                                                <h5>Kéo hoặc thả file tại đây</h5>

                                                <p class="mb-2">hoặc</p>

                                                <label class="file-selector">
                                                    <input type="file" name="pimg" class="file-selector-input" multiple />
                                                    Chọn File
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="drop-here">Thả ở Đây</div>
                                        </div>
                                    </div>
                                    <div class="list-section js-dropzone dz-dropzone dz-dropzone-card ">
                                        <div class="list-title">File đã tải lên</div>
                                        <div class="list"></div>
                                    </div>

                                    <!-- End Dropzone -->
                                </div>
                                <!-- Body -->
                                <img src="../img/<%= p.getProductPhoto()%>" alt="alt" style="width: 300px; margin: 0 auto;
                                     padding-bottom: 30px;border: solid 1.5px #377dff;border-radius: 22px;"/>
                            </div>



                        </div>
                        <div class="col-lg-4">
                            <!-- Card -->
                            <div class="card mb-3 mb-lg-5">
                                <!-- Header -->
                                <div class="card-header">
                                    <h4 class="card-header-title">Giá Bán</h4>
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">
                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="priceNameLabel" class="form-label">Giá</label>

                                        <div class="input-group">
                                            <input 
                                                type="text" 
                                                class="form-control" 
                                                name="price" 
                                                type="number" 
                                                id="priceNameLabel" 
                                                placeholder="0.00" 
                                                aria-label="0.00"
                                                value="<%= p.getPrice()%>"
                                                >

                                            <div class="input-group-append">
                                                <!-- Select -->
                                                <div class="tom-select-custom">
                                                    <select class="js-select form-select "
                                                            data-hs-tom-select-options='{
                                                            "searchInDropdown": false,
                                                            "hideSearch": true,
                                                            "dropdownWidth": "7rem",
                                                            "dropdownWrapperClass": "tom-select-custom tom-select-custom-end"
                                                            }'>
                                                        <option value="USD" >USD</option>
                                                        <option value="VND" selected>VND</option>
                                                    </select>
                                                </div>
                                                <!-- End Select -->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Form -->



                                    <hr class="my-4">

                                    <!-- Form Switch -->
                                    <label class="row form-check form-switch" for="availabilitySwitch1">
                                        <span class="col-8 col-sm-9 ms-0">
                                            <span class="text-dark">Đăng lên trang <i class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Product availability switch toggler."></i></span>
                                        </span>
                                        <span class="col-4 col-sm-3 text-end">
                                            <div class="tom-select-custom">
                                                <select name="pstatus" class="js-select form-select" autocomplete="off" id="categoryLabel"
                                                        data-hs-tom-select-options='{
                                                        "searchInDropdown": false,
                                                        "hideSearch": true,
                                                        "placeholder": "Select category"
                                                        }'>

                                                    <option value="Đăng" <%= "Active".equals(p.getStatus()) ? "selected" : ""%>>Đăng</option>
                                                    <option value="Không đăng" <%= "Inactive".equals(p.getStatus()) ? "selected" : ""%>>Không đăng</option>

                                                </select>
                                            </div>
                                        </span>
                                    </label>
                                    <!-- End Form Switch -->
                                </div>
                                <!-- Body -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div class="card">
                                <!-- Header -->
                                <div class="card-header">
                                    <h4 class="card-header-title">Thông tin bán hàng</h4>
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">

                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="vendorLabel" class="form-label">Số lượng tồn kho</label>

                                        <input type="text" class="form-control" 
                                               name="unitsInStock" id="vendorLabel" 
                                               value="<%= p.getUnitsInStock()%>"
                                               >
                                    </div>
                                    <!-- End Form -->
                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="vendorLabel" class="form-label">Phân loại hàng</label>

                                        <input type="text" class="form-control" name="newCategory" id="vendorLabel" >
                                    </div>
                                    <!-- End Form -->
                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="categoryLabel" class="form-label">Chọn phân loại hàng</label>

                                        <!-- Select -->

                                        <div class="tom-select-custom">
                                            <select name="categoryName" class="js-select form-select" autocomplete="off" id="categoryLabel"
                                                    data-hs-tom-select-options='{
                                                    "searchInDropdown": false,
                                                    "hideSearch": true,
                                                    "placeholder": "Select category"
                                                    }'>
                                                <%
                                                    ProductDAOimpl d = new ProductDAOimpl(DBContext.getConn());
                                                    List<ProductInfo> list = d.getAllProduct();
                                                    for (ProductInfo b : list) {
                                                %>
                                                <option selected="selected"> --Select-- </option>
                                                <option ><%= b.getCategoryName()%></option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>

                                    </div>
                                </div>
                                <!-- Body -->

                            </div>
                            <!-- End Card -->
                            <div class="align-items-center mb-3 btn-add-books-main">
                                <button type="submit" class="btn btn-primary" href="edit-product.jsp">
                                    Edit Product
                                </button>
                            </div>

                        </div>

                        <!-- End Row -->

                    </div>
                </form>

                <!-- End Content -->
        </main>
        <!-- ========== END MAIN CONTENT ========== -->
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
                    }
                });
            });
        </script>

        <!-- JS Plugins Init. -->
        <script>
            (function () {
                window.onload = function () {


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


                    // INITIALIZATION OF ADD FIELD
                    // =======================================================
                    new HSAddField('.js-add-field', {
                        addedField: field => {
                            HSCore.components.HSTomSelect.init(field.querySelector('.js-select-dynamic'))
                        }
                    })


                    // INITIALIZATION OF  QUANTITY COUNTER
                    // =======================================================
                    new HSQuantityCounter('.js-quantity-counter')


                    // INITIALIZATION OF DROPZONE
                    // =======================================================
                    HSCore.components.HSDropzone.init('.js-dropzone')


                    // INITIALIZATION OF QUILLJS EDITOR
                    // =======================================================
                    HSCore.components.HSQuill.init('.js-quill')
                }
            })()
        </script>
        <script>
                    (function () {
                        // STYLE SWITCHER
                        // =======================================================
                        const $dropdownBtn = document.getElementById('selectThemeDropdown') // Dropdowon trigger
                        const $variants = document.querySelectorAll(`[aria-labelledby="selectThemeDropdown"] [data-icon]`) // All items of the dropdown

                        // Function to set active style in the dorpdown menu and set icon for dropdown trigger
                        const setActiveStyle = function () {
                            $variants.forEach($item => {
                                if ($item.getAttribute('data-value') === HSThemeAppearance.getOriginalAppearance()) {
                                    $dropdownBtn.innerHTML = `<i class="${$item.getAttribute('data-icon')}" />`
                                    return $item.classList.add('active')
                                }

                                $item.classList.remove('active')
                            })
                        }

                        // Add a click event to all items of the dropdown to set the style
                        $variants.forEach(function ($item) {
                            $item.addEventListener('click', function () {
                                HSThemeAppearance.setAppearance($item.getAttribute('data-value'))
                            })
                        })

                        // Call the setActiveStyle on load page
                        setActiveStyle()

                        // Add event listener on change style to call the setActiveStyle function
                        window.addEventListener('on-hs-appearance-change', function () {
                            setActiveStyle()
                        })
                    })()
        </script>

        <!-- JS Plugins Init. -->
        <!-- JS Global Compulsory @@deleteLine:build -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery/dist/jquery.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery-migrate/dist/jquery-migrate.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JS Implementing Plugins -->
        <!-- bundlejs:vendor [https://d24ouiz0dt1p4y.cloudfront.net] -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-navbar-vertical-aside/dist/hs-navbar-vertical-aside.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-form-search/dist/hs-form-search.min.js"></script>

        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.js"></script>

        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-quantity-counter/dist/hs-quantity-counter.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-add-field/dist/hs-add-field.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/js/tom-select.complete.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/quill/dist/quill.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/datatables.net.extensions/select/select.min.js"></script>



        <!-- JS Front -->
        <!-- bundlejs:theme [https://d24ouiz0dt1p4y.cloudfront.net] -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.core.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.bs-dropdown.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.tom-select.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.quill.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.datatables.js"></script>


        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/daterangepicker/moment.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/daterangepicker/daterangepicker.js"></script>
        <script src="js/flowbite.js"></script>


        <script src="js/browers-file.js"></script>

    </body>
</html>
