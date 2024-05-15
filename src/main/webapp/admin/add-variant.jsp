<%-- 
    Document   : add-variant
    Created on : Apr 8, 2024, 10:52:24 PM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Thêm Sản Phẩm</title>
        <link rel="shortcut icon" href="css/favicon.png" type="image/png" />

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <body>
        <%@ include file="sidebar.jsp"%>
        <!-- ========== MAIN CONTENT ========== -->

        <!--Block access to admin/add_books.jsp-->
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
               
                <form action="../addvariant" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-8 mb-3 mb-lg-0">
                            <div class="card mb-3 mb-lg-5">
                                <!-- Header -->
                                <div class="card-header">
                                    <h4 class="card-header-title">Phân Loại</h4>
                                </div>
                                <!-- End Header -->



                                <!-- Body -->
                                <div class="card-body">
                                    <%
                                        ProductDAOimpl d = new ProductDAOimpl(DBContext.getConn());
                                        List<ProductInfo> list = d.getAllProduct();
                                        ProductInfo latestProduct = d.getNewProductId();
                                        if (latestProduct != null) {
                                    %>
                                    <input 
                                        type="hidden" 
                                        name="ProductID" 
                                        value="<%= latestProduct.getProductID()%>"
                                        >
                                    <%
                                        }
                                    %>

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- Form -->
                                            <div class="mb-4">
                                                <label for="SizeLabel" class="form-label">Size</label>

                                                <input 
                                                    type="text" 
                                                    class="form-control" 
                                                    name="size" id="SKULabel" 
                                                    placeholder="39,40,41,..." 
                                                    aria-label="39,40,41,..."
                                                    >
                                            </div>
                                            <!-- End Form -->
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-sm-6">
                                            <!-- Form -->
                                            <div class="mb-4">
                                                <label for="materialLabel" class="form-label">Chất liệu</label>

                                                <div class="input-group">
                                                    <input
                                                        name="material"
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
                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="productNameLabel" class="form-label">Màu sắc 
                                            <i class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Book's Name."></i></label>
                                        <input
                                            name="productColor"
                                            type="text"
                                            class="form-control"
                                            id="exampleInputEmail1"
                                            aria-describedby="emailHelp"
                                            >
                                    </div>
                                    <!-- End Form -->
                                </div>
                                <!-- Body -->

                                <div class="card mb-3 mb-lg-5">
                                    <!-- Header -->
                                    <div class="card-header card-header-content-between">
                                        <h4 class="card-header-title">Hình ảnh</h4>

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
                                                        <input type="file" name="productSubphoto[]" class="file-selector-input" multiple="true" />
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

                                    <!-- End Card -->

                                    <!-- Card -->

                                </div>

                                <!--                                <div class="card-body">
                                                                    <div class="col-sm-4">
                                                                        <div class="mb-4">
                                                                            <label for="materialLabel" class="form-label">Phân loại</label>
                                
                                                                            <div class="input-group">
                                                                                <input
                                                                                    name="productColor"
                                                                                    type="text"
                                                                                    class="form-control"
                                                                                    id="exampleInputEmail1"
                                                                                    aria-describedby="emailHelp"
                                                                                    >
                                                                            </div>
                                                                            <label class="file-selector">
                                                                                <input type="file" name="ProductColorPhoto[]" class="file-selector-input" multiple="true" />
                                                                                Chọn File
                                                                            </label>
                                                                        </div>
                                                                        <div class="mb-4">
                                
                                                                            <div class="input-group">
                                                                                <input
                                                                                    name="productColor"
                                                                                    type="text"
                                                                                    class="form-control"
                                                                                    id="exampleInputEmail1"
                                                                                    aria-describedby="emailHelp"
                                                                                    >
                                                                            </div>
                                                                            <label class="file-selector">
                                                                                <input type="file" name="ProductColorPhoto[]" class="file-selector-input" multiple="true" />
                                                                                Chọn File
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                            </div>

                            <!-- End Col -->
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" >
                        Add Variant
                    </button>
                </form>
            </div>

            <script src="js/browers-file.js"></script>

    </body>
</html>
