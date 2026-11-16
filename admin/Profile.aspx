<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Admin_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Profile &amp; Account Settings | New Journey Holidays</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Admin Profile &amp; Settings</h2>
            <p class="nj-page-subtitle">Manage administrative account details, contact information, and security credentials.</p>
        </div>
         
    </div>

    <div class="row g-4">
        <!-- 1. Profile Details Card -->
        <div class="col-12 col-lg-8">
            <div class="card shadow-sm border mb-4">
                <div class="card-header bg-white py-3 d-flex align-items-center justify-content-between">
                    <h6 class="mb-0 fw-bold text-dark">
                        <i class="bi bi-person-badge text-primary me-2"></i>Account Information
                    </h6>
                     
                </div>
                <div class="card-body p-3 p-md-4">
                    <!-- Profile Message Alert -->
                    <asp:Label ID="lblProfileMsg" runat="server" EnableViewState="false"></asp:Label>

                    <!-- Top Identity Row -->
                    <div class="d-flex align-items-center gap-3 p-3 bg-light rounded mb-4">
                        <div class="nj-avatar bg-primary flex-shrink-0" style="width: 56px; height: 56px; font-size: 1.35rem;">
                            <asp:Literal ID="litAdminAvatar" runat="server">AD</asp:Literal>
                        </div>
                        <div>
                            <h5 class="fw-bold text-dark mb-0">
                                <asp:Label ID="lblAdminDisplayName" runat="server" Text="Administrator"></asp:Label>
                            </h5>
                            <div class="text-muted small">New Journey Holidays &bull; Master Account</div>
                        </div>
                    </div>

                    <!-- Form Fields (Strictly from ecommerce_backend table) -->
                    <div class="row g-3">
                        <!-- 1. id -->
                        <div class="col-12 col-md-4">
                            <label class="form-label small fw-semibold text-muted mb-1">
                                Admin ID <span class="text-muted fw-normal">(id)</span>
                            </label>
                            <asp:TextBox ID="txtAdminId" runat="server" CssClass="form-control form-control-sm bg-light" ReadOnly="true" Text="1"></asp:TextBox>
                        </div>

                        <!-- 2. backend_name -->
                        <div class="col-12 col-md-8">
                            <label class="form-label small fw-semibold text-muted mb-1">
                                Full Name <span class="text-muted fw-normal">(backend_name)</span> <span class="text-danger">*</span>
                            </label>
                            <asp:TextBox ID="txtBackendName" runat="server" CssClass="form-control form-control-sm" placeholder="Enter Admin Name"></asp:TextBox>
                        </div>

                        <!-- 3. backend_email -->
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold text-muted mb-1">
                                Email Address <span class="text-muted fw-normal">(backend_email)</span> <span class="text-danger">*</span>
                            </label>
                            <asp:TextBox ID="txtBackendEmail" runat="server" CssClass="form-control form-control-sm" placeholder="admin@newjourneyholidays.com"></asp:TextBox>
                        </div>

                        <!-- 4. backend_mobileno -->
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold text-muted mb-1">
                                Mobile Number <span class="text-muted fw-normal">(backend_mobileno)</span>
                            </label>
                            <asp:TextBox ID="txtBackendMobile" runat="server" CssClass="form-control form-control-sm" placeholder="Enter contact number"></asp:TextBox>
                        </div>

                        <!-- 5. backend_role -->
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold text-muted mb-1">
                                System Role <span class="text-muted fw-normal">(backend_role)</span>
                            </label>
                            <asp:TextBox ID="txtBackendRole" runat="server" CssClass="form-control form-control-sm bg-light" ReadOnly="true" Text="Admin"></asp:TextBox>
                        </div>

                        <!-- 6. backend_status -->
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold text-muted mb-1">
                                Account Status <span class="text-muted fw-normal">(backend_status)</span>
                            </label>
                            <asp:TextBox ID="txtBackendStatus" runat="server" CssClass="form-control form-control-sm bg-light text-success fw-bold" ReadOnly="true" Text="Active"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="text-end border-top pt-3 mt-4">
                        <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes" CssClass="btn btn-sm btn-primary px-3" OnClick="btnSaveProfile_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- 2. Security & Change Password Card -->
        <div class="col-12 col-lg-4">
            <div class="card shadow-sm border mb-4">
                <div class="card-header bg-white py-3">
                    <h6 class="mb-0 fw-bold text-dark">
                        <i class="bi bi-key-fill text-warning me-2"></i>Change Password
                    </h6>
                </div>
                <div class="card-body p-3 p-md-4">
                    <!-- Password Message Alert -->
                    <asp:Label ID="lblPasswordMsg" runat="server" EnableViewState="false"></asp:Label>

                    <div class="alert alert-info py-2 px-3 small mb-3">
                        <i class="bi bi-info-circle me-1"></i>Password update will reflect directly in <code>backend_password</code>.
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold text-muted mb-1">
                            Current Password <span class="text-danger">*</span>
                        </label>
                        <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password" placeholder="Enter current password"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold text-muted mb-1">
                            New Password <span class="text-danger">*</span>
                        </label>
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password" placeholder="Enter new password"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold text-muted mb-1">
                            Confirm New Password <span class="text-danger">*</span>
                        </label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password" placeholder="Re-enter new password"></asp:TextBox>
                    </div>

                    <div class="border-top pt-3 mt-3">
                        <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" CssClass="btn btn-sm btn-warning w-100 fw-semibold text-dark" OnClick="btnUpdatePassword_Click" />
                    </div>
                </div>
            </div>

             
        </div>
    </div>
</asp:Content>
