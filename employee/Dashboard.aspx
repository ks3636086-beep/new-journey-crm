<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Employee Dashboard | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header & Greeting -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Welcome back, Priya!</h2>
            <p class="nj-page-subtitle">Senior Sales Executive &bull; Gorakhpur HQ Desk &bull; Here is your daily travel inquiry pipeline.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <a href="AddLead.aspx" class="btn btn-nj-primary btn-sm">
                <i class="bi bi-plus-circle"></i> Add Lead
            </a>
            <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-calendar-check"></i> Today's Calls
            </a>
        </div>
    </div>

    <!-- 4 Employee KPI Stat Cards -->
    <div class="row g-3 mb-4">
        <!-- 1. My Leads -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">My Assigned Leads</div>
                    <div class="stat-value">38</div>
                    <div class="stat-meta text-success">
                        <i class="bi bi-arrow-up-short fs-6"></i>
                        <span>+6 new this week</span>
                    </div>
                </div>
                <div class="nj-stat-icon green">
                    <i class="bi bi-people-fill"></i>
                </div>
            </div>
        </div>

        <!-- 2. Confirmed Bookings -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Confirmed Bookings</div>
                    <div class="stat-value text-success">14</div>
                    <div class="stat-meta text-muted">
                        <span class="badge bg-success-subtle text-success">36.8% Conversion</span>
                    </div>
                </div>
                <div class="nj-stat-icon teal">
                    <i class="bi bi-patch-check-fill"></i>
                </div>
            </div>
        </div>

        <!-- 3. Today's Follow-ups -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Today's Follow-ups</div>
                    <div class="stat-value text-danger">8</div>
                    <div class="stat-meta text-danger">
                        <i class="bi bi-clock-history fs-6"></i>
                        <span>3 Pending Calls</span>
                    </div>
                </div>
                <div class="nj-stat-icon red">
                    <i class="bi bi-calendar2-event-fill"></i>
                </div>
            </div>
        </div>

        <!-- 4. Calls Conducted Today -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Calls Logged Today</div>
                    <div class="stat-value text-primary">12</div>
                    <div class="stat-meta text-muted">
                        <span>Target: 20 calls/day</span>
                    </div>
                </div>
                <div class="nj-stat-icon blue">
                    <i class="bi bi-telephone-outbound-fill"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Row: Today's Follow-up Queue & Performance -->
    <div class="row g-3 mb-4">
        <!-- Today's Priority Follow-up Queue (col-lg-8) -->
        <div class="col-12 col-lg-8">
            <div class="card h-100">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-telephone-inbound text-success"></i> Today's Scheduled Calls Queue</h6>
                        <small class="text-muted">High priority follow-ups due today for immediate client conversion</small>
                    </div>
                    <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">
                        View All <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Client Name</th>
                                    <th>Tour Destination</th>
                                    <th>Scheduled Time</th>
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
                                    <td>Char Dham Yatra Heli (4 Pax)</td>
                                    <td><span class="fw-bold text-danger">Today, 02:30 PM</span></td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td><span class="badge badge-status-new">Pending Call</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-outline btn-sm" title="View Details">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Calling Dr. Arvind Kumar (+91 98390 12345)...');">
                                            <i class="bi bi-telephone"></i> Call
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Rohit Verma</div>
                                        <small class="text-muted">+91 98765 43210 (Gorakhpur)</small>
                                    </td>
                                    <td>Kashmir 5N/6D Deluxe</td>
                                    <td><span class="fw-bold text-dark">Today, 05:15 PM</span></td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td><span class="badge badge-status-interested">Itinerary Sent</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-outline btn-sm" title="View Details">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Calling Rohit Verma (+91 98765 43210)...');">
                                            <i class="bi bi-telephone"></i> Call
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Preeti Agrawal</div>
                                        <small class="text-muted">+91 99180 88990 (Basti)</small>
                                    </td>
                                    <td>Dubai 5N Luxury Package</td>
                                    <td><span class="fw-bold text-dark">Today, 06:00 PM</span></td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td><span class="badge badge-status-pending">Awaiting Reply</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10314" class="btn btn-nj-outline btn-sm" title="View Details">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Calling Preeti Agrawal (+91 99180 88990)...');">
                                            <i class="bi bi-telephone"></i> Call
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Monthly Target & Quick Links (col-lg-4) -->
        <div class="col-12 col-lg-4">
            <div class="card h-100">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-trophy text-warning"></i> My Monthly Goal</h6>
                        <small class="text-muted">October 2026 Target Progress</small>
                    </div>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <div class="d-flex justify-content-between small fw-bold mb-1">
                            <span>Bookings Target (14 / 20)</span>
                            <span class="text-success">70% Achieved</span>
                        </div>
                        <div class="progress" style="height: 10px;">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 70%;"></div>
                        </div>
                        <small class="text-muted">6 more bookings to reach monthly bonus</small>
                    </div>

                    <div class="p-3 bg-light rounded border mb-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="text-muted small">My Sourced Leads (Owner)</span>
                            <span class="fw-bold text-primary">22 Leads</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="text-muted small">Assigned by Admin</span>
                            <span class="fw-bold text-dark">16 Leads</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted small">Conversion Ratio</span>
                            <span class="fw-bold text-success">36.8%</span>
                        </div>
                    </div>

                    <div class="d-grid gap-2">
                        <a href="AddLead.aspx" class="btn btn-nj-primary btn-sm">
                            <i class="bi bi-plus-lg me-1"></i> Register Client Inquiry
                        </a>
                        <a href="MyLeads.aspx" class="btn btn-nj-outline btn-sm">
                            <i class="bi bi-list-ul me-1"></i> Browse My Leads
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- My Recent Leads Table -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-clock-history text-success"></i> My Active Travel Inquiries</h6>
                        <small class="text-muted">Recently updated inquiries assigned to your desk</small>
                    </div>
                    <a href="MyLeads.aspx" class="btn btn-nj-outline btn-sm">
                        View All My Leads <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Lead ID</th>
                                    <th>Customer Name</th>
                                    <th>Mobile & City</th>
                                    <th>Destination / Package</th>
                                    <th>Lead Owner</th>
                                    <th>Status</th>
                                    <th>Priority</th>
                                    <th class="text-end">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="fw-bold text-success">#NJ-10302</span></td>
                                    <td>
                                        <div class="fw-bold">Ananya Mishra</div>
                                        <small class="text-muted">Couple</small>
                                    </td>
                                    <td>+91 94521 88321 &bull; Deoria</td>
                                    <td>Dubai Luxury Tour (5N/6D)</td>
                                    <td><span class="badge bg-success-subtle text-success">Priya Sharma (You)</span></td>
                                    <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                                    <td><span class="badge badge-priority-hot">Hot</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10302" class="btn btn-nj-outline btn-sm">
                                            <i class="bi bi-eye"></i> View
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold text-success">#NJ-10306</span></td>
                                    <td>
                                        <div class="fw-bold">Dr. Arvind Kumar</div>
                                        <small class="text-muted">Senior Citizens (4 Pax)</small>
                                    </td>
                                    <td>+91 98390 12345 &bull; Gorakhpur</td>
                                    <td>Char Dham Yatra Heli</td>
                                    <td><span class="badge bg-success-subtle text-success">Priya Sharma (You)</span></td>
                                    <td><span class="badge badge-status-new">New</span></td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-outline btn-sm">
                                            <i class="bi bi-eye"></i> View
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold text-success">#NJ-10301</span></td>
                                    <td>
                                        <div class="fw-bold">Rohit Verma</div>
                                        <small class="text-muted">Family (4 Pax)</small>
                                    </td>
                                    <td>+91 98765 43210 &bull; Gorakhpur</td>
                                    <td>Kashmir 5N/6D</td>
                                    <td><span class="badge bg-light text-dark border">Rakesh Yadav</span></td>
                                    <td><span class="badge badge-status-interested">Interested</span></td>
                                    <td><span class="badge badge-priority-hot">Hot</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-outline btn-sm">
                                            <i class="bi bi-eye"></i> View
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold text-success">#NJ-10308</span></td>
                                    <td>
                                        <div class="fw-bold">Kavita Gupta</div>
                                        <small class="text-muted">Honeymoon (2 Pax)</small>
                                    </td>
                                    <td>+91 98399 44332 &bull; Kushinagar</td>
                                    <td>Maldives Overwater Villa</td>
                                    <td><span class="badge bg-light text-dark border">Admin</span></td>
                                    <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                                    <td><span class="badge badge-priority-hot">Hot</span></td>
                                    <td class="text-end">
                                        <a href="LeadDetails.aspx?id=NJ-10308" class="btn btn-nj-outline btn-sm">
                                            <i class="bi bi-eye"></i> View
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>