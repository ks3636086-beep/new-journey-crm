<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Employee Dashboard | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Category Awareness Greeting Banner -->
    <div class="card bg-white border mb-4">
        <div class="card-body p-3 p-md-4">
            <div class="d-flex flex-wrap align-items-center justify-content-between gap-3">
                <div class="d-flex align-items-center gap-3">
                    <div class="nj-avatar bg-primary"
                        style="width: 52px; height: 52px; font-size: 1.35rem;">
                        <asp:Literal ID="litDashAvatar" runat="server" Mode="Encode" />
                    </div>

                    <div>
                        <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                            <h3 class="fw-bold text-dark mb-0 fs-5">Welcome,
                                <asp:Literal ID="litDashName" runat="server" Mode="Encode" />!
                            </h3>

                            <span class="badge badge-cat-sales">
                                <i class="bi bi-briefcase-fill me-1"></i>
                                <asp:Literal ID="litDashCategory" runat="server" Mode="Encode" />
                            </span>
                        </div>

                        <p class="text-muted small mb-0">
                            <i class="bi bi-geo-alt-fill text-success me-1"></i>
                            <asp:Literal ID="litDashDescription" runat="server" Mode="Encode" />
                        </p>
                    </div>
                </div>


            </div>
        </div>
    </div>

    <!-- 1. Common Statistics Row (6 Cards required: Total Leads, Hot, Warm, Cold, Today's Calls, Today's Follow-ups) -->
    <%-- <div class="mb-2 d-flex align-items-center justify-content-between">
        <span class="text-uppercase fw-bold text-muted" style="font-size: 0.725rem; letter-spacing: 0.05em;">Common Overview Metrics</span>
        <span class="badge bg-light text-dark border">All Employee Categories</span>
    </div>--%>
    <%-- <div class="row g-3 mb-4">
        <!-- Total Leads -->
        <div class="col-6 col-md-4 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Total Leads</div>
                    <asp:Literal ID="litTotalLeads" runat="server" />

                    <div class="stat-meta text-success">
                        <i class="bi bi-arrow-up-short"></i>Active in CRM
                   
                    </div>
                </div>
                <div class="nj-stat-icon green">
                    <i class="bi bi-people-fill"></i>
                </div>
            </div>
        </div>

        <!-- Hot Leads -->
        <div class="col-6 col-md-4 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Hot Leads</div>
                   <asp:Literal ID="litHotLeads" runat="server" />

                    <div class="stat-meta text-danger">
                        <i class="bi bi-fire"></i>High Priority
                   
                    </div>
                </div>
                <div class="nj-stat-icon red">
                    <i class="bi bi-fire"></i>
                </div>
            </div>
        </div>

        <!-- Warm Leads -->
        <div class="col-6 col-md-4 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Warm Leads</div>
                   <asp:Literal ID="litWarmLeads" runat="server" />

                    <div class="stat-meta text-muted">
                        <span>Standard Follow-up</span>
                    </div>
                </div>
                <div class="nj-stat-icon amber">
                    <i class="bi bi-thermometer-half"></i>
                </div>
            </div>
        </div>

        <!-- Cold Leads -->
        <div class="col-6 col-md-4 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Cold Leads</div>
                    <asp:Literal ID="litColdLeads" runat="server" />

                    <div class="stat-meta text-muted">
                        <span>Tentative Travel</span>
                    </div>
                </div>
                <div class="nj-stat-icon teal">
                    <i class="bi bi-snow"></i>
                </div>
            </div>
        </div>

        <!-- Today's Calls -->
        <div class="col-6 col-md-4 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Today's Calls</div>
                    <div class="stat-value text-primary" id="statTodayCalls">14</div>
                    <div class="stat-meta text-primary">
                       <asp:Literal ID="litTodayCalls" runat="server" />

                   
                    </div>
                </div>
                <div class="nj-stat-icon blue">
                    <i class="bi bi-telephone-fill"></i>
                </div>
            </div>
        </div>

        <!-- Today's Follow-ups -->
        <div class="col-6 col-md-4 col-xl-2">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Today Follow-ups</div>
                    <div class="stat-value text-danger" id="statTodayFollowups">8</div>
                    <div class="stat-meta text-danger">
                      <asp:Literal ID="litTodayFollowups" runat="server" />
                   
                    </div>
                </div>
                <div class="nj-stat-icon red">
                    <i class="bi bi-calendar-check-fill"></i>
                </div>
            </div>
        </div>
    </div>--%>

    <!-- 2. Category-Specific Statistics Row (Dynamically changes between Sales and Calling) -->

    <!-- Sales Employee Specific Section -->
    <div id="sectionSalesSpecific">
        <div class="mb-2 d-flex align-items-center justify-content-between">
            <span class="text-uppercase fw-bold text-success" style="font-size: 0.725rem; letter-spacing: 0.05em;">
                <i class="bi bi-briefcase-fill me-1"></i>Sales Employee Specific Metrics (Field Focus)
            </span>
            <span class="badge bg-success-subtle text-success">Personal Client Generation</span>
        </div>
        <div class="row g-3 mb-4">
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card p-3 h-100 border-start border-4 border-success">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <span class="text-muted small">My Field Leads</span>
                            <h4 class="fw-bold mb-0 text-dark">28</h4>
                            <div class="text-success small mt-1"><i class="bi bi-award-fill"></i>You are Lead Owner</div>
                        </div>
                        <span class="badge bg-success-subtle text-success p-2 fs-6"><i class="bi bi-geo-alt"></i></span>
                    </div>
                    <div class="text-muted small mt-2">Acquired via direct field visits & client meetings</div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card p-3 h-100 border-start border-4 border-success">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <span class="text-muted small">My Calls (Month)</span>
                            <h4 class="fw-bold mb-0 text-dark">142</h4>
                            <div class="text-primary small mt-1"><i class="bi bi-telephone-check"></i>High Engagement</div>
                        </div>
                        <span class="badge bg-primary-subtle text-primary p-2 fs-6"><i class="bi bi-telephone"></i></span>
                    </div>
                    <div class="text-muted small mt-2">Direct client consultations & itinerary reviews</div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card p-3 h-100 border-start border-4 border-warning">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <span class="text-muted small">My Follow-ups</span>
                            <h4 class="fw-bold mb-0 text-dark">7 Scheduled</h4>
                            <div class="text-warning small mt-1"><i class="bi bi-hourglass-split"></i>2 Urgent Today</div>
                        </div>
                        <span class="badge bg-warning-subtle text-warning p-2 fs-6"><i class="bi bi-calendar-check"></i></span>
                    </div>
                    <div class="text-muted small mt-2">Active pipeline of quotations awaiting closure</div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card p-3 h-100 border-start border-4 border-info">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <span class="text-muted small">Lead Status Summary</span>
                            <h4 class="fw-bold mb-0 text-success">14 Won</h4>
                            <div class="text-muted small mt-1">35% Conversion Ratio</div>
                        </div>
                        <span class="badge bg-info-subtle text-info p-2 fs-6"><i class="bi bi-pie-chart"></i></span>
                    </div>
                    <div class="text-muted small mt-2">14 Confirmed &bull; 8 Interested &bull; 6 Pending</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Calling Employee Specific Section -->
    <div id="sectionCallingSpecific" class="d-none">
        <div class="mb-2 d-flex align-items-center justify-content-between">
            <span class="text-uppercase fw-bold text-success" style="font-size: 0.725rem; letter-spacing: 0.05em;">
                <i class="bi bi-headset me-1"></i>Calling Employee Specific Metrics (Telecalling Focus)
            </span>
            <span class="badge bg-success-subtle text-success">Office Inbound & Dialing</span>
        </div>
        <div class="row g-3 mb-4">
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card p-3 h-100 border-start border-4 border-success">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <span class="text-muted small">Assigned Leads</span>
                            <h4 class="fw-bold mb-0 text-dark">
                                <asp:Label ID="lblMyFieldLeads" runat="server" Text="0"></asp:Label>
                            </h4>
                            <div class="text-success small mt-1"><i class="bi bi-inbox-fill"></i>From Admin / Office</div>
                        </div>
                        <span class="badge bg-success-subtle text-success p-2 fs-6"><i class="bi bi-folder-check"></i></span>
                    </div>
                    <div class="text-muted small mt-2">Inquiries allocated to you for tele-calling</div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card p-3 h-100 border-start border-4 border-success">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <span class="text-muted small">Active Leads</span>
                            <h4 class="fw-bold mb-0 text-dark">
                                <asp:Label ID="lblActiveLeads" runat="server" Text="0"></asp:Label>
                            </h4>
                            <div class="text-success small mt-1">
                                <i class="bi bi-graph-up-arrow"></i>Active Pipeline
               
                            </div>
                        </div>
                        <span class="badge bg-success-subtle text-success p-2 fs-6">
                            <i class="bi bi-people"></i>
                        </span>
                    </div>
                    <div class="text-muted small mt-2">
                        Pending & Interested Client Enquiries
       
                    </div>
                </div>
            </div>


            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card p-3 h-100 border-start border-4 border-success">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <span class="text-muted small">Today's Call Target</span>
                            <h4 class="fw-bold mb-0 text-dark">
                                <asp:Label ID="lblMonthlyTarget" runat="server" Text="0 / 30"></asp:Label>
                            </h4>
                            <div class="text-success small mt-1"><i class="bi bi-check-circle"></i>73% Completed</div>
                        </div>
                        <span class="badge bg-success-subtle text-success p-2 fs-6"><i class="bi bi-telephone-forward"></i></span>
                    </div>
                    <div class="text-muted small mt-2">Daily telecalling outreach quota progress</div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card p-3 h-100 border-start border-4 border-success">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <span class="text-muted small">Pending Follow-ups</span>
                            <h4 class="fw-bold mb-0 text-dark">
                                <asp:Label ID="lblTodayCalls" runat="server" Text="0 Calls"></asp:Label>
                            </h4>
                            <div class="text-success small mt-1"><i class="bi bi-exclamation-circle"></i>Action Needed Today</div>
                        </div>
                        <span class="badge bg-success-subtle text-success p-2 fs-6"><i class="bi bi-alarm"></i></span>
                    </div>
                    <div class="text-muted small mt-2">Customers waiting for call back & rates</div>
                </div>
            </div>
        </div>
    </div>

    <!-- 3. Lead Priority Summary & Today's Follow-ups Queue -->
    <div class="row g-3 mb-4">
        <!-- Today's Priority Follow-ups Table (col-lg-8) -->
        <div class="col-12">
            <div class="card h-100">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-calendar2-day text-success"></i>Today's Follow-ups Queue</h6>
                        <small class="text-muted">Calls due today for high-conversion holiday inquiries</small>
                    </div>
                    <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">View All (8) <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Customer Name</th>
                                    <th>Destination / Package</th>
                                    <th>Travel Date</th>
                                    <th>Due Date &amp; Time</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                    <th class="text-end">Quick Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptTodayFollowups" runat="server">
                                    <itemtemplate>
                                        <tr>
                                            <td>
                                                <div class="fw-bold text-dark"><%# Eval("client_name") %></div>
                                                <small class="text-muted">
                                                    <a href='tel:+91<%# Eval("mobile") %>' class="text-decoration-none text-dark">
                                                        <i class="bi bi-telephone text-muted me-1"></i><%# Eval("mobile") %>
                                                    </a>
                                                    &bull; <%# Eval("city") %>
                                                </small>
                                            </td>
                                            <td>
                                                <div class="fw-semibold text-dark"><%# Eval("destination") %></div>
                                            </td>
                                            <td>
                                                <small class="text-muted">
                                                    <i class="bi bi-calendar-event me-1"></i><%# Eval("travel_date") == DBNull.Value || Eval("travel_date") == null ? "-" : Eval("travel_date") %>
                                                </small>
                                            </td>
                                            <td>
                                                <span class="fw-bold text-danger">
                                                    <i class="bi bi-clock me-1"></i><%# Eval("followup_date") == DBNull.Value || Eval("followup_date") == null ? "-" : Eval("followup_date") %>
                                                </span>
                                            </td>
                                            <td>
                                                <span class='badge <%# Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "hot" ? "badge-priority-hot" : (Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "warm" ? "badge-priority-warm" : "badge-priority-cold") %>'>
                                                    <%# Eval("lead_priority") %>
                                                </span>
                                            </td>
                                            <td>
                                                <span class='badge <%# Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "confirmed" ? "bg-success-subtle text-success" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "interested" ? "badge-status-interested" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "new" ? "badge-status-new" : "badge-status-pending")) %>'>
                                                    <%# Eval("lead_status") %>
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <div class="d-inline-flex gap-1 justify-content-end">
                                                    <a href='LeadDetails.aspx?id=<%# Eval("lead_code") %>' class="btn btn-nj-outline btn-sm text-nowrap" title="View Lead">
                                                        <i class="bi bi-eye"></i>View
                                                    </a>
                                                    <a href='tel:+91<%# Eval("mobile") %>' class="btn btn-nj-primary btn-sm text-nowrap" title="Call Customer">
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
                                    </itemtemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <!-- 4. Recent Leads & Recent Call Activity Row -->
    <div class="row g-3">
        <!-- Recent Leads (col-lg-7) -->
        <div class="col-12 col-lg-12">
            <div class="card h-100">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-person-lines-fill text-success"></i>Recent Leads</h6>
                        <small class="text-muted">Inquiries registered in the CRM</small>
                    </div>
                    <a href="MyLeads.aspx" class="btn btn-nj-outline btn-sm">All Leads <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Customer Name</th>
                                    <th>Destination</th>
                                    <th>Lead Owner</th>
                                    <th>Assigned Employee</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                    <th class="text-end">View</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptRecentLeads" runat="server">
                                    <itemtemplate>
                                        <tr>
                                            <td>
                                                <div class="fw-bold text-dark"><%# Eval("client_name") %></div>
                                                <small class="text-muted">
                                                    <a href='tel:+91<%# Eval("mobile") %>' class="text-decoration-none text-muted">
                                                        <i class="bi bi-telephone text-muted me-1 small"></i><%# Eval("mobile") %>
                                                    </a>
                                                </small>
                                            </td>
                                            <td>
                                                <div class="fw-semibold text-dark"><%# Eval("destination") %></div>
                                            </td>
                                            <td>
                                                <span class="badge bg-light text-dark border">
                                                    <%# Eval("created_by") %>
                                                </span>
                                            </td>
                                            <td>
                                                <span class="badge bg-primary-subtle text-primary">
                                                    <%# Eval("assigned_employee_name") %>                                                </span>
                                            </td>
                                            <td>
                                                <span class='badge <%# Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "hot" ? "badge-priority-hot" : (Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "warm" ? "badge-priority-warm" : "badge-priority-cold") %>'>
                                                    <%# Eval("lead_priority") %>
                                                </span>
                                            </td>
                                            <td>
                                                <span class='badge <%# Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "confirmed" ? "bg-success-subtle text-success" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "interested" ? "badge-status-interested" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "new" ? "badge-status-new" : "badge-status-pending")) %>'>
                                                    <%# Eval("lead_status") %>
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href='LeadDetails.aspx?id=<%# Eval("lead_code") %>' class="btn btn-nj-outline btn-sm" title="View Lead">
                                                    <i class="bi bi-eye"></i>View
                                                </a>
                                            </td>
                                        </tr>
                                    </itemtemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
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

    <!-- Category Switching JS Logic -->
    <script>
        function applyDashboardCategory(cat) {
            var sSection = document.getElementById('sectionSalesSpecific');
            var cSection = document.getElementById('sectionCallingSpecific');
            var btnSales = document.getElementById('btnDashSales');
            var btnCalling = document.getElementById('btnDashCalling');
            var badge = document.getElementById('dashCategoryBadge');
            var greeting = document.getElementById('dashGreetingName');
            var desc = document.getElementById('dashCategoryDescription');
            var avatar = document.getElementById('dashAvatar');

            if (cat === 'Calling') {
                if (sSection) sSection.classList.add('d-none');
                if (cSection) cSection.classList.remove('d-none');
                if (btnSales) btnSales.classList.remove('active');
                if (btnCalling) btnCalling.classList.add('active');
                if (badge) {
                    badge.className = 'badge badge-cat-calling';
                    badge.innerHTML = '<i class="bi bi-headset me-1"></i> Calling Employee (Back Office)';
                }
                if (greeting) greeting.textContent = 'Welcome, Pooja Srivastava!';
                if (avatar) { avatar.textContent = 'PS'; avatar.className = 'nj-avatar bg-info'; }
                if (desc) desc.innerHTML = '<i class="bi bi-headset text-primary me-1"></i> Back office telecalling desk &bull; Inbound inquiries, lead qualification, and admin-assigned follow-up calls.';
            } else {
                if (sSection) sSection.classList.remove('d-none');
                if (cSection) cSection.classList.add('d-none');
                if (btnSales) btnSales.classList.add('active');
                if (btnCalling) btnCalling.classList.remove('active');
                if (badge) {
                    badge.className = 'badge badge-cat-sales';
                    badge.innerHTML = '<i class="bi bi-briefcase-fill me-1"></i> Sales Employee (Field)';
                }
                if (greeting) greeting.textContent = 'Welcome, Priya Sharma!';
                if (avatar) { avatar.textContent = 'PS'; avatar.className = 'nj-avatar bg-primary'; }
                if (desc) desc.innerHTML = '<i class="bi bi-geo-alt-fill text-success me-1"></i> Field sales desk &bull; Client visits across Gorakhpur and Eastern UP &bull; Sourcing and converting travel inquiries.';
            }
        }

        window.addEventListener('njCategoryChanged', function (e) {
            applyDashboardCategory(e.detail.category);
        });

        document.addEventListener('DOMContentLoaded', function () {
            var currentCat = localStorage.getItem('nj_employee_category') || 'Sales';
            applyDashboardCategory(currentCat);
        });
    </script>
</asp:Content>
