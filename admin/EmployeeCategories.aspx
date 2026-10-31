<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeCategories.aspx.cs" Inherits="EmployeeCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Employee Categories | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Employee Categories</h2>
            <p class="nj-page-subtitle">Configure organizational roles and permissions within the unified Employee Panel.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                <i class="bi bi-plus-circle"></i> Add Category
            </button>
            <a href="Employees.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-people"></i> View Employees
            </a>
        </div>
    </div>

    <!-- Single Panel Clarification Notice -->
    <div class="alert alert-light border py-2 px-3 mb-4 small d-flex align-items-center gap-2">
        <i class="bi bi-info-circle-fill text-success fs-5"></i>
        <div>
            <strong>Single Employee Portal Architecture:</strong> All categories (Sales, Field, Calling, Data Entry, etc.) access the same Employee Portal. Sales executives can also perform calling activities, and Field staff can capture and register their own leads.
        </div>
    </div>

    <!-- Category Highlights Cards -->
    <div class="row g-3 mb-4">
        <!-- Sales -->
        <div class="col-12 col-md-6 col-xl-3">
            <div class="card h-100 p-3 border-start border-4 border-primary">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <span class="badge bg-primary-subtle text-primary fw-bold px-2 py-1">Sales</span>
                    <span class="fw-bold fs-5 text-dark">4 Staff</span>
                </div>
                <div class="fw-semibold text-dark mb-1">Direct Sales & Closures</div>
                <p class="text-muted small mb-0">High-ticket itinerary customization, direct client consultations, and booking confirmations.</p>
            </div>
        </div>

        <!-- Field -->
        <div class="col-12 col-md-6 col-xl-3">
            <div class="card h-100 p-3 border-start border-4 border-warning">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <span class="badge bg-warning-subtle text-warning fw-bold px-2 py-1">Field</span>
                    <span class="fw-bold fs-5 text-dark">3 Staff</span>
                </div>
                <div class="fw-semibold text-dark mb-1">On-Ground Promotions</div>
                <p class="text-muted small mb-0">Corporate visits, institutional leads, and market promotions across Gorakhpur and Eastern UP.</p>
            </div>
        </div>

        <!-- Calling -->
        <div class="col-12 col-md-6 col-xl-3">
            <div class="card h-100 p-3 border-start border-4 border-info">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <span class="badge bg-info-subtle text-info fw-bold px-2 py-1">Calling</span>
                    <span class="fw-bold fs-5 text-dark">4 Staff</span>
                </div>
                <div class="fw-semibold text-dark mb-1">Telecalling Desk</div>
                <p class="text-muted small mb-0">Inbound inquiries, cold outreach, follow-up calls, and lead qualification for sales handover.</p>
            </div>
        </div>

        <!-- Data Entry -->
        <div class="col-12 col-md-6 col-xl-3">
            <div class="card h-100 p-3 border-start border-4 border-secondary">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <span class="badge bg-secondary-subtle text-secondary fw-bold px-2 py-1">Data Entry</span>
                    <span class="fw-bold fs-5 text-dark">1 Staff</span>
                </div>
                <div class="fw-semibold text-dark mb-1">Operations & Tariff</div>
                <p class="text-muted small mb-0">Package catalog maintenance, supplier rates, flight ticketing notes and data cleanup.</p>
            </div>
        </div>
    </div>

    <!-- Categories Table Card -->
    <div class="card">
        <div class="card-header bg-white">
            <div>
                <h6 class="mb-0"><i class="bi bi-tags"></i> Active Employee Categories</h6>
                <small class="text-muted">Extensible structure to support future departments like Ticketing or Visa Desk</small>
            </div>
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                <i class="bi bi-plus-lg"></i> New Category
            </button>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead>
                        <tr>
                            <th>Category Name</th>
                            <th>Description</th>
                            <th>Primary Capabilities</th>
                            <th class="text-center">Assigned Employees</th>
                            <th>Status</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Row 1: Sales -->
                        <tr>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <span class="p-2 bg-primary-subtle text-primary rounded"><i class="bi bi-briefcase-fill"></i></span>
                                    <div>
                                        <div class="fw-bold">Sales</div>
                                        <small class="text-muted">Code: <code>CAT-SALES</code></small>
                                    </div>
                                </div>
                            </td>
                            <td>Consults clients, plans custom itineraries, closes domestic and international holiday bookings.</td>
                            <td><span class="badge bg-light text-dark border">Add Leads, Follow-up, Close, Calling</span></td>
                            <td class="text-center"><span class="badge bg-light text-primary border fw-bold">4 Employees</span></td>
                            <td><span class="badge bg-success-subtle text-success">Active</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editCategory('Sales', 'Consults clients, plans custom itineraries, closes domestic and international holiday bookings.', 'Active');">
                                    <i class="bi bi-pencil"></i> Edit
                                </button>
                                <button type="button" class="btn btn-outline-danger btn-sm" onclick="confirmDeleteCategory('Sales', 4);">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 2: Field -->
                        <tr>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <span class="p-2 bg-warning-subtle text-warning rounded"><i class="bi bi-geo-alt-fill"></i></span>
                                    <div>
                                        <div class="fw-bold">Field</div>
                                        <small class="text-muted">Code: <code>CAT-FIELD</code></small>
                                    </div>
                                </div>
                            </td>
                            <td>Travels across Gorakhpur, Basti, Deoria and surrounding regions generating offline leads.</td>
                            <td><span class="badge bg-light text-dark border">Capture Leads, Direct Visits, B2B</span></td>
                            <td class="text-center"><span class="badge bg-light text-warning border fw-bold">3 Employees</span></td>
                            <td><span class="badge bg-success-subtle text-success">Active</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editCategory('Field', 'Travels across Gorakhpur, Basti, Deoria and surrounding regions generating offline leads.', 'Active');">
                                    <i class="bi bi-pencil"></i> Edit
                                </button>
                                <button type="button" class="btn btn-outline-danger btn-sm" onclick="confirmDeleteCategory('Field', 3);">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 3: Calling -->
                        <tr>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <span class="p-2 bg-info-subtle text-info rounded"><i class="bi bi-telephone-fill"></i></span>
                                    <div>
                                        <div class="fw-bold">Calling</div>
                                        <small class="text-muted">Code: <code>CAT-CALL</code></small>
                                    </div>
                                </div>
                            </td>
                            <td>Dedicated calling team that dials internet leads, qualifies interest, and schedules follow-up calls.</td>
                            <td><span class="badge bg-light text-dark border">Outbound Calling, Lead Qualification, Follow-ups</span></td>
                            <td class="text-center"><span class="badge bg-light text-info border fw-bold">4 Employees</span></td>
                            <td><span class="badge bg-success-subtle text-success">Active</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editCategory('Calling', 'Dedicated calling team that dials internet leads, qualifies interest, and schedules follow-up calls.', 'Active');">
                                    <i class="bi bi-pencil"></i> Edit
                                </button>
                                <button type="button" class="btn btn-outline-danger btn-sm" onclick="confirmDeleteCategory('Calling', 4);">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 4: Data Entry -->
                        <tr>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <span class="p-2 bg-secondary-subtle text-secondary rounded"><i class="bi bi-keyboard-fill"></i></span>
                                    <div>
                                        <div class="fw-bold">Data Entry</div>
                                        <small class="text-muted">Code: <code>CAT-DATA</code></small>
                                    </div>
                                </div>
                            </td>
                            <td>Uploads tour packages, hotels, seasonal pricing, and transfers offline forms into the CRM.</td>
                            <td><span class="badge bg-light text-dark border">Package Entry, Rate Cards, Record Logging</span></td>
                            <td class="text-center"><span class="badge bg-light text-secondary border fw-bold">1 Employee</span></td>
                            <td><span class="badge bg-success-subtle text-success">Active</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="editCategory('Data Entry', 'Uploads tour packages, hotels, seasonal pricing, and transfers offline forms into the CRM.', 'Active');">
                                    <i class="bi bi-pencil"></i> Edit
                                </button>
                                <button type="button" class="btn btn-outline-danger btn-sm" onclick="confirmDeleteCategory('Data Entry', 1);">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Add Category Modal -->
    <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCatTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="addCatTitle">
                        <i class="bi bi-plus-circle text-success me-1"></i> Add Employee Category
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Category Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="new_cat_name" placeholder="e.g. Ticketing Specialist / Visa Desk" required="required" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description <span class="text-danger">*</span></label>
                        <textarea class="form-control" id="new_cat_desc" rows="3" placeholder="Describe role responsibilities within the travel agency..."></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Category Status</label>
                        <select class="form-select" id="new_cat_status">
                            <option value="Active" selected="selected">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    <div class="alert alert-light border small text-muted mb-0">
                        <i class="bi bi-check-circle-fill text-success me-1"></i> Note: Employees assigned to this new category will use the standard Employee Panel without requiring additional portal builds.
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Category saved (UI sample)!');" data-bs-dismiss="modal">
                        Save Category
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Category Modal -->
    <div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCatTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="editCatTitle">
                        <i class="bi bi-pencil-square text-success me-1"></i> Edit Category
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="edit_cat_name" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea class="form-control" id="edit_cat_desc" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select class="form-select" id="edit_cat_status">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Category updated (UI sample)!');" data-bs-dismiss="modal">
                        Save Changes
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Category Modal -->
    <div class="modal fade" id="deleteCategoryModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-header border-0 pb-0">
                    <h6 class="modal-title fw-bold text-danger">Delete Category?</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-muted small pt-2">
                    <p class="mb-2">Are you sure you want to delete category <strong id="del_cat_name"></strong>?</p>
                    <div class="alert alert-warning py-1 px-2 small mb-0">
                        <i class="bi bi-exclamation-triangle me-1"></i> Currently assigned to <span id="del_cat_count"></span> employee(s).
                    </div>
                </div>
                <div class="modal-footer border-0 pt-0">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-danger" onclick="alert('Category deleted (UI sample).');" data-bs-dismiss="modal">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function editCategory(name, desc, status) {
            document.getElementById('edit_cat_name').value = name;
            document.getElementById('edit_cat_desc').value = desc;
            document.getElementById('edit_cat_status').value = status;
            var modal = new bootstrap.Modal(document.getElementById('editCategoryModal'));
            modal.show();
        }

        function confirmDeleteCategory(name, count) {
            document.getElementById('del_cat_name').textContent = name;
            document.getElementById('del_cat_count').textContent = count;
            var modal = new bootstrap.Modal(document.getElementById('deleteCategoryModal'));
            modal.show();
        }
    </script>
</asp:Content>
