<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Profile | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Employee Profile & Settings</h2>
            <p class="nj-page-subtitle">Personal identity details, assigned operational category, contact information and password management.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <span class="badge bg-success-subtle text-success border border-success-subtle p-2">
                <i class="bi bi-shield-check me-1"></i> Active Employee Account
            </span>
        </div>
    </div>
 <!-- Professional Horizontal Profile Card -->
    <div class="card mb-4 shadow-sm border">
        <div class="card-header bg-white py-3 d-flex align-items-center justify-content-between">
            <h6 class="mb-0 fw-bold text-dark">
                <i class="bi bi-person-lines-fill text-success me-2"></i>Employee Profile Information
            </h6>
            <span class="badge bg-success-subtle text-success border border-success-subtle px-2.5 py-1">
                <i class="bi bi-shield-check me-1"></i>Verified Profile
            </span>
        </div>
        <div class="card-body p-4">
            <div class="row g-4 align-items-center">
                <!-- Left Column: Profile Identity Card (Horizontal Left) -->
                <div class="col-12 col-lg-4 col-xl-3 text-center border-end-lg pe-lg-4 pb-4 pb-lg-0 border-bottom border-bottom-lg-0">
                    <div class="p-3 bg-light bg-opacity-50 rounded-3">
                        <div class="mx-auto mb-3 position-relative d-inline-block">
                            <div class="nj-avatar bg-primary" id="profileAvatar" runat="server" style="width: 76px; height: 76px; font-size: 1.8rem; margin: 0 auto; box-shadow: 0 4px 10px rgba(2,132,199,0.25);">PS</div>
                            <span class="position-absolute bottom-0 end-0 badge rounded-pill bg-success p-1 border border-2 border-white" title="Active">
                                <i class="bi bi-check-lg" style="font-size: 0.75rem;"></i>
                            </span>
                        </div>
                        <h5 class="fw-bold text-dark mb-1" id="profileDisplayName" runat="server"></h5>
                        <div class="text-muted small mb-2" id="profileDisplayId" runat="server"></div>

                        <!-- Employee Category Badge -->
                        <div class="mb-0">
                            <span class="badge badge-cat-sales px-3 py-1.5" id="profileCatBadge" style="font-size: 0.78rem;">
                                <i class="bi bi-briefcase-fill me-1"></i>Category: Sales (Field)
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Right Column: 10 Form Fields Grid (Horizontal Right) -->
                <div class="col-12 col-lg-8 col-xl-9 ps-lg-4">
                    <div class="row g-3">
                        <!-- 1. employee_id -->
                        <div class="col-12 col-md-6">
                            <label class="form-label fw-semibold text-muted mb-1 small">
                                Employee ID (employee_id)
                            </label>
                            <asp:TextBox ID="txtEmployeeId" runat="server"
                                CssClass="form-control form-control-sm bg-light"
                                ReadOnly="true">
                            </asp:TextBox>
                        </div>

                        <!-- 2. employee_code -->
                        <div class="col-12 col-md-6">
                            <label class="form-label fw-semibold text-muted mb-1 small">
                                Employee Code (employee_code)
                            </label>
                            <asp:TextBox ID="txtProfileEmpId" runat="server"
                                CssClass="form-control form-control-sm bg-light"
                                ReadOnly="true">
                            </asp:TextBox>
                        </div>

                        <!-- 3. employee_name -->
                        <div class="col-12 col-md-6">
                            <label class="form-label fw-semibold text-muted mb-1 small">
                                Full Name (employee_name) <span class="text-danger">*</span>
                            </label>
                            <asp:TextBox ID="txtProfileFullName" runat="server"
                                CssClass="form-control form-control-sm">
                            </asp:TextBox>
                        </div>

                        <!-- 4. employee_username -->
                        <div class="col-12 col-md-6">
                            <label class="form-label fw-semibold text-muted mb-1 small">
                                Username (employee_username)
                            </label>
                            <asp:TextBox ID="txtProfileUsername" runat="server"
                                CssClass="form-control form-control-sm bg-light"
                                ReadOnly="true">
                            </asp:TextBox>
                        </div>

                        <!-- 5. employee_mobile -->
                        <div class="col-12 col-md-6">
                            <label class="form-label fw-semibold text-muted mb-1 small">
                                Mobile Number (employee_mobile) <span class="text-danger">*</span>
                            </label>
                            <div class="input-group input-group-sm">
                                <span class="input-group-text bg-light">+91</span>
                                <asp:TextBox ID="txtProfilePhone" runat="server"
                                    CssClass="form-control form-control-sm"
                                    TextMode="Phone">
                                </asp:TextBox>
                            </div>
                        </div>

                        <!-- 6. employee_email -->
                        <div class="col-12 col-md-6">
                            <label class="form-label fw-semibold text-muted mb-1 small">
                                Email Address (employee_email) <span class="text-danger">*</span>
                            </label>
                            <asp:TextBox ID="txtProfileEmail" runat="server"
                                CssClass="form-control form-control-sm"
                                TextMode="Email">
                            </asp:TextBox>
                        </div>

                        <!-- 7. employee_password -->
                        <div class="col-12 col-md-6">
                            <label class="form-label fw-semibold text-muted mb-1 small">
                                Password (employee_password)
                            </label>
                            <div class="input-group input-group-sm">
                                <asp:TextBox ID="txtProfilePassword" runat="server"
                                    CssClass="form-control form-control-sm"
                                    TextMode="Password"
                                    ClientIDMode="Static">
                                </asp:TextBox>
                                <button type="button" class="btn btn-outline-secondary" onclick="togglePasswordEye();">
                                    <i class="bi bi-eye" id="eyeIcon"></i>
                                </button>
                            </div>
                        </div>

                        <!-- 8. employee_category -->
                        <div class="col-12 col-md-6">
                            <label class="form-label fw-semibold text-muted mb-1 small">
                                Employee Category (employee_category)
                            </label>
                            <asp:TextBox ID="txtProfileCategory" runat="server"
                                CssClass="form-control form-control-sm bg-light"
                                ReadOnly="true">
                            </asp:TextBox>
                        </div>

                        <!-- 9. employee_status -->
                        <div class="col-12 col-md-6">
                            <label class="form-label fw-semibold text-muted mb-1 small">
                                Account Status (employee_status)
                            </label>
                            <asp:TextBox ID="txtProfileStatus" runat="server"
                                CssClass="form-control form-control-sm bg-light"
                                ReadOnly="true">
                            </asp:TextBox>
                        </div>

                        <!-- 10. created_at -->
                        <div class="col-12 col-md-6">
                            <label class="form-label fw-semibold text-muted mb-1 small">
                                Joining Date (created_at)
                            </label>
                            <asp:TextBox ID="txtProfileJoiningDate" runat="server"
                                CssClass="form-control form-control-sm bg-light"
                                ReadOnly="true">
                            </asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Adapt profile view based on current category switch
        function adaptProfileToCategory(cat) {
            var dName = document.getElementById('profileDisplayName');
            var dId = document.getElementById('profileDisplayId');
            var badge = document.getElementById('profileCatBadge');
            var catLabel = document.getElementById('profileCatLabel');
            var username = document.getElementById('profileUsername');
            var scope = document.getElementById('profileScope');
            var avatar = document.getElementById('profileAvatar');
            var fName = document.getElementById('txtProfileFullName');
            var fId = document.getElementById('txtProfileEmpId');
            var fPhone = document.getElementById('txtProfilePhone');
            var fEmail = document.getElementById('txtProfileEmail');
            var fCategory = document.getElementById('txtProfileCategory');

            if (cat === 'Calling') {
                if (dName && !dName.innerText) dName.textContent = 'Pooja Srivastava';
                if (dId && !dId.innerText) dId.textContent = 'Employee ID: #EMP-03';
                if (badge) {
                    badge.className = 'badge badge-cat-calling px-3 py-1.5';
                    badge.innerHTML = '<i class="bi bi-headset me-1"></i> Category: Calling (Back Office)';
                }
            } else {
                if (dName && !dName.innerText) dName.textContent = 'Priya Sharma';
                if (dId && !dId.innerText) dId.textContent = 'Employee ID: #EMP-01';
                if (badge) {
                    badge.className = 'badge badge-cat-sales px-3 py-1.5';
                    badge.innerHTML = '<i class="bi bi-briefcase-fill me-1"></i> Category: Sales (Field Work)';
                }
            }
        }

        window.addEventListener('njCategoryChanged', function (e) {
            adaptProfileToCategory(e.detail.category);
        });

        function togglePasswordEye() {
            var pass = document.getElementById('txtProfilePassword');
            var icon = document.getElementById('eyeIcon');
            if (pass.type === 'password') {
                pass.type = 'text';
                icon.classList.remove('bi-eye');
                icon.classList.add('bi-eye-slash');
            } else {
                pass.type = 'password';
                icon.classList.remove('bi-eye-slash');
                icon.classList.add('bi-eye');
            }
        }
    </script>
</asp:Content>