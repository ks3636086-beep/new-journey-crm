<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Employees.aspx.cs" Inherits="Employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Employees | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Employee Management</h2>
            <p class="nj-page-subtitle">Manage agency staff, roles and access credentials across all operational departments.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addEmployeeModal">
                <i class="bi bi-person-plus-fill me-1"></i>Add Employee
            </button>
            <a href="EmployeeCategories.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-tags me-1"></i>Manage Categories
            </a>
        </div>
    </div>

    <!-- Search & Filter Card -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-4 col-lg-5">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="search" id="employeeSearchInput" class="form-control border-start-0" placeholder="Search by employee name, mobile or username..." autocomplete="off" name="emp_search_filter" onkeyup="filterEmployeesTable();" />
                    </div>
                </div>
                <div class="col-6 col-md-3 col-lg-2">
                    <asp:DropDownList ID="ddlCategoryFilter" runat="server"
                        CssClass="form-select form-select-sm"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlCategoryFilter_SelectedIndexChanged">
                        <asp:ListItem Value="">All Categories</asp:ListItem>
                        <asp:ListItem Value="Sales">Sales</asp:ListItem>
                        <asp:ListItem Value="Calling">Calling</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-6 col-md-3 col-lg-2">
                    <asp:DropDownList ID="ddlStatusFilter" runat="server"
                        CssClass="form-select form-select-sm"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlStatusFilter_SelectedIndexChanged">
                        <asp:ListItem Value="">All Statuses</asp:ListItem>
                        <asp:ListItem Value="Active">Active</asp:ListItem>
                        <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-md-2 col-lg-3 text-md-end text-nowrap">
                    <asp:Label ID="lblEmployeeCount" runat="server"
                        CssClass="small text-muted" />
                </div>
            </div>
        </div>
    </div>

    <!-- Employees Table Card -->
    <div class="card">
        <div class="card-header bg-white">
            <div>
                <h6 class="mb-0"><i class="bi bi-people"></i>Staff Directory</h6>
                <%--<small class="text-muted">All categories login to the same unified Employee Panel</small>--%>
            </div>
            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="alert('Exporting staff roster...');">
                <i class="bi bi-download"></i>Export Roster
           
            </button>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead>
                        <tr>

                            <th>Employee Code</th>
                            <th>Staff Name</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Username</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptEmployees" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><span class="fw-bold text-success">-<%# Eval("employee_code") %></span></td>
                                    <td>
                                        <div class="fw-semibold text-dark"><%# Eval("employee_name") %></div>
                                    </td>
                                    <td>
                                        <a href='tel:+91<%# Eval("employee_mobile") %>' class="text-decoration-none text-dark">
                                            <i class="bi bi-telephone text-muted me-1 small"></i><%# Eval("employee_mobile") %>
                                        </a>
                                    </td>
                                    <td>
                                        <span class="text-secondary">
                                            <i class="bi bi-envelope text-muted me-1 small"></i><%# Eval("employee_email") %>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-light text-dark border fw-normal px-2 py-1">@<%# Eval("employee_username") %>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-primary-subtle text-primary px-2 py-1">
                                            <%# Eval("employee_category") %>
                                        </span>
                                    </td>
                                    <td>
                                        <span class='badge <%# Eval("employee_status") != null && Eval("employee_status").ToString().ToLower() == "active" ? "bg-success-subtle text-success" : "bg-danger-subtle text-danger" %> px-2 py-1'>
                                            <i class="bi bi-dot"></i><%# Eval("employee_status") %>
                                        </span>
                                    </td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="editEmployee('<%# Eval("employee_id") %>', '<%# Eval("employee_name") %>', '<%# Eval("employee_mobile") %>', '<%# Eval("employee_email") %>', '<%# Eval("employee_username") %>', '<%# Eval("employee_category") %>', '<%# Eval("employee_status") %>');" title="Edit Staff">
                                            <i class="bi bi-pencil"></i>
                                        </button>

                                        <asp:LinkButton ID="btnDeleteEmployee" runat="server"
                                            CssClass="btn btn-outline-danger btn-sm"
                                            CommandArgument='<%# Eval("employee_id") %>'
                                             OnClick="btnDeleteEmployee_Click"
                                            CausesValidation="false"
                                            OnClientClick="return confirm('Are you sure you want to delete this employee?');"
                                            title="Delete Staff">
        <i class="bi bi-trash"></i>
    </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Add Employee Modal -->
    <div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="addEmpTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="addEmpTitle">
                        <i class="bi bi-person-plus text-success me-1"></i>Add New Employee
                    </h6>
                    <button type="button" class="btn-close" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="mb-3">
                        <label class="form-label">Full Name <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                            placeholder="e.g. Alok Nath Pandey" onkeyup="generateUsername(this.value);" oninput="generateUsername(this.value);">
                        </asp:TextBox>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Mobile <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMobile" runat="server" TextMode="Phone"
                                CssClass="form-control" placeholder="98765 00000">
                            </asp:TextBox>
                        </div>

                        <div class="col-6">
                            <label class="form-label">Email <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                                CssClass="form-control" placeholder="name@domain.com">
                            </asp:TextBox>
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Username <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtUsername" runat="server" ClientIDMode="Static"
                                CssClass="form-control" placeholder="Auto-generated username">
                            </asp:TextBox>
                        </div>

                        <div class="col-6">
                            <label class="form-label">Password <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="new-password"
                                    CssClass="form-control" placeholder="••••••••">
                                </asp:TextBox>

                                <button type="button" class="btn btn-outline-secondary"
                                    onclick="togglePassword('<%= txtPassword.ClientID %>');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Employee Category <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                <asp:ListItem Value="Sales">Sales</asp:ListItem>
                                <asp:ListItem Value="Calling">Calling</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="col-6">
                            <label class="form-label">Account Status</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Value="Active" Selected="True">Active</asp:ListItem>
                                <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="alert alert-light border small text-muted mb-0">
                        <i class="bi bi-info-circle me-1"></i>
                        All categories access the single shared Employee Panel. Sales employees can also make calls, and employees can register their own leads.
                    </div>

                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">
                        Cancel
                    </button>

                    <asp:Button ID="btnCreateEmployee" runat="server" Text="Create Employee" CssClass="btn btn-sm btn-nj-primary" OnClick="btnCreateEmployee_Click" UseSubmitBehavior="false" />
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Employee Modal -->
    <div class="modal fade" id="editEmployeeModal" tabindex="-1" aria-labelledby="editEmpTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header border-bottom py-2">
                    <h6 class="modal-title fw-bold" id="editEmpTitle">
                        <i class="bi bi-pencil-square text-success me-1"></i>Edit Employee Profile
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    <asp:HiddenField ID="edit_id" runat="server" ClientIDMode="Static" />

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Full Name <span class="text-danger">*</span></label>
                        <asp:TextBox ID="edit_name" runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" placeholder="e.g. Alok Nath Pandey"></asp:TextBox>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Mobile <span class="text-danger">*</span></label>
                            <asp:TextBox ID="edit_mobile" runat="server" TextMode="Phone" CssClass="form-control form-control-sm" ClientIDMode="Static" placeholder="98765 00000"></asp:TextBox>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Email <span class="text-danger">*</span></label>
                            <asp:TextBox ID="edit_email" runat="server" TextMode="Email" CssClass="form-control form-control-sm" ClientIDMode="Static" placeholder="name@domain.com"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Username <span class="text-danger">*</span></label>
                            <asp:TextBox ID="edit_username" runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" placeholder="e.g. alok_sales"></asp:TextBox>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Reset Password</label>
                            <div class="input-group">
                                <asp:TextBox ID="edit_password" runat="server" TextMode="Password" CssClass="form-control form-control-sm" ClientIDMode="Static" placeholder="Leave blank to keep"></asp:TextBox>
                                <button type="button" class="btn btn-outline-secondary btn-sm" onclick="togglePassword('edit_password');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Category <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="edit_category" runat="server" CssClass="form-select form-select-sm" ClientIDMode="Static">
                                <asp:ListItem Value="Sales">Sales (Desk & Direct)</asp:ListItem>
                                <asp:ListItem Value="Field">Field (Market Agent)</asp:ListItem>
                                <asp:ListItem Value="Calling">Calling (Telecaller)</asp:ListItem>
                                <asp:ListItem Value="Data Entry">Data Entry (Operations)</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Account Status</label>
                            <asp:DropDownList ID="edit_status" runat="server" CssClass="form-select form-select-sm" ClientIDMode="Static">
                                <asp:ListItem Value="Active">Active</asp:ListItem>
                                <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="alert alert-light border small text-muted mb-0">
                        <i class="bi bi-info-circle text-success me-1"></i>
                        Updating category or status modifies access permissions across the Employee Panel immediately.
                   
                    </div>
                </div>
                <div class="modal-footer border-top py-2">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>

                    <asp:Button ID="btnUpdateEmployee" runat="server" Text="Save Changes" CssClass="btn btn-sm btn-nj-primary" OnClick="btnUpdateEmployee_Click" CausesValidation="false" UseSubmitBehavior="false" />
                </div>
            </div>
        </div>
    </div>

    <script>
        // Clear browser autofill on search input on page load
        window.addEventListener('DOMContentLoaded', function () {
            var searchInput = document.getElementById('employeeSearchInput');
            if (searchInput) {
                searchInput.value = '';
                setTimeout(function () { searchInput.value = ''; }, 50);
                setTimeout(function () { searchInput.value = ''; }, 200);
            }
        });
        function filterEmployeesTable() {
            var input = document.getElementById('employeeSearchInput');
            if (!input) return;
            var filter = input.value.toLowerCase();
            var rows = document.querySelectorAll('.table tbody tr');
            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                row.style.display = (text.indexOf(filter) > -1) ? '' : 'none';
            });
        }

        function generateUsername(name) {
            var username = (name || '').toLowerCase().replace(/[^a-z0-9]/g, '');
            var userBox = document.getElementById('txtUsername') || document.getElementById('<%= txtUsername.ClientID %>');
            if (!userBox) return;

            if (username !== "") {
                var current = userBox.value || '';
                var existingNum = (current.indexOf('@') !== -1) ? current.split('@')[1] : '';
                var number = (existingNum && !isNaN(existingNum)) ? existingNum : (Math.floor(Math.random() * 90) + 10);
                userBox.value = username + '@' + number;
            } else {
                userBox.value = '';
            }
        }
        function togglePassword(id) {
            var input = document.getElementById(id);
            if (input) {
                if (input.type === 'password') {
                    input.type = 'text';
                } else {
                    input.type = 'password';
                }
            }
        }

        function editEmployee(id, name, mobile, email, username, category, status) {
            var elId = document.getElementById('edit_id');
            var elName = document.getElementById('edit_name');
            var elMobile = document.getElementById('edit_mobile');
            var elEmail = document.getElementById('edit_email');
            var elUsername = document.getElementById('edit_username');
            var elCategory = document.getElementById('edit_category');
            var elStatus = document.getElementById('edit_status');

            if (elId) elId.value = id;
            if (elName) elName.value = name;
            if (elMobile) elMobile.value = mobile;
            if (elEmail) elEmail.value = email;
            if (elUsername) elUsername.value = username;
            if (elCategory) elCategory.value = category;
            if (elStatus) elStatus.value = status;

            var modalEl = document.getElementById('editEmployeeModal');
            if (modalEl) {
                var modal = bootstrap.Modal.getOrCreateInstance(modalEl);
                modal.show();
            }
        }
    </script>
</asp:Content>
