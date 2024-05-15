<%-- 
    Document   : account-settings
    Created on : Mar 20, 2024, 6:40:19 AM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>

        <!-- GOOGLE FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet"/>
        <!-- BOXICONS -->
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/js/bootstrap/bootstrap.min.js" />
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="preload" href="https://d24ouiz0dt1p4y.cloudfront.net/assets/css/theme.css" data-hs-appearance="default" as="style" />  
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />

        <link rel="stylesheet" href="admin/css/theme.min.css" />

        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/css/tom-select.bootstrap5.css" />
    </head>
    <body>
        <main id="content" role="main" class="main">

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
                            <strong class="me-auto">Lỗi</strong>
                            <small class="text-body-secondary"><i class="fa-solid fa-xmark"></i></small>
                            <button class="btn ms-2 p-0" type="button" data-bs-dismiss="toast" aria-label="Close"><span class="uil uil-times fs-7"></span></button>
                        </div>
                        <div class="toast-body">${failMess}.</div>
                    </div>
                </div>
                <c:remove var="failMess" scope="session"/>
            </c:if>

            <!-- Content -->
            <div class="content container-fluid">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="row align-items-end">
                        <div class="col-sm mb-2 mb-sm-0">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb breadcrumb-no-gutter">
                                    <li class="breadcrumb-item"><a class="breadcrumb-link" href="index.jsp  ">Pages</a></li>
                                    <li class="breadcrumb-item"><a class="breadcrumb-link" href="javascript:;">Account</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Settings</li>
                                </ol>
                            </nav>

                            <h1 class="page-header-title">Settings</h1>
                        </div>
                        <!-- End Col -->

                        <div class="col-sm-auto">
                            <a class="btn btn-primary" href="user-profile.jsp">
                                <i class="bi-person-fill me-1"></i> My profile
                            </a>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>
                <!-- End Page Header -->

                <div class="row">
                    <div class="col-lg-3">
                        <!-- Navbar -->
                        <div class="navbar-expand-lg navbar-vertical mb-3 mb-lg-5">
                            <!-- Navbar Toggle -->
                            <!-- Navbar Toggle -->
                            <div class="d-grid">
                                <button type="button" class="navbar-toggler btn btn-white mb-3" data-bs-toggle="collapse" data-bs-target="#navbarVerticalNavMenu" aria-label="Toggle navigation" aria-expanded="false" aria-controls="navbarVerticalNavMenu">
                                    <span class="d-flex justify-content-between align-items-center">
                                        <span class="text-dark">Menu</span>

                                        <span class="navbar-toggler-default">
                                            <i class="bi-list"></i>
                                        </span>

                                        <span class="navbar-toggler-toggled">
                                            <i class="bi-x"></i>
                                        </span>
                                    </span>
                                </button>
                            </div>
                            <!-- End Navbar Toggle -->
                            <!-- End Navbar Toggle -->

                            <!-- Navbar Collapse -->
                            <div id="navbarVerticalNavMenu" class="collapse navbar-collapse">
                                <ul id="navbarSettings" class="js-sticky-block js-scrollspy card card-navbar-nav nav nav-tabs nav-lg nav-vertical" data-hs-sticky-block-options='{
                                    "parentSelector": "#navbarVerticalNavMenu",
                                    "targetSelector": "#header",
                                    "breakpoint": "lg",
                                    "startPoint": "#navbarVerticalNavMenu",
                                    "endPoint": "#stickyBlockEndPoint",
                                    "stickyOffsetTop": 20
                                    }'>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#content">
                                            <i class="bi-person nav-icon"></i> Basic information
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#emailSection">
                                            <i class="bi-at nav-icon"></i> Email
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#passwordSection">
                                            <i class="bi-key nav-icon"></i> Password
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#preferencesSection">
                                            <i class="bi-gear nav-icon"></i> Preferences
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#twoStepVerificationSection">
                                            <i class="bi-shield-lock nav-icon"></i> Two-step verification
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#recentDevicesSection">
                                            <i class="bi-phone nav-icon"></i> Recent devices
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#notificationsSection">
                                            <i class="bi-bell nav-icon"></i> Notifications
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#connectedAccountsSection">
                                            <i class="bi-diagram-3 nav-icon"></i> Connected accounts
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#socialAccountsSection">
                                            <i class="bi-instagram nav-icon"></i> Social accounts
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#deleteAccountSection">
                                            <i class="bi-trash nav-icon"></i> Delete account
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- End Navbar Collapse -->
                        </div>
                        <!-- End Navbar -->
                    </div>

                    <div class="col-lg-9">
                        <div class="d-grid gap-3 gap-lg-5">
                            <!-- Card -->
                            <div class="card">
                                <!-- Profile Cover -->
                                <div class="profile-cover">
                                    <div class="profile-cover-img-wrapper">
                                        <img id="profileCoverImg" class="profile-cover-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/1920x400/img2.jpg" alt="Image Description">

                                        <!-- Custom File Cover -->
                                        <div class="profile-cover-content profile-cover-uploader p-3">
                                            <input type="file" class="js-file-attach profile-cover-uploader-input" id="profileCoverUplaoder" data-hs-file-attach-options='{
                                                   "textTarget": "#profileCoverImg",
                                                   "mode": "image",
                                                   "targetAttr": "src",
                                                   "allowTypes": [".png", ".jpeg", ".jpg"]
                                                   }'>
                                            <label class="profile-cover-uploader-label btn btn-sm btn-white" for="profileCoverUplaoder">
                                                <i class="bi-camera-fill"></i>
                                                <span class="d-none d-sm-inline-block ms-1">Upload header</span>
                                            </label>
                                        </div>
                                        <!-- End Custom File Cover -->
                                    </div>
                                </div>
                                <!-- End Profile Cover -->

                                <!-- Avatar -->
                                <label class="avatar avatar-xxl avatar-circle avatar-uploader profile-cover-avatar" for="editAvatarUploaderModal">
                                    <img id="editAvatarImgModal" class="avatar-img" src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-66.jpg" alt="Image Description">

                                    <input type="file" class="js-file-attach avatar-uploader-input" id="editAvatarUploaderModal" data-hs-file-attach-options='{
                                           "textTarget": "#editAvatarImgModal",
                                           "mode": "image",
                                           "targetAttr": "src",
                                           "allowTypes": [".png", ".jpeg", ".jpg"]
                                           }'>

                                    <span class="avatar-uploader-trigger">
                                        <i class="bi-pencil-fill avatar-uploader-icon shadow-sm"></i>
                                    </span>
                                </label>
                                <!-- End Avatar -->

                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <form action="editprofile" method="post">
                                <input type="hidden" value="${userobj.id}" name="id">
                                <div class="card">
                                    <div class="card-header">
                                        <h2 class="card-title h4">Basic information</h2>
                                    </div>

                                    <!-- Body -->
                                    <div class="card-body">
                                        <!-- Form -->
                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="firstNameLabel" class="col-sm-3 col-form-label form-label">Full name <i class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Displayed on public forums, such as Front."></i></label>

                                            <div class="col-sm-9">
                                                <div class="input-group input-group-sm-vertical">
                                                    <%
                                                        UserGoogle userg = (UserGoogle) session.getAttribute("userGoogle");
                                                    %>
                                                    <%
                                                        if (userg == null) {
                                                    %>
                                                    <input 
                                                        type="text" class="form-control" name="name" 
                                                        id="firstNameLabel" placeholder="Your name" 
                                                        aria-label="Your first name" value="${userobj.name}">
                                                    <%    } else {
                                                    %>
                                                    <input 
                                                        type="text" class="form-control" name="name" 
                                                        id="firstNameLabel" placeholder="Your name" 
                                                        aria-label="Your first name" value="${userGoogle.name}">
                                                    <%
                                                        }
                                                    %>

                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="emailLabel" class="col-sm-3 col-form-label form-label">Email</label>

                                            <div class="col-sm-9">
                                                <%
                                                    if (userg == null) {
                                                %>
                                                <input type="email" class="form-control" name="email" id="emailLabel" 
                                                       placeholder="Email" aria-label="Email" value="${userobj.email}">
                                                <%    } else {
                                                %>
                                                <input type="email" class="form-control" name="email" id="emailLabel" 
                                                       placeholder="Email" aria-label="Email" value="${userGoogle.email}">
                                                <%
                                                    }
                                                %>

                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="phoneLabel" class="col-sm-3 col-form-label form-label">Phone <span class="form-label-secondary"></span></label>

                                            <div class="col-sm-9">
                                                
                                                <input type="text" class="js-input-mask form-control" name="phno" id="phoneLabel" 
                                                       placeholder="+x(xxx)xxx-xx-xx" aria-label="+x(xxx)xxx-xx-xx" value="${userobj.phno}" >
                                            </div>
                                        </div>
                                        <!-- End Form -->






                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="locationLabel" class="col-sm-3 col-form-label form-label">Location</label>

                                            <div class="col-sm-9">
                                                <!-- Select -->
                                                <div class="tom-select-custom mb-4">
                                                    <select class="js-select form-select" id="locationLabel">
                                                        <option value="VN" data-option-template='<span class="d-flex align-items-center"><img class="avatar avatar-xss avatar-circle me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/flag-icon-css/flags/1x1/vn.svg" alt="Vietnam Flag" /><span class="text-truncate">Vietnam</span></span>'>Vietnam</option>
                                                    </select>
                                                </div>
                                                <!-- End Select -->
                                                <label for="locationLabel" class="col-sm-3 col-form-label form-label">City</label>

                                                <div class="mb-3">
                                                    <input type="text" class="form-control" name="city" id="cityLabel" placeholder="City" aria-label="City" value="${userobj.city}">
                                                </div>

                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="addressLine1Label" class="col-sm-3 col-form-label form-label">Address</label>

                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="address" id="addressLine1Label" placeholder="Your address" aria-label="Your address" value="${userobj.address}">
                                            </div>
                                        </div>
                                        <!-- End Form -->


                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="zipCodeLabel" class="col-sm-3 col-form-label form-label">Zip code <i class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="You can find your code in a postal address."></i></label>

                                            <div class="col-sm-9">
                                                <input type="text" class="js-input-mask form-control" name="zipCode" id="zipCodeLabel" placeholder="Your zip code" aria-label="Your zip code" value="${userobj.zipCode}" data-hs-mask-options='{
                                                       "mask": "AA0 0AA"
                                                       }'>
                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <!-- Form -->
                                        <div class="row align-items-center mb-4">
                                            <label class="col-sm-3 col-form-label form-label">Disable ads <span class="badge bg-primary text-uppercase ms-1">PRO</span></label>

                                            <div class="col-sm-9">
                                                <!-- Form Check -->
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        With your Pro account, you can disable ads across the site.
                                                    </label>
                                                </div>
                                                <!-- End Form Check -->
                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <div class="d-flex justify-content-end">
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </div>

                                        <!-- End Form -->
                                    </div>
                                    <!-- End Body -->
                                </div>
                                <!-- End Card -->
                            </form>


                            <!-- Card -->
                            <div id="passwordSection" class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Change your password</h4>
                                </div>

                                <!-- Body -->
                                <div class="card-body">
                                    <!-- Form -->
                                    <form action="changepassword" method="post">
                                        <input type="hidden" value="${userobj.id}" name="id">
                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="currentPasswordLabel" class="col-sm-3 col-form-label form-label">Current password</label>

                                            <div class="col-sm-9">
                                                <input type="password" class="form-control" name="currentPassword" id="currentPasswordLabel" placeholder="Enter current password" aria-label="Enter current password">
                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="newPassword" class="col-sm-3 col-form-label form-label">New password</label>

                                            <div class="col-sm-9">
                                                <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Enter new password" aria-label="Enter new password">
                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="confirmNewPasswordLabel" class="col-sm-3 col-form-label form-label">Confirm new password</label>

                                            <div class="col-sm-9">
                                                <div class="mb-3">
                                                    <input type="password" class="form-control" name="confirmNewPassword" id="confirmNewPasswordLabel" placeholder="Confirm your new password" aria-label="Confirm your new password">
                                                </div>

                                                <h5>Password requirements:</h5>

                                                <p class="fs-6 mb-2">Ensure that these requirements are met:</p>

                                                <ul class="fs-6">
                                                    <li>Minimum 8 characters long - the more, the better</li>
                                                    <li>At least one lowercase character</li>
                                                    <li>At least one uppercase character</li>
                                                    <li>At least one number, symbol, or whitespace character</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <div class="d-flex justify-content-end">
                                            <button type="submit" class="btn btn-primary">Save Changes</button>
                                        </div>
                                    </form>
                                    <!-- End Form -->
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div id="preferencesSection" class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Preferences</h4>
                                </div>

                                <!-- Body -->
                                <div class="card-body">
                                    <!-- Form -->
                                    <form>
                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="languageLabel" class="col-sm-3 col-form-label form-label">Language</label>

                                            <div class="col-sm-9">
                                                <!-- Select -->
                                                <div class="tom-select-custom">
                                                    <select class="js-select form-select" id="languageLabel" data-hs-tom-select-options='{
                                                            "searchInDropdown": false
                                                            }'>
                                                        <option label="empty"></option>
                                                        <option value="language1" data-option-template='<span class="d-flex align-items-center"><img class="avatar avatar-xss avatar-circle me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/flag-icon-css/flags/1x1/us.svg" alt="Image description" width="16"/><span>English (US)</span></span>'>English (US)</option>
                                                        <option value="language2" selected data-option-template='<span class="d-flex align-items-center"><img class="avatar avatar-xss avatar-circle me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/flag-icon-css/flags/1x1/gb.svg" alt="Image description" width="16"/><span>English (UK)</span></span>'>English (UK)</option>
                                                        <option value="language3" data-option-template='<span class="d-flex align-items-center"><img class="avatar avatar-xss avatar-circle me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/flag-icon-css/flags/1x1/de.svg" alt="Image description" width="16"/><span>Deutsch</span></span>'>Deutsch</option>
                                                        <option value="language4" data-option-template='<span class="d-flex align-items-center"><img class="avatar avatar-xss avatar-circle me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/flag-icon-css/flags/1x1/dk.svg" alt="Image description" width="16"/><span>Dansk</span></span>'>Dansk</option>
                                                        <option value="language5" data-option-template='<span class="d-flex align-items-center"><img class="avatar avatar-xss avatar-circle me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/flag-icon-css/flags/1x1/es.svg" alt="Image description" width="16"/><span>Español</span></span>'>Español</option>
                                                        <option value="language6" data-option-template='<span class="d-flex align-items-center"><img class="avatar avatar-xss avatar-circle me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/flag-icon-css/flags/1x1/nl.svg" alt="Image description" width="16"/><span>Nederlands</span></span>'>Nederlands</option>
                                                        <option value="language7" data-option-template='<span class="d-flex align-items-center"><img class="avatar avatar-xss avatar-circle me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/flag-icon-css/flags/1x1/it.svg" alt="Image description" width="16"/><span>Italiano</span></span>'>Italiano</option>
                                                        <option value="language8" data-option-template='<span class="d-flex align-items-center"><img class="avatar avatar-xss avatar-circle me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/flag-icon-css/flags/1x1/cn.svg" alt="Image description" width="16"/><span>中文 (繁體)</span></span>'>中文 (繁體)</option>
                                                    </select>
                                                </div>
                                                <!-- End Select -->
                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="timeZoneLabel" class="col-sm-3 col-form-label form-label">Time zone</label>

                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="currentPassword" id="timeZoneLabel" placeholder="Your time zone" aria-label="Your time zone" value="GMT+01:00" readonly>
                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <!-- Form Switch -->
                                        <label class="row form-check form-switch mb-4" for="accounrSettingsPreferencesSwitch1">
                                            <span class="col-8 col-sm-9 ms-0">
                                                <span class="d-block text-dark">Early release</span>
                                                <span class="d-block fs-5">Get included on early releases for new Front features.</span>
                                            </span>
                                            <span class="col-4 col-sm-3 text-end">
                                                <input type="checkbox" class="form-check-input" id="accounrSettingsPreferencesSwitch1">
                                            </span>
                                        </label>
                                        <!-- End Form Switch -->

                                        <!-- Form Switch -->
                                        <label class="row form-check form-switch mb-4" for="accounrSettingsPreferencesSwitch2">
                                            <span class="col-8 col-sm-9 ms-0">
                                                <span class="d-block text-dark mb-1">See info about people who view my profile</span>
                                                <span class="d-block fs-5 text-muted"><a class="link" href="#">More about viewer info</a>.</span>
                                            </span>
                                            <span class="col-4 col-sm-3 text-end">
                                                <input type="checkbox" class="form-check-input" id="accounrSettingsPreferencesSwitch2" checked>
                                            </span>
                                        </label>
                                        <!-- End Form Switch -->

                                        <div class="d-flex justify-content-end">
                                            <button type="submit" class="btn btn-primary">Save Changes</button>
                                        </div>
                                    </form>
                                    <!-- End Form -->
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div id="twoStepVerificationSection" class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="mb-0">Two-step verification</h4>
                                        <span class="badge bg-soft-danger text-danger ms-2">Disabled</span>
                                    </div>
                                </div>

                                <!-- Body -->
                                <div class="card-body">
                                    <p class="card-text">Start by entering your password so that we know it's you. Then we'll walk you through two more simple steps.</p>

                                    <form>
                                        <!-- Form -->
                                        <div class="row mb-4">
                                            <label for="accountPasswordLabel" class="col-sm-3 col-form-label form-label">Account password</label>

                                            <div class="col-sm-9">
                                                <input type="password" class="form-control" name="currentPassword" id="accountPasswordLabel" placeholder="Enter current password" aria-label="Enter current password">
                                                <small class="form-text">This is the password you use to log in to your Front account.</small>
                                            </div>
                                        </div>
                                        <!-- End Form -->

                                        <div class="d-flex justify-content-end">
                                            <button type="submit" class="btn btn-primary">Set up</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div id="recentDevicesSection" class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Recent devices</h4>
                                </div>

                                <!-- Body -->
                                <div class="card-body">
                                    <p class="card-text">View and manage devices where you're currently logged in.</p>
                                </div>
                                <!-- End Body -->

                                <!-- Table -->
                                <div class="table-responsive">
                                    <table class="table table-thead-bordered table-nowrap table-align-middle card-table">
                                        <thead class="thead-light">
                                            <tr>
                                                <th>Browser</th>
                                                <th>Device</th>
                                                <th>Location</th>
                                                <th>Most recent activity</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td class="align-items-center">
                                                    <img class="avatar avatar-xss me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/chrome-icon.svg" alt="Image Description"> Chrome on Windows
                                                </td>
                                                <td><i class="bi-laptop fs-3 me-2"></i> Dell XPS 15 <span class="badge bg-soft-success text-success ms-1">Current</span></td>
                                                <td>London, UK</td>
                                                <td>Now</td>
                                            </tr>

                                            <tr>
                                                <td class="align-items-center">
                                                    <img class="avatar avatar-xss me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/chrome-icon.svg" alt="Image Description"> Chrome on Android
                                                </td>
                                                <td><i class="bi-phone fs-3 me-2"></i> Google Pixel 3a</td>
                                                <td>London, UK</td>
                                                <td>15, August 2020 15:08</td>
                                            </tr>

                                            <tr>
                                                <td class="align-items-center">
                                                    <img class="avatar avatar-xss me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/chrome-icon.svg" alt="Image Description"> Chrome on Windows
                                                </td>
                                                <td><i class="bi-display fs-3 me-2"></i> Microsoft Studio 2</td>
                                                <td>London, UK</td>
                                                <td>12, August 2020 20:07</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End Table -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div id="notificationsSection" class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Notifications</h4>
                                </div>

                                <!-- Alert -->
                                <div class="alert alert-soft-dark card-alert text-center" role="alert">
                                    We need permission from your browser to show notifications. <a class="alert-link" href="#">Request permission</a>
                                </div>
                                <!-- End Alert -->

                                <form>
                                    <!-- Table -->
                                    <div class="table-responsive datatable-custom">
                                        <table class="table table-thead-bordered table-nowrap table-align-middle table-first-col-px-0">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>Type</th>
                                                    <th class="text-center">
                                                        <div class="mb-1">
                                                            <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-email-at.svg" alt="Image Description" data-hs-theme-appearance="default">
                                                            <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations-light/oc-email-at.svg" alt="Image Description" data-hs-theme-appearance="dark">
                                                        </div>
                                                        Email
                                                    </th>
                                                    <th class="text-center">
                                                        <div class="mb-1">
                                                            <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-globe.svg" alt="Image Description" data-hs-theme-appearance="default">
                                                            <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations-light/oc-globe.svg" alt="Image Description" data-hs-theme-appearance="dark">
                                                        </div>
                                                        Browser
                                                    </th>
                                                    <th class="text-center">
                                                        <div class="mb-1">
                                                            <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-phone.svg" alt="Image Description" data-hs-theme-appearance="default">
                                                            <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations-light/oc-phone.svg" alt="Image Description" data-hs-theme-appearance="dark">
                                                        </div>
                                                        App
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <td>New for you</td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox1">
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox1"></label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox2">
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox2"></label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox3">
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox3"></label>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>Account activity <i class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Get important notifications about you or activity you've missed"></i></td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox4">
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox4"></label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox5" checked>
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox5"></label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox6" checked>
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox6"></label>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>A new browser used to sign in</td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox7" checked>
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox7"></label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox8" checked>
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox8"></label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox9" checked>
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox9"></label>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>A new device is linked</td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox10">
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox10"></label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox11" checked>
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox11"></label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox12">
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox12"></label>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>A new device connected <i class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Email me when a new device connected"></i></td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox13">
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox13"></label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox14" checked>
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox14"></label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="checkbox" value="" id="editUserModalAlertsCheckbox15" checked>
                                                            <label class="form-check-label" for="editUserModalAlertsCheckbox15"></label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- End Table -->
                                </form>

                                <hr>

                                <!-- Body -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm">
                                            <!-- Form -->
                                            <div class="mb-4">
                                                <p class="card-text">When should we send you notifications?</p>

                                                <!-- Select -->
                                                <div class="tom-select-custom">
                                                    <select class="js-select form-select" autocomplete="off" data-hs-tom-select-options='{
                                                            "searchInDropdown": false,
                                                            "width": "15rem",
                                                            "hideSearch": true
                                                            }'>
                                                        <option value="whenToSendNotification1">Always</option>
                                                        <option value="whenToSendNotification2">Only when I'm online</option>
                                                    </select>
                                                </div>
                                                <!-- End Select -->
                                            </div>
                                            <!-- End Form -->
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-sm">
                                            <!-- Form -->
                                            <div class="mb-4">
                                                <p class="card-text">Send me a daily summary ("Daily Digest") of task activity.</p>

                                                <div class="row">
                                                    <div class="col-auto mb-2">
                                                        <!-- Select -->
                                                        <div class="tom-select-custom">
                                                            <select class="js-select form-select" autocomplete="off" data-hs-tom-select-options='{
                                                                    "searchInDropdown": false,
                                                                    "hideSearch": true,
                                                                    "dropdownWidth": "10rem"
                                                                    }'>
                                                                <option value="EveryDay">Every day</option>
                                                                <option value="weekdays" selected>Weekdays</option>
                                                                <option value="Never">Never</option>
                                                            </select>
                                                        </div>
                                                        <!-- End Select -->
                                                    </div>
                                                    <!-- End Col -->

                                                    <div class="col-auto mb-2">
                                                        <!-- Select -->
                                                        <div class="tom-select-custom">
                                                            <select class="js-select form-select" autocomplete="off" data-hs-tom-select-options='{
                                                                    "searchInDropdown": false,
                                                                    "hideSearch": true,
                                                                    "dropdownWidth": "10rem"
                                                                    }'>
                                                                <option value="0">at 12 AM</option>
                                                                <option value="1">at 1 AM</option>
                                                                <option value="2">at 2 AM</option>
                                                                <option value="3">at 3 AM</option>
                                                                <option value="4">at 4 AM</option>
                                                                <option value="5">at 5 AM</option>
                                                                <option value="6">at 6 AM</option>
                                                                <option value="7">at 7 AM</option>
                                                                <option value="8">at 8 AM</option>
                                                                <option value="9" selected>at 9 AM</option>
                                                                <option value="10">at 10 AM</option>
                                                                <option value="11">at 11 AM</option>
                                                                <option value="12">at 12 PM</option>
                                                                <option value="13">at 1 PM</option>
                                                                <option value="14">at 2 PM</option>
                                                                <option value="15">at 3 PM</option>
                                                                <option value="16">at 4 PM</option>
                                                                <option value="17">at 5 PM</option>
                                                                <option value="18">at 6 PM</option>
                                                                <option value="19">at 7 PM</option>
                                                                <option value="20">at 8 PM</option>
                                                                <option value="21">at 9 PM</option>
                                                                <option value="22">at 10 PM</option>
                                                                <option value="23">at 11 PM</option>
                                                            </select>
                                                        </div>
                                                        <!-- End Select -->
                                                    </div>
                                                    <!-- End Col -->
                                                </div>
                                                <!-- End Row -->
                                            </div>
                                            <!-- End Form -->
                                        </div>
                                        <!-- End Col -->
                                    </div>
                                    <!-- End Row -->

                                    <p class="card-text">In order to cut back on noise, email notifications are grouped together and only sent when you're idle or offline.</p>

                                    <div class="d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div id="connectedAccountsSection" class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Connected accounts</h4>
                                </div>

                                <!-- Body -->
                                <div class="card-body">
                                    <p class="card-text">Integrated features from these accounts make it easier to collaborate with people you know on Front Dashboard.</p>

                                    <!-- Form -->
                                    <form>
                                        <div class="list-group list-group-lg list-group-flush list-group-no-gutters">
                                            <!-- List Item -->
                                            <div class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/google-icon.svg" alt="Image Description">
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <div class="row align-items-center">
                                                            <div class="col">
                                                                <h4 class="mb-0">Google</h4>
                                                                <p class="fs-5 text-body mb-0">Calendar and contacts</p>
                                                            </div>
                                                            <!-- End Col -->

                                                            <div class="col-auto">
                                                                <!-- Form Switch -->
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="connectedAccounts1">
                                                                    <label class="form-check-label" for="connectedAccounts1"></label>
                                                                </div>
                                                                <!-- End Form Switch -->
                                                            </div>
                                                            <!-- End Col -->
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End List Item -->

                                            <!-- List Item -->
                                            <div class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/spec-icon.svg" alt="Image Description">
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <div class="row align-items-center">
                                                            <div class="col">
                                                                <h4 class="mb-0">Spec</h4>
                                                                <p class="fs-5 text-body mb-0">Project management</p>
                                                            </div>
                                                            <!-- End Col -->

                                                            <div class="col-auto">
                                                                <!-- Form Switch -->
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="connectedAccounts2">
                                                                    <label class="form-check-label" for="connectedAccounts2"></label>
                                                                </div>
                                                                <!-- End Form Switch -->
                                                            </div>
                                                            <!-- End Col -->
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End List Item -->

                                            <!-- List Item -->
                                            <div class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/slack-icon.svg" alt="Image Description">
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <div class="row align-items-center">
                                                            <div class="col">
                                                                <h4 class="mb-0">Slack</h4>
                                                                <p class="fs-5 text-body mb-0">Communication <a class="link" href="#">Learn more</a></p>
                                                            </div>
                                                            <!-- End Col -->

                                                            <div class="col-auto">
                                                                <!-- Form Switch -->
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="connectedAccounts3" checked>
                                                                    <label class="form-check-label" for="connectedAccounts3"></label>
                                                                </div>
                                                                <!-- End Form Switch -->
                                                            </div>
                                                            <!-- End Col -->
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End List Item -->

                                            <!-- List Item -->
                                            <div class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mailchimp-icon.svg" alt="Image Description">
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <div class="row align-items-center">
                                                            <div class="col">
                                                                <h4 class="mb-0">Mailchimp</h4>
                                                                <p class="fs-5 text-body mb-0">Email marketing service</p>
                                                            </div>
                                                            <!-- End Col -->

                                                            <div class="col-auto">
                                                                <!-- Form Switch -->
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="connectedAccounts4" checked>
                                                                    <label class="form-check-label" for="connectedAccounts4"></label>
                                                                </div>
                                                                <!-- End Form Switch -->
                                                            </div>
                                                            <!-- End Col -->
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End List Item -->

                                            <!-- List Item -->
                                            <div class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/google-webdev-icon.svg" alt="Image Description">
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <div class="row align-items-center">
                                                            <div class="col">
                                                                <h4 class="mb-0">Google Webdev</h4>
                                                                <p class="fs-5 text-body mb-0">Tools for Web Developers <a class="link" href="#">Learn more</a></p>
                                                            </div>
                                                            <!-- End Col -->

                                                            <div class="col-auto">
                                                                <!-- Form Switch -->
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="connectedAccounts5">
                                                                    <label class="form-check-label" for="connectedAccounts5"></label>
                                                                </div>
                                                                <!-- End Form Switch -->
                                                            </div>
                                                            <!-- End Col -->
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End List Item -->
                                        </div>
                                    </form>
                                    <!-- End Form -->
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div id="socialAccountsSection" class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Social accounts</h4>
                                </div>

                                <!-- Body -->
                                <div class="card-body">
                                    <form>
                                        <div class="list-group list-group-lg list-group-flush list-group-no-gutters">
                                            <!-- Item -->
                                            <div class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <i class="bi-twitter list-group-icon"></i>
                                                    </div>

                                                    <div class="flex-grow-1">
                                                        <div class="row align-items-center">
                                                            <div class="col-sm mb-2 mb-sm-0">
                                                                <h4 class="mb-0">Twitter</h4>
                                                                <a class="fs-5" href="#">www.twitter.com/htmlstream</a>
                                                            </div>
                                                            <!-- End Col -->

                                                            <div class="col-sm-auto">
                                                                <a class="btn btn-white btn-sm" href="javascript:;">Disconnect</a>
                                                            </div>
                                                            <!-- End Col -->
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Item -->

                                            <!-- Item -->
                                            <div class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <i class="bi-facebook list-group-icon"></i>
                                                    </div>

                                                    <div class="flex-grow-1">
                                                        <div class="row align-items-center">
                                                            <div class="col-sm mb-2 mb-sm-0">
                                                                <h4 class="mb-0">Facebook</h4>
                                                                <a class="fs-5" href="#">www.facebook.com/htmlstream</a>
                                                            </div>
                                                            <!-- End Col -->

                                                            <div class="col-sm-auto">
                                                                <a class="btn btn-white btn-sm" href="javascript:;">Disconnect</a>
                                                            </div>
                                                            <!-- End Col -->
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Item -->

                                            <!-- Item -->
                                            <div class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <i class="bi-slack list-group-icon"></i>
                                                    </div>

                                                    <div class="flex-grow-1">
                                                        <div class="row align-items-center">
                                                            <div class="col-sm mb-2 mb-sm-0">
                                                                <h4 class="mb-0">Slack</h4>
                                                                <p class="fs-5 text-body mb-0">Not connected</p>
                                                            </div>
                                                            <!-- End Col -->

                                                            <div class="col-sm-auto">
                                                                <a class="btn btn-white btn-sm" href="javascript:;">Connect</a>
                                                            </div>
                                                            <!-- End Col -->
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Item -->

                                            <!-- Item -->
                                            <div class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <i class="bi-linkedin list-group-icon"></i>
                                                    </div>

                                                    <div class="flex-grow-1">
                                                        <div class="row align-items-center">
                                                            <div class="col-sm mb-2 mb-sm-0">
                                                                <h4 class="mb-0">Linkedin</h4>
                                                                <a class="fs-5" href="#">www.linkedin.com/htmlstream</a>
                                                            </div>
                                                            <!-- End Col -->

                                                            <div class="col-sm-auto">
                                                                <a class="btn btn-white btn-sm" href="javascript:;">Disconnect</a>
                                                            </div>
                                                            <!-- End Col -->
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Item -->

                                            <!-- Item -->
                                            <div class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <i class="bi-google list-group-icon"></i>
                                                    </div>

                                                    <div class="flex-grow-1">
                                                        <div class="row align-items-center">
                                                            <div class="col-sm mb-2 mb-sm-0">
                                                                <h4 class="mb-0">Google</h4>
                                                                <p class="fs-5 text-body mb-0">Not connected</p>
                                                            </div>
                                                            <!-- End Col -->

                                                            <div class="col-sm-auto">
                                                                <a class="btn btn-white btn-sm" href="javascript:;">Connect</a>
                                                            </div>
                                                            <!-- End Col -->
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Item -->
                                        </div>
                                    </form>
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div id="deleteAccountSection" class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Delete your account</h4>
                                </div>

                                <!-- Body -->
                                <div class="card-body">
                                    <p class="card-text">When you delete your account, you lose access to Front account services, and we permanently delete your personal data. You can cancel the deletion for 14 days.</p>

                                    <div class="mb-4">
                                        <!-- Form Check -->
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="deleteAccountCheckbox">
                                            <label class="form-check-label" for="deleteAccountCheckbox">
                                                Confirm that I want to delete my account.
                                            </label>
                                        </div>
                                        <!-- End Form Check -->
                                    </div>

                                    <div class="d-flex justify-content-end gap-3">
                                        <a class="btn btn-white" href="#">Learn more</a>
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </div>
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->
                        </div>

                        <!-- Sticky Block End Point -->
                        <div id="stickyBlockEndPoint"></div>
                    </div>
                </div>
                <!-- End Row -->
            </div>
            <!-- End Content -->

            <!-- Footer -->

            <div class="footer">
                <div class="row justify-content-between align-items-center">
                    <div class="col">
                        <p class="fs-6 mb-0">&copy; Front. <span class="d-none d-sm-inline-block">2022 Htmlstream.</span></p>
                    </div>
                    <!-- End Col -->

                    <div class="col-auto">
                        <div class="d-flex justify-content-end">
                            <!-- List Separator -->
                            <ul class="list-inline list-separator">
                                <li class="list-inline-item">
                                    <a class="list-separator-link" href="#">FAQ</a>
                                </li>

                                <li class="list-inline-item">
                                    <a class="list-separator-link" href="#">License</a>
                                </li>

                                <li class="list-inline-item">
                                    <!-- Keyboard Shortcuts Toggle -->
                                    <button class="btn btn-ghost-secondary btn btn-icon btn-ghost-secondary rounded-circle" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasKeyboardShortcuts" aria-controls="offcanvasKeyboardShortcuts">
                                        <i class="bi-command"></i>
                                    </button>
                                    <!-- End Keyboard Shortcuts Toggle -->
                                </li>
                            </ul>
                            <!-- End List Separator -->
                        </div>
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
            </div>

            <!-- End Footer -->
        </main>
        <!-- ========== END MAIN CONTENT ========== -->

        <!-- ========== SECONDARY CONTENTS ========== -->
        <!-- Keyboard Shortcuts -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasKeyboardShortcuts" aria-labelledby="offcanvasKeyboardShortcutsLabel">
            <div class="offcanvas-header">
                <h4 id="offcanvasKeyboardShortcutsLabel" class="mb-0">Keyboard shortcuts</h4>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                    <div class="list-group-item">
                        <h5 class="mb-1">Formatting</h5>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span class="fw-semibold">Bold</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">b</kbd>
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <em>italic</em>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">i</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <u>Underline</u>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">u</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <s>Strikethrough</s>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Alt</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">s</kbd>
                                <!-- End Col -->
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span class="small">Small text</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">s</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <mark>Highlight</mark>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">e</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                </div>

                <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                    <div class="list-group-item">
                        <h5 class="mb-1">Insert</h5>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Mention person <a href="#">(@Brian)</a></span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">@</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Link to doc <a href="#">(+Meeting notes)</a></span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">+</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <a href="#">#hashtag</a>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">#hashtag</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Date</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">/date</kbd>
                                <kbd class="d-inline-block mb-1">Space</kbd>
                                <kbd class="d-inline-block mb-1">/datetime</kbd>
                                <kbd class="d-inline-block mb-1">/datetime</kbd>
                                <kbd class="d-inline-block mb-1">Space</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Time</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">/time</kbd>
                                <kbd class="d-inline-block mb-1">Space</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Note box</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">/note</kbd>
                                <kbd class="d-inline-block mb-1">Enter</kbd>
                                <kbd class="d-inline-block mb-1">/note red</kbd>
                                <kbd class="d-inline-block mb-1">/note red</kbd>
                                <kbd class="d-inline-block mb-1">Enter</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                </div>

                <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                    <div class="list-group-item">
                        <h5 class="mb-1">Editing</h5>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Find and replace</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">r</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Find next</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">n</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Find previous</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">p</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Indent</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Tab</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Un-indent</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Tab</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Move line up</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1"><i class="bi-arrow-up-short"></i></kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Move line down</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1"><i class="bi-arrow-down-short fs-5"></i></kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Add a comment</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Alt</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">m</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Undo</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">z</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Redo</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">y</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                </div>

                <div class="list-group list-group-sm list-group-flush list-group-no-gutters">
                    <div class="list-group-item">
                        <h5 class="mb-1">Application</h5>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Create new doc</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Alt</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">n</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Present</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">p</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Share</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">s</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Search docs</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">o</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Keyboard shortcuts</span>
                            </div>
                            <!-- End Col -->

                            <div class="col-7 text-end">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">/</kbd>
                            </div>
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>

                </div>
            </div>
        </div>
        <!-- End Keyboard Shortcuts -->

        <!-- Activity -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasActivityStream" aria-labelledby="offcanvasActivityStreamLabel">
            <div class="offcanvas-header">
                <h4 id="offcanvasActivityStreamLabel" class="mb-0">Activity stream</h4>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <!-- Step -->
                <ul class="step step-icon-sm step-avatar-sm">
                    <!-- Step Item -->
                    <li class="step-item">
                        <div class="step-content-wrapper">
                            <div class="step-avatar">
                                <img class="step-avatar" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img9.jpg" alt="Image Description">
                            </div>

                            <div class="step-content">
                                <h5 class="mb-1">Iana Robinson</h5>

                                <p class="fs-5 mb-1">Added 2 files to task <a class="text-uppercase" href="#"><i class="bi-journal-bookmark-fill"></i> Fd-7</a></p>

                                <ul class="list-group list-group-sm">
                                    <!-- List Item -->
                                    <li class="list-group-item list-group-item-light">
                                        <div class="row gx-1">
                                            <div class="col-6">
                                                <!-- Media -->
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                    </div>
                                                    <div class="flex-grow-1 text-truncate ms-2">
                                                        <span class="d-block fs-6 text-dark text-truncate" title="weekly-reports.xls">weekly-reports.xls</span>
                                                        <span class="d-block small text-muted">12kb</span>
                                                    </div>
                                                </div>
                                                <!-- End Media -->
                                            </div>
                                            <!-- End Col -->

                                            <div class="col-6">
                                                <!-- Media -->
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/word-icon.svg" alt="Image Description">
                                                    </div>
                                                    <div class="flex-grow-1 text-truncate ms-2">
                                                        <span class="d-block fs-6 text-dark text-truncate" title="weekly-reports.xls">weekly-reports.xls</span>
                                                        <span class="d-block small text-muted">4kb</span>
                                                    </div>
                                                </div>
                                                <!-- End Media -->
                                            </div>
                                            <!-- End Col -->
                                        </div>
                                        <!-- End Row -->
                                    </li>
                                    <!-- End List Item -->
                                </ul>

                                <span class="small text-muted text-uppercase">Now</span>
                            </div>
                        </div>
                    </li>
                    <!-- End Step Item -->

                    <!-- Step Item -->
                    <li class="step-item">
                        <div class="step-content-wrapper">
                            <span class="step-icon step-icon-soft-dark">B</span>

                            <div class="step-content">
                                <h5 class="mb-1">Bob Dean</h5>

                                <p class="fs-5 mb-1">Marked <a class="text-uppercase" href="#"><i class="bi-journal-bookmark-fill"></i> Fr-6</a> as <span class="badge bg-soft-success text-success rounded-pill"><span class="legend-indicator bg-success"></span>"Completed"</span></p>

                                <span class="small text-muted text-uppercase">Today</span>
                            </div>
                        </div>
                    </li>
                    <!-- End Step Item -->

                    <!-- Step Item -->
                    <li class="step-item">
                        <div class="step-content-wrapper">
                            <div class="step-avatar">
                                <img class="step-avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img3.jpg" alt="Image Description">
                            </div>

                            <div class="step-content">
                                <h5 class="h5 mb-1">Crane</h5>

                                <p class="fs-5 mb-1">Added 5 card to <a href="#">Payments</a></p>

                                <ul class="list-group list-group-sm">
                                    <li class="list-group-item list-group-item-light">
                                        <div class="row gx-1">
                                            <div class="col">
                                                <img class="img-fluid rounded" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/card-1.svg" alt="Image Description">
                                            </div>
                                            <div class="col">
                                                <img class="img-fluid rounded" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/card-2.svg" alt="Image Description">
                                            </div>
                                            <div class="col">
                                                <img class="img-fluid rounded" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/card-3.svg" alt="Image Description">
                                            </div>
                                            <div class="col-auto align-self-center">
                                                <div class="text-center">
                                                    <a href="#">+2</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>

                                <span class="small text-muted text-uppercase">May 12</span>
                            </div>
                        </div>
                    </li>
                    <!-- End Step Item -->

                    <!-- Step Item -->
                    <li class="step-item">
                        <div class="step-content-wrapper">
                            <span class="step-icon step-icon-soft-info">D</span>

                            <div class="step-content">
                                <h5 class="mb-1">David Lidell</h5>

                                <p class="fs-5 mb-1">Added a new member to Front Dashboard</p>

                                <span class="small text-muted text-uppercase">May 15</span>
                            </div>
                        </div>
                    </li>
                    <!-- End Step Item -->

                    <!-- Step Item -->
                    <li class="step-item">
                        <div class="step-content-wrapper">
                            <div class="step-avatar">
                                <img class="step-avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img7.jpg" alt="Image Description">
                            </div>

                            <div class="step-content">
                                <h5 class="mb-1">Rachel King</h5>

                                <p class="fs-5 mb-1">Marked <a class="text-uppercase" href="#"><i class="bi-journal-bookmark-fill"></i> Fr-3</a> as <span class="badge bg-soft-success text-success rounded-pill"><span class="legend-indicator bg-success"></span>"Completed"</span></p>

                                <span class="small text-muted text-uppercase">Apr 29</span>
                            </div>
                        </div>
                    </li>
                    <!-- End Step Item -->

                    <!-- Step Item -->
                    <li class="step-item">
                        <div class="step-content-wrapper">
                            <div class="step-avatar">
                                <img class="step-avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img5.jpg" alt="Image Description">
                            </div>

                            <div class="step-content">
                                <h5 class="mb-1">Finch Hoot</h5>

                                <p class="fs-5 mb-1">Earned a "Top endorsed" <i class="bi-patch-check-fill text-primary"></i> badge</p>

                                <span class="small text-muted text-uppercase">Apr 06</span>
                            </div>
                        </div>
                    </li>
                    <!-- End Step Item -->

                    <!-- Step Item -->
                    <li class="step-item">
                        <div class="step-content-wrapper">
                            <span class="step-icon step-icon-soft-primary">
                                <i class="bi-person-fill"></i>
                            </span>

                            <div class="step-content">
                                <h5 class="mb-1">Project status updated</h5>

                                <p class="fs-5 mb-1">Marked <a class="text-uppercase" href="#"><i class="bi-journal-bookmark-fill"></i> Fr-3</a> as <span class="badge bg-soft-primary text-primary rounded-pill"><span class="legend-indicator bg-primary"></span>"In progress"</span></p>

                                <span class="small text-muted text-uppercase">Feb 10</span>
                            </div>
                        </div>
                    </li>
                    <!-- End Step Item -->
                </ul>
                <!-- End Step -->

                <div class="d-grid">
                    <a class="btn btn-white" href="javascript:;">View all <i class="bi-chevron-right"></i></a>
                </div>
            </div>
        </div>
        <!-- End Activity -->

        <!-- Welcome Message Modal -->
        <div class="modal fade" id="welcomeMessageModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Header -->
                    <div class="modal-close">
                        <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm" data-bs-dismiss="modal" aria-label="Close">
                            <i class="bi-x-lg"></i>
                        </button>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="modal-body p-sm-5">
                        <div class="text-center">
                            <div class="w-75 w-sm-50 mx-auto mb-4">
                                <img class="img-fluid" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-collaboration.svg" alt="Image Description" data-hs-theme-appearance="default">
                                <img class="img-fluid" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations-light/oc-collaboration.svg" alt="Image Description" data-hs-theme-appearance="dark">
                            </div>

                            <h4 class="h1">Welcome to Front</h4>

                            <p>We're happy to see you in our community.</p>
                        </div>
                    </div>
                    <!-- End Body -->

                    <!-- Footer -->
                    <div class="modal-footer d-block text-center py-sm-5">
                        <small class="text-cap text-muted">Trusted by the world's best teams</small>

                        <div class="w-85 mx-auto">
                            <div class="row justify-content-between">
                                <div class="col">
                                    <img class="img-fluid" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/gitlab-gray.svg" alt="Image Description">
                                </div>
                                <div class="col">
                                    <img class="img-fluid" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/fitbit-gray.svg" alt="Image Description">
                                </div>
                                <div class="col">
                                    <img class="img-fluid" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/flow-xo-gray.svg" alt="Image Description">
                                </div>
                                <div class="col">
                                    <img class="img-fluid" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/layar-gray.svg" alt="Image Description">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Footer -->
                </div>
            </div>
        </div>

        <!-- End Welcome Message Modal -->
        <!-- ========== END SECONDARY CONTENTS ========== -->

        <!-- JS Global Compulsory @@deleteLine:build -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery/dist/jquery.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery-migrate/dist/jquery-migrate.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JS Implementing Plugins -->
        <!-- bundlejs:vendor [https://d24ouiz0dt1p4y.cloudfront.net] -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-navbar-vertical-aside/dist/hs-navbar-vertical-aside.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-form-search/dist/hs-form-search.min.js"></script>

        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-nav-scroller/dist/hs-nav-scroller.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-sticky-block/dist/hs-sticky-block.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-file-attach/dist/hs-file-attach.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/js/tom-select.complete.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-scrollspy/dist/hs-scrollspy.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/imask/dist/imask.min.js"></script>
    </body>
</html>
