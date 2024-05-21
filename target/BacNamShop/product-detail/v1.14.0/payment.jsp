<%-- 
    Document   : checkout
    Created on : Apr 12, 2024, 10:06:13 PM
    Author     : datla
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html data-navigation-type="default" data-navbar-horizontal-shape="default" lang="en-US" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Checkout</title>
        <link rel="shortcut icon" type="image/png" href="assets/favicon.png"/>
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
                    <h2 class="mb-5">Phương thức thanh toán</h2>
                    <div class="row justify-content-between">
                        <div class="col-lg-7 col-xl-8">
                            <form>

                                <div class="row g-4 mb-7">
                                    <div class="col-12">
                                        <div class="row justify-content-center gx-lg-11">
                                            <div class="col-12 col-md-auto ">
                                                <div class="form-check">
                                                    <input class="form-check-input" id="coupon" type="radio" name="paymentMethod" checked="checked" />
                                                    <label class="form-check-label fs-8 text-body" for="coupon">Thẻ ngân hàng </label>
                                                    <span class="badge badge-phoenix badge-phoenix-warning ms-2 ms-lg-4 ms-xl-2">Popular</span>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-auto">
                                                <div class="form-check">
                                                    <input class="form-check-input" id="paypal" type="radio" name="paymentMethod" disabled/>
                                                    <label class="form-check-label fs-8 text-body" for="paypal">Paypal </label></div>
                                            </div>
                                        </div>
                                    </div>
                                    <%     User user = (User) session.getAttribute("userobj");
                                        CartDAOimpl dao = new CartDAOimpl(DBContext.getConn());
                                        List<Cart> cart = dao.getProductByUser(user.getId());
                                        float totalPrice = 0;
                                        for (Cart c : cart) {
                                            totalPrice += c.getTotalPrice();
                                        }
                                        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

                                    %>

                                    <div class="main main-layout-lg layout-bills">


                                        <div class="main-wrap">
                                            <div class="main-inner main-inner-page">
                                                <div class="box box-main">
                                                    <!-- _custom.headerMobile -->

                                                    <div class="box__header header-box header-box-simple">
                                                        <div class="box__header-inner">
                                                            <div class="section">
                                                                <div class="row justify-content-center align-items-center">
                                                                    <div class="col-md-auto header-box-top">
                                                                        <div class="row align-items-center justify-content-md-center">
                                                                            <div class="col-md-auto col logo-group-wrap w-100">
                                                                                <div class="row justify-content-between align-items-center">
                                                                                    <div class="col-md-auto col">
                                                                                        <div class="logo d-block">
                                                                                            <img src="QR_Code/images/brands/logo.svg" alt="VNPAY">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-auto col">
                                                                                        <div class="logo d-block text-right">
                                                                                            <img src="QR_Code/images/merchant/vban.png" alt="Merchant Logo">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-auto show-mobile box-ic-holder-col">
                                                                                <div class="box-ic-holder"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end _custom.headerMobile -->
                                                    <div class="box__body ubg-white">
                                                        <div class="list-mb24">
                                                            <div class="layout-bills-inner box-section">
                                                                <div class="row list-mb24 list-crop">
                                                                    <div class="col-12 main-title-mobile show-mobile h3 text-center">
                                                                        Thanh toán qua ứng dụng Ngân hàng/ Ví điện tử
                                                                    </div>

                                                                    <div class="col-md-5 bills-col">
                                                                        <div class="bills">
                                                                            <div class="bills-header h2 show-desktop">
                                                                                Thông tin đơn hàng
                                                                            </div>
                                                                            <div class="bills-header-mobile show-mobile list-mb12 list-last-mb"
                                                                                 data-bs-toggle="collapse" data-bs-target="#accordionBill"
                                                                                 aria-expanded="true" aria-controls="accordionBill">
                                                                                <div class="title weight5">
                                                                                    Thanh toán đơn hàng 182098
                                                                                </div>
                                                                                <div class="row color-primary align-items-center">
                                                                                    <div class="col h2">
                                                                                        <span id="totalAmountMb"><%= currencyFormat.format(totalPrice).replace("₫", "")%></span><sup>VND</sup>
                                                                                    </div>
                                                                                    <div class="col-auto">
                                                                                        <!-- button.button -->
                                                                                        <div
                                                                                            class="ubg-transparent ubox-size-button-xs ubg-hover ubg-active ubtn">
                                                                                            <div class="ubtn-inner">
                                                                                                <span class="ubtn-text color-primary">
                                                                                                    Xem chi tiết
                                                                                                </span>
                                                                                                <span class="ubtn-ic ubtn-ic-right">
                                                                                                    <img src="QR_Code/Images/icons-color/primary/default/24x24-chevrondown.svg"
                                                                                                         alt="" class="ic-default">
                                                                                                </span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <!-- end button.button -->
                                                                                    </div>
                                                                                </div>
                                                                            </div>


                                                                            <div class="bills-body accordion-collapse collapse" id="accordionBill">
                                                                                <div>
                                                                                    <div class="bills-list list-mb24 list-last-mb">
                                                                                        <div class="bills-list-item show-desktop">
                                                                                            <div class="row">
                                                                                                <div class="col-md-12 col-5 mb4">
                                                                                                    <div class="sub-title color-sub-default">
                                                                                                        Số tiền thanh toán
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-12 col">
                                                                                                    <div
                                                                                                        class="title text-left-md-right color-primary h2">
                                                                                                        <span
                                                                                                            id="totalAmountDt"><%= currencyFormat.format(totalPrice).replace("₫", "")%></span><sup>VND</sup>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="bills-list-item">
                                                                                            <div class="row">
                                                                                                <div class="col-md-12 col-5 mb4">
                                                                                                    <div class="sub-title color-sub-default">
                                                                                                        Giá trị đơn hàng
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-12 col">
                                                                                                    <div class="title text-left-md-right">
                                                                                                        <%= currencyFormat.format(totalPrice).replace("₫", "")%><sup>VND</sup>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="bills-list-item">
                                                                                            <div class="row">
                                                                                                <div class="col-md-12 col-5 mb4">
                                                                                                    <div class="sub-title color-sub-default">
                                                                                                        Phí giao dịch
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-12 col">
                                                                                                    <div class="title text-left-md-right ">
                                                                                                        0<sup>VND</sup>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="bills-list-item" id="discountAmountItem"
                                                                                             style="display: none">
                                                                                            <div class="row">
                                                                                                <div class="col-md-12 col-5 mb4">
                                                                                                    <div class="sub-title color-sub-default">
                                                                                                        Số tiền khuyến mại
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-12 col">
                                                                                                    <div class="title text-left-md-right">
                                                                                                        <span id="discountAmount">0</span><sup>VND</sup>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="bills-list-item show-desktop">
                                                                                            <div class="row">
                                                                                                <div class="col-md-12 col-5 mb4">
                                                                                                    <div class="sub-title color-sub-default">
                                                                                                        Mã đơn hàng
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-12 col">
                                                                                                    <div class="title text-left-md-right h3">
                                                                                                        ${userobj.name} - ${userobj.id}
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="bills-list-item">
                                                                                            <div class="row">
                                                                                                <div class="col-md-12 col-5 mb4">
                                                                                                    <div class="sub-title color-sub-default">
                                                                                                        Nhà cung cấp
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-12 col">
                                                                                                    <div class="title text-left-md-right h3">
                                                                                                        MC CTT VNPAY
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md right-bill-col">
                                                                        <div class="right-bill-col-inner">
                                                                            <div class="main-title h2 text-center show-desktop mb24">
                                                                                Quét mã qua ứng dụng Ngân hàng/ Ví điện tử
                                                                            </div>
                                                                            <div class="qr-section">
                                                                                <div class="qr-section-inner list-mb24 list-last-mb">
                                                                                    <a href="#" data-bs-toggle="modal" data-bs-target="#modalHuongDan"
                                                                                       class="link weight5 link-style-default show-desktop">
                                                                                        <img src="QR_Code/images/icons-color/info/default/24x24-information-circle.svg"
                                                                                             alt="" class="ic-default">
                                                                                        Hướng dẫn thanh toán
                                                                                    </a>
                                                                                    <div class="qr qr-size-default" data-bs-toggle="modal"
                                                                                         data-bs-target="#modalQR">
                                                                                        <div class="qr-inner"
                                                                                             style="background-image: url('QR_Code/images/qr-frame.svg')">
                                                                                            <img class="qrcodeimg-modal"
                                                                                                 src="https://img.vietqr.io/image/vietinbank-104877396758-qr_only.jpg?amount=<%= totalPrice%>&addInfo=${userobj.name}%20${userobj.id}"
                                                                                                 alt="QR CODE">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div
                                                                                        class="section d-flex justify-content-center align-items-center w-100 show-mobile">
                                                                                        <a href="Transaction/DownloadQR.html"
                                                                                           class="link weight5 link-style-default">
                                                                                            <img src="QR_Code/images/icons-color/info/default/24x24-download.svg"
                                                                                                 alt="" class="ic-default">
                                                                                            Tải mã
                                                                                        </a>
                                                                                        <a data-bs-toggle="modal" data-bs-target="#modalHuongDanMobile"
                                                                                           class="link link-underline weight5"
                                                                                           style="margin-left:15px;">
                                                                                            <img src="QR_Code/images/icons-color/info/default/24x24-question-circle.svg"
                                                                                                 alt="" class="ic-md">
                                                                                            Hướng dẫn
                                                                                        </a>
                                                                                    </div>


                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="box-section show-desktop">
                                                                <div class="list-bank-promo">
                                                                    <div class="list-mb24 list-last-mb">
                                                                        <div class="list-bank-promo-section list-mb16">
                                                                            <div class="row row-16 align-items-center">
                                                                                <div class="col">
                                                                                    <div class="weight5">

                                                                                        Danh sách Ngân hàng/ Ví điện tử khác hỗ trợ thanh toán
                                                                                        <span class="vnpay-logo b">
                                                                                            <span class="vnpay-red">VN</span><span
                                                                                                class="vnpay-blue">PAY</span>
                                                                                            <sup class="vnpay-red">QR</sup>
                                                                                        </span>


                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="list-bank list-bank-grid-8">
                                                                                <div class="list-mb24 list-last-mb">
                                                                                    <div class="list-bank-main list-bank-main-unclickable">
                                                                                        <div class="row row-8 list-mb8 list-crop">

                                                                                            <div class="col-item col-4 col-md-auto">
                                                                                                <div class="list-bank-item">
                                                                                                    <div class="list-bank-item-inner"
                                                                                                         style="background-image: url(QR_Code/images/img/logos/bank/big/vietinbank.svg)">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-item col-4 col-md-auto">
                                                                                                <div class="list-bank-item">
                                                                                                    <div class="list-bank-item-inner"
                                                                                                         style="background-image: url(QR_Code/images/img/logos/bank/big/vietcombank.svg)">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-item col-4 col-md-auto">
                                                                                                <div class="list-bank-item">
                                                                                                    <div class="list-bank-item-inner"
                                                                                                         style="background-image: url(QR_Code/images/img/logos/bank/big/bidv.svg)">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-item col-4 col-md-auto">
                                                                                                <div class="list-bank-item">
                                                                                                    <div class="list-bank-item-inner"
                                                                                                         style="background-image: url(QR_Code/images/img/logos/bank/big/agribank.svg)">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-item col-4 col-md-auto">
                                                                                                <div class="list-bank-item">
                                                                                                    <div class="list-bank-item-inner"
                                                                                                         style="background-image: url(QR_Code/images/img/logos/bank/big/techcombank.svg)">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-item col-4 col-md-auto">
                                                                                                <div class="list-bank-item">
                                                                                                    <div class="list-bank-item-inner"
                                                                                                         style="background-image: url(QR_Code/images/img/logos/bank/big/mbbank.svg)">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-item col-4 col-md-auto">
                                                                                                <div class="list-bank-item">
                                                                                                    <div class="list-bank-item-inner"
                                                                                                         style="background-image: url(QR_Code/images/img/logos/bank/big/vpbank.svg)">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-item col-4 col-md-auto">
                                                                                                <div class="list-bank-item">
                                                                                                    <div class="list-bank-item-inner"
                                                                                                         style="background-image: url(QR_Code/images/img/logos/bank/big/tpbank.svg)">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-item col-4 col-md-auto">
                                                                                                <div class="list-bank-item">
                                                                                                    <div class="list-bank-item-inner"
                                                                                                         style="background-image: url(QR_Code/images/img/logos/bank/big/acb.svg)">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-item col-4 col-md-auto">
                                                                                                <div class="list-bank-item">
                                                                                                    <div class="list-bank-item-inner"
                                                                                                         style="background-image: url(QR_Code/images/img/logos/bank/big/viettelmoney.svg)">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- _custom.footerBox -->
                                                    <div class="box__footer footer-box">
                                                        <div class="box__footer-inner">
                                                            <div class="section">
                                                                <div class="row row-32 list-mb24 list-crop align-items-center justify-content-center">

                                                                    <div class="col-sm show-desktop">
                                                                        <div class="row row-32 align-items-center">
                                                                            <div class="col-auto">
                                                                                <!-- button.button -->
                                                                                <a href="tel:0968338829"
                                                                                   class="ubg-ghost ubox-size-button-default ubg-hover ubg-active ubtn">
                                                                                    <div class="ubtn-inner">
                                                                                        <div
                                                                                            class="ubg-line-porcelain-dark ubox-size-ic-md ubox-square ubox ubox-ic">
                                                                                            <img src="QR_Code/images/icons-color/default2/default/24x24-phone.svg"
                                                                                                 alt="" class="ic-default">
                                                                                        </div>
                                                                                        <span
                                                                                            class="ubtn-text h3 color-info u pl12">0968.33.88.29</span>
                                                                                    </div>
                                                                                </a>
                                                                                <!-- end button.button -->
                                                                            </div>
                                                                            <div class="col-auto">
                                                                                <!-- button.button -->
                                                                                <a href="mailto:datlacve2@gmail.com"
                                                                                   class="ubg-ghost ubox-size-button-default ubg-hover ubg-active ubtn">
                                                                                    <div class="ubtn-inner">
                                                                                        <div
                                                                                            class="ubg-line-porcelain-dark ubox-size-ic-md ubox-square ubox ubox-ic">
                                                                                            <img src="QR_Code/images/icons-color/default2/default/24x24-email.svg"
                                                                                                 alt="" class="ic-default">
                                                                                        </div>
                                                                                        <span
                                                                                            class="ubtn-text h3 color-info u pl12">datlacve2@gmail.com</span>
                                                                                    </div>
                                                                                </a>
                                                                                <!-- end button.button -->
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-auto">
                                                                        <div class="row row-8 justify-content-center">
                                                                            <div class="col-auto">
                                                                                <a href="https://profile.globalsign.com/SiteSeal/siteSeal/profile/profile.do?p1=e797f6ab&amp;p2=a06dada7520ada559537452c666a510c95706240fc2dfde64d4c864bf735462b7a370908847a6060a26daeac4f549d0bc8&amp;p3=7b58e9c169b0b0ff3eb932a37330cc91d466b871"
                                                                                   target="_blank" class="footer-logos">
                                                                                    <img src="QR_Code/images/img/logos/global-sign.svg" height="40">
                                                                                </a>
                                                                            </div>
                                                                            <div class="col-auto">
                                                                                <a href="https://seal.controlcase.com/index.php?page=showCert&amp;cId=3865876849"
                                                                                   target="_blank" class="footer-logos">
                                                                                    <img src="QR_Code/images/img/logos/pcidss.svg" height="40">
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end _custom.footerBox -->
                                                </div>
                                            </div>
                                        </div>

                                        <!-- modal.modal -->
                                        <div class="modal fade" id="modalQR" aria-labelledby="exampleModalLabel" aria-hidden="true"
                                             style="display: none;">
                                            <div class="modal-dialog modal-dialog-centered modal-size-default modal-dialog-scrollable" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <div class="modal-wrap">
                                                            <div class="row row-16 modal-title-wrap">
                                                                <div class="col-12 text-center">
                                                                    <h2 class="modal-title h2">
                                                                        Quét mã thanh toán

                                                                    </h2>
                                                                </div>
                                                            </div>
                                                            <!-- button.button -->
                                                            <a data-bs-dismiss="modal"
                                                               class="ubg-transparent ubox-size-button-default ubox-square ubg-hover ubg-active ubtn modal-close-btn">
                                                                <div class="ubtn-inner">
                                                                </div>
                                                            </a>
                                                            <!-- end button.button -->
                                                        </div>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="list-mb24 list-crop text-center row justify-content-center">
                                                            <div class="col-12">
                                                                <div class="qr qr-size-lg">
                                                                    <div class="qr-inner" style="background-image: url('QR_Code/images/qr-frame.svg')">
                                                                        <img class="qrcodeimg-modal"
                                                                             src="https://img.vietqr.io/image/vietinbank-104877396758-qr_only.jpg?amount=<%= currencyFormat.format(totalPrice).replace("₫", "")%>&addInfo=${userobj.name}%20${userobj.id}"
                                                                             alt="QR CODE">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-12">
                                                                <div class="bills bills-simple">
                                                                    <div class="text-center">
                                                                        <div class="sub-title weight5 mb4">
                                                                            Số tiền thanh toán
                                                                        </div>
                                                                        <div class="title color-primary h2">
                                                                            <%= currencyFormat.format(totalPrice).replace("₫", "")%><sup>VND</sup>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-auto show-desktop">
                                                                <a href="#" data-bs-dismiss="modal" data-bs-toggle="modal"
                                                                   data-bs-target="#modalHuongDan" class="link weight5 link-style-default">
                                                                    <img src="QR_Code/images/icons-color/info/default/24x24-information-circle.svg" alt=""
                                                                         class="ic-default">
                                                                    Hướng dẫn thanh toán
                                                                </a>
                                                            </div>
                                                            <div class="col-12 show-mobile">
                                                                <!-- button.button -->
                                                                <a href="Transaction/DownloadQR.html"
                                                                   class="ubg-sub-primary ubox-size-button-default ubg-hover ubg-active ubtn">
                                                                    <div class="ubtn-inner">
                                                                        <span class="ubtn-ic ubtn-ic-left">
                                                                            <img src="QR_Code/images/icons-color/primary/default/24x24-download.svg" alt=""
                                                                                 class="ic-default">
                                                                        </span>
                                                                        <span class="ubtn-text">Tải mã</span>
                                                                    </div>
                                                                </a>
                                                                <!-- end button.button -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end modal.modal -->
                                        <!-- modal.modal -->

                                        <div class="modal fade" id="modalHuongDan" aria-labelledby="exampleModalLabel" aria-hidden="true"
                                             style="display: none;">
                                            <div class="modal-dialog modal-dialog-centered modal-size-md modal-dialog-scrollable" role="document">
                                                <div class="modal-content">

                                                    <div class="modal-body">
                                                        <div class="modal-section show-desktop">
                                                            <div class="guide">
                                                                <div class="guide-inner">
                                                                    <div class="row row-52">
                                                                        <div class="col-auto">
                                                                            <div class="tab-content">
                                                                                <div class="tab-pane fade show active tabGuide1">
                                                                                    <div class="guide-image">
                                                                                        <img src="QR_Code/images/img/guide/hd-1.png" alt="">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="tab-pane fade tabGuide2">
                                                                                    <div class="guide-image">
                                                                                        <img src="QR_Code/images/img/guide/hd-2.png" alt="">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="tab-pane fade tabGuide3">
                                                                                    <div class="guide-image">
                                                                                        <img src="QR_Code/images/img/guide/hd-3.png" alt="">
                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="h2 mb32">Hướng dẫn thanh toán</div>
                                                                            <!-- tab.tab -->
                                                                            <div class="nav-wrap">
                                                                                <nav class="nav nav-style-guide tabs-vertical tabs-progress nav-full">
                                                                                    <a class="nav-link active" data-bs-toggle="tab"
                                                                                       data-bs-target=".tabGuide1">
                                                                                        <div class="guide-content color-default">
                                                                                            <div class="row row-16">
                                                                                                <div class="col-auto">
                                                                                                    <div class="guide-title-number">
                                                                                                        <div class="guide-title-number-inner h3">1</div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col">
                                                                                                    <div class="guide-title h3 mb2">
                                                                                                        <div class="guide-title-inner">
                                                                                                            Quét mã QR

                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="guide-sub-title">
                                                                                                        Đăng nhập ứng dụng thanh toán, chọn chức năng
                                                                                                        QRPay và quét mã QR
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </a>
                                                                                    <a class="nav-link" data-bs-toggle="tab"
                                                                                       data-bs-target=".tabGuide2">
                                                                                        <div class="guide-content color-default">
                                                                                            <div class="row row-16">
                                                                                                <div class="col-auto">
                                                                                                    <div class="guide-title-number">
                                                                                                        <div class="guide-title-number-inner h3">2</div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col">
                                                                                                    <div class="guide-title h3 mb2">
                                                                                                        <div class="guide-title-inner">
                                                                                                            Kiểm tra đơn hàng

                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="guide-sub-title">
                                                                                                        Kiểm tra thông tin đơn hàng và lựa chọn tài
                                                                                                        khoản thanh toán để tiếp tục
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </a>
                                                                                    <a class="nav-link" data-bs-toggle="tab"
                                                                                       data-bs-target=".tabGuide3">
                                                                                        <div class="guide-content color-default">
                                                                                            <div class="row row-16">
                                                                                                <div class="col-auto">
                                                                                                    <div class="guide-title-number">
                                                                                                        <div class="guide-title-number-inner h3">3</div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col">
                                                                                                    <div class="guide-title h3 mb2">
                                                                                                        <div class="guide-title-inner">
                                                                                                            Xác nhận giao dịch

                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="guide-sub-title">
                                                                                                        Xác nhận thanh toán và hoàn tất giao dịch
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </a>
                                                                                </nav>
                                                                            </div>
                                                                            <!-- end tab.tab -->
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- modal.modal -->
                                        <div class="modal fade modal-full-height" id="modalHuongDanMobile" role="dialog"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-size-md modal-dialog-scrollable" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <div class="modal-wrap">
                                                            <div class="row row-16 modal-title-wrap">
                                                                <div class="col-12 text-center">
                                                                    <h2 class="modal-title h2">
                                                                        Hướng dẫn thanh toán

                                                                    </h2>
                                                                </div>
                                                            </div>
                                                            <!-- button.button -->
                                                            <a data-bs-dismiss="modal"
                                                               class="ubg-transparent ubox-size-button-default ubox-square ubg-hover ubg-active ubtn modal-close-btn">
                                                                <div class="ubtn-inner">
                                                                </div>
                                                            </a>
                                                            <!-- end button.button -->
                                                            <div class="mt16">
                                                                <!-- tab.tab -->
                                                                <div class="nav-wrap">
                                                                    <nav class="nav nav-style-pills nav-fill">
                                                                        <a class="nav-link active" data-bs-toggle="tab"
                                                                           data-bs-target=".tabGuideMobile1">
                                                                            Qua quét mã VNPAY<sup>QR</sup>
                                                                        </a>
                                                                        <a class="nav-link" data-bs-toggle="tab" data-bs-target=".tabGuideMobile2">
                                                                            Qua ứng dụng hỗ trợ VNPAY
                                                                        </a>
                                                                    </nav>
                                                                </div>
                                                                <!-- end tab.tab -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="tab-content">
                                                            <div class="tab-pane fade show active tabGuideMobile1">
                                                                <div class="list-mb24 list-last-mb">
                                                                    <ul class="ul weight5 list-mb12 list-last-mb">
                                                                        <li>
                                                                            <span class="color-primary">Bước 1</span>: Tải mã / chụp lại mã thanh toán
                                                                        </li>
                                                                        <li>
                                                                            <span class="color-primary">Bước 2</span>: Đăng nhập ứng dụng hỗ trợ thanh
                                                                            toán, chọn chức năng QRPay
                                                                        </li>
                                                                        <li>
                                                                            <span class="color-primary">Bước 3</span>: Tại màn hình quét QR, chọn chức
                                                                            năng "Thư viện ảnh"
                                                                        </li>
                                                                        <li>
                                                                            <span class="color-primary">Bước 4</span>:Chọn ảnh QR đã tải về trong thư
                                                                            viện
                                                                        </li>
                                                                        <li>
                                                                            <span class="color-primary">Bước 5</span>: Kiểm tra thông tin đơn hàng và
                                                                            lựa chọn tài khoản thanh toán
                                                                        </li>
                                                                        <li>
                                                                            <span class="color-primary">Bước 6</span>: Xác nhận thanh toán và hoàn tất
                                                                            giao dịch
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <div class="tab-pane fade tabGuideMobile2">
                                                                <div class="list-mb24 list-last-mb">
                                                                    <ul class="ul weight5 list-mb12 list-last-mb">
                                                                        <li>
                                                                            <span class="color-primary">Bước 1</span>:
                                                                            Nhấn vào logo của ứng dụng hỗ trợ thanh toán QR trong danh sách
                                                                        </li>
                                                                        <li>
                                                                            <span class="color-primary">Bước 2</span>:
                                                                            Đồng ý mở ứng dụng hỗ trợ thanh toán QR theo yêu câu thông báo trên màn hình
                                                                            và Đăng nhập
                                                                        </li>
                                                                        <li>
                                                                            <span class="color-primary">Bước 3</span>:
                                                                            Xác nhận giao dịch và hoàn tất thanh toán
                                                                        </li>
                                                                    </ul>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end modal.modal -->


                                    </div>

                                    <div class="col-md-6" style="display: none">
                                        <label class="form-label fs-8 text-body-highlight ps-0 text-transform-none" for="selectCard">Select card</label>
                                        <select class="form-select text-body-emphasis" id="selectCard">
                                            <option selected="selected">select a card</option>
                                            <option value="visa">Visa</option>
                                            <option value="discover">Discover</option>
                                            <option value="mastercard">Mastercard</option>
                                            <option value="american-express">American Express</option>
                                        </select>
                                    </div>
                                    <div style="display: none" class="col-md-6"><label class="form-label fs-8 text-body-highlight ps-0 text-transform-none" for="inputCardNumber">Card number</label><input class="form-control" id="inputCardNumber" type="number" placeholder="Enter card number" aria-label="Card number" /></div>
                                    <div style="display: none" class="col-12"><label class="form-label fs-8 text-body-highlight ps-0 text-transform-none" for="inputName">Full name</label><input class="form-control" id="inputName" type="text" placeholder="Ansolo Lazinatov" aria-label="Full name" /></div>
                                    <div style="display: none" class="col-md-6"><label class="form-label fs-8 text-body-highlight ps-0 text-transform-none">Expires on</label>
                                        <div class="d-flex"><select class="form-select text-body-emphasis me-3">
                                                <option selected="selected">Month</option>
                                                <option>January</option>
                                                <option>February</option>
                                                <option>March</option>
                                            </select><select class="form-select text-body-emphasis">
                                                <option selected="selected">Year</option>
                                                <option value="1990">1990</option>

                                            </select></div>
                                    </div>
                                    <div style="display: none" class="col-md-6"><label class="form-label fs-8 text-body-highlight ps-0 text-transform-none" for="inputCardCVC">CVC</label><input class="form-control" id="inputCardCVC" type="number" placeholder="Enter a valid CVC" aria-label="CVC" /></div>
                                    <div style="display: none" class="col-12">
                                        <div class="form-check"><input class="form-check-input" id="gridCheck" type="checkbox" /><label class="form-check-label text-body-emphasis fs-8" for="gridCheck">Save Card Details</label></div>
                                    </div>  


                                </div>
                                <div class="row g-2 mb-5 mb-lg-0" style="display: none">
                                    <div class="col-md-8 col-lg-9 d-grid"><button class="btn btn-primary" type="submit">Pay $695.20</button></div>
                                    <div class="col-md-4 col-lg-3 d-grid"><button class="btn btn-phoenix-secondary text-nowrap" type="submit">Save Order and Exit</button></div>
                                </div>
                            </form>
                        </div>


                        <div class="col-lg-5 col-xl-4">
                            <div class="card mt-3 mt-lg-0">
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h3 class="mb-0">Tóm tắt</h3>
                                        <a href="cart.jsp">
                                            <button class="btn btn-link pe-0"  type="button">Chỉnh sửa giỏ hàng</button>
                                        </a>
                                    </div>

                                    <%

                                        for (Cart c : cart) {
                                            totalPrice += c.getTotalPrice();
                                    %>
                                    <input type="hidden" name="userID" value="<%= user.getId()%>">
                                    <input type="hidden" name="name" value="<%= user.getName()%>">
                                    <input type="hidden" name="address" value="<%= user.getAddress()%>">

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
                                    <%
                                        totalPrice /= 2;
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
                                    <a href="../../index.jsp" class="btn-to-payment" style="padding-top: 20px">
                                        <button class="btn btn-primary w-100">Trở về trang chủ
                                            <span class="fas fa-chevron-right ms-1 fs-10"></span>
                                        </button>
                                    </a>
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

    </body>

</html>