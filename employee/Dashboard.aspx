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
    <div class="mb-2 d-flex align-items-center justify-content-between">
        <span class="text-uppercase fw-bold text-muted" style="font-size: 0.725rem; letter-spacing: 0.05em;">Common Overview Metrics</span>
        <span class="badge bg-light text-dark border">All Employee Categories</span>
    </div>
    <div class="row g-3 mb-4">
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
    </div>

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
                            <h4 class="fw-bold mb-0 text-dark">35</h4>
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
                            <span class="text-muted small">Self-Found Leads</span>
                            <h4 class="fw-bold mb-0 text-dark">15</h4>
                            <div class="text-success small mt-1"><i class="bi bi-award-fill"></i>Google/Internet Sourced</div>
                        </div>
                        <span class="badge bg-success-subtle text-success p-2 fs-6"><i class="bi bi-globe"></i></span>
                    </div>
                    <div class="text-muted small mt-2">Leads found independently where you are Lead Owner</div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card p-3 h-100 border-start border-4 border-success">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <span class="text-muted small">Today's Call Target</span>
                            <h4 class="fw-bold mb-0 text-dark">22 / 30</h4>
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
                            <h4 class="fw-bold mb-0 text-dark">5 Calls</h4>
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
        <div class="col-12 col-lg-8">
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
                                    <th>Due Time</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                    <th class="text-end">Quick Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Dr. Arvind Kumar</div>
                                        <small class="text-muted">+91 98390 12345 (Gorakhpur)</small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold">Char Dham Yatra Heli</div>
                                        <small class="text-muted">4 Pax &bull; VIP Package</small>
                                    </td>
                                    <td><span class="fw-bold text-danger">Today, 02:30 PM</span></td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td><span class="badge badge-status-new">Pending Call</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-outline btn-sm" title="View Lead">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Initiating call to Dr. Arvind Kumar (+91 98390 12345)...');">
                                            <i class="bi bi-telephone-outbound"></i>Call
                                       
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="fw-bold">Rohit Verma</div>
                                        <small class="text-muted">+91 98765 43210 (Gorakhpur)</small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold">Kashmir 5N/6D Deluxe</div>
                                        <small class="text-muted">Family (4 Pax)</small>
                                    </td>
                                    <td><span class="fw-bold text-dark">Today, 05:15 PM</span></td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td><span class="badge badge-status-interested">Itinerary Sent</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-outline btn-sm" title="View Lead">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Initiating call to Rohit Verma (+91 98765 43210)...');">
                                            <i class="bi bi-telephone-outbound"></i>Call
                                       
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="fw-bold">Preeti Agrawal</div>
                                        <small class="text-muted">+91 99180 88990 (Basti)</small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold">Dubai 5N Luxury Package</div>
                                        <small class="text-muted">Family (5 Pax)</small>
                                    </td>
                                    <td><span class="fw-bold text-dark">Today, 06:00 PM</span></td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td><span class="badge badge-status-pending">Awaiting Decision</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10314" class="btn btn-nj-outline btn-sm" title="View Lead">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Initiating call to Preeti Agrawal (+91 99180 88990)...');">
                                            <i class="bi bi-telephone-outbound"></i>Call
                                       
                                        </button>
                                    </td>
                                </tr>
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
        <div class="col-12 col-lg-7">
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
                                    <th>Assigned To</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                    <th class="text-end">View</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Rohit Verma</div>
                                        <small class="text-muted">+91 98765 43210</small>
                                    </td>
                                    <td>Kashmir 5N/6D</td>
                                    <td><span class="badge bg-light text-dark border">Rakesh (Sales)</span></td>
                                    <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                                    <td><span class="badge badge-priority-hot">Hot</span></td>
                                    <td><span class="badge badge-status-interested">Interested</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-outline btn-sm"><i class="bi bi-eye"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Ananya Mishra</div>
                                        <small class="text-muted">+91 94521 88321</small>
                                    </td>
                                    <td>Dubai Luxury</td>
                                    <td><span class="badge bg-success-subtle text-success">Priya (Sales)</span></td>
                                    <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                                    <td><span class="badge badge-priority-hot">Hot</span></td>
                                    <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10302" class="btn btn-nj-outline btn-sm"><i class="bi bi-eye"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Dr. Arvind Kumar</div>
                                        <small class="text-muted">+91 98390 12345</small>
                                    </td>
                                    <td>Char Dham Heli</td>
                                    <td><span class="badge bg-success-subtle text-success">Priya (Sales)</span></td>
                                    <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                                    <td><span class="badge badge-priority-hot">Hot</span></td>
                                    <td><span class="badge badge-status-new">New</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-outline btn-sm"><i class="bi bi-eye"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Suresh Chandra</div>
                                        <small class="text-muted">+91 97920 66778</small>
                                    </td>
                                    <td>Char Dham Coach</td>
                                    <td><span class="badge bg-light text-dark border">Admin</span></td>
                                    <td><span class="badge bg-info-subtle text-info">Pooja (Calling)</span></td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td><span class="badge badge-status-interested">Interested</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm"><i class="bi bi-eye"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Call Activity (col-lg-5) -->
        <div class="col-12 col-lg-5">
            <div class="card h-100">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-telephone-outbound text-primary"></i>Recent Call Activity</h6>
                        <small class="text-muted">Latest calls logged by the desk</small>
                    </div>
                    <a href="CallHistory.aspx" class="btn btn-nj-outline btn-sm">Call Log <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
                <div class="card-body p-0">
                    <div class="list-group list-group-flush">
                        <div class="list-group-item p-3">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <span class="fw-bold text-dark">Rohit Verma (+91 98765 43210)</span>
                                <span class="badge bg-success-subtle text-success"><i class="bi bi-check-circle me-1"></i>Connected</span>
                            </div>
                            <div class="text-muted small">Discussed Kashmir houseboat booking. Next call today 05:15 PM.</div>
                            <div class="text-muted" style="font-size: 0.7rem; margin-top: 4px;">Today, 11:45 AM &bull; By Priya Sharma</div>
                        </div>

                        <div class="list-group-item p-3">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <span class="fw-bold text-dark">Dr. Arvind Kumar (+91 98390 12345)</span>
                                <span class="badge bg-primary-subtle text-primary"><i class="bi bi-star-fill me-1"></i>Interested</span>
                            </div>
                            <div class="text-muted small">High interest in VIP helicopter package for 4 senior family members.</div>
                            <div class="text-muted" style="font-size: 0.7rem; margin-top: 4px;">Today, 10:15 AM &bull; By Priya Sharma</div>
                        </div>

                        <div class="list-group-item p-3">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <span class="fw-bold text-dark">Preeti Agrawal (+91 99180 88990)</span>
                                <span class="badge bg-warning-subtle text-dark"><i class="bi bi-clock-history me-1"></i>Call Back</span>
                            </div>
                            <div class="text-muted small">Client was busy; requested follow-up call after 06:00 PM.</div>
                            <div class="text-muted" style="font-size: 0.7rem; margin-top: 4px;">Today, 09:30 AM &bull; By Priya Sharma</div>
                        </div>
                    </div>
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
