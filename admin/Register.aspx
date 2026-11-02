<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Admin_Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Admin Registration - New Journey Holidays</title>

    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <!-- Bootstrap 5.3.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons 1.11.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <!-- Admin Theme CSS -->
    <link href="css/admin-style.css" rel="stylesheet" />

    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: #ffffff;
        }

        .fullpage-layout {
            min-height: 100vh;
        }

        /* Left Branding Panel */
        .brand-panel {
            background-color: #123524;
            background-image: radial-gradient(circle at 20% 20%, rgba(20, 83, 45, 0.9) 0%, transparent 60%), radial-gradient(circle at 80% 80%, rgba(30, 95, 58, 0.6) 0%, transparent 60%);
            color: #ffffff;
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .brand-logo-icon {
            width: 48px;
            height: 48px;
            background: #ffffff;
            color: #14532D;
            border-radius: 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        /* Right Form Panel */
        .form-panel {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2.5rem 1.5rem;
            background-color: #ffffff;
        }

        .form-wrapper {
            width: 100%;
            max-width: 480px;
        }

        .form-control:focus {
            border-color: #14532D;
            box-shadow: 0 0 0 0.2rem rgba(20, 83, 45, 0.15);
        }

        .btn-nj-primary {
            background-color: #14532D;
            border-color: #14532D;
            color: #ffffff;
            transition: all 0.2s ease-in-out;
        }

            .btn-nj-primary:hover {
                background-color: #0f3d21;
                border-color: #0f3d21;
                color: #ffffff;
            }

        @media (max-width: 991.98px) {
            .brand-panel {
                padding: 2rem 1.5rem;
                min-height: auto;
            }

            .form-panel {
                padding: 2rem 1.5rem 3rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container-fluid p-0">
            <div class="row g-0 fullpage-layout">

                <!-- Left Side: Brand Panel (Full Height) -->
                <div class="col-12 col-lg-5 brand-panel">
                    <div>
                        <div class="d-flex align-items-center gap-3 mb-4">
                            <div class="brand-logo-icon">
                                <i class="bi bi-airplane-engines-fill"></i>
                            </div>
                            <div>
                                <h4 class="fw-bold mb-0 text-white tracking-wide">New Journey Holidays</h4>
                                <span class="text-white-50 small">Travel CRM &amp; Tour Operations</span>
                            </div>
                        </div>

                        <div class="my-5 d-none d-lg-block">
                            <h2 class="display-6 fw-bold text-white mb-3">Master Admin Setup</h2>
                            <p class="text-light text-opacity-75 fs-6">
                                Initial account setup to manage travel leads, customer follow-ups, and agency staff.
                           
                            </p>
                        </div>
                    </div>

                    <!-- Gorakhpur Office Address -->
                    <div class="pt-4 border-top border-white border-opacity-10 text-white-50 small">
                        <div class="d-flex align-items-start gap-2">
                            <i class="bi bi-geo-alt-fill text-success fs-5"></i>
                            <div>
                                <span class="text-white fw-semibold d-block">New Journey Holidays</span>
                                Radhika Complex, 5/B, Ambedkar Chowk, Civil Lines, Gorakhpur, UP 273001
                           
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side: Clean Registration Form (Full Height) -->
                <div class="col-12 col-lg-7 form-panel">
                    <div class="form-wrapper">

                        <div class="mb-4">
                            <h2 class="fw-bold text-dark mb-1">Create Admin Account</h2>
                            <p class="text-muted small">Enter details to set up your master administrator access</p>
                        </div>

                        <!-- Alerts -->
                        <div id="registerAlertBox" class="alert alert-danger d-none py-2 px-3 small mb-3" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-1"></i>
                            <span id="registerAlertMsg">Please fill all fields.</span>
                        </div>
                        <div id="registerSuccessBox" class="alert alert-success d-none py-2 px-3 small mb-3" role="alert">
                            <i class="bi bi-check-circle-fill me-1"></i>
                            <span id="registerSuccessMsg">Account setup successfully! Redirecting to login...</span>
                        </div>

                        <!-- Form Fields -->
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text bg-white text-muted">
                                    <i class="bi bi-person"></i>
                                </span>
                                <asp:TextBox ID="txtAdminName" runat="server"
                                    CssClass="form-control"
                                    placeholder="Enter your full name" />
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-12 col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-text bg-white text-muted">
                                        <i class="bi bi-envelope"></i>
                                    </span>
                                    <asp:TextBox ID="txtEmail" runat="server"
                                        CssClass="form-control"
                                        TextMode="Email"
                                        placeholder="admin@email.com" />
                                </div>
                            </div>
                            <div class="col-12 col-sm-6">
                                <label for="txtMobile" class="form-label small fw-semibold text-secondary">Mobile Number</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white text-muted">
                                        <i class="bi bi-phone"></i>
                                    </span>
                                    <asp:TextBox ID="txtMobile" runat="server"
                                        CssClass="form-control"
                                        TextMode="Phone"
                                        placeholder="10-digit number"
                                        MaxLength="10" />
                                </div>
                            </div>
                        </div>

                        <div class="row g-2 mb-4">
                            <div class="col-12 col-sm-6">
                                <label for="txtPassword" class="form-label small fw-semibold text-secondary">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white text-muted">
                                        <i class="bi bi-lock"></i>
                                    </span>
                                    <asp:TextBox ID="txtPassword" runat="server"
                                        CssClass="form-control border-end-0"
                                        TextMode="Password"
                                        placeholder="Min 6 characters" />
                                    <button class="btn btn-outline-secondary border-start-0 bg-white text-muted" type="button"
                                        onclick="togglePasswordVisibility('txtPassword', this);">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6">
                                <label for="txtConfirmPassword" class="form-label small fw-semibold text-secondary">Confirm Password</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white text-muted">
                                        <i class="bi bi-shield-check"></i>
                                    </span>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server"
                                        CssClass="form-control border-end-0"
                                        TextMode="Password"
                                        placeholder="Re-enter password" />
                                    <button class="btn btn-outline-secondary border-start-0 bg-white text-muted" type="button"
                                        onclick="togglePasswordVisibility('txtConfirmPassword', this);">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Register Button -->
                        <div class="d-grid mb-4">
                            <asp:Button ID="btnRegister" runat="server"
                                CssClass="btn btn-nj-primary py-2 fw-semibold"
                                Text="Register Admin"
                                OnClick="btnRegister_Click" />
                        </div>

                        <!-- Login Link -->
                        <div class="text-center pt-3 border-top small text-muted">
                            Already have an account? 
                           
                            <a href="Login.aspx" class="text-success fw-bold text-decoration-none ms-1">Sign In
                            </a>
                        </div>

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

        function handleAdminRegistration() {
            var name = document.getElementById('txtAdminName').value.trim();
            var email = document.getElementById('txtEmail').value.trim();
            var mobile = document.getElementById('txtMobile').value.trim();
            var pass = document.getElementById('txtPassword').value.trim();
            var confirmPass = document.getElementById('txtConfirmPassword').value.trim();

            var alertBox = document.getElementById('registerAlertBox');
            var alertMsg = document.getElementById('registerAlertMsg');
            var successBox = document.getElementById('registerSuccessBox');

            alertBox.classList.add('d-none');
            successBox.classList.add('d-none');

            if (!name || !email || !mobile || !pass || !confirmPass) {
                alertBox.classList.remove('d-none');
                alertMsg.textContent = 'Please fill out all required fields.';
                return;
            }

            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alertBox.classList.remove('d-none');
                alertMsg.textContent = 'Please enter a valid email address.';
                return;
            }

            if (mobile.length < 10) {
                alertBox.classList.remove('d-none');
                alertMsg.textContent = 'Please enter a valid 10-digit mobile number.';
                return;
            }

            if (pass.length < 6) {
                alertBox.classList.remove('d-none');
                alertMsg.textContent = 'Password must be at least 6 characters.';
                return;
            }

            if (pass !== confirmPass) {
                alertBox.classList.remove('d-none');
                alertMsg.textContent = 'Passwords do not match.';
                return;
            }

            var btn = document.getElementById('btnRegister');
            btn.disabled = true;
            btn.innerHTML = '<span class="spinner-border spinner-border-sm me-1" role="status" aria-hidden="true"></span> Creating Account...';

            successBox.classList.remove('d-none');

            setTimeout(function () {
                window.location.href = 'Login.aspx';
            }, 800);
        }
    </script>
</body>
</html>
