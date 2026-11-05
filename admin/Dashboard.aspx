<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Executive Dashboard</h2>
            <p class="nj-page-subtitle">Welcome back, Admin. Real-time overview of leads, team operations & follow-ups.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <a href="AddLead.aspx" class="btn btn-nj-primary btn-sm">
                <i class="bi bi-plus-circle"></i> Add Lead
            </a>
            <a href="AssignLeads.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-arrow-left-right"></i> Assign Leads
            </a>
            <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Exporting monthly summary report (sample)...');">
                <i class="bi bi-download"></i> Export
            </button>
        </div>
    </div>

    <!-- 6 Summary KPI Cards -->
    <div class="row g-3 mb-4">
        <!-- 1. Total Leads -->
        <div class="col-12 col-sm-6 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Total Leads</div>
                    <asp:Label ID="lblTotalLeads" runat="server" CssClass="stat-value d-block" Text="0" />
                    <div class="stat-meta text-success">
                        <i class="bi bi-arrow-up-short fs-6"></i>
                        <span>+18% this month</span>
                    </div>
                </div>
                <div class="nj-stat-icon green">
                    <i class="bi bi-people-fill"></i>
                </div>
            </div>
        </div>

        <!-- 2. Confirmed Leads -->
        <div class="col-12 col-sm-6 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Confirmed</div>
                    <asp:Label ID="lblConfirmedLeads" runat="server" CssClass="stat-value text-success d-block" Text="0" />
                    <div class="stat-meta text-muted">
                        <asp:Label ID="lblConversion" runat="server" CssClass="badge bg-success-subtle text-success" Text="0% Conv." />
                    </div>
                </div>
                <div class="nj-stat-icon green">
                    <i class="bi bi-check-circle-fill"></i>
                </div>
            </div>
        </div>

        <!-- 3. Pending Leads -->
        <div class="col-12 col-sm-6 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Pending Leads</div>
                    <asp:Label ID="lblPendingLeads" runat="server" CssClass="stat-value text-warning d-block" Text="0" />
                    <div class="stat-meta text-muted">
                        <span>Follow-up queue</span>
                    </div>
                </div>
                <div class="nj-stat-icon amber">
                    <i class="bi bi-hourglass-split"></i>
                </div>
            </div>
        </div>

        <!-- 4. Hot Leads -->
        <div class="col-12 col-sm-6 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Hot Leads</div>
                    <asp:Label ID="lblHotLeads" runat="server" CssClass="stat-value text-danger d-block" Text="0" />
                    <div class="stat-meta text-danger">
                        <i class="bi bi-fire fs-6"></i>
                        <span>High Priority</span>
                    </div>
                </div>
                <div class="nj-stat-icon red">
                    <i class="bi bi-fire"></i>
                </div>
            </div>
        </div>

        <!-- 5. Total Employees -->
        <div class="col-12 col-sm-6 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Total Staff</div>
                    <asp:Label ID="lblTotalEmployees" runat="server" CssClass="stat-value text-primary d-block" Text="0" />
                    <div class="stat-meta text-muted">
                        <span>Active Team</span>
                    </div>
                </div>
                <div class="nj-stat-icon blue">
                    <i class="bi bi-person-badge-fill"></i>
                </div>
            </div>
        </div>

        <!-- 6. Today's Follow-ups -->
        <div class="col-12 col-sm-6 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Today Follow-ups</div>
                    <asp:Label ID="lblTodayFollowups" runat="server" CssClass="stat-value text-teal d-block" Text="0" />
                    <div class="stat-meta text-muted">
                        <asp:Label ID="lblPendingFollowups" runat="server" CssClass="badge bg-danger-subtle text-danger" Text="0 Pending" />
                    </div>
                </div>
                <div class="nj-stat-icon teal">
                    <i class="bi bi-calendar2-check-fill"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Dashboard Main Grid: Recent Leads -->
    <div class="row g-3 mb-4">
        <!-- Recent Leads Table -->
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-clock-history"></i> Recent Leads</h6>
                        <small class="text-muted">Latest travel inquiries recorded across all channels</small>
                    </div>
                    <a href="AllLeads.aspx" class="btn btn-nj-outline btn-sm">
                        View All Leads <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Lead ID</th>
                                    <th>Client Name</th>
                                    <th>Mobile</th>
                                    <th>City / Destination</th>
                                    <th>Lead Source</th>
                                    <th>Created By</th>
                                    <th>Assigned Employee</th>
                                    <th>Status</th>
                                    <th>Priority</th>
                                    <th>Next Follow-up</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptRecentLeads" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <span class="fw-bold text-success">#<%# Eval("lead_code") %></span>
                                            </td>
                                            <td>
                                                <div class="fw-semibold text-dark"><%# Eval("client_name") %></div>
                                            </td>
                                            <td>
                                                <a href='tel:+91<%# Eval("mobile") %>' class="text-decoration-none text-dark">
                                                    <i class="bi bi-telephone text-muted me-1 small"></i><%# Eval("mobile") %>
                                                </a>
                                            </td>
                                            <td>
                                                <div><%# Eval("city") %></div>
                                                <small class="text-muted"><%# Eval("destination") %></small>
                                            </td>
                                            <td>
                                                <span class="badge bg-light text-dark border"><%# ((System.Data.DataRowView)Container.DataItem).Row.Table.Columns.Contains("lead_source") ? Eval("lead_source") : "Direct" %></span>
                                            </td>
                                            <td>
                                                <%# Eval("created_by") %>
                                            </td>
                                            <td>
                                                <span class="badge bg-primary-subtle text-primary">
                                                    <%# Eval("assigned_employee_id") == DBNull.Value || string.IsNullOrEmpty(Eval("assigned_employee_id").ToString()) ? "Not Assigned" : Eval("assigned_employee_id") %>
                                                </span>
                                            </td>
                                            <td>
                                                <span class='badge <%# Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "confirmed" ? "bg-success-subtle text-success" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "interested" ? "bg-info-subtle text-info" : "bg-warning-subtle text-warning") %>'>
                                                    <%# Eval("lead_status") %>
                                                </span>
                                            </td>
                                            <td>
                                                <span class='badge <%# Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "hot" ? "badge-priority-hot" : (Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "warm" ? "badge-priority-warm" : "badge-priority-cold") %>'>
                                                    <%# Eval("lead_priority") %>
                                                </span>
                                            </td>
                                            <td>
                                                <small class="text-muted"><%# Eval("followup_date") == DBNull.Value || Eval("followup_date") == null ? "-" : Eval("followup_date") %></small>
                                            </td>
                                            <td class="text-end">
                                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#viewLeadModal" 
                                                        data-name='<%# Eval("client_name") %>' 
                                                        data-phone='<%# Eval("mobile") %>' 
                                                        data-dest='<%# Eval("destination") %>' 
                                                        data-owner='<%# Eval("created_by") %>' 
                                                        data-assigned='<%# Eval("assigned_employee_id") %>' 
                                                        data-status='<%# Eval("lead_status") %>' 
                                                        data-priority='<%# Eval("lead_priority") %>' 
                                                        title="View Details">
                                                    <i class="bi bi-eye"></i> View
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
        </div>
    </div>

    <!-- Upcoming Follow-ups Table -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-calendar-event"></i> Upcoming Follow-ups</h6>
                        <small class="text-muted">Client communications scheduled for today and tomorrow</small>
                    </div>
                    <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">
                        View All Follow-ups <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Client Name</th>
                                    <th>Mobile</th>
                                    <th>Package / Destination</th>
                                    <th>Assigned Employee</th>
                                    <th>Follow-up Date & Time</th>
                                    <th>Status</th>
                                    <th class="text-end">Quick Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptUpcomingFollowups" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <div class="fw-semibold"><%# Eval("client_name") %></div>
                                                <div class="text-muted small"><%# Eval("city") %></div>
                                            </td>

                                            <td>
                                                <a href='tel:+91<%# Eval("mobile") %>' class="text-decoration-none text-dark">
                                                    <%# Eval("mobile") %>
                                                </a>
                                            </td>

                                            <td><%# Eval("destination") %></td>

                                            <td>
                                                <span class="badge bg-primary-subtle text-primary">
                                                    <%# Eval("assigned_employee_id") == DBNull.Value || string.IsNullOrEmpty(Eval("assigned_employee_id").ToString()) ? "Not Assigned" : Eval("assigned_employee_id") %>
                                                </span>
                                            </td>

                                            <td>
                                                <span class="fw-semibold text-dark">
                                                    <%# Convert.ToDateTime(Eval("followup_date")).ToString("dd MMM yyyy, hh:mm tt") %>
                                                </span>
                                            </td>

                                            <td>
                                                <span class='badge <%# Eval("lead_status").ToString().ToLower() == "confirmed" ? "bg-success-subtle text-success" : (Eval("lead_status").ToString().ToLower() == "interested" ? "badge-status-interested" : "badge-status-pending") %>'>
                                                    <%# Eval("lead_status") %>
                                                </span>
                                            </td>

                                            <td class="text-end">
                                                <div class="d-inline-flex gap-1 justify-content-end">
                                                    <a href='tel:+91<%# Eval("mobile") %>' class="btn btn-nj-primary btn-sm text-nowrap" title="Call Client">
                                                        <i class="bi bi-telephone-outbound me-1"></i>Call
                                                    </a>
                                                    <asp:LinkButton ID="btnUpdateCall" runat="server"
                                                        CssClass="btn btn-nj-outline btn-sm text-nowrap"
                                                        CommandArgument='<%# Eval("lead_code") %>'
                                                        OnClick="btnUpdateCall_Click"
                                                        CausesValidation="false"
                                                        title="Update Call Details">
                                                        <i class="bi bi-telephone-forward me-1"></i>Update Call
                                                    </asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Lead Details View Modal -->
    <div class="modal fade" id="viewLeadModal" tabindex="-1" aria-labelledby="viewLeadModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="viewLeadModalLabel">
                        <i class="bi bi-person-badge text-success me-1"></i>Lead Quick Preview
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="d-flex align-items-center justify-content-between mb-3 p-2 bg-light rounded">
                        <div>
                            <h6 class="mb-0 fw-bold" id="m-lead-name">Rohit Verma</h6>
                            <span class="text-muted small" id="m-lead-phone">+91 98765 43210</span>
                        </div>
                        <div>
                            <span class="badge badge-priority-hot" id="m-lead-priority">Hot</span>
                            <span class="badge badge-status-interested" id="m-lead-status">Interested</span>
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <div class="p-2 border rounded">
                                <small class="text-muted d-block">Destination / Package</small>
                                <span class="fw-semibold small" id="m-lead-dest">Kashmir 5N/6D</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border rounded">
                                <small class="text-muted d-block">Original Lead Owner (Credit)</small>
                                <span class="fw-semibold small" id="m-lead-owner">Rakesh Yadav</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border rounded">
                                <small class="text-muted d-block">Currently Assigned To</small>
                                <span class="fw-semibold small text-success" id="m-lead-assigned">Priya Sharma</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border rounded">
                                <small class="text-muted d-block">Lead Source</small>
                                <span class="fw-semibold small">Google / Internet</span>
                            </div>
                        </div>
                    </div>

                    <div class="alert alert-light border small text-muted mb-0">
                        <i class="bi bi-info-circle text-success me-1"></i>
                        <strong>CRM Note:</strong> Lead owner remains accredited to the initial acquirer even if assigned to another team member for follow-ups.
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <a href="AllLeads.aspx" class="btn btn-sm btn-nj-outline">Open in All Leads</a>
                    <button type="button" class="btn btn-sm btn-nj-primary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Small Modal for Updating Call Details -->
    <div class="modal fade" id="updateCallModal" tabindex="-1" aria-labelledby="updateCallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">

                <div class="modal-header border-bottom py-2">
                    <h6 class="modal-title fw-bold" id="updateCallModalLabel">
                        <i class="bi bi-telephone-forward text-success me-1"></i>Update Call
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">

                    <asp:HiddenField ID="hfLeadCode" runat="server" />

                    <div class="mb-3 p-2 bg-light rounded d-flex justify-content-between align-items-center">
                        <div>
                            <asp:Label ID="lblModalClientName" runat="server"
                                Text="Client" CssClass="fw-semibold small d-block" />

                            <asp:Label ID="lblModalClientPhone" runat="server"
                                Text="+91" CssClass="text-muted small" />
                        </div>
                        <span class="badge bg-primary-subtle text-primary">Follow-up</span>
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">
                            Call Status <span class="text-danger">*</span>
                        </label>

                        <asp:DropDownList ID="ddlCallStatus" runat="server"
                            CssClass="form-select form-select-sm">
                            <asp:ListItem Text="-- Select Status --" Value="" />
                            <asp:ListItem Text="Answered" Value="Answered" />
                            <asp:ListItem Text="Not Answered" Value="Not Answered" />
                            <asp:ListItem Text="Busy" Value="Busy" />
                            <asp:ListItem Text="Switched Off" Value="Switched Off" />
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="rfvCallStatus" runat="server"
                            ControlToValidate="ddlCallStatus"
                            InitialValue=""
                            ErrorMessage="Please select call status."
                            CssClass="text-danger small"
                            Display="Dynamic"
                            ValidationGroup="CallUpdate" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Next Follow-up Date & Time</label>

                        <asp:TextBox ID="txtNextFollowUp" runat="server"
                            TextMode="DateTimeLocal"
                            CssClass="form-control form-control-sm" />
                    </div>

                    <div class="mb-2">
                        <label class="form-label small fw-semibold">Call Remarks</label>

                        <asp:TextBox ID="txtCallRemarks" runat="server"
                            TextMode="MultiLine"
                            Rows="3"
                            CssClass="form-control form-control-sm"
                            placeholder="Enter conversation details, client response, notes..." />
                    </div>

                </div>

                <div class="modal-footer border-top py-2">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">
                        Cancel
                    </button>

                    <asp:Button ID="btnSaveCallUpdate" runat="server"
                        Text="Save"
                        CssClass="btn btn-nj-primary btn-sm"
                        ValidationGroup="CallUpdate" 
                        OnClick="btnSaveCallUpdate_Click" />
                </div>

            </div>
        </div>
    </div>

    <!-- Client-side Scripts -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var viewModal = document.getElementById('viewLeadModal');
            if (viewModal) {
                viewModal.addEventListener('show.bs.modal', function (event) {
                    var button = event.relatedTarget;
                    if (button) {
                        var name = button.getAttribute('data-name');
                        var phone = button.getAttribute('data-phone');
                        var dest = button.getAttribute('data-dest');
                        var owner = button.getAttribute('data-owner');
                        var assigned = button.getAttribute('data-assigned');
                        var status = button.getAttribute('data-status');
                        var priority = button.getAttribute('data-priority');

                        if (name) document.getElementById('m-lead-name').textContent = name;
                        if (phone) document.getElementById('m-lead-phone').textContent = phone;
                        if (dest) document.getElementById('m-lead-dest').textContent = dest;
                        if (owner) document.getElementById('m-lead-owner').textContent = owner;
                        if (assigned) document.getElementById('m-lead-assigned').textContent = assigned;
                        if (status) document.getElementById('m-lead-status').textContent = status;
                        if (priority) document.getElementById('m-lead-priority').textContent = priority;
                    }
                });
            }
        });

        // Helper function to open Update Call modal
        function openUpdateCallModal() {
            var modalEl = document.getElementById('updateCallModal');
            if (modalEl) {
                var modal = bootstrap.Modal.getOrCreateInstance(modalEl);
                modal.show();
            }
        }
    </script>
</asp:Content>
