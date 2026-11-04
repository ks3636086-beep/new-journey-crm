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
                    <div class="stat-value">300</div>
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
                    <div class="stat-value text-success">65</div>
                    <div class="stat-meta text-muted">
                        <span class="badge bg-success-subtle text-success">21.7% Conv.</span>
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
                    <div class="stat-value text-warning">180</div>
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
                    <div class="stat-value text-danger">55</div>
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
                    <div class="stat-value text-primary">12</div>
                    <div class="stat-meta text-muted">
                        <span>4 Categories</span>
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
                    <div class="stat-value text-teal">24</div>
                    <div class="stat-meta text-muted">
                        <span class="badge bg-danger-subtle text-danger">8 Pending</span>
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
                                    <th>Client Name</th>
                                    <th>Mobile</th>
                                    <th>Location</th>
                                    <th>Lead Source</th>
                                    <th>Added By</th>
                                    <th>Lead Status</th>
                                    <th>Priority</th>
                                    <th class="text-end">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="fw-semibold">Rohit Verma</div>
                                        <div class="text-muted small">Kashmir 5N/6D (Family)</div>
                                    </td>
                                    <td><a href="tel:+919876543210" class="text-decoration-none text-dark">+91 98765 43210</a></td>
                                    <td>Gorakhpur</td>
                                    <td><span class="badge bg-light text-dark border">Google / Internet</span></td>
                                    <td>Rakesh (Field)</td>
                                    <td><span class="badge badge-status-interested">Interested</span></td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#viewLeadModal" data-name="Rohit Verma" data-phone="+91 98765 43210" data-dest="Kashmir 5N/6D" data-owner="Rakesh Yadav" data-assigned="Priya Sharma" data-status="Interested" data-priority="Hot">
                                            <i class="bi bi-eye"></i> View
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-semibold">Ananya Mishra</div>
                                        <div class="text-muted small">Dubai Luxury Tour (Couple)</div>
                                    </td>
                                    <td><a href="tel:+919452188321" class="text-decoration-none text-dark">+91 94521 88321</a></td>
                                    <td>Deoria</td>
                                    <td><span class="badge bg-light text-dark border">Sales</span></td>
                                    <td>Priya (Sales)</td>
                                    <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#viewLeadModal" data-name="Ananya Mishra" data-phone="+91 94521 88321" data-dest="Dubai Luxury Tour" data-owner="Priya Sharma" data-assigned="Priya Sharma" data-status="Confirmed" data-priority="Hot">
                                            <i class="bi bi-eye"></i> View
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-semibold">Amit Pandey</div>
                                        <div class="text-muted small">Goa Honeymoon Special</div>
                                    </td>
                                    <td><a href="tel:+918876511234" class="text-decoration-none text-dark">+91 88765 11234</a></td>
                                    <td>Basti</td>
                                    <td><span class="badge bg-light text-dark border">Referral</span></td>
                                    <td>Admin Entry</td>
                                    <td><span class="badge badge-status-pending">Pending</span></td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#viewLeadModal" data-name="Amit Pandey" data-phone="+91 88765 11234" data-dest="Goa Honeymoon Special" data-owner="Admin" data-assigned="Manoj Tiwari" data-status="Pending" data-priority="Warm">
                                            <i class="bi bi-eye"></i> View
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-semibold">Sunita Singh</div>
                                        <div class="text-muted small">Himachal Adventure (4 Pax)</div>
                                    </td>
                                    <td><a href="tel:+919123456789" class="text-decoration-none text-dark">+91 91234 56789</a></td>
                                    <td>Gorakhpur</td>
                                    <td><span class="badge bg-light text-dark border">Field Visit</span></td>
                                    <td>Rakesh (Field)</td>
                                    <td><span class="badge badge-status-interested">Interested</span></td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#viewLeadModal" data-name="Sunita Singh" data-phone="+91 91234 56789" data-dest="Himachal Adventure" data-owner="Rakesh Yadav" data-assigned="Pooja Srivastava" data-status="Interested" data-priority="Hot">
                                            <i class="bi bi-eye"></i> View
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-semibold">Vikram Chauhan</div>
                                        <div class="text-muted small">Thailand 4N/5D Pattaya-BKK</div>
                                    </td>
                                    <td><a href="tel:+919798123456" class="text-decoration-none text-dark">+91 97981 23456</a></td>
                                    <td>Maharajganj</td>
                                    <td><span class="badge bg-light text-dark border">Google / Internet</span></td>
                                    <td>Admin Entry</td>
                                    <td><span class="badge badge-status-pending">Pending</span></td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#viewLeadModal" data-name="Vikram Chauhan" data-phone="+91 97981 23456" data-dest="Thailand 4N/5D" data-owner="Admin" data-assigned="Pooja Srivastava" data-status="Pending" data-priority="Warm">
                                            <i class="bi bi-eye"></i> View
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
                                <tr>
                                    <td>
                                        <div class="fw-semibold">Dr. Arvind Kumar</div>
                                        <div class="text-muted small">Gorakhpur Medical College</div>
                                    </td>
                                    <td>+91 98390 12345</td>
                                    <td>Char Dham Yatra by Helicopter (4 Pax)</td>
                                    <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                                    <td><span class="fw-semibold text-danger">Today, 02:30 PM</span></td>
                                    <td><span class="badge badge-status-pending">Pending Call</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Call logged for Dr. Arvind Kumar.');">
                                            <i class="bi bi-telephone-outbound"></i> Call
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-semibold">Meera Rastogi</div>
                                        <div class="text-muted small">Civil Lines, Gorakhpur</div>
                                    </td>
                                    <td>+91 94150 98765</td>
                                    <td>Kerala 6N/7D Munnar & Houseboat</td>
                                    <td><span class="badge bg-warning-subtle text-warning">Rakesh Yadav</span></td>
                                    <td><span class="fw-semibold text-dark">Today, 04:00 PM</span></td>
                                    <td><span class="badge badge-status-interested">Itinerary Sent</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Call logged for Meera Rastogi.');">
                                            <i class="bi bi-telephone-outbound"></i> Call
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-semibold">Rajesh Gupta</div>
                                        <div class="text-muted small">Padrauna</div>
                                    </td>
                                    <td>+91 97210 54321</td>
                                    <td>Vietnam & Cambodia 8D Tour</td>
                                    <td><span class="badge bg-info-subtle text-info">Pooja Srivastava</span></td>
                                    <td><span class="fw-semibold text-muted">Tomorrow, 11:00 AM</span></td>
                                    <td><span class="badge bg-light text-dark border">Scheduled</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Rescheduled reminder note.');">
                                            <i class="bi bi-clock"></i> Reschedule
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-semibold">Sanjay Tripathi</div>
                                        <div class="text-muted small">Rustampur, Gorakhpur</div>
                                    </td>
                                    <td>+91 99351 77665</td>
                                    <td>Andaman Islands 5N Honeymoon</td>
                                    <td><span class="badge bg-primary-subtle text-primary">Manoj Tiwari</span></td>
                                    <td><span class="fw-semibold text-muted">Tomorrow, 03:00 PM</span></td>
                                    <td><span class="badge badge-status-interested">Hot Lead</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Rescheduled reminder note.');">
                                            <i class="bi bi-clock"></i> Reschedule
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

    <!-- Quick Lead Details View Modal -->
    <div class="modal fade" id="viewLeadModal" tabindex="-1" aria-labelledby="viewLeadModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="viewLeadModalLabel">
                        <i class="bi bi-person-badge text-success me-1"></i> Lead Quick Preview
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

    <!-- Script to populate Lead View modal -->
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
    </script>
</asp:Content>