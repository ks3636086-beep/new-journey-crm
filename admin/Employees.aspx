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
                <i class="bi bi-person-plus-fill"></i> Add Employee
            </button>
            <a href="EmployeeCategories.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-tags"></i> Manage Categories
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
                <h6 class="mb-0"><i class="bi bi-people"></i> Staff Directory</h6>
                <small class="text-muted">All categories login to the same unified Employee Panel</small>
            </div>
            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="alert('Exporting staff roster...');">
                <i class="bi bi-download"></i> Export Roster
            </button>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead>
                        <tr>
                            <th>Employee ID</th>
                            <th>Staff Member</th>
                            <th>Mobile</th>
                            <th>Email & Username</th>
                            <th>Category</th>
                            <th class="text-center">Total Leads</th>
                            <th>Status</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Staff 1 -->
                        <tr>
                            <td><span class="fw-bold text-success">#EMP-01</span></td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="nj-avatar bg-primary" style="width: 32px; height: 32px; font-size: 0.8rem;">PS</div>
                                    <div>
                                        <div class="fw-bold">Priya Sharma</div>
                                        <small class="text-muted">Senior Sales Executive</small>
                                    </div>
                                </div>
                            </td>
                            <td><a href="tel:+919839088771" class="text-decoration-none text-dark">+91 98390 88771</a></td>
                            <td>
                                <div>priya@newjourneyholidays.com</div>
                                <small class="text-muted">User: <code>priya_nj</code></small>
                            </td>
                            <td><span class="badge bg-primary-subtle text-primary">Sales</span></td>
                            <td class="text-center"><span class="badge bg-light text-dark border fw-bold">68 Leads</span></td>
                            <td><span class="badge bg-success-subtle text-success"><i class="bi bi-dot"></i> Active</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editEmployee('EMP-01', 'Priya Sharma', '+91 98390 88771', 'priya@newjourneyholidays.com', 'priya_nj', 'Sales', 'Active');" title="Edit Staff">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Staff 2 -->
                        <tr>
                            <td><span class="fw-bold text-success">#EMP-02</span></td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="nj-avatar bg-warning text-dark" style="width: 32px; height: 32px; font-size: 0.8rem;">RY</div>
                                    <div>
                                        <div class="fw-bold">Rakesh Yadav</div>
                                        <small class="text-muted">Field Sales Lead (Eastern UP)</small>
                                    </div>
                                </div>
                            </td>
                            <td><a href="tel:+919415033442" class="text-decoration-none text-dark">+91 94150 33442</a></td>
                            <td>
                                <div>rakesh@newjourneyholidays.com</div>
                                <small class="text-muted">User: <code>rakesh_field</code></small>
                            </td>
                            <td><span class="badge bg-warning-subtle text-warning">Field</span></td>
                            <td class="text-center"><span class="badge bg-light text-dark border fw-bold">84 Leads</span></td>
                            <td><span class="badge bg-success-subtle text-success"><i class="bi bi-dot"></i> Active</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editEmployee('EMP-02', 'Rakesh Yadav', '+91 94150 33442', 'rakesh@newjourneyholidays.com', 'rakesh_field', 'Field', 'Active');" title="Edit Staff">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Staff 3 -->
                        <tr>
                            <td><span class="fw-bold text-success">#EMP-03</span></td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="nj-avatar bg-info" style="width: 32px; height: 32px; font-size: 0.8rem;">PS</div>
                                    <div>
                                        <div class="fw-bold">Pooja Srivastava</div>
                                        <small class="text-muted">Telecalling Team Lead</small>
                                    </div>
                                </div>
                            </td>
                            <td><a href="tel:+919792011225" class="text-decoration-none text-dark">+91 97920 11225</a></td>
                            <td>
                                <div>pooja@newjourneyholidays.com</div>
                                <small class="text-muted">User: <code>pooja_call</code></small>
                            </td>
                            <td><span class="badge bg-info-subtle text-info">Calling</span></td>
                            <td class="text-center"><span class="badge bg-light text-dark border fw-bold">92 Leads</span></td>
                            <td><span class="badge bg-success-subtle text-success"><i class="bi bi-dot"></i> Active</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editEmployee('EMP-03', 'Pooja Srivastava', '+91 97920 11225', 'pooja@newjourneyholidays.com', 'pooja_call', 'Calling', 'Active');" title="Edit Staff">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Staff 4 -->
                        <tr>
                            <td><span class="fw-bold text-success">#EMP-04</span></td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="nj-avatar bg-primary" style="width: 32px; height: 32px; font-size: 0.8rem;">MT</div>
                                    <div>
                                        <div class="fw-bold">Manoj Tiwari</div>
                                        <small class="text-muted">Direct Sales Consultant</small>
                                    </div>
                                </div>
                            </td>
                            <td><a href="tel:+919839955443" class="text-decoration-none text-dark">+91 98399 55443</a></td>
                            <td>
                                <div>manoj@newjourneyholidays.com</div>
                                <small class="text-muted">User: <code>manoj_sales</code></small>
                            </td>
                            <td><span class="badge bg-primary-subtle text-primary">Sales</span></td>
                            <td class="text-center"><span class="badge bg-light text-dark border fw-bold">45 Leads</span></td>
                            <td><span class="badge bg-success-subtle text-success"><i class="bi bi-dot"></i> Active</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editEmployee('EMP-04', 'Manoj Tiwari', '+91 98399 55443', 'manoj@newjourneyholidays.com', 'manoj_sales', 'Sales', 'Active');" title="Edit Staff">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Staff 5 -->
                        <tr>
                            <td><span class="fw-bold text-success">#EMP-05</span></td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="nj-avatar bg-info" style="width: 32px; height: 32px; font-size: 0.8rem;">AV</div>
                                    <div>
                                        <div class="fw-bold">Ankita Verma</div>
                                        <small class="text-muted">Inbound Calling Executive</small>
                                    </div>
                                </div>
                            </td>
                            <td><a href="tel:+919451122334" class="text-decoration-none text-dark">+91 94511 22334</a></td>
                            <td>
                                <div>ankita@newjourneyholidays.com</div>
                                <small class="text-muted">User: <code>ankita_call</code></small>
                            </td>
                            <td><span class="badge bg-info-subtle text-info">Calling</span></td>
                            <td class="text-center"><span class="badge bg-light text-dark border fw-bold">38 Leads</span></td>
                            <td><span class="badge bg-success-subtle text-success"><i class="bi bi-dot"></i> Active</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editEmployee('EMP-05', 'Ankita Verma', '+91 94511 22334', 'ankita@newjourneyholidays.com', 'ankita_call', 'Calling', 'Active');" title="Edit Staff">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Staff 6 -->
                        <tr>
                            <td><span class="fw-bold text-success">#EMP-06</span></td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="nj-avatar bg-secondary" style="width: 32px; height: 32px; font-size: 0.8rem;">SM</div>
                                    <div>
                                        <div class="fw-bold">Sunil Mishra</div>
                                        <small class="text-muted">Package & Tariff Specialist</small>
                                    </div>
                                </div>
                            </td>
                            <td><a href="tel:+919838166554" class="text-decoration-none text-dark">+91 98381 66554</a></td>
                            <td>
                                <div>sunil@newjourneyholidays.com</div>
                                <small class="text-muted">User: <code>sunil_data</code></small>
                            </td>
                            <td><span class="badge bg-secondary-subtle text-secondary">Data Entry</span></td>
                            <td class="text-center"><span class="badge bg-light text-dark border fw-bold">12 Leads</span></td>
                            <td><span class="badge bg-success-subtle text-success"><i class="bi bi-dot"></i> Active</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editEmployee('EMP-06', 'Sunil Mishra', '+91 98381 66554', 'sunil@newjourneyholidays.com', 'sunil_data', 'Data Entry', 'Active');" title="Edit Staff">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Staff 7 -->
                        <tr>
                            <td><span class="fw-bold text-success">#EMP-07</span></td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="nj-avatar bg-warning text-dark" style="width: 32px; height: 32px; font-size: 0.8rem;">VD</div>
                                    <div>
                                        <div class="fw-bold">Vikas Dubey</div>
                                        <small class="text-muted">Field Agent (Deoria & Kushinagar)</small>
                                    </div>
                                </div>
                            </td>
                            <td><a href="tel:+919793044112" class="text-decoration-none text-dark">+91 97930 44112</a></td>
                            <td>
                                <div>vikas@newjourneyholidays.com</div>
                                <small class="text-muted">User: <code>vikas_field</code></small>
                            </td>
                            <td><span class="badge bg-warning-subtle text-warning">Field</span></td>
                            <td class="text-center"><span class="badge bg-light text-dark border fw-bold">31 Leads</span></td>
                            <td><span class="badge bg-danger-subtle text-danger"><i class="bi bi-dot"></i> Inactive</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editEmployee('EMP-07', 'Vikas Dubey', '+91 97930 44112', 'vikas@newjourneyholidays.com', 'vikas_field', 'Field', 'Inactive');" title="Edit Staff">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>
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
                        <i class="bi bi-person-plus text-success me-1"></i> Add New Employee
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Full Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="add_name" placeholder="e.g. Alok Nath Pandey" required="required" />
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Mobile <span class="text-danger">*</span></label>
                            <input type="tel" class="form-control" id="add_mobile" placeholder="98765 00000" required="required" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Email <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" id="add_email" placeholder="name@domain.com" required="required" />
                        </div>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Username <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="add_username" placeholder="e.g. alok_sales" required="required" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Password <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="add_password" placeholder="••••••••" />
                                <button type="button" class="btn btn-outline-secondary" onclick="togglePassword('add_password');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Employee Category <span class="text-danger">*</span></label>
                            <select class="form-select" id="add_category">
                                <option value="Sales">Sales (Desk & Direct)</option>
                                <option value="Field">Field (Market Agent)</option>
                                <option value="Calling">Calling (Telecaller)</option>
                                <option value="Data Entry">Data Entry (Operations)</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label class="form-label">Account Status</label>
                            <select class="form-select" id="add_status">
                                <option value="Active" selected="selected">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                    <div class="alert alert-light border small text-muted mb-0">
                        <i class="bi bi-info-circle me-1"></i> All categories access the single shared Employee Panel. Sales employees can also make calls, and employees can register their own leads.
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Employee profile created (UI sample)!');" data-bs-dismiss="modal">
                        <i class="bi bi-check-lg"></i> Create Employee
                    </button>
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
                        <i class="bi bi-pencil-square text-success me-1"></i> Edit Employee Profile
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
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
