<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee_Login.aspx.cs" Inherits="Employee_Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Employee Login - New Journey Holidays</title>

    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <!-- Bootstrap 5.3.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons 1.11.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <!-- Employee Theme CSS -->
    <link href="css/employee-style.css" rel="stylesheet" />

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
            max-width: 420px;
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
        <div class="container-fluid p-0">
            <div class="row g-0 fullpage-layout">

                <!-- Left Side: Brand Panel (Full Height) -->
                <div class="col-12 col-lg-5 brand-panel">
                    <div>
                        <div class="d-flex align-items-center gap-3 mb-4">
                            <div class="brand-logo-icon shadow-sm">
                                <i class="bi bi-airplane-engines-fill"></i>
                            </div>
                            <div>
                                <h4 class="fw-bold mb-0 text-white tracking-wide">New Journey Holidays</h4>
                                <span class="text-white-50 small">Travel CRM &bull; Employee Portal</span>
                            </div>
                        </div>

                        <div class="my-5 d-none d-lg-block">
                            <span class="badge bg-success-subtle text-success border border-success-subtle px-3 py-2 rounded-pill mb-3">
                                <i class="bi bi-shield-check me-1"></i> Staff Workspace
                            </span>
                            <h2 class="display-6 fw-bold text-white mb-3">Welcome to Your Daily Travel Hub</h2>
                            <p class="text-light text-opacity-75 fs-6">
                                Access your assigned leads, upcoming follow-ups, and holiday bookings all in one unified workspace.
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

                <!-- Right Side: Clean Login Form (Full Height) -->
                <div class="col-12 col-lg-7 form-panel">
                    <div class="form-wrapper">

                        <div class="mb-4">
                            <span class="badge bg-light text-dark border mb-2 px-2 py-1">
                                <i class="bi bi-person-badge text-success me-1"></i>Employee Access
                            </span>
                            <h2 class="fw-bold text-dark mb-1">Staff Sign In</h2>
                            <p class="text-muted small">Enter your assigned username or email and password</p>
                        </div>

                        <!-- Username or Email -->
                        <div class="mb-3">
                            <label class="form-label small fw-semibold text-secondary">
                                Email Address or Username
                            </label>
                            <div class="input-group">
                                <span class="input-group-text bg-white text-muted">
                                    <i class="bi bi-person"></i>
                                </span>
                                <asp:TextBox ID="txtLogin" runat="server"
                                    ClientIDMode="Static"
                                    CssClass="form-control"
                                    placeholder="e.g. alok_sales or name@domain.com" />
                            </div>
                        </div>

                        <!-- Password -->
                        <div class="mb-3">
                            <label class="form-label small fw-semibold text-secondary">
                                Password
                            </label>
                            <div class="input-group">
                                <span class="input-group-text bg-white text-muted">
                                    <i class="bi bi-lock"></i>
                                </span>
                                <asp:TextBox ID="txtPassword" runat="server"
                                    ClientIDMode="Static"
                                    CssClass="form-control"
                                    TextMode="Password"
                                    placeholder="Enter your password" />

                                <button class="btn btn-outline-secondary border-start-0 bg-white text-muted"
                                    type="button"
                                    onclick="togglePasswordVisibility('txtPassword', this);">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>

                        <!-- Remember Me & Forgot Password -->
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="chkRememberMe" checked />
                                <label class="form-check-label small text-muted" for="chkRememberMe">
                                    Remember me
                                </label>
                            </div>
                            <span class="small text-muted">
                                Forgot password? Contact Admin
                            </span>
                        </div>

                        <!-- Login Button -->
                        <div class="d-grid mb-3">
                            <asp:Button ID="btnLogin" runat="server"
                                CssClass="btn btn-nj-primary py-2 fw-semibold"
                                Text="Sign In to Employee Panel"
                                OnClick="btnLogin_Click" />
                        </div>

                        <asp:Label ID="lblMessage" runat="server"
                            CssClass="text-danger small d-block mb-3" />

                        <!-- Switch to Admin Login -->
                        <div class="text-center pt-3 border-top small text-muted">
                            Are you an administrator? 
                            <a href="../admin/Login.aspx" class="text-success fw-bold text-decoration-none ms-1">
                                Admin Portal <i class="bi bi-arrow-right-short"></i>
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
    </script>
</body>
</html>

