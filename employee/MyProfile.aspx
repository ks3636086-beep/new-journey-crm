<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Profile | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">My Account Profile</h2>
            <p class="nj-page-subtitle">View and update your personal employee details, contact preferences and password.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <span class="badge bg-success-subtle text-success p-2">
                <i class="bi bi-shield-check me-1"></i> Active Employee Account
            </span>
        </div>
    </div>

    <div class="row g-4">
        <!-- Profile Card & Stats (col-lg-4) -->
        <div class="col-12 col-lg-4">
            <!-- Profile Identity Card -->
            <div class="card mb-3 text-center p-4">
                <div class="mx-auto mb-3">
                    <div class="nj-avatar bg-primary" style="width: 72px; height: 72px; font-size: 1.75rem; margin: 0 auto;">PS</div>
                </div>
                <h5 class="fw-bold text-dark mb-1">Priya Sharma</h5>
                <div class="text-muted small mb-2">Senior Sales Executive &bull; #EMP-01</div>
                <div>
                    <span class="badge bg-primary-subtle text-primary border border-primary-subtle">
                        <i class="bi bi-briefcase me-1"></i> Sales Department
                    </span>
                </div>

                <hr class="my-3 text-muted" />

                <div class="text-start small">
                    <div class="d-flex justify-content-between py-1 border-bottom">
                        <span class="text-muted">Branch Office:</span>
                        <span class="fw-semibold text-dark">Gorakhpur HQ</span>
                    </div>
                    <div class="d-flex justify-content-between py-1 border-bottom">
                        <span class="text-muted">Username:</span>
                        <code class="text-dark">priya_nj</code>
                    </div>
                    <div class="d-flex justify-content-between py-1 border-bottom">
                        <span class="text-muted">Joining Date:</span>
                        <span class="fw-semibold text-dark">15 Jan 2024</span>
                    </div>
                    <div class="d-flex justify-content-between py-1">
                        <span class="text-muted">Portal Role:</span>
                        <span class="badge bg-light text-dark border">Travel Consultant</span>
                    </div>
                </div>
            </div>

            <!-- Performance Snapshot Card -->
            <div class="card p-3">
                <h6 class="fw-bold mb-3 text-success"><i class="bi bi-trophy me-1"></i> Performance Snapshot</h6>
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="text-muted small">Total Leads Handled</span>
                    <span class="fw-bold text-dark">68</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="text-muted small">Confirmed Bookings</span>
                    <span class="fw-bold text-success">24</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="text-muted small">Lead Conversion Rate</span>
                    <span class="fw-bold text-primary">35.3%</span>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <span class="text-muted small">Top Destination</span>
                    <span class="badge bg-light text-dark border">Kashmir & Dubai</span>
                </div>
            </div>
        </div>

        <!-- Forms: Profile Details & Password (col-lg-8) -->
        <div class="col-12 col-lg-8">
            <!-- 1. Profile Information Display & Edit -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-person-lines-fill text-success"></i> Personal & Contact Details</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">Full Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="txtProfileName" value="Priya Sharma" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Employee ID</label>
                            <input type="text" class="form-control bg-light" value="EMP-01" readonly="readonly" />
                            <div class="form-text">System ID assigned by Administrator.</div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Mobile Number <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light">+91</span>
                                <input type="tel" class="form-control" id="txtProfileMobile" value="98390 88771" />
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Official Email <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" id="txtProfileEmail" value="priya@newjourneyholidays.com" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Employee Category</label>
                            <input type="text" class="form-control bg-light" value="Sales (Desk & Direct Client Closing)" readonly="readonly" />
                            <div class="form-text">Category permissions managed by Admin.</div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Desk / Seating Location</label>
                            <input type="text" class="form-control" value="Desk #4, Ground Floor Travel Counter, Golghar" />
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-white border-top text-end">
                    <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Profile details updated (UI sample)!');">
                        <i class="bi bi-check-lg"></i> Update Profile
                    </button>
                </div>
            </div>

            <!-- 2. Change Password Form UI -->
            <div class="card">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-shield-lock text-success"></i> Change Password</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12">
                            <label class="form-label">Current Password <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="txtCurrentPass" placeholder="Enter current password" />
                                <button type="button" class="btn btn-outline-secondary" onclick="togglePassVisibility('txtCurrentPass');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">New Password <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="txtNewPass" placeholder="Min. 8 characters" />
                                <button type="button" class="btn btn-outline-secondary" onclick="togglePassVisibility('txtNewPass');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Confirm New Password <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="txtConfirmPass" placeholder="Re-enter new password" />
                                <button type="button" class="btn btn-outline-secondary" onclick="togglePassVisibility('txtConfirmPass');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-white border-top text-end">
                    <button type="button" class="btn btn-nj-primary btn-sm" onclick="handlePasswordChange();">
                        <i class="bi bi-key"></i> Update Password
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function togglePassVisibility(id) {
            var el = document.getElementById(id);
            if (el.type === 'password') {
                el.type = 'text';
            } else {
                el.type = 'password';
            }
        }

        function handlePasswordChange() {
            var curr = document.getElementById('txtCurrentPass').value;
            var nw = document.getElementById('txtNewPass').value;
            var conf = document.getElementById('txtConfirmPass').value;

            if (!curr || !nw || !conf) {
                alert('Please fill out all password fields.');
                return;
            }
            if (nw !== conf) {
                alert('New Password and Confirm Password do not match.');
                return;
            }

            alert('Password changed successfully (UI sample)!');
            document.getElementById('txtCurrentPass').value = '';
            document.getElementById('txtNewPass').value = '';
            document.getElementById('txtConfirmPass').value = '';
        }
    </script>
</asp:Content>
