<%-- 
    Document   : checkout
    Created on : Apr 12, 2024, 10:06:13 PM
    Author     : datla
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@page import="java.util.List" %>


<html data-navigation-type="default" data-navbar-horizontal-shape="default" lang="en-US" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Thanh toán</title>
        <link rel="shortcut icon" type="image/png" href="../../assets/favicon.png"/>

        <script src="./assets/js/config.js"></script>

        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link href="./assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">

        <link rel="stylesheet" href="QR_Code/Styles/style.css">
        <link rel="stylesheet" href="QR_Code/Styles/custom.bundles.css">

    </head>

    <body>

        <%@include file="header.jsp" %>

        <!-- ===============================================-->
        <!--    Main Content-->
        <!-- ===============================================-->
        <main class="main" id="top">

            <section class="pt-5 pb-9">
                <div class="container-small">
                    <h2 class="mb-5">Thủ tục thanh toán</h2>
                    <div class="row justify-content-between">
                        <div class="col-lg-7 col-xl-7">
                            <c:if test="${not empty succMess}">
                                <div class="position-relative mb-4" aria-live="polite" aria-atomic="true" >
                                    <div class="toast show ">
                                        <div class="toast-header ">
                                            <strong class="me-auto">Chúc Mừng</strong>
                                            <small class="text-body-secondary"><i class="fas fa-check"></i></small>
                                            <button class="btn ms-2 p-0" type="button" data-bs-dismiss="toast" aria-label="Close"><span class="uil uil-times fs-7"></span></button>
                                        </div>
                                        <div class="toast-body">${succMess}.</div>
                                    </div>
                                </div>
                                <c:remove var="succMess" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failMess}">
                                <div class="position-relative mb-4" aria-live="polite" aria-atomic="true" >
                                    <div class="toast show ">
                                        <div class="toast-header ">
                                            <strong class="me-auto">Xin lỗi</strong>
                                            <small class="text-body-secondary"><i class="fa-solid fa-xmark"></i></small>
                                            <button class="btn ms-2 p-0" type="button" data-bs-dismiss="toast" aria-label="Close"><span class="uil uil-times fs-7"></span></button>
                                        </div>
                                        <div class="toast-body">${failMess}.</div>
                                    </div>
                                </div>
                                <c:remove var="failMess" scope="session"/>
                            </c:if>
                            <div class="d-flex align-items-end">
                                <h3 class="mb-5 me-3">Địa chỉ nhận hàng</h3>
                                <!--                                        <button class="btn btn-link p-0" type="button">Chỉnh sửa</button>-->
                            </div>
                            <form action="../../checkout" method="post">
                                <input type="hidden" name="id" value="${userobj.id}">
                                <div class="row g-4 mb-7">
                                    <div class="col-md-6">
                                        <label class="form-label fs-8 text-body-highlight ps-0 text-transform-none" for="inputCardNumber">Số điện thoại</label>
                                        <input class="form-control" id="inputCardNumber" 
                                               type="text" 
                                               placeholder="Số điện thoại" 
                                               aria-label="Số điện thoại" 
                                               name="phno"
                                               value="${userobj.phno}"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fs-8 text-body-highlight ps-0 text-transform-none" for="inputCardNumber">Email (Tùy chọn)</label>
                                        <input class="form-control" id="inputCardNumber" 
                                               type="text" 
                                               placeholder="Email" 
                                               aria-label="Email"
                                               name="email"
                                               value="${userobj.email}"/>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label fs-8 text-body-highlight ps-0 text-transform-none" for="inputName">Họ và tên</label>
                                        <input class="form-control" id="inputName" 
                                               type="text" 
                                               placeholder="Họ và tên" 
                                               aria-label="Họ và tên"
                                               name="name"
                                               value="${userobj.name}"/>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label fs-8 text-body-highlight ps-0 text-transform-none" for="inputName">Địa chỉ</label>
                                        <input class="form-control" id="inputName" 
                                               type="text" 
                                               placeholder="Địa chỉ" 
                                               aria-label="Địa chỉ"
                                               name="address"
                                               value="${userobj.address}"
                                               />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fs-8 text-body-highlight ps-0 text-transform-none" for="inputCardNumber">Tỉnh / Thành phố</label>
                                        <input class="form-control" id="inputCardNumber" 
                                               type="text" 
                                               placeholder="Tỉnh/Thành phố" 
                                               aria-label=""
                                               name="city"
                                               value="${userobj.city}"
                                               />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fs-8 text-body-highlight ps-0 text-transform-none" for="inputCardNumber">Quốc gia</label>
                                        <input class="form-control" id="inputCardNumber" disabled
                                               type="text" 
                                               placeholder="Quốc gia" 
                                               aria-label="Quốc gia"
                                               value="Việt Nam"/>
                                    </div>
                                    <div class="col-5">
                                        <a class="btn-to-payment">
                                            <button type="submit" class="btn btn-primary w-100" >Xác nhận thông tin giao hàng
                                                <span class="fas fa-chevron-right ms-1 fs-10"></span>
                                            </button>
                                        </a>
                                    </div>
                                </div>

                                <hr class="my-3">

                                <a class="btn-to-payment">
                                    <button disabled="" class="btn btn-primary w-100" >Thanh toán đơn hàng
                                        <span class="fas fa-chevron-right ms-1 fs-10"></span>
                                    </button>
                                </a>
                            </form>
                        </div>

                        <%     User user = (User) session.getAttribute("userobj");
                            CartDAOimpl dao = new CartDAOimpl(DBContext.getConn());
                            List<Cart> cart = dao.getProductByUser(user.getId());
                            float totalPrice = 0;

                            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

                        %>
                        <div class="col-lg-5 col-xl-4">
                            <div class="card mt-3 mt-lg-0">
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h3 class="mb-0">Tóm tắt</h3>
                                        <a href="cart.jsp">
                                            <button class="btn btn-link pe-0"  type="button">Chỉnh sửa giỏ hàng</button>
                                        </a>
                                    </div>

                                    <%                                        for (Cart c : cart) {
                                            totalPrice += c.getTotalPrice();
                                    %>
                                    <input type="hidden" name="userID" value="<%= user.getId()%>">
                                    <input type="hidden" name="productID" value="<%= c.getProductID()%>">
                                    <div class="border-dashed border-bottom border-translucent mt-4">
                                        <div class="ms-n2">
                                            <div class="row align-items-center mb-2 g-3">
                                                <div class="col-8 col-md-7 col-lg-7">
                                                    <div class="d-flex align-items-center">
                                                        <img class="me-2 ms-1" src="../../img/<%= c.getProductPhoto()%>" width="40" alt="" />
                                                        <h6 class="fw-semibold product-name-checkout text-body-highlight lh-base"><%= c.getProductName()%></h6>
                                                    </div>
                                                </div>
                                                <div class="col-2 col-md-3 col-lg-2">
                                                    <h6 class=" mb-0">×<%= c.getQuantity()%></h6>
                                                </div>
                                                <div class="col-2 ps-0 col-lg-3">
                                                    <h5 class="mb-0 fw-semibold text-end"><%= currencyFormat.format(c.getPrice())%></h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <div class="border-dashed border-bottom border-translucent mt-4">
                                        <div class="d-flex justify-content-between mb-2">
                                            <h5 class="text-body fw-semibold">Tổng giá trị :</h5>
                                            <h5 class="text-body fw-semibold"><%= currencyFormat.format(totalPrice)%></h5>
                                        </div>
                                        <div class="d-flex justify-content-between mb-2">
                                            <h5 class="text-body fw-semibold">Giảm giá : </h5>
                                            <h5 class="text-danger fw-semibold">-0</h5>
                                        </div>
                                        <div class="d-flex justify-content-between mb-2">
                                            <h5 class="text-body fw-semibold">Thuế : </h5>
                                            <h5 class="text-body fw-semibold">0</h5>
                                        </div>
                                        <!--                                        <div class="d-flex justify-content-between mb-2">
                                                                                    <h5 class="text-body fw-semibold">Subtotal </h5>
                                                                                    <h5 class="text-body fw-semibold">$665</h5>
                                                                                </div>-->
                                        <div class="d-flex justify-content-between mb-3">
                                            <h5 class="text-body fw-semibold">Phí Shipping </h5>
                                            <h5 class="text-body fw-semibold">0 </h5>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between border-dashed-y pt-3">
                                        <h4 class="mb-0">Tổng :</h4>
                                        <h4 class="mb-0"><%= currencyFormat.format(totalPrice)%></h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div><!-- end of .container-->
            </section><!-- <section> close ============================-->
            <!-- ============================================-->


            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="bg-body-highlight dark__bg-gray-1100 py-9">
                <div class="container-small">
                    <div class="row justify-content-between gy-4">
                        <div class="col-12 col-lg-4">
                            <div class="d-flex align-items-center mb-3"><img src="../../../assets/img/icons/logo.png" alt="phoenix" width="27" />
                                <p class="logo-text ms-2">phoenix</p>
                            </div>
                            <p class="text-body-tertiary mb-1 fw-semibold lh-sm fs-9">Phoenix is an admin dashboard template with fascinating features and amazing layout. The template is responsive to all major browsers and is compatible with all available devices and screen sizes.</p>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">About Phoenix</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Careers</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Affiliate Program</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Privacy Policy</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Terms & Conditions</a></div>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">Stay Connected</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Blogs</a><a class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span class="fab fa-facebook-square text-primary me-2 fs-8"></span><span class="text-body-secondary">Facebook</span></a><a class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span class="fab fa-twitter-square text-info me-2 fs-8"></span><span class="text-body-secondary">Twitter</span></a></div>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">Customer Service</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Help Desk</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Support, 24/7</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Community of Phoenix</a></div>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">Payment Method</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Cash on Delivery</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Online Payment</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">PayPal</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Installment</a></div>
                        </div>
                    </div>
                </div><!-- end of .container-->
            </section><!-- <section> close ============================-->
            <!-- ============================================-->

            <footer class="footer position-relative">
                <div class="row g-0 justify-content-between align-items-center h-100">
                    <div class="col-12 col-sm-auto text-center">
                        <p class="mb-0 mt-2 mt-sm-0 text-body">Thank you for creating with Phoenix<span class="d-none d-sm-inline-block"></span><span class="d-none d-sm-inline-block mx-1">|</span><br class="d-sm-none" />2023 &copy;<a class="mx-1" href="https://themewagon.com">Themewagon</a></p>
                    </div>
                    <div class="col-12 col-sm-auto text-center">
                        <p class="mb-0 text-body-tertiary text-opacity-85">v1.14.0</p>
                    </div>
                </div>
            </footer>
        </main><!-- ===============================================-->
        <!--    End of Main Content-->
        <!-- ===============================================-->

        <script src="https://vendor.bacshop.s3.ap-southeast-2.amazonaws.com/vendors/bootstrap/bootstrap.min.js"></script>
        <script src="Scripts/vendors/bootstrap/bootstrap.bundles.js"></script>

        <script src="./assets/js/phoenix.js"></script>
    </body>

</html>