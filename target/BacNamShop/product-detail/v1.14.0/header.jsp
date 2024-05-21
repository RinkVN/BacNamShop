<%-- 
    Document   : header
    Created on : Apr 11, 2024, 6:19:46 PM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="en">

    <head>
        <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Header</title>
                <link rel="stylesheet" href="style.css">
                    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css" rel="stylesheet">
                        </head>

                        <body>
                            <header>

                                <%
                                    User u = (User) session.getAttribute("userobj");
                                %>

                                <!-- header -->
                                <div class="header-top mobile-hide">
                                    <div class="container">


                                        <ul class="header-social-container">

                                            <li>
                                                <a href="https://www.facebook.com/profile.php?id=100066432909767" target="blank"
                                                   class="social-link">
                                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="16" height="16"
                                                         viewBox="0 0 48 48">
                                                        <path fill="#3F51B5"
                                                              d="M42,37c0,2.762-2.238,5-5,5H11c-2.761,0-5-2.238-5-5V11c0-2.762,2.239-5,5-5h26c2.762,0,5,2.238,5,5V37z">
                                                        </path>
                                                        <path fill="#FFF"
                                                              d="M34.368,25H31v13h-5V25h-3v-4h3v-2.41c0.002-3.508,1.459-5.59,5.592-5.59H35v4h-2.287C31.104,17,31,17.6,31,18.723V21h4L34.368,25z">
                                                        </path>
                                                    </svg>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="https://shopee.vn/skechers_official" target="blank" class="social-link shopee-icon">

                                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="16" height="16"
                                                         viewBox="0 0 48 48">
                                                        <path fill="#f4511e"
                                                              d="M36.683,43H11.317c-2.136,0-3.896-1.679-3.996-3.813l-1.272-27.14C6.022,11.477,6.477,11,7.048,11 h33.904c0.571,0,1.026,0.477,0.999,1.047l-1.272,27.14C40.579,41.321,38.819,43,36.683,43z">
                                                        </path>
                                                        <path fill="#f4511e"
                                                              d="M32.5,11.5h-2C30.5,7.364,27.584,4,24,4s-6.5,3.364-6.5,7.5h-2C15.5,6.262,19.313,2,24,2 S32.5,6.262,32.5,11.5z">
                                                        </path>
                                                        <path fill="#fafafa"
                                                              d="M24.248,25.688c-2.741-1.002-4.405-1.743-4.405-3.577c0-1.851,1.776-3.195,4.224-3.195 c1.685,0,3.159,0.66,3.888,1.052c0.124,0.067,0.474,0.277,0.672,0.41l0.13,0.087l0.958-1.558l-0.157-0.103 c-0.772-0.521-2.854-1.733-5.49-1.733c-3.459,0-6.067,2.166-6.067,5.039c0,3.257,2.983,4.347,5.615,5.309 c3.07,1.122,4.934,1.975,4.934,4.349c0,1.828-2.067,3.314-4.609,3.314c-2.864,0-5.326-2.105-5.349-2.125l-0.128-0.118l-1.046,1.542 l0.106,0.087c0.712,0.577,3.276,2.458,6.416,2.458c3.619,0,6.454-2.266,6.454-5.158C30.393,27.933,27.128,26.741,24.248,25.688z">
                                                        </path>
                                                    </svg>

                                                </a>
                                            </li>

                                            <li>
                                                <a href="https://www.lazada.vn/shop/lu-store-shoes-and-clothes/?itemId=2468320722&spm=a2o4n.pdp_revamp.seller.1.406a5afc00uQRp&path=promotion-42986-0.htm&tab=promotion&channelSource=pdp"
                                                   target="blank" class="social-link lazada-icon">
                                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="16" height="16"
                                                         viewBox="0 0 100 100">
                                                        <path fill="#f9b621"
                                                              d="M74.007,18.001c0.204,0,0.403,0.056,0.576,0.163l16.427,10.109c0.61,0.375,0.989,1.054,0.989,1.77	v29.085c0,0.724-0.367,1.384-0.982,1.766L51.055,85.699C50.738,85.896,50.373,86,50,86s-0.738-0.104-1.055-0.301L8.982,60.895	C8.367,60.513,8,59.853,8,59.129V30.044c0-0.716,0.379-1.395,0.989-1.77l16.427-10.109c0.173-0.107,0.373-0.163,0.576-0.163	c0.205,0,0.406,0.057,0.58,0.165l15.354,9.53c2.426,1.506,5.218,2.302,8.073,2.302s5.647-0.796,8.073-2.302l15.354-9.53	C73.602,18.058,73.802,18.001,74.007,18.001">
                                                        </path>
                                                        <path fill="#f5905f"
                                                              d="M50,52L8.228,29.125C8.087,29.408,8,29.72,8,30.044v29.085c0,0.724,0.367,1.384,0.982,1.766	l39.963,24.805C49.262,85.896,49.627,86,50,86V52z">
                                                        </path>
                                                        <path fill="#ee4267"
                                                              d="M50,52l41.772-22.875C91.913,29.408,92,29.72,92,30.044v29.085c0,0.724-0.367,1.384-0.982,1.766	L51.055,85.699C50.738,85.896,50.373,86,50,86V52z">
                                                        </path>
                                                        <path fill="#ee5490"
                                                              d="M92,30.04v29.09c0,0.72-0.37,1.38-0.98,1.76L85,64.63v-31.8l6.77-3.71C91.91,29.41,92,29.72,92,30.04	z">
                                                        </path>
                                                        <polygon fill="#ef5684" points="85,32.83 85,64.63 79,68.35 79,36.11"></polygon>
                                                        <polygon fill="#ef517b" points="79,36.11 79,68.35 73,72.08 73,39.4"></polygon>
                                                        <polygon fill="#ef4a75" points="73,39.4 73,72.08 67,75.8 67,42.69"></polygon>
                                                        <polygon fill="#f2ac0f" points="41,27.12 41,47.07 35,43.78 35,23.4"></polygon>
                                                        <path fill="#f59173"
                                                              d="M47,29.7v20.66l-6-3.29V27.12l0.93,0.58C43.49,28.67,45.21,29.34,47,29.7z">
                                                        </path>
                                                        <path fill="#f27c7c"
                                                              d="M53,29.7v20.66L50,52l-3-1.64V29.7c0.98,0.2,1.99,0.3,3,0.3S52.02,29.9,53,29.7z">
                                                        </path>
                                                        <path fill="#f16e7c"
                                                              d="M59,27.12v19.95l-6,3.29V29.7c1.79-0.36,3.51-1.03,5.07-2L59,27.12z"></path>
                                                        <polygon fill="#ef6388" points="65,23.4 65,43.78 59,47.07 59,27.12"></polygon>
                                                        <path fill="#ee5490"
                                                              d="M91.77,29.12L65,43.78V23.4l8.43-5.23C73.6,18.06,73.8,18,74.01,18c0.2,0,0.4,0.06,0.57,0.16	l16.43,10.11C91.34,28.48,91.61,28.78,91.77,29.12z">
                                                        </path>
                                                        <path fill="#1f212b"
                                                              d="M50,87c-0.559,0-1.105-0.156-1.582-0.451L8.455,61.744C7.544,61.179,7,60.201,7,59.128V30.044	c0-1.062,0.562-2.066,1.465-2.622l16.427-10.109c0.665-0.409,1.542-0.408,2.207,0.002l15.355,9.532	c2.268,1.407,4.877,2.151,7.546,2.151s5.278-0.744,7.546-2.151l15.354-9.53c0.669-0.414,1.544-0.413,2.209-0.004l16.427,10.109	C92.438,27.978,93,28.982,93,30.044v29.084c0,1.072-0.544,2.05-1.455,2.616L51.582,86.549C51.105,86.844,50.559,87,50,87z M25.416,18.165l0.524,0.852L9.514,29.125C9.196,29.32,9,29.672,9,30.044v29.084c0,0.376,0.19,0.718,0.51,0.917L49.473,84.85	c0.316,0.196,0.738,0.197,1.055,0L90.49,60.045C90.81,59.847,91,59.504,91,59.128V30.044c0-0.372-0.196-0.724-0.514-0.919	L74.007,19.001c-0.02,0-0.038,0.005-0.055,0.016l-15.352,9.529c-2.584,1.604-5.559,2.452-8.601,2.452s-6.017-0.848-8.601-2.452	l-15.354-9.53L25.416,18.165z">
                                                        </path>
                                                        <polygon fill="#1f212b"
                                                                 points="50,52.57 7.76,29.438 8.24,28.562 50,51.43 91.76,28.562 92.24,29.438">
                                                        </polygon>
                                                        <rect width="1" height="35" x="49.5" y="52" fill="#1f212b"></rect>
                                                        <path fill="#1f212b"
                                                              d="M29.5,68.833c-0.091,0-0.182-0.024-0.264-0.075l-16.055-9.965C12.441,58.333,12,57.539,12,56.669	V35.5c0-0.276,0.224-0.5,0.5-0.5s0.5,0.224,0.5,0.5v21.169c0,0.522,0.265,0.999,0.709,1.274l16.055,9.965	c0.234,0.146,0.307,0.454,0.161,0.688C29.83,68.749,29.667,68.833,29.5,68.833z">
                                                        </path>
                                                        <path fill="#1f212b"
                                                              d="M44.5,78.144c-0.091,0-0.182-0.024-0.264-0.075l-1-0.621c-0.234-0.146-0.307-0.454-0.161-0.688	c0.146-0.235,0.456-0.305,0.688-0.161l1,0.621c0.234,0.146,0.307,0.454,0.161,0.688C44.83,78.06,44.667,78.144,44.5,78.144z">
                                                        </path>
                                                        <path fill="#1f212b"
                                                              d="M40.5,75.661c-0.091,0-0.182-0.024-0.264-0.075l-4-2.483c-0.234-0.146-0.307-0.454-0.161-0.688	c0.146-0.235,0.456-0.304,0.688-0.161l4,2.483c0.234,0.146,0.307,0.454,0.161,0.688C40.83,75.577,40.667,75.661,40.5,75.661z">
                                                        </path>
                                                        <path fill="#1f212b"
                                                              d="M84.418,30c-0.09,0-0.181-0.024-0.262-0.074l-9.351-5.754c-0.489-0.3-1.093-0.298-1.577,0.003	l-5.465,3.392c-0.232,0.146-0.542,0.074-0.688-0.161c-0.146-0.234-0.073-0.543,0.161-0.688l5.465-3.392	c0.811-0.503,1.817-0.504,2.628-0.005l9.351,5.754c0.235,0.145,0.309,0.453,0.164,0.688C84.749,29.916,84.585,30,84.418,30z">
                                                        </path>
                                                        <path fill="#1f212b"
                                                              d="M63.701,30c-0.167,0-0.33-0.084-0.425-0.236c-0.146-0.235-0.073-0.543,0.161-0.688l1.611-1	c0.233-0.144,0.542-0.074,0.688,0.161c0.146,0.235,0.073,0.543-0.161,0.688l-1.611,1C63.883,29.976,63.792,30,63.701,30z">
                                                        </path>
                                                    </svg>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="https://www.tiktok.com/" target="blank" class="social-link tiktok-icon">
                                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="16" height="16"
                                                         viewBox="0 0 50 50">
                                                        <path
                                                            d="M41,4H9C6.243,4,4,6.243,4,9v32c0,2.757,2.243,5,5,5h32c2.757,0,5-2.243,5-5V9C46,6.243,43.757,4,41,4z M37.006,22.323 c-0.227,0.021-0.457,0.035-0.69,0.035c-2.623,0-4.928-1.349-6.269-3.388c0,5.349,0,11.435,0,11.537c0,4.709-3.818,8.527-8.527,8.527 s-8.527-3.818-8.527-8.527s3.818-8.527,8.527-8.527c0.178,0,0.352,0.016,0.527,0.027v4.202c-0.175-0.021-0.347-0.053-0.527-0.053 c-2.404,0-4.352,1.948-4.352,4.352s1.948,4.352,4.352,4.352s4.527-1.894,4.527-4.298c0-0.095,0.042-19.594,0.042-19.594h4.016 c0.378,3.591,3.277,6.425,6.901,6.685V22.323z">
                                                        </path>
                                                    </svg>
                                                </a>
                                            </li>

                                        </ul>

                                        <div class="header-alert-news">
                                            <p>
                                                Số điện thoại liên hệ:
                                                <b>0968.33.88.29</b>
                                            </p>
                                        </div>

                                        <div class="header-top-actions">

                                            <select class="custom-select" name="currency">

                                                <option class="custom-option" value="eur">VND</option>
                                                <option class="custom-option" value="usd">USD &dollar;</option>

                                            </select>

                                            <select class="custom-select" name="language">

                                                <option class="custom-option" value="en-US">Tiếng Việt</option>
                                                <option class="custom-option" value="en-US">English</option>

                                            </select>

                                        </div>

                                    </div>
                                </div>
                                <!-- Header-top -->
                                <div class="header-nav">
                                    <div class="container">
                                        <div class="wrapper flexitem">
                                            <a href="#" class="trigger desktop-hide"><span class="i ri-menu-2-line"></span></a>
                                            <div class="left flexitem">
                                                <div class="logo">
                                                    <a href="../../index.jsp">
                                                        <!-- <span class="circle"></span>Shop -->
                                                        <img src="assets/logo_main.png" alt="">
                                                    </a>
                                                </div>
                                                <nav class="mobile-hide">
                                                    <ul class="flexitem second-links">
                                                        <li><a href="../../index.jsp">Trang chủ</a></li>
                                                        <li><a href="page-category.html">Cửa hàng</a></li>
                                                        <li class="has-child">
                                                            <a href="#">Phụ nữ
                                                                <div class="icon-small"><i class="ri-arrow-down-s-line"></i></div>
                                                            </a>
                                                            <div class="mega">
                                                                <div class="container">
                                                                    <div class="wrapper">
                                                                        <div class="felxcol">
                                                                            <div class="row">
                                                                                <h4>Quần áo phụ nữ</h4>
                                                                                <ul>
                                                                                    <li><a href="#">Váy</a></li>
                                                                                    <li><a href="#">Áo & Áo thun</a></li>
                                                                                    <li><a href="#">Áo khoác</a></li>
                                                                                    <li><a href="#">Quần & Quần short</a></li>
                                                                                    <li><a href="#">Áo len</a></li>
                                                                                    <li><a href="#">Trang phục</a></li>
                                                                                    <li><a href="#">Hoodie & Áo lót</a></li>
                                                                                    <li><a href="#">Quần dài & Quần ngắn</a></li>
                                                                                    <li><a href="#">Đồ bơi</a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        <div class="felxcol">
                                                                            <div class="row">
                                                                                <h4>Trang sức</h4>
                                                                                <ul>
                                                                                    <li><a href="#"></a>Phụ kiện</li>
                                                                                    <li><a href="#"></a>Túi & Ví</li>
                                                                                    <li><a href="#"></a>Dây chuyền</li>
                                                                                    <li><a href="#"></a>Nhẫn</li>
                                                                                    <li><a href="#"></a>Bông tai</li>
                                                                                    <li><a href="#"></a>Vòng cổ</li>
                                                                                    <li><a href="#"></a>Trang sức cơ thể</li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        <div class="felxcol">
                                                                            <div class="row">
                                                                                <h4>Làm đẹp</h4>
                                                                                <ul>
                                                                                    <li><a href="#"></a>Phụ kiện tắm</li>
                                                                                    <li><a href="#"></a>Trang điểm & Mỹ phẩm</li>
                                                                                    <li><a href="#"></a>Chăm sóc da</li>
                                                                                    <li><a href="#"></a>Chăm sóc tóc</li>
                                                                                    <li><a href="#"></a>Dầu thơm</li>
                                                                                    <li><a href="#"></a>Nước hoa</li>
                                                                                    <li><a href="#"></a>Xà phòng & Bóng tắm</li>
                                                                                    <li><a href="#"></a>Mặt nạ & Bao trùm mặt</li>
                                                                                    <li><a href="#"></a>Bộ quà tặng và Dụng cụ spa</li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        <div class="felxcol">
                                                                            <div class="row">
                                                                                <h4>Thương hiệu nổi tiếng</h4>
                                                                                <ul class="women-brands">
                                                                                    <li><a href="#"></a>Nike</li>
                                                                                    <li><a href="#"></a>Louis Vuitton</li>
                                                                                    <li><a href="#"></a>Hermes</li>
                                                                                    <li><a href="#"></a>Gucci</li>
                                                                                    <li><a href="#"></a>Zalando</li>
                                                                                    <li><a href="#"></a>Tiffancy & Co.</li>
                                                                                    <li><a href="#"></a>Zara</li>
                                                                                    <li><a href="#"></a>H&M</li>
                                                                                    <li><a href="#"></a>Cartier</li>
                                                                                    <li><a href="#"></a>Chanel</li>
                                                                                    <li><a href="#"></a>Hurley</li>
                                                                                </ul>
                                                                                <a href="#" class="view-all">Xem tất cả các thương hiệu <i
                                                                                        class="ri-arrow-right-line"></i></a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="flexcol products">
                                                                            <div class="row">
                                                                                <div class="media">
                                                                                    <div class="thumbnail object-cover">
                                                                                        <a href="#">
                                                                                            <img src="" alt="">
                                                                                        </a>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="text-content">
                                                                                    <h4>Sản phẩm được săn đón nhất!</h4>
                                                                                    <a href="#" class="primary-button">Đặt hàng ngay</a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li><a href="#">Nam</a></li>
                                                        <li>
                                                            <a href="#">Thể thao
                                                                <div class="fly-item"><span>Mới!</span></div>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                            <div class="right">

                                                <ul class="flexitem second-links">
                                                    <c:choose>
                                                        <c:when test="${not empty userobj}">
                                                            <li class="account-card">
                                                                <div class="icon-large icon-user">
                                                                    <a href="../../account-settings.jsp">
                                                                        <i class="ri-user-line sign-in-text"></i>
                                                                    </a>
                                                                </div>
                                                                <div class="account-text sig-in">
                                                                    <a href="../../account-settings.jsp">
                                                                        <div class="sign-in-text">${userobj.name}</div>
                                                                    </a>
                                                                </div>
                                                            </li>
                                                            <c:if test="${userobj.email eq 'admin@gmail.com'}">
                                                                <div class="account-text logout">
                                                                    <a href="../../admin/all-products.jsp" class="sign-in-text"><i class="ri-login-circle-r-line "></i> Admin Page</a>
                                                                </div>
                                                            </c:if>
                                                            <div class="account-text logout">
                                                                <a href="../../logout" class="sign-in-text"><i class="ri-logout-circle-r-line "></i> Logout</a>
                                                            </div>
                                                            <li class="">
                                                                <a href="#">
                                                                    <div class="icon-large"><i class="ri-heart-line"></i></div>
                                                                    <div class="fly-item"><span class="item-number">0</span></div>
                                                                </a>
                                                            </li>
                                                            <li class="iscart">
                                                                <a href="#">
                                                                    <div class="icon-large">
                                                                        <a href="product-detail/v1.14.0/cart.jsp">
                                                                            <div class="cart-icon">
                                                                                <i class="ri-shopping-cart-line"></i>
                                                                            </div>
                                                                        </a>
                                                                        <div class="fly-item"><span class="item-number cartNo">0</span></div>
                                                                    </div>
                                                                </a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${not empty userGoogle}">
                                                                    <li class="account-card">
                                                                        <div class="icon-large icon-user">
                                                                            <a href="../../account-settings.jsp">
                                                                                <i class="ri-user-line"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="account-text sig-in">
                                                                            <a href="../../account-settings.jsp">
                                                                                <div class="sign-in-text">${userGoogle.name}</div>
                                                                            </a>
                                                                        </div>
                                                                    </li>
                                                                    <div class="account-text logout">
                                                                        <a href="../../logout" class="sign-in-text"><i class="ri-logout-circle-r-line "></i> Logout</a>
                                                                    </div>
                                                                    <li class="">
                                                                        <a href="#">
                                                                            <div class="icon-large"><i class="ri-heart-line"></i></div>
                                                                            <div class="fly-item"><span class="item-number">0</span></div>
                                                                        </a>
                                                                    </li>
                                                                    <li class="iscart">
                                                                        <a href="#">
                                                                            <div class="icon-large">
                                                                                <a href="product-detail/v1.14.0/cart.jsp">
                                                                                    <div class="cart-icon">
                                                                                        <i class="ri-shopping-cart-line"></i>
                                                                                    </div>
                                                                                </a>
                                                                                <div class="fly-item"><span class="item-number cartNo">0</span></div>
                                                                            </div>
                                                                        </a>
                                                                    </li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <li class="account-card">
                                                                        <div class="icon-large icon-user">
                                                                            <a href="../../login.jsp">
                                                                                <i class="ri-user-line"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="account-text sig-in">
                                                                            <a href="../../login.jsp">
                                                                                <div class="sign-in-text">Đăng nhập</div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="account-text sig-up">
                                                                            <div class="sign-up-text">/</div>
                                                                        </div>
                                                                        <div class="account-text sig-up">
                                                                            <a href="../../register.jsp">
                                                                                <div class="sign-up-text">Đăng ký</div>
                                                                            </a>
                                                                        </div>
                                                                    </li> 
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </ul>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </header>

                        </body>

                        </html>
