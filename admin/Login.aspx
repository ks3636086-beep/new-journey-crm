<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

    <!DOCTYPE html>
    <html lang="en">

    <head runat="server">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Admin Login | New Journey Holidays</title>

        <!-- Google Fonts: Inter -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet" />

        <!-- Bootstrap 5.3.3 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <!-- Bootstrap Icons 1.11.3 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
            rel="stylesheet" />

        <!-- Admin Theme CSS -->
        <link href="css/admin-style.css?v=20261112b" rel="stylesheet" />

        <style>
            * {
                box-sizing: border-box;
            }

            html,
            body {
                height: 100%;
                margin: 0;
                padding: 0;
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                background: radial-gradient(circle at 10% 20%, rgba(20, 83, 45, 0.08) 0%, transparent 45%),
                    radial-gradient(circle at 90% 80%, rgba(18, 53, 36, 0.1) 0%, transparent 45%),
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
                box-shadow: 0 20px 40px rgba(18, 53, 36, 0.15), 0 5px 15px rgba(0, 0, 0, 0.04);
                overflow: hidden;
                border: 1px solid rgba(226, 232, 240, 0.8);
            }

            /* Left Side: Forest Green Welcome Overlay */
            .welcome-panel {
                background: linear-gradient(135deg, #14532D 0%, #166534 45%, #123524 100%);
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
                color: #14532D;
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
                border-color: #14532D;
                color: #14532D;
                background: #e8f5e9;
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
                border-color: #14532D;
                box-shadow: 0 0 0 3px rgba(20, 83, 45, 0.18);
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
                color: #14532D;
            }

            /* Submit Button: Rounded Pill (matching reference image) */
            .btn-nj-submit-pill {
                background-color: #14532D;
                border: 2px solid #14532D;
                color: #ffffff;
                border-radius: 50px;
                padding: 0.65rem 2.8rem;
                font-size: 0.85rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.08em;
                cursor: pointer;
                transition: all 0.2s ease-in-out;
                box-shadow: 0 4px 14px rgba(20, 83, 45, 0.35);
            }

            .btn-nj-submit-pill:hover,
            .btn-nj-submit-pill:focus {
                background-color: #0f3d21;
                border-color: #0f3d21;
                color: #ffffff;
                transform: translateY(-1px);
                box-shadow: 0 6px 18px rgba(20, 83, 45, 0.45);
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
                                To keep connected with us please sign in with your admin credentials
                            </p>

                            <!-- Switch to Employee Portal Pill -->
                            <a href="../employee/Employee_Login.aspx" class="btn-outline-pill">
                                Employee Portal
                            </a>

                            <div
                                class="mt-4 pt-3 border-top border-white border-opacity-10 small text-white text-opacity-75">
                                <i class="bi bi-geo-alt-fill me-1 text-light"></i>New Journey Holidays &bull; Gorakhpur
                                HQ
                            </div>
                        </div>

                        <!-- ========================================== -->
                        <!-- Right Side: Clean Form (Matching Image)   -->
                        <!-- ========================================== -->
                        <div class="col-12 col-lg-7 form-panel">
                            <h2 class="form-title">Admin Sign In</h2>

                            <!-- Role Circles (f, G+, in style from reference) -->
                            <div class="role-circles">
                                <span class="role-circle-btn" title="System Administrator"><i
                                        class="bi bi-shield-lock-fill"></i></span>
                                <span class="role-circle-btn" title="Lead Management"><i
                                        class="bi bi-kanban"></i></span>
                                <span class="role-circle-btn" title="Tour Operations"><i
                                        class="bi bi-gear-fill"></i></span>
                            </div>

                            <p class="form-subtitle">or enter your admin credentials below</p>

                            <!-- Feedback Alert / Label from Backend -->
                            <asp:Label ID="lblMessage" runat="server"
                                CssClass="text-danger small d-block mb-3 text-center fw-medium" />

                            <!-- Email Address Input -->
                            <div class="custom-input-group">
                                <span class="input-icon"><i class="bi bi-envelope"></i></span>
                                <asp:TextBox ID="txtemail" runat="server" ClientIDMode="Static" CssClass="form-control"
                                    TextMode="Email" placeholder="Email Address" autocomplete="username"
                                    required="required" />
                            </div>

                            <!-- Password Input -->
                            <div class="custom-input-group">
                                <span class="input-icon"><i class="bi bi-lock"></i></span>
                                <asp:TextBox ID="txtpassword" runat="server" ClientIDMode="Static"
                                    CssClass="form-control" TextMode="Password" placeholder="Password"
                                    autocomplete="current-password" required="required" />

                                <button type="button" class="btn-eye"
                                    onclick="togglePasswordVisibility('txtpassword', this);"
                                    title="Toggle password visibility">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>

                            <!-- Remember Me -->
                            <div class="d-flex justify-content-between align-items-center mb-4 px-1">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="chkRememberMe"
                                        checked="checked" />
                                    <label class="form-check-label small text-muted" for="chkRememberMe">
                                        Remember me
                                    </label>
                                </div>
                                <a href="javascript:void(0);" class="small text-decoration-none fw-semibold"
                                    style="color: #14532D;" data-bs-toggle="modal"
                                    data-bs-target="#forgotPasswordModal">
                                    Forgot password?
                                </a>
                            </div>

                            <!-- Pill Submit Button -->
                            <div class="text-center">
                                <asp:Button ID="btnLogin" runat="server" CssClass="btn-nj-submit-pill" Text="Sign In"
                                    OnClick="btnLogin_Click1" />
                            </div>

                        </div>

                    </div>
                </div>
            </div>

            <!-- Forgot Password Modal -->
            <div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-labelledby="forgotPasswordTitle"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content border-0 shadow" style="border-radius: 16px; overflow: hidden;">
                        <div class="modal-header border-bottom py-3">
                            <h6 class="modal-title fw-bold" id="forgotPasswordTitle" style="color: #14532D;">
                                <i class="bi bi-key-fill me-1"></i>Password Reset
                            </h6>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body py-3">
                            <label class="form-label small text-muted">Enter registered Email</label>
                            <input type="email" class="form-control form-control-sm" id="txtRecoveryContact"
                                placeholder="e.g. admin@newjourneyholidays.com" />
                        </div>
                        <div class="modal-footer border-top p-2 bg-light">
                            <button type="button" class="btn btn-sm btn-outline-secondary rounded-pill px-3"
                                data-bs-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-sm text-white rounded-pill px-3"
                                style="background-color: #14532D;" onclick="handlePasswordRecovery();">Send
                                Link</button>
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
                if (!field) return;

                if (field.type === 'password') {
                    field.type = 'text';
                    icon.className = 'bi bi-eye-slash';
                } else {
                    field.type = 'password';
                    icon.className = 'bi bi-eye';
                }
            }

            function handlePasswordRecovery() {
                var contact = document.getElementById('txtRecoveryContact').value.trim();
                if (!contact) {
                    alert('Please enter your registered email address.');
                    return;
                }
                var modalEl = document.getElementById('forgotPasswordModal');
                var modal = bootstrap.Modal.getInstance(modalEl);
                if (modal) modal.hide();

                alert('Password reset link sent to ' + contact);
            }
        </script>
    </body>

    </html>