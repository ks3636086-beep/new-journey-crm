<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="MyLeads.aspx.cs" Inherits="MyLeads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Leads | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">My Leads Directory</h2>
            <p class="nj-page-subtitle">All inquiries where you are either the original Lead Owner or the Assigned Employee for follow-up.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <a href="Add-Lead.aspx" class="btn btn-nj-primary btn-sm">
                <i class="bi bi-plus-circle"></i>Add New Lead
            </a>
            <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-calendar-check"></i>Follow-ups
            </a>
        </div>
    </div>


    <!-- Filters & Search Toolbar Card -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <!-- Search input -->
                <div class="col-12 col-md-4">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" id="leadSearchInput" class="form-control border-start-0" placeholder="Search customer, phone, city..." onkeyup="filterLeads();" />
                    </div>
                </div>

                <!-- Date Filter -->
                <div class="col-6 col-md-3">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0" title="Follow-up Date"><i class="bi bi-calendar-event text-muted"></i></span>
                        <input type="date" id="filterDate" class="form-control border-start-0" title="Filter by Follow-up Date" onchange="filterLeads();" />
                    </div>
                </div>

                <!-- Status Filter (New, Interested, Pending, Confirmed, Not Interested, Closed) -->
                <div class="col-6 col-md-2">
                    <select id="filterStatus" class="form-select form-select-sm" onchange="filterLeads();">
                        <option value="">All Statuses</option>
                        <option value="New">New</option>
                        <option value="Interested">Interested</option>
                        <option value="Pending">Pending</option>
                        <option value="Confirmed">Confirmed</option>
                        <option value="Not Interested">Not Interested</option>
                        <option value="Closed">Closed</option>
                    </select>
                </div>

                <!-- Priority Filter (Hot, Warm, Cold) -->
                <div class="col-6 col-md-2">
                    <select id="filterPriority" class="form-select form-select-sm" onchange="filterLeads();">
                        <option value="">All Priorities</option>
                        <option value="Hot">Hot (Urgent &lt; 30d)</option>
                        <option value="Warm">Warm (1-2 Months)</option>
                        <option value="Cold">Cold (Long-term)</option>
                    </select>
                </div>

                <!-- Reset Button -->
                <div class="col-6 col-md-1 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="resetFilters();" title="Reset Filters">
                        <i class="bi bi-arrow-counterclockwise"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Desktop & Tablet Leads Table Card -->
    <div class="card d-none d-md-block">
        <div class="card-header bg-white">
            <div>
                <h6 class="mb-0"><i class="bi bi-table"></i>Leads Directory</h6>
                <small class="text-muted">Assigned inquiries &bull; Columns reflect lead assignment, status and follow-ups</small>
            </div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0" id="leadsDesktopTable">
                    <thead>
                        <tr>
                            <th>Lead ID</th>
                            <th>Customer Name</th>
                            <th>Mobile</th>
                            <th>City / Destination</th>
                            <th>Created By</th>

                            <th>Status</th>
                            <th>Priority</th>
                            <th>Next Follow-up</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptMyLeads" runat="server">
                            <itemtemplate>
                                <tr class="lead-item-row" data-status='<%# Eval("lead_status") %>' data-priority='<%# Eval("lead_priority") %>' data-date='<%# Eval("followup_date", "{0:yyyy-MM-dd}") %>'>
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
                                        <%# Eval("created_by") %>
                                    </td>

                                    <td>
                                        <span class='badge <%# Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "confirmed" ? "bg-success-subtle text-success" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "interested" ? "badge-status-interested" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "new" ? "badge-status-new" : "badge-status-pending")) %>'>
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
                                    <%-- <td class="text-end">
                                        <a href='LeadDetails.aspx?id=<%# Eval("lead_code") %>' class="btn btn-nj-outline btn-sm">
                                            <i class="bi bi-eye"></i>View Details
                                        </a>
                                    </td>--%>

                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm btn-view-lead"
                                            data-bs-toggle="modal"
                                            data-bs-target="#leadViewModal"
                                            title="View Details"
                                            data-id='<%# Eval("lead_code") %>'
                                            data-name='<%# Eval("client_name") %>'
                                            data-phone='<%# Eval("mobile") %>'
                                            data-city='<%# Eval("city") %>'
                                            data-dest='<%# Eval("destination") %>'
                                            data-createdby='<%# Eval("created_by") %>'
                                            data-assigned='<%# Eval("assigned_employee_id") %>'
                                            data-status='<%# Eval("lead_status") %>'
                                            data-priority='<%# Eval("lead_priority") %>'
                                            data-remarks='<%# ((System.Data.DataRowView)Container.DataItem).Row.Table.Columns.Contains("remarks") ? Eval("remarks") : "" %>'
                                            onclick="handleViewLead(this);">
                                            <i class="bi bi-eye"></i>
                                        </button>

                                        <asp:LinkButton ID="btnEditLead" runat="server"
                                            CssClass="btn btn-nj-outline btn-sm"
                                            CommandArgument='<%# Eval("lead_code") %>'
                                            OnClick="btnEditLead_Click" CausesValidation="false"
                                            title="Edit Lead">
                                            <i class="bi bi-pencil"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="btnDeleteLead" runat="server"
                                            CssClass="btn btn-outline-danger btn-sm"
                                            CommandArgument='<%# Eval("lead_code") %>'
                                            CausesValidation="false"
                                            OnClientClick="return confirm('Are you sure you want to delete this lead?');"
                                            title="Delete Lead">
                                            <i class="bi bi-trash"></i>
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </itemtemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="card-footer bg-white p-3 d-flex justify-content-between align-items-center">
            <span class="small text-muted">Showing 7 leads</span>
            <ul class="pagination pagination-sm mb-0">
                <li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
    </div>



    <!-- Lead View Modal -->
    <div class="modal fade" id="leadViewModal" tabindex="-1" aria-labelledby="leadViewModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="leadViewModalTitle">
                        <i class="bi bi-info-circle text-success me-1"></i>Lead Information Details
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="d-flex justify-content-between align-items-center mb-3 p-3 bg-light rounded">
                        <div>
                            <span class="badge bg-secondary mb-1" id="v-id">#NJ-10301</span>
                            <h5 class="mb-0 fw-bold" id="v-name">Rohit Verma</h5>
                            <small class="text-muted" id="v-phone">+91 98765 43210</small>
                        </div>
                        <div class="text-end">
                            <div id="v-priority-badge" class="mb-1"><span class="badge badge-priority-hot">Hot</span></div>
                            <div id="v-status-badge"><span class="badge badge-status-interested">Interested</span></div>
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <div class="p-2 border rounded">
                                <span class="text-muted small d-block">Location</span>
                                <span class="fw-semibold small" id="v-location">Gorakhpur</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border rounded">
                                <span class="text-muted small d-block">Tour Destination</span>
                                <span class="fw-semibold small" id="v-destination">Kashmir 5N/6D</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border rounded">
                                <span class="text-muted small d-block">Lead Source</span>
                                <span class="fw-semibold small" id="v-source">Google / Internet</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border rounded">
                                <span class="text-muted small d-block">Added By</span>
                                <span class="fw-semibold small" id="v-addedby">Admin Entry</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border rounded bg-success-subtle border-success-subtle">
                                <span class="text-success small d-block fw-semibold">Lead Owner (Credit)</span>
                                <span class="fw-bold small text-success" id="v-owner">Rakesh Yadav</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 border rounded">
                                <span class="text-muted small d-block">Assigned For Follow-up</span>
                                <span class="fw-semibold small text-primary" id="v-assigned">Priya Sharma</span>
                            </div>
                        </div>
                    </div>

                    <div class="mb-2">
                        <label class="form-label text-muted small mb-1">Remarks & Requirements</label>
                        <div class="p-2 bg-light border rounded small" id="v-remarks">
                            Client asked for 4-star houseboats in Srinagar and Sonmarg day tour.
                     
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    <a href="FollowUps.aspx" class="btn btn-sm btn-nj-primary"><i class="bi bi-calendar-event me-1"></i>View Follow-up</a>
                </div>
            </div>
        </div>
    </div>


    <!-- Lead Quick Edit Modal -->
    <div class="modal fade" id="leadEditModal" tabindex="-1" aria-labelledby="leadEditModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header border-bottom py-2">
                    <h6 class="modal-title fw-bold" id="leadEditModalTitle">
                        <i class="bi bi-pencil-square text-success me-1"></i>Edit Lead Quick Info
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:HiddenField ID="hfEditLeadCode" runat="server" ClientIDMode="Static" />

                    <div class="row g-2 mb-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Client Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEditClientName" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm" placeholder="Client Full Name" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Mobile <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEditMobile" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm" placeholder="10-digit Mobile Number" />
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Alternate Mobile</label>
                            <asp:TextBox ID="txtEditAltMobile" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm" placeholder="Alternate Mobile (Optional)" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">City / Location</label>
                            <asp:TextBox ID="txtEditCity" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm" placeholder="e.g. Gorakhpur" />
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Destination</label>
                            <asp:TextBox ID="txtEditDestination" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm" placeholder="e.g. Kashmir, Dubai, Goa..." />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Travel Date</label>
                            <asp:TextBox ID="txtEditTravelDate" runat="server" ClientIDMode="Static" TextMode="Date" CssClass="form-control form-control-sm" />
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Lead Status <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="ddlEditLeadStatus" runat="server" ClientIDMode="Static" CssClass="form-select form-select-sm">
                                <asp:ListItem Text="-- Select Status --" Value="" />
                                <asp:ListItem Text="New" Value="New" />
                                <asp:ListItem Text="Interested" Value="Interested" />
                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Confirmed" Value="Confirmed" />
                                <asp:ListItem Text="Not Interested" Value="Not Interested" />
                                <asp:ListItem Text="Closed" Value="Closed" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Priority <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="ddlEditLeadPriority" runat="server" ClientIDMode="Static" CssClass="form-select form-select-sm">
                                <asp:ListItem Text="-- Select Priority --" Value="" />
                                <asp:ListItem Text="Hot" Value="Hot" />
                                <asp:ListItem Text="Warm" Value="Warm" />
                                <asp:ListItem Text="Cold" Value="Cold" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Next Follow-up Date & Time</label>
                            <asp:TextBox ID="txtEditFollowUp" runat="server" ClientIDMode="Static"
                                TextMode="DateTimeLocal"
                                CssClass="form-control form-control-sm" />
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold">Remarks</label>
                            <asp:TextBox ID="txtEditRemarks" runat="server" ClientIDMode="Static"
                                TextMode="MultiLine" Rows="3"
                                CssClass="form-control form-control-sm"
                                placeholder="Enter conversation details, client requirements, notes..." />
                        </div>
                    </div>


                </div>
                <div class="modal-footer border-top py-2">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnSaveLeadEdit" runat="server" OnClick="btnSaveLeadEdit_Click" Text="Save Changes" CssClass="btn btn-nj-primary btn-sm" />
                </div>
            </div>
        </div>
    </div>



    <!-- Mobile-First Responsive Cards View (Visible only on Mobile screens < 768px) -->
    <div class="d-md-none" id="leadsMobileContainer">
        <!-- Mobile Card 1 -->
        <div class="card mb-3 lead-mobile-card" data-status="Interested" data-priority="Hot" data-source="Google">
            <div class="card-body p-3">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <div>
                        <h6 class="fw-bold text-dark mb-0">Rohit Verma</h6>
                        <small class="text-muted"><a href="tel:+919876543210" class="text-decoration-none text-dark">+91 98765 43210</a> &bull; Gorakhpur</small>
                    </div>
                    <div>
                        <span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span>
                    </div>
                </div>

                <div class="p-2 bg-light rounded small mb-2">
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Destination:</span>
                        <span class="fw-semibold text-dark">Kashmir 5N/6D Deluxe</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Travel Date:</span>
                        <span>15 Nov 2026 (4 Pax)</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Lead Owner:</span>
                        <span class="fw-semibold">Rakesh Yadav (Sales)</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Assigned:</span>
                        <span class="text-primary fw-semibold">Priya Sharma</span>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center">
                    <span class="badge badge-status-interested">Interested</span>
                    <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-primary btn-sm">
                        <i class="bi bi-eye"></i>View Details
                    </a>
                </div>
            </div>
        </div>

        <!-- Mobile Card 2 -->
        <div class="card mb-3 lead-mobile-card" data-status="Confirmed" data-priority="Hot" data-source="Walk-in">
            <div class="card-body p-3">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <div>
                        <h6 class="fw-bold text-dark mb-0">Ananya Mishra</h6>
                        <small class="text-muted"><a href="tel:+919452188321" class="text-decoration-none text-dark">+91 94521 88321</a> &bull; Deoria</small>
                    </div>
                    <div>
                        <span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span>
                    </div>
                </div>

                <div class="p-2 bg-light rounded small mb-2">
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Destination:</span>
                        <span class="fw-semibold text-dark">Dubai Luxury Tour</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Travel Date:</span>
                        <span>20 Dec 2026 (2 Pax)</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Lead Owner:</span>
                        <span class="text-success fw-semibold">Priya Sharma (You)</span>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center">
                    <span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span>
                    <a href="LeadDetails.aspx?id=NJ-10302" class="btn btn-nj-primary btn-sm">
                        <i class="bi bi-eye"></i>View Details
                    </a>
                </div>
            </div>
        </div>

        <!-- Mobile Card 3 -->
        <div class="card mb-3 lead-mobile-card" data-status="New" data-priority="Hot" data-source="Field Visit">
            <div class="card-body p-3">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <div>
                        <h6 class="fw-bold text-dark mb-0">Dr. Arvind Kumar</h6>
                        <small class="text-muted"><a href="tel:+919839012345" class="text-decoration-none text-dark">+91 98390 12345</a> &bull; Gorakhpur</small>
                    </div>
                    <div>
                        <span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span>
                    </div>
                </div>

                <div class="p-2 bg-light rounded small mb-2">
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Destination:</span>
                        <span class="fw-semibold text-dark">Char Dham Yatra Heli</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Travel Date:</span>
                        <span>05 May 2027 (4 Pax)</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Lead Owner:</span>
                        <span class="text-success fw-semibold">Priya Sharma (You)</span>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center">
                    <span class="badge badge-status-new">New</span>
                    <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-primary btn-sm">
                        <i class="bi bi-eye"></i>View Details
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Empty State -->
    <div id="leadsEmptyState" class="text-center p-5 d-none bg-white rounded border">
        <i class="bi bi-search text-muted fs-1 mb-2"></i>
        <h6 class="fw-bold text-dark">No matching leads found</h6>
        <p class="text-muted small mb-3">Try adjusting your filters or search keywords.</p>
        <button type="button" class="btn btn-nj-outline btn-sm" onclick="resetFilters();">Clear All Filters</button>
    </div>

    <script>
        function filterLeads() {
            var search = (document.getElementById('leadSearchInput').value || '').toLowerCase().trim();
            var date = (document.getElementById('filterDate').value || '').trim();
            var status = (document.getElementById('filterStatus').value || '').trim();
            var priority = (document.getElementById('filterPriority').value || '').trim();

            // Desktop Rows
            var rows = document.querySelectorAll('.lead-item-row');
            var visibleCount = 0;

            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                var rStatus = (row.getAttribute('data-status') || '').trim();
                var rPriority = (row.getAttribute('data-priority') || '').trim();
                var rDate = (row.getAttribute('data-date') || '').trim();

                var mSearch = search === '' || text.indexOf(search) > -1;
                var mStatus = status === '' || rStatus.toLowerCase() === status.toLowerCase();
                var mPriority = priority === '' || rPriority.toLowerCase() === priority.toLowerCase();
                
                var mDate = true;
                if (date !== '') {
                    if (rDate === '') {
                        mDate = false;
                    } else if (rDate === date || rDate.indexOf(date) === 0) {
                        mDate = true;
                    } else {
                        var dRow = new Date(rDate);
                        var dFilter = new Date(date);
                        mDate = !isNaN(dRow) && !isNaN(dFilter) &&
                                dRow.getFullYear() === dFilter.getFullYear() &&
                                dRow.getMonth() === dFilter.getMonth() &&
                                dRow.getDate() === dFilter.getDate();
                    }
                }

                if (mSearch && mDate && mStatus && mPriority) {
                    row.style.display = '';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            });

            // Mobile Cards
            var cards = document.querySelectorAll('.lead-mobile-card');
            cards.forEach(function (card) {
                var text = card.innerText.toLowerCase();
                var cStatus = (card.getAttribute('data-status') || '').trim();
                var cPriority = (card.getAttribute('data-priority') || '').trim();

                var mSearch = search === '' || text.indexOf(search) > -1;
                var mStatus = status === '' || cStatus.toLowerCase() === status.toLowerCase();
                var mPriority = priority === '' || cPriority.toLowerCase() === priority.toLowerCase();

                if (mSearch && mStatus && mPriority) {
                    card.style.display = '';
                    visibleCount++;
                } else {
                    card.style.display = 'none';
                }
            });

            var empty = document.getElementById('leadsEmptyState');
            if (empty) {
                if (visibleCount === 0) {
                    empty.classList.remove('d-none');
                } else {
                    empty.classList.add('d-none');
                }
            }
        }

        function resetFilters() {
            var s = document.getElementById('leadSearchInput');
            var d = document.getElementById('filterDate');
            var st = document.getElementById('filterStatus');
            var p = document.getElementById('filterPriority');

            if (s) s.value = '';
            if (d) d.value = '';
            if (st) st.selectedIndex = 0;
            if (p) p.selectedIndex = 0;

            filterLeads();
        }

        // Function to populate View Lead Modal
        function handleViewLead(btn) {
            var id = btn.getAttribute('data-id') || '';
            var name = btn.getAttribute('data-name') || '';
            var phone = btn.getAttribute('data-phone') || '';
            var city = btn.getAttribute('data-city') || '';
            var dest = btn.getAttribute('data-dest') || '';
            var createdby = btn.getAttribute('data-createdby') || '';
            var assigned = btn.getAttribute('data-assigned') || '';
            var status = btn.getAttribute('data-status') || '';
            var priority = btn.getAttribute('data-priority') || '';
            var remarks = btn.getAttribute('data-remarks') || '';

            showLeadDetails(id, name, phone, city, dest, createdby, assigned, status, priority, remarks);
        }

        function showLeadDetails(id, name, phone, city, dest, createdby, assigned, status, priority, remarks) {
            if (document.getElementById('v-id')) document.getElementById('v-id').textContent = id ? ('#' + id) : '-';
            if (document.getElementById('v-name')) document.getElementById('v-name').textContent = name || '-';
            if (document.getElementById('v-phone')) document.getElementById('v-phone').textContent = phone || '-';
            if (document.getElementById('v-location')) document.getElementById('v-location').textContent = city || '-';
            if (document.getElementById('v-destination')) document.getElementById('v-destination').textContent = dest || '-';
            if (document.getElementById('v-addedby')) document.getElementById('v-addedby').textContent = createdby || 'Direct';
            if (document.getElementById('v-assigned')) document.getElementById('v-assigned').textContent = assigned || 'You';
            if (document.getElementById('v-remarks')) document.getElementById('v-remarks').textContent = remarks || 'No remarks provided.';

            var pBadge = document.getElementById('v-priority-badge');
            if (pBadge) {
                var pLow = (priority || 'warm').toLowerCase();
                pBadge.innerHTML = '<span class="badge badge-priority-' + pLow + '">' + (priority || 'Normal') + '</span>';
            }

            var sBadge = document.getElementById('v-status-badge');
            if (sBadge) {
                var sLow = (status || 'new').toLowerCase().replace(/\s+/g, '');
                sBadge.innerHTML = '<span class="badge badge-status-' + sLow + '">' + (status || 'New') + '</span>';
            }

            var modalEl = document.getElementById('leadViewModal');
            if (modalEl && typeof bootstrap !== 'undefined') {
                var modal = bootstrap.Modal.getOrCreateInstance(modalEl);
                modal.show();
            }
        }

        // Function to populate Edit Lead Modal
        function handleEditLead(btn) {
            var code = btn.getAttribute('data-code') || '';
            var name = btn.getAttribute('data-name') || '';
            var mobile = btn.getAttribute('data-mobile') || '';
            var city = btn.getAttribute('data-city') || '';
            var dest = btn.getAttribute('data-dest') || '';
            var status = btn.getAttribute('data-status') || '';
            var priority = btn.getAttribute('data-priority') || '';
            var followup = btn.getAttribute('data-followup') || '';
            var remarks = btn.getAttribute('data-remarks') || '';

            openEditLeadModal(code, name, mobile, city, dest, status, priority, followup, remarks);
        }

        function openEditLeadModal(code, name, mobile, city, dest, status, priority, followup, remarks) {
            if (document.getElementById('hfEditLeadCode')) document.getElementById('hfEditLeadCode').value = code;
            if (document.getElementById('txtEditClientName')) document.getElementById('txtEditClientName').value = name;
            if (document.getElementById('txtEditMobile')) document.getElementById('txtEditMobile').value = mobile;
            if (document.getElementById('txtEditCity')) document.getElementById('txtEditCity').value = city;
            if (document.getElementById('txtEditDestination')) document.getElementById('txtEditDestination').value = dest;
            if (document.getElementById('ddlEditLeadStatus')) document.getElementById('ddlEditLeadStatus').value = status;
            if (document.getElementById('ddlEditLeadPriority')) document.getElementById('ddlEditLeadPriority').value = priority;
            if (document.getElementById('txtEditRemarks')) document.getElementById('txtEditRemarks').value = remarks;

            var modalEl = document.getElementById('leadEditModal');
            if (modalEl && typeof bootstrap !== 'undefined') {
                var modal = bootstrap.Modal.getOrCreateInstance(modalEl);
                modal.show();
            }
        }
    </script>
</asp:Content>
