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
                <i class="bi bi-person-plus-fill"></i>Add Employee
           
            </button>
            <a href="EmployeeCategories.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-tags"></i>Manage Categories
            </a>
        </div>
    </div>

    <!-- Category Distribution KPI Cards -->
    <div class="row g-3 mb-3">
        <div class="col-6 col-md-3">
            <div class="card p-3 h-100">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <span class="text-muted small">Sales Team</span>
                        <h4 class="fw-bold mb-0 text-dark">4</h4>
                    </div>
                    <span class="badge bg-primary-subtle text-primary p-2 fs-6"><i class="bi bi-briefcase"></i></span>
                </div>
                <div class="text-muted small mt-2">Conversion & client closing</div>
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="card p-3 h-100">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <span class="text-muted small">Calling Desk</span>
                        <h4 class="fw-bold mb-0 text-dark">4</h4>
                    </div>
                    <span class="badge bg-info-subtle text-info p-2 fs-6"><i class="bi bi-telephone"></i></span>
                </div>
                <div class="text-muted small mt-2">Telecalling & inquiries</div>
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="card p-3 h-100">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <span class="text-muted small">Field Force</span>
                        <h4 class="fw-bold mb-0 text-dark">3</h4>
                    </div>
                    <span class="badge bg-warning-subtle text-warning p-2 fs-6"><i class="bi bi-geo-alt"></i></span>
                </div>
                <div class="text-muted small mt-2">Gorakhpur & Eastern UP</div>
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="card p-3 h-100">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <span class="text-muted small">Data Entry</span>
                        <h4 class="fw-bold mb-0 text-dark">1</h4>
                    </div>
                    <span class="badge bg-secondary-subtle text-secondary p-2 fs-6"><i class="bi bi-keyboard"></i></span>
                </div>
                <div class="text-muted small mt-2">Itinerary & tariff updates</div>
            </div>
        </div>
    </div>

    <!-- Search & Filter Card -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-5">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" class="form-control border-start-0" placeholder="Search by employee name, mobile or username..." />
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <select class="form-select form-select-sm">
                        <option value="">All Categories</option>
                        <option value="Sales">Sales</option>
                        <option value="Field">Field</option>
                        <option value="Calling">Calling</option>
                        <option value="Data Entry">Data Entry</option>
                    </select>
                </div>
                <div class="col-6 col-md-2">
                    <select class="form-select form-select-sm">
                        <option value="">All Statuses</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <div class="col-12 col-md-2 text-md-end">
                    <span class="small text-muted">12 Employees Total</span>
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
                                        <span class="badge bg-light text-dark border fw-normal px-2 py-1">
                                            @<%# Eval("employee_username") %>
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
                            placeholder="e.g. Alok Nath Pandey" required="required"></asp:TextBox>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Mobile <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMobile" runat="server" TextMode="Phone"
                                CssClass="form-control" placeholder="98765 00000"
                                required="required"></asp:TextBox>
                        </div>

                        <div class="col-6">
                            <label class="form-label">Email <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                                CssClass="form-control" placeholder="name@domain.com"
                                required="required"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Username <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtUsername" runat="server"
                                CssClass="form-control" placeholder="e.g. alok_sales"
                                required="required"></asp:TextBox>
                        </div>

                        <div class="col-6">
                            <label class="form-label">Password <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                                    CssClass="form-control" placeholder="••••••••"
                                    required="required"></asp:TextBox>

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
                                <asp:ListItem Value="Sales">Sales (Desk & Direct)</asp:ListItem>
                                <asp:ListItem Value="Field">Field (Market Agent)</asp:ListItem>
                                <asp:ListItem Value="Calling">Calling (Telecaller)</asp:ListItem>
                                <asp:ListItem Value="Data Entry">Data Entry (Operations)</asp:ListItem>
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

                    <asp:Button ID="btnCreateEmployee" runat="server"
                        Text="Create Employee"
                        CssClass="btn btn-sm btn-nj-primary"
                         OnClick="btnCreateEmployee_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Employee Modal -->
    <div class="modal fade" id="editEmployeeModal" tabindex="-1" aria-labelledby="editEmpTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="editEmpTitle">
                        <i class="bi bi-pencil-square text-success me-1"></i>Edit Employee Profile
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    <input type="hidden" id="edit_id" />
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="edit_name" />
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Mobile</label>
                            <input type="tel" class="form-control" id="edit_mobile" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" id="edit_email" />
                        </div>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Username</label>
                            <input type="text" class="form-control" id="edit_username" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Reset Password</label>
                            <input type="password" class="form-control" placeholder="Leave blank to keep" />
                        </div>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Category</label>
                            <select class="form-select" id="edit_category">
                                <option value="Sales">Sales</option>
                                <option value="Field">Field</option>
                                <option value="Calling">Calling</option>
                                <option value="Data Entry">Data Entry</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label class="form-label">Status</label>
                            <select class="form-select" id="edit_status">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Employee profile updated (UI sample)!');" data-bs-dismiss="modal">
                        Save Changes
                   
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function togglePassword(id) {
            var input = document.getElementById(id);
            if (input.type === 'password') {
                input.type = 'text';
            } else {
                input.type = 'password';
            }
        }

        function editEmployee(id, name, mobile, email, username, category, status) {
            document.getElementById('edit_id').value = id;
            document.getElementById('edit_name').value = name;
            document.getElementById('edit_mobile').value = mobile;
            document.getElementById('edit_email').value = email;
            document.getElementById('edit_username').value = username;
            document.getElementById('edit_category').value = category;
            document.getElementById('edit_status').value = status;

            var modal = new bootstrap.Modal(document.getElementById('editEmployeeModal'));
            modal.show();
        }
    </script>
</asp:Content>
