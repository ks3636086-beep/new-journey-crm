<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee_Login.aspx.cs" Inherits="Employee_Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Employee Login | New Journey Holidays</title>

    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />

    <!-- Bootstrap 5.3.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons 1.11.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <!-- Employee Theme CSS -->
    <link href="css/employee-style.css?v=20261112e" rel="stylesheet" />

    <style>
        * {
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background: radial-gradient(circle at 10% 20%, rgba(2, 132, 199, 0.08) 0%, transparent 45%),
                        radial-gradient(circle at 90% 80%, rgba(11, 37, 69, 0.1) 0%, transparent 45%),
                        #f1f5f9;
        }

        .login-viewport {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
        }

        /* Modern Centered Split Card */
        .login-card {
            width: 100%;
            max-width: 860px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(11, 37, 69, 0.12), 0 5px 15px rgba(0, 0, 0, 0.04);
            overflow: hidden;
            border: 1px solid rgba(226, 232, 240, 0.8);
        }

        /* Left Side: Ocean Blue Welcome Overlay */
        .welcome-panel {
            background: linear-gradient(135deg, #0284c7 0%, #0369a1 45%, #0b2545 100%);
            color: #ffffff;
            padding: 3.5rem 2.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
        }

        .welcome-logo {
            width: 64px;
            height: 64px;
            background: #ffffff;
            border-radius: 50%;
            padding: 3px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.25);
            margin-bottom: 1.5rem;
            object-fit: contain;
        }

        .welcome-title {
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: -0.02em;
            margin-bottom: 0.75rem;
            color: #ffffff;
        }

        .welcome-text {
            font-size: 0.9rem;
            line-height: 1.6;
            color: rgb(255 255 255);
            max-width: 290px;
            margin-bottom: 1.75rem;
        }

        .btn-outline-pill {
            border: 2px solid rgba(255, 255, 255, 0.9);
            color: #ffffff;
            background: transparent;
            border-radius: 50px;
            padding: 0.55rem 2.2rem;
            font-size: 0.825rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            text-decoration: none;
            transition: all 0.2s ease-in-out;
            display: inline-block;
            outline: none !important;
            box-shadow: none !important;
        }

        .btn-outline-pill:hover,
        .btn-outline-pill:focus,
        .btn-outline-pill:focus-visible,
        .btn-outline-pill:active {
            background: #ffffff;
            color: #0369a1;
            border-color: #ffffff;
            outline: none !important;
            box-shadow: none !important;
            transform: translateY(-1px);
        }

        /* Right Side: Clean Modern Form Panel */
        .form-panel {
            padding: 3.5rem 3rem;
            background: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-title {
            font-size: 1.85rem;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: -0.02em;
            text-align: center;
            margin-bottom: 0.25rem;
        }

        /* Role circles matching the f, G+, in from the reference */
        .role-circles {
            display: flex;
            justify-content: center;
            gap: 0.75rem;
            margin: 1rem 0 0.75rem 0;
        }

        .role-circle-btn {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            border: 1px solid #e2e8f0;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #475569;
            background: #ffffff;
            font-size: 0.95rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
            transition: all 0.15s ease-in-out;
        }

        .role-circle-btn:hover {
            border-color: #0284c7;
            color: #0284c7;
            background: #e0f2fe;
            transform: translateY(-1px);
        }

        .form-subtitle {
            font-size: 0.775rem;
            color: #64748b;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        /* Soft Grey Filled Inputs (matching reference image) */
        .custom-input-group {
            background-color: #f1f5f9;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 0.25rem 0.5rem;
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            transition: all 0.2s ease-in-out;
        }

        .custom-input-group:focus-within {
            background-color: #ffffff;
            border-color: #0284c7;
            box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.18);
        }

        .custom-input-group .input-icon {
            color: #94a3b8;
            padding: 0 0.5rem;
            font-size: 1rem;
        }

        .custom-input-group .form-control {
            border: none;
            background: transparent;
            padding: 0.55rem 0.5rem;
            font-size: 0.875rem;
            color: #0f172a;
            box-shadow: none !important;
        }

        .custom-input-group .form-control::placeholder {
            color: #94a3b8;
            font-size: 0.85rem;
        }

        .custom-input-group .btn-eye {
            border: none;
            background: transparent;
            color: #94a3b8;
            padding: 0 0.5rem;
            cursor: pointer;
        }

        .custom-input-group .btn-eye:hover {
            color: #0284c7;
        }

        /* Submit Button: Rounded Pill (matching reference image) */
        .btn-nj-submit-pill {
            background-color: #0284c7;
            border: 2px solid #0284c7;
            color: #ffffff;
            border-radius: 10px;
            padding: 0.65rem 2.8rem;
            font-size: 0.85rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            cursor: pointer;
            transition: all 0.2s ease-in-out;
            box-shadow: 0 4px 14px rgba(2, 132, 199, 0.35);
        }

        .btn-nj-submit-pill:hover,
        .btn-nj-submit-pill:focus {
            background-color: #0369a1;
            border-color: #0369a1;
            color: #ffffff;
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(2, 132, 199, 0.45);
        }

        @media (max-width: 991.98px) {
            .welcome-panel {
                padding: 2.5rem 1.5rem;
            }

            .form-panel {
                padding: 2.5rem 1.5rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-viewport">
            <div class="login-card">
                <div class="row g-0 align-items-stretch">

                    <!-- ========================================== -->
                    <!-- Left Side: Welcome Panel (Matching Image)  -->
                    <!-- ========================================== -->
                    <div class="col-12 col-lg-5 welcome-panel">
                        <!-- Logo -->
                        <img src="images/logo.png" alt="New Journey Holidays" class="welcome-logo" />

                        <h2 class="welcome-title">Welcome Back!</h2>
                        <p class="welcome-text">
                            To keep connected with us please sign in with your employee credentials
                        </p>

                        <!-- Switch / Info Pill -->
                       <%-- <a href="../admin/Login.aspx" class="btn-outline-pill">
                            Admin Portal
                        </a>--%>

                        <div class="mt-4 pt-3 border-top border-white border-opacity-10 small text-white text-opacity-75">
                            <i class="bi bi-geo-alt-fill me-1 text-light"></i>New Journey Holidays &bull; Gorakhpur HQ
                        </div>
                    </div>

                    <!-- ========================================== -->
                    <!-- Right Side: Clean Form (Matching Image)   -->
                    <!-- ========================================== -->
                    <div class="col-12 col-lg-7 form-panel">
                        <h2 class="form-title">Staff Sign In</h2>

                        <!-- Role Circles (f, G+, in style from reference) -->
                        <div class="role-circles">
                            <span class="role-circle-btn" title="Sales Executive"><i class="bi bi-briefcase-fill"></i></span>
                            <span class="role-circle-btn" title="Calling Desk"><i class="bi bi-headset"></i></span>
                            <span class="role-circle-btn" title="Holiday Operations"><i class="bi bi-airplane-fill"></i></span>
                        </div>

                        <div class="form-subtitle">or use your assigned email / username</div>

                        <!-- 1. Email / Username Input -->
                        <div class="custom-input-group">
                            <span class="input-icon"><i class="bi bi-person"></i></span>
                            <asp:TextBox ID="txtLogin" runat="server"
                                ClientIDMode="Static"
                                CssClass="form-control"
                                placeholder="Username or Email"
                                autocomplete="username" />
                        </div>

                        <!-- 2. Password Input -->
                        <div class="custom-input-group">
                            <span class="input-icon"><i class="bi bi-lock"></i></span>
                            <asp:TextBox ID="txtPassword" runat="server"
                                ClientIDMode="Static"
                                CssClass="form-control"
                                TextMode="Password"
                                placeholder="Password"
                                autocomplete="current-password" />

                            <button class="btn-eye" type="button" onclick="togglePasswordVisibility('txtPassword', this);" title="Toggle password">
                                <i class="bi bi-eye"></i>
                            </button>
                        </div>

                        <!-- Remember Me & Forgot Password -->
                        <div class="d-flex justify-content-between align-items-center mb-4 px-1">
                            <div class="form-check mb-0">
                                <input class="form-check-input" type="checkbox" id="chkRememberMe" checked />
                                <label class="form-check-label small text-muted" for="chkRememberMe" style="font-size: 0.8rem;">
                                    Remember me
                                </label>
                            </div>
                            <span class="small text-muted" style="font-size: 0.8rem;">
                                Need help? Contact Admin
                            </span>
                        </div>

                        <!-- Submit Button: Centered Pill matching reference image -->
                        <div class="text-center mb-2">
                            <asp:Button ID="btnLogin" runat="server"
                                CssClass="btn-nj-submit-pill"
                                Text="Sign In"
                                OnClick="btnLogin_Click" />
                        </div>

                        <!-- Error Message Label -->
                        <asp:Label ID="lblMessage" runat="server"
                            CssClass="text-danger small text-center d-block mt-2" />
                    </div>

                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap 5.3.3 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function togglePasswordVisibility(fieldId, btn) {
            var field = document.getElementById(fieldId);
            var icon = btn.querySelector('i');
            if (field.type === 'password') {
                field.type = 'text';
                icon.className = 'bi bi-eye-slash';
            } else {
                field.type = 'password';
                icon.className = 'bi bi-eye';
            }
        }
    </script>
</body>
</html>
