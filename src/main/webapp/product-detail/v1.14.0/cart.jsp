<%-- 
    Document   : cart
    Created on : Apr 11, 2024, 10:00:16 PM
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
        <title>Giỏ hàng</title>
        <link rel="shortcut icon" type="image/png" href="assets/favicon.png"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
        <link href="./assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    </head>

    <body>

        <%@include file="header.jsp" %>

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

        <main class="main" id="top">
            <section class="pt-5 pb-9">
                <div class="container-small cart">
                    <h2 class="mb-6">Giỏ Hàng</h2>
                    <div class="row g-5">
                        <div class="col-12 col-lg-9">
                            <div id="cartTable" data-list='{"valueNames":["products","color","size","price","quantity","total"],"page":10}'>
                                <div class="table-responsive scrollbar mx-n1 px-1">
                                    <table class="table fs-9 mb-0 border-top border-translucent">
                                        <thead>
                                            <tr>
                                                <th class="sort white-space-nowrap align-middle fs-10" scope="col"></th>
                                                <th class="sort white-space-nowrap align-middle" scope="col" style="min-width:160px;">SẢN PHẨM</th>
                                                <th class="sort align-middle " scope="col" style="width:80px;">PHÂN LOẠI</th>
                                                <th class="sort align-middle" scope="col" style="width:150px;">SIZE</th>
                                                <th class="sort align-middle " scope="col" style="width:300px;">GIÁ</th>
                                                <th class="sort align-middle ps-5" scope="col" style="width:200px;">SỐ LƯỢNG</th>
                                                <th class="sort align-middle text-end" scope="col" style="width:250px;">TỔNG</th>
                                                <th class="sort text-end align-middle pe-0" scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody class="list" id="cart-table-body">
                                            <%                                                User user = (User) session.getAttribute("userobj");
                                                CartDAOimpl dao = new CartDAOimpl(DBContext.getConn());
                                                List<Cart> cart = dao.getProductByUser(user.getId());

                                                ProductDAOimpl productDao = new ProductDAOimpl(DBContext.getConn());

                                                Float totalPrice = (float) 0;
                                                NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")); // Định dạng số tiền theo tiền Việt Nam
                                                for (Cart c : cart) {
                                                    totalPrice += c.getTotalPrice();
                                                    ProductInfo p = productDao.getProductById(c.getProductID());
                                            %>
                                            <tr class="cart-table-row btn-reveal-trigger">
                                                <td class="align-middle white-space-nowrap py-0">
                                                    <a class="d-block border border-translucent rounded-2 cart-table-body-img" href="product-details.jsp?pid=<%= c.getProductID()%>">
                                                        <img src="../../img/<%= c.getProductPhoto()%>" alt="" />
                                                    </a>
                                                </td>
                                                <td class="products align-middle">
                                                    <a class="fw-semibold mb-0 line-clamp-2" href="product-details.jsp?pid=<%= c.getProductID()%>">
                                                        <%= c.getProductName()%>
                                                    </a>
                                                </td>
                                                <td class="color align-middle white-space-nowrap fs-9 text-body"><%= c.getProductColor()%></td>
                                                <td class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold"><%= c.getSize()%></td>

                                                <td class="price align-middle text-body fs-9 fw-semibold text-end"><%= currencyFormat.format(c.getPrice())%></td>

                                        <form action="../../editquantity" method="post">
                                            <input type="hidden" name="userID" value="<%= user.getId()%>">
                                            <input type="hidden" name="productID" value="<%= c.getProductID()%>">

                                            <td class="quantity align-middle fs-8 ps-5">
                                                <div class="quantity-value">
                                                    <div class="qty-input">
                                                        <button class="qty-count qty-count--minus" data-action="minus" type="button">-</button>
                                                        <input class="product-qty" type="number" name="quantity" min="1" max="<%= p.getUnitsInStock()%>"  value="<%= c.getQuantity()%>">
                                                        <button class="qty-count qty-count--add" data-action="add" type="button">+</button>
                                                    </div>

                                                    <button type="submit" class="btn btn-primary">
                                                        Cập nhật số lượng
                                                    </button>

                                                </div>
                                            </td>
                                        </form>

                                        <td class="total align-middle fw-bold text-body-highlight text-end"><%= currencyFormat.format(c.getTotalPrice())%></td>
                                        <td class="align-middle white-space-nowrap text-end pe-0 ps-3">
                                            <button class="btn btn-sm text-body-tertiary text-opacity-85 text-body-tertiary-hover me-2">

                                                <a href="../../removeproduct?ProductID=<%=c.getProductID()%>"><span class="fas fa-trash"></span></a>

                                            </button>
                                        </td>
                                        </tr>
                                        <%
                                            }
                                        %>

                                        <tr class="cart-table-row btn-reveal-trigger">
                                            <td class="text-body-emphasis fw-semibold ps-0 fs-8" colspan="6">Tổng giá trị giỏ hàng :</td>
                                            <td class="text-body-emphasis fw-bold text-end fs-8"><%= currencyFormat.format(totalPrice)%></td>
                                            <td></td>
                                        </tr>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-between-center mb-3">
                                        <h3 class="card-title mb-0">Tóm tắt</h3>
                                    </div>

                                    <div>
                                        <div class="d-flex justify-content-between">
                                            <p class="text-body fw-semibold">Tổng giá trị :</p>
                                            <p class="text-body-emphasis fw-semibold"><%= currencyFormat.format(totalPrice)%></p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <p class="text-body fw-semibold">Giảm giá :</p>
                                            <p class="text-danger fw-semibold">-0</p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <p class="text-body fw-semibold">Thuế :</p>
                                            <p class="text-body-emphasis fw-semibold">0</p>
                                        </div>
                                        <!--                                        <div class="d-flex justify-content-between">
                                                                                    <p class="text-body fw-semibold">Subtotal :</p>
                                                                                    <p class="text-body-emphasis fw-semibold">$665</p>
                                                                                </div>-->
                                        <div class="d-flex justify-content-between">
                                            <p class="text-body fw-semibold">Phí Shipping :</p>
                                            <p class="text-body-emphasis fw-semibold">0</p>
                                        </div>
                                    </div>
                                    <div class="input-group mb-3"><input class="form-control" type="text" placeholder="Voucher" />
                                        <button class="btn btn-phoenix-primary px-5">Apply</button>
                                    </div>
                                    <div class="d-flex justify-content-between border-y border-dashed py-3 mb-4">
                                        <h4 class="mb-0">Tổng :</h4>
                                        <h4 class="mb-"><%= currencyFormat.format(totalPrice)%></h4>
                                    </div>
                                    <a href="checkout.jsp?id=<%= u.getId()%>" class="btn-to-payment">
                                        <button class="btn btn-primary w-100">Thông tin nhận hàng và Thanh toán
                                            <span class="fas fa-chevron-right ms-1 fs-10"></span>
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end of .container-->
            </section>
            <!-- <section> close ============================-->
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
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Careers</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Affiliate Program</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Privacy Policy</a>
                                <a
                                    class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Terms & Conditions</a>
                            </div>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">Stay Connected</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Blogs</a><a class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span class="fab fa-facebook-square text-primary me-2 fs-8"></span><span class="text-body-secondary">Facebook</span></a>
                                <a
                                    class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span class="fab fa-twitter-square text-info me-2 fs-8"></span><span class="text-body-secondary">Twitter</span></a>
                            </div>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">Customer Service</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Help Desk</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Support, 24/7</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Community of Phoenix</a></div>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">Payment Method</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Cash on Delivery</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Online Payment</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">PayPal</a>
                                <a
                                    class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Installment</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end of .container-->
            </section>
            <!-- <section> close ============================-->
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
        </main>

        <script>
            var QtyInput = (function () {
                var $qtyInputs = $(".qty-input");

                if (!$qtyInputs.length) {
                    return;
                }

                var $inputs = $qtyInputs.find(".product-qty");
                var $countBtn = $qtyInputs.find(".qty-count");
                var qtyMin = parseInt($inputs.attr("min"));
                var qtyMax = parseInt($inputs.attr("max"));

                $inputs.change(function () {
                    var $this = $(this);
                    var $minusBtn = $this.siblings(".qty-count--minus");
                    var $addBtn = $this.siblings(".qty-count--add");
                    var qty = parseInt($this.val());

                    if (isNaN(qty) || qty <= qtyMin) {
                        $this.val(qtyMin);
                        $minusBtn.attr("disabled", true);
                    } else {
                        $minusBtn.attr("disabled", false);

                        if (qty >= qtyMax) {
                            $this.val(qtyMax);
                            $addBtn.attr('disabled', true);
                        } else {
                            $this.val(qty);
                            $addBtn.attr('disabled', false);
                        }
                    }
                });

                $countBtn.click(function () {
                    var operator = this.dataset.action;
                    var $this = $(this);
                    var $input = $this.siblings(".product-qty");
                    var qty = parseInt($input.val());

                    if (operator == "add") {
                        qty += 1;
                        if (qty >= qtyMin + 1) {
                            $this.siblings(".qty-count--minus").attr("disabled", false);
                        }

                        if (qty >= qtyMax) {
                            $this.attr("disabled", true);
                        }
                    } else {
                        qty = qty <= qtyMin ? qtyMin : (qty = 1);

                        if (qty == qtyMin) {
                            $this.attr("disabled", true);
                        }

                        if (qty < qtyMax) {
                            $this.siblings(".qty-count--add").attr("disabled", false);
                        }
                    }

                    $input.val(qty);
                });
            })();


        </script>
    </body>

</html>
