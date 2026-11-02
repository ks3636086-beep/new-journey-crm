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

    <div class="row g-4">
        <!-- Profile Identity Column (col-lg-4) -->
        <div class="col-12 col-lg-4">
            <!-- Profile Identity Card -->
            <div class="card mb-3 text-center p-4">
                <div class="mx-auto mb-3 position-relative d-inline-block">
                    <div class="nj-avatar bg-primary" id="profileAvatar" style="width: 80px; height: 80px; font-size: 2rem; margin: 0 auto;">PS</div>
                    <span class="position-absolute bottom-0 end-0 badge rounded-pill bg-success p-1" title="Active">
                        <i class="bi bi-check-lg" style="font-size: 0.8rem;"></i>
                    </span>
                </div>
                <h5 class="fw-bold text-dark mb-1" id="profileDisplayName">Priya Sharma</h5>
                <div class="text-muted small mb-2" id="profileDisplayId">Employee ID: #EMP-01</div>

                <!-- Employee Category Badge (ONLY TWO CATEGORIES: Sales or Calling) -->
                <div class="mb-3">
                    <span class="badge badge-cat-sales px-3 py-2" id="profileCatBadge">
                        <i class="bi bi-briefcase-fill me-1"></i> Category: Sales (Field Work)
                    </span>
                </div>

                <hr class="my-3 text-muted" />

                <div class="text-start small">
                    <div class="d-flex justify-content-between py-2 border-bottom">
                        <span class="text-muted">Employee Category:</span>
                        <span class="fw-bold text-dark" id="profileCatLabel">Sales</span>
                    </div>
                    <div class="d-flex justify-content-between py-2 border-bottom">
                        <span class="text-muted">Assigned Branch:</span>
                        <span class="fw-semibold text-dark">Gorakhpur HQ (Golghar)</span>
                    </div>
                    <div class="d-flex justify-content-between py-2 border-bottom">
                        <span class="text-muted">Joining Date:</span>
                        <span class="fw-semibold text-dark">15 January 2024</span>
                    </div>
                    <div class="d-flex justify-content-between py-2 border-bottom">
                        <span class="text-muted">System Username:</span>
                        <code class="text-dark" id="profileUsername">priya_nj</code>
                    </div>
                    <div class="d-flex justify-content-between py-2">
                        <span class="text-muted">Operational Scope:</span>
                        <span class="text-dark fw-semibold" id="profileScope">Field Visits & Direct Clients</span>
                    </div>
                </div>
            </div>

            <!-- Two Category Rule Info Box -->
            <div class="card p-3 border-success border-opacity-25 bg-white">
                <h6 class="fw-bold text-success mb-2"><i class="bi bi-info-circle me-1"></i> Two Employee Categories</h6>
                <p class="text-muted small mb-2">
                    In New Journey Holidays CRM, employees are classified into two operational categories:
                </p>
                <ul class="ps-3 mb-0 small text-muted">
                    <li class="mb-1"><strong>Sales:</strong> Works in field, sources client leads, calls own clients, manages follow-ups.</li>
                    <li><strong>Calling:</strong> Works from back office, dials admin-assigned leads and self-sourced leads.</li>
                </ul>
            </div>
        </div>

        <!-- Edit Profile & Change Password Column (col-lg-8) -->
        <div class="col-12 col-lg-8">
            <!-- 1. Profile Information Display & Edit Form -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-person-lines-fill text-success"></i> Edit Profile Information</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">Full Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="txtProfileFullName" value="Priya Sharma" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Employee ID</label>
                            <input type="text" class="form-control bg-light" id="txtProfileEmpId" value="EMP-01" readonly="readonly" />
                            <div class="form-text">System ID assigned by agency Administrator.</div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Mobile Number <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light">+91</span>
                                <input type="tel" class="form-control" id="txtProfilePhone" value="98390 88771" />
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Email Address <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" id="txtProfileEmail" value="priya@newjourneyholidays.com" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Employee Category</label>
                            <input type="text" class="form-control bg-light" id="txtProfileCategory" value="Sales (Field Operations)" readonly="readonly" />
                            <div class="form-text">Assigned by Admin during account creation.</div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Joining Date</label>
                            <input type="text" class="form-control bg-light" value="15-Jan-2024" readonly="readonly" />
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-white border-top text-end">
                    <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Profile updated successfully (UI sample)!');">
                        <i class="bi bi-check-lg"></i> Update Profile
                    </button>
                </div>
            </div>

            <!-- 2. Change Password Form UI -->
            <div class="card">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-shield-lock text-success"></i> Change Account Password</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12">
                            <label class="form-label">Current Password <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="txtCurrPass" placeholder="Enter existing password" />
                                <button type="button" class="btn btn-outline-secondary" onclick="togglePasswordEye('txtCurrPass');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">New Password <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="txtNewPassword" placeholder="Min. 8 characters" />
                                <button type="button" class="btn btn-outline-secondary" onclick="togglePasswordEye('txtNewPassword');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Confirm New Password <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="txtConfirmPassword" placeholder="Confirm new password" />
                                <button type="button" class="btn btn-outline-secondary" onclick="togglePasswordEye('txtConfirmPassword');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-white border-top text-end">
                    <button type="button" class="btn btn-nj-primary btn-sm" onclick="handleUpdatePassword();">
                        <i class="bi bi-key"></i> Update Password
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function togglePasswordEye(id) {
            var el = document.getElementById(id);
            if (el.type === 'password') {
                el.type = 'text';
            } else {
                el.type = 'password';
            }
        }

        function handleUpdatePassword() {
            var curr = document.getElementById('txtCurrPass').value;
            var nw = document.getElementById('txtNewPassword').value;
            var conf = document.getElementById('txtConfirmPassword').value;

            if (!curr || !nw || !conf) {
                alert('Please fill out all password fields.');
                return;
            }
            if (nw !== conf) {
                alert('New Password and Confirm Password do not match.');
                return;
            }

            alert('Password changed successfully (UI sample)!');
            document.getElementById('txtCurrPass').value = '';
            document.getElementById('txtNewPassword').value = '';
            document.getElementById('txtConfirmPassword').value = '';
        }

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
                if (dName) dName.textContent = 'Pooja Srivastava';
                if (dId) dId.textContent = 'Employee ID: #EMP-03';
                if (badge) {
                    badge.className = 'badge badge-cat-calling px-3 py-2';
                    badge.innerHTML = '<i class="bi bi-headset me-1"></i> Category: Calling (Back Office)';
                }
                if (catLabel) catLabel.textContent = 'Calling (Back Office)';
                if (username) username.textContent = 'pooja_call';
                if (scope) scope.textContent = 'Inbound & Outbound Calling';
                if (avatar) { avatar.textContent = 'PS'; avatar.className = 'nj-avatar bg-info'; }
                if (fName) fName.value = 'Pooja Srivastava';
                if (fId) fId.value = 'EMP-03';
                if (fPhone) fPhone.value = '97920 11225';
                if (fEmail) fEmail.value = 'pooja@newjourneyholidays.com';
                if (fCategory) fCategory.value = 'Calling (Back Office Desk)';
            } else {
                if (dName) dName.textContent = 'Priya Sharma';
                if (dId) dId.textContent = 'Employee ID: #EMP-01';
                if (badge) {
                    badge.className = 'badge badge-cat-sales px-3 py-2';
                    badge.innerHTML = '<i class="bi bi-briefcase-fill me-1"></i> Category: Sales (Field Work)';
                }
                if (catLabel) catLabel.textContent = 'Sales (Field)';
                if (username) username.textContent = 'priya_nj';
                if (scope) scope.textContent = 'Field Visits & Direct Clients';
                if (avatar) { avatar.textContent = 'PS'; avatar.className = 'nj-avatar bg-primary'; }
                if (fName) fName.value = 'Priya Sharma';
                if (fId) fId.value = 'EMP-01';
                if (fPhone) fPhone.value = '98390 88771';
                if (fEmail) fEmail.value = 'priya@newjourneyholidays.com';
                if (fCategory) fCategory.value = 'Sales (Field Operations)';
            }
        }

        window.addEventListener('njCategoryChanged', function (e) {
            adaptProfileToCategory(e.detail.category);
        });

        document.addEventListener('DOMContentLoaded', function () {
            var currentCat = localStorage.getItem('nj_employee_category') || 'Sales';
            adaptProfileToCategory(currentCat);
        });
    </script>
</asp:Content>