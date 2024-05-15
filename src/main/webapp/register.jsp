<%-- 
    Document   : register
    Created on : Apr 4, 2024, 11:10:46 PM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" type="image/png" href="assets/favicon.png"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="css/Login/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Register |</title>
    </head>

    <body>
        <div class="container d-flex justify-content-center align-items-center min-vh-100">
            <div class="row border rounded-5 p-3 bg-white shadow box-area">
                <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box"
                     style="background: #1087be;">
                    <div class="featured-image mb-3">
                        <img src="css/Login/images/1.png" class="img-fluid" style="width: 250px;">
                    </div>
                    <p class="text-white fs-2" style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">
                        Space Shop</p>
                    <small class="text-white text-wrap text-center"
                           style="width: 17rem;font-family: 'Courier New', Courier, monospace;">Thỏa sức mua sắm trong
                        </br>không gian của bạn.</small>
                </div>
                <div class="col-md-6 right-box">
                    <div class="row align-items-center">
                        <div class="header-text mb-4">
                            <h2>Đăng Ký</h2>
                            <p>We are very happy to see you here.</p>



                            <c:if test="${not empty failMess}">
                                <div class="position-relative mb-4" aria-live="polite" aria-atomic="true" >
                                    <div class="toast show ">
                                        <div class="toast-header ">
                                            <strong class="me-auto">Xin lỗi</strong>
                                            <small class="text-body-secondary"><i class="fa-solid fa-xmark"></i></small>
                                            <button class="btn ms-2 p-0" type="button" data-bs-dismiss="toast" aria-label="Close"><span class="uil uil-times fs-7"></span></button>
                                        </div>
                                        <div class="toast-body">${failMess}</div>
                                    </div>
                                </div>
                                <c:remove var="failMess" scope="session"/>
                            </c:if>

                        </div>
                        <form action="register" method="post">
                            <div class="input-group mb-4">
                                <input type="text" id="exampleInputName" class="form-control form-control-lg bg-light fs-6" 
                                       placeholder="Họ và Tên"
                                       name="name"
                                       value="${name}">
                            </div>
                            <div class="input-group mb-4">
                                <input type="text" id="exampleInputPhone" class="form-control form-control-lg bg-light fs-6"
                                       placeholder="Số Điện Thoại"
                                       name="phno"
                                       value="${phno}">
                            </div>
                            <div class="input-group mb-4">
                                <input type="text" id="exampleInputEmailId" class="form-control form-control-lg bg-light fs-6"
                                       placeholder="Email (Tùy chọn)"
                                       name="email"
                                       value="${email}">
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" id="InputPassword" class="form-control form-control-lg bg-light fs-6"
                                       placeholder="Mật khẩu"
                                       name="password"
                                       value="${password}">
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" id="InputRepassword" class="form-control form-control-lg bg-light fs-6"
                                       placeholder="Xác nhận mật khẩu"
                                       name="repassword">
                            </div>
                            <div class="input-group mb-4 d-flex justify-content-between">
                                <div class="form-check">
                                    <input type="checkbox" id="user-checkbox" class="form-check-input"
                                           checked="" name="check" required="">
                                    <label for="formCheck" class="form-check-label text-secondary">
                                        <small>Đồng ý với điều khoản của chúng tôi?</small>
                                    </label>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <button type="submit" class="btn btn-lg btn-primary w-100 fs-6">Đăng Ký</button>
                            </div>

                        </form>
                        <div class="input-group mb-3">
                            <button type="button" class="btn btn-lg btn-light w-100 fs-6"><img src="css/Login/images/google.png" style="width:20px"
                                                                                               class="me-2"><small>Đăng nhập với Google</small></button>
                        </div>
                        <div class="row">
                            <small>Bạn đã có tài khoản? <a href="login.jsp">Đăng Nhập</a></small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script>
        // Lấy URL hiện tại
        var currentURL = window.location.href;

// Thay thế ".jsp" bằng ""
        var newURL = currentURL.replace(".jsp", "");

// Thay đổi URL trên thanh địa chỉ của trình duyệt
        window.history.replaceState(null, null, newURL);

    </script>
</html>