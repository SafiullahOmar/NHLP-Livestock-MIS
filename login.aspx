<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<html lang="en" data-textdirection="LTR" class="loading">

<!-- Mirrored from pixinvent.com/bootstrap-admin-template/robust/html/ltr/horizontal-menu-template/login-with-bg.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 27 Jan 2018 05:31:44 GMT -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Robust admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, robust admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Login with LiveStock-MIS</title>
    <link rel="apple-touch-icon" sizes="60x60" href="app-assets/images/ico/apple-icon-60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="app-assets/images/ico/apple-icon-76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="app-assets/images/ico/apple-icon-120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="app-assets/images/ico/apple-icon-152.png">
    <link rel="shortcut icon" type="image/x-icon" href="https://pixinvent.com/bootstrap-admin-template/robust/app-assets/images/ico/favicon.ico">
    <link rel="shortcut icon" type="image/png" href="app-assets/images/ico/favicon-32.png">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <!-- BEGIN VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap.min.css">    <!-- font icons-->
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/icheck/icheck.css">
    <%--<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/icheck/custom.css">--%>
    <!-- END VENDOR CSS-->
    <!-- BEGIN ROBUST CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap-extended.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/app.min.css">
    <%--<link rel="stylesheet" type="text/css" href="app-assets/css/colors.min.css">--%>
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <!-- END ROBUST CSS-->

    <!-- BEGIN Custom CSS-->
    <%--   <link rel="stylesheet" type="text/css" href="assets/css/style.css">--%>
    <!-- END Custom CSS-->
</head>
<body data-open="hover" data-menu="horizontal-menu" data-col="1-column" class="horizontal-layout horizontal-menu 1-column bg-cyan bg-lighten-2 blank-page blank-page">
    <!-- ////////////////////////////////////////////////////////////////////////////-->
   
      <form runat="server">
        <div class="app-content container center-layout mt-2">
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <section class="flexbox-container">
                        <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1 box-shadow-2 p-0">
                            <div class="card border-grey border-lighten-3 m-0">
                                <div class="card-header no-border">
                                    <div class="card-title font-medium-3 text-xs-center">
                                        <div class="p-1">
                                            LiveStock-MIS
                                        </div>
                                    </div>

                                </div>
                                <div class="card-body collapse in">

                                    <p class="card-subtitle line-on-side text-muted text-xs-center font-small-3 mx-2"><span>Using Account Details</span></p>
                                    <div class="card-block pt-0">

                                        <asp:Login ID="Login1" FailureTextStyle-ForeColor="Red" runat="server" Width="100%">
                                            <LayoutTemplate>

                                                <asp:Label ID="FailureText" runat="server" Font-Size="13.5px" CssClass="label label-danger" EnableViewState="false"></asp:Label>


                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName"></asp:Label>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ToolTip="User Name is required." ValidationGroup="Login1"></asp:RequiredFieldValidator>
                                                <fieldset class="form-group has-feedback has-icon-left mb-0">
                                                    <asp:TextBox ID="UserName" placeholder="Your Name" class="form-control form-control-lg input-lg" runat="server"></asp:TextBox>

                                                </fieldset>

                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password"></asp:Label>
                                                <asp:RequiredFieldValidator Display="Static" ID="PasswordRequired" runat="server" ControlToValidate="Password" ToolTip="Password is required." ValidationGroup="Login1"></asp:RequiredFieldValidator>
                                                <fieldset class="form-group has-feedback has-icon-left">
                                                    <asp:TextBox ID="Password" placeholder="Enter Password" class="form-control form-control-lg input-lg" runat="server" TextMode="Password"></asp:TextBox>

                                                </fieldset>


                                                <fieldset class="form-group row">
                                                    <div class="col-md-6 col-xs-12 text-xs-center text-md-left">

                                                        <fieldset>
                                                            <input type="checkbox" id="remember-me" class="chk-remember">
                                                            <label for="remember-me">Remember Me</label>
                                                        </fieldset>

                                                    </div>

                                                </fieldset>

                                                <asp:LinkButton ID="LoginButton" ValidationGroup="Login1" class="btn btn-primary btn-lg btn-block" CommandName="Login" runat="server"> Login <i class="icon-unlock2"></i> </asp:LinkButton>

                                            </LayoutTemplate>
                                        </asp:Login>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </div>
        </div>
    </form>
    <!-- ////////////////////////////////////////////////////////////////////////////-->

    <!-- BEGIN VENDOR JS-->
    <!-- build:js app-assets/js/vendors.min.js-->
    <script src="app-assets/js/core/libraries/jquery.min.js" type="text/javascript"></script>
    <script src="app-assets/js/core/libraries/bootstrap.min.js" type="text/javascript"></script>

    <!-- /build-->
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->

    <script src="app-assets/vendors/js/forms/icheck/icheck.min.js" type="text/javascript"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN ROBUST JS-->
    <!-- build:js app-assets/js/app.min.js-->

    <!-- /build-->
    <!-- END ROBUST JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="app-assets/js/scripts/forms/form-login-register.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL JS-->

</body>


</html>
