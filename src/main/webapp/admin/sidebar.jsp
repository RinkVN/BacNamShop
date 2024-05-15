<%-- 
    Document   : sidebar
    Created on : Mar 12, 2024, 9:50:58 PM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Trang Quản Lý</title>
        <link rel="shortcut icon" href="https://d24ouiz0dt1p4y.cloudfront.net/images/logo-mb.png" type="image/png" />
        <!-- GOOGLE FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet"
            />
        <!-- BOXICONS -->
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <!-- APP CSS -->
        <link rel="stylesheet" href="css/grid.css" />
        <link rel="stylesheet" href="css/app.css" />
    </head>

    <body>

        <!-- SIDEBAR -->
        <div class="sidebar">
            <div class="sidebar-logo">
                <a href="../index.jsp" style="margin: 0 auto">
                    <img src="../assets/logo_main.png" alt="Comapny logo" style="width: 100%; min-height: 180px; padding-top: 20px" />
                </a>
                <div class="sidebar-close" id="sidebar-close">
                    <i class="bx bx-left-arrow-alt"></i>
                </div>
            </div>
            <div class="sidebar-user">
                <div class="sidebar-user-info">
                    <img
                        src="../assets/favicon.png"
                        alt="User picture"
                        class="profile-image"
                        />
                    <div class="sidebar-user-name">BacNam Shop</div>
                </div>
                <button class="btn btn1 btn-outline" href="logout">
                    <a href="../logout"><i class="bx bx-log-out bx-flip-horizontal"></i></a>
                </button>
            </div>
            <!-- SIDEBAR MENU -->
            <ul class="sidebar-menu">
                <li>
                    <a href="home.jsp" class="active">
                        <i class="bx bx-home"></i>
                        <span>Bảng điều khiển</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="bx bx-shopping-bag"></i>
                        <span>sales</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="bx bx-chart"></i>
                        <span>Phân tích</span>
                    </a>
                </li>
                <li class="sidebar-submenu">
                    <a href="#" class="sidebar-menu-dropdown">
                        <i class="bx bx-user-circle"></i>
                        <span>Khách hàng</span>
                        <div class="dropdown-icon"></div>
                    </a>
                    <ul class="sidebar-menu sidebar-menu-dropdown-content">
                        <li>
                            <a href="customers.jsp"> Khách hàng </a>
                        </li>
                        <li>
                            <a href="#"> account settings </a>
                        </li>
                        <li>
                            <a href="#"> billing </a>
                        </li>
                    </ul>
                </li>

                <li class="sidebar-submenu">
                    <a href="#" class="sidebar-menu-dropdown">
                        <i class="bx bx-category"></i>
                        <span>Thương mại</span>
                        <div class="dropdown-icon"></div>
                    </a>
                    <ul class="sidebar-menu sidebar-menu-dropdown-content">
                        <li>
                            <a href="all-products.jsp">
                                Danh sách sản phẩm
                            </a>
                        </li>
                        <li>
                            <a href="add-product.jsp"> Thêm sản phẩm </a>
                        </li>
                        <li>
                            <a href="orders.jsp"> Đặt hàng </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="bx bx-mail-send"></i>
                        <span>mail</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="bx bx-chat"></i>
                        <span>chat</span>
                    </a>
                </li>

                <li class="sidebar-submenu">
                    <a href="#" class="sidebar-menu-dropdown">
                        <i class="bx bx-cog"></i>
                        <span>Cài đặt</span>
                        <div class="dropdown-icon"></div>
                    </a>
                    <ul class="sidebar-menu sidebar-menu-dropdown-content">
                        <li>
                            <a href="#" class="darkmode-toggle" id="darkmode-toggle">
                                darkmode
                                <span class="darkmode-switch"></span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- END SIDEBAR MENU -->
        </div>
        <!-- END SIDEBAR -->

        <div class="overlay"></div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                // Xử lý sự kiện khi nhấn vào "All Books"
                $("a[href='all-books.jsp']").on("click", function () {
                    // Loại bỏ class active khỏi tất cả các thẻ <a> trong menu
                    $(".sidebar-menu a").removeClass("active");
                    // Thêm class active vào thẻ <a> được nhấn
                    $(this).addClass("active");
                });

                // Xử lý sự kiện khi nhấn vào "add product"
                $("a[href='add-product.jsp']").on("click", function () {
                    // Loại bỏ class active khỏi tất cả các thẻ <a> trong menu
                    $(".sidebar-menu a").removeClass("active");
                    // Thêm class active vào thẻ <a> được nhấn
                    $(this).addClass("active");
                });
            });
        </script>


        <!-- SCRIPT -->
        <!-- APEX CHART -->
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <!-- APP JS -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/js/app.js"></script>
    </body>
</html>
