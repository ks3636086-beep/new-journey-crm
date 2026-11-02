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
            <a href="AddLead.aspx" class="btn btn-nj-primary btn-sm">
                <i class="bi bi-plus-circle"></i> Add New Lead
            </a>
            <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-calendar-check"></i> Follow-ups
            </a>
        </div>
    </div>

    <!-- Attribution Rule Reminder -->
    <div class="alert alert-light border py-2 px-3 mb-3 small d-flex align-items-center justify-content-between flex-wrap gap-2">
        <div class="d-flex align-items-center gap-2">
            <i class="bi bi-info-circle text-success fs-5"></i>
            <span><strong>Rule:</strong> <em>Lead Owner</em> = Original acquirer who gets sales credit &bull; <em>Assigned Employee</em> = Staff handling current calls.</span>
        </div>
        <span class="badge bg-light text-muted border">Total Active: 38 Leads</span>
    </div>

    <!-- Filters & Search Toolbar Card -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <!-- Search input -->
                <div class="col-12 col-md-3">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" id="leadSearchInput" class="form-control border-start-0" placeholder="Search customer, phone, city..." onkeyup="filterLeads();" />
                    </div>
                </div>

                <!-- Status Filter (New, Interested, Pending, Confirmed, Not Interested, Closed) -->
                <div class="col-6 col-md-3">
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

                <!-- Lead Source Filter -->
                <div class="col-6 col-md-3">
                    <select id="filterSource" class="form-select form-select-sm" onchange="filterLeads();">
                        <option value="">All Lead Sources</option>
                        <option value="Field Visit">Field Visit</option>
                        <option value="Google">Google</option>
                        <option value="Internet">Internet</option>
                        <option value="Referral">Referral</option>
                        <option value="Walk-in">Walk-in</option>
                        <option value="Admin/Office">Admin/Office</option>
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
                <h6 class="mb-0"><i class="bi bi-table"></i> Leads Directory</h6>
                <small class="text-muted">Showing 7 inquiries &bull; Columns reflect lead ownership, assignment and last call</small>
            </div>
            <span class="badge bg-light text-dark border">7 of 38 Shown</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0" id="leadsDesktopTable">
                    <thead>
                        <tr>
                            <th>Customer Name & Mobile</th>
                            <th>Destination & Date</th>
                            <th>Lead Source</th>
                            <th>Lead Owner</th>
                            <th>Assigned Employee</th>
                            <th>Priority</th>
                            <th>Status</th>
                            <th>Last Call</th>
                            <th>Next Follow-up</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Row 1 -->
                        <tr class="lead-item-row" data-status="Interested" data-priority="Hot" data-source="Google">
                            <td>
                                <div class="fw-bold">Rohit Verma</div>
                                <small class="text-muted"><a href="tel:+919876543210" class="text-decoration-none text-dark">+91 98765 43210</a> &bull; Gorakhpur</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Kashmir 5N/6D Deluxe</div>
                                <small class="text-muted">15 Nov 2026 &bull; 4 Pax</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Google</span></td>
                            <td><span class="badge bg-light text-dark border">Rakesh Yadav (Sales)</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td><span class="badge badge-status-interested">Interested</span></td>
                            <td><span class="small text-muted">Today, 11:45 AM</span></td>
                            <td><span class="small fw-bold text-danger">Today, 05:15 PM</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-outline btn-sm">
                                    <i class="bi bi-eye"></i> View Details
                                </a>
                            </td>
                        </tr>

                        <!-- Row 2 -->
                        <tr class="lead-item-row" data-status="Confirmed" data-priority="Hot" data-source="Walk-in">
                            <td>
                                <div class="fw-bold">Ananya Mishra</div>
                                <small class="text-muted"><a href="tel:+919452188321" class="text-decoration-none text-dark">+91 94521 88321</a> &bull; Deoria</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Dubai Luxury Tour</div>
                                <small class="text-muted">20 Dec 2026 &bull; 2 Pax</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Walk-in</span></td>
                            <td><span class="badge bg-success-subtle text-success">Priya Sharma (You)</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                            <td><span class="small text-muted">Today, 11:30 AM</span></td>
                            <td><span class="small text-muted">Completed (Won)</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10302" class="btn btn-nj-outline btn-sm">
                                    <i class="bi bi-eye"></i> View Details
                                </a>
                            </td>
                        </tr>

                        <!-- Row 3 -->
                        <tr class="lead-item-row" data-status="New" data-priority="Hot" data-source="Field Visit">
                            <td>
                                <div class="fw-bold">Dr. Arvind Kumar</div>
                                <small class="text-muted"><a href="tel:+919839012345" class="text-decoration-none text-dark">+91 98390 12345</a> &bull; Gorakhpur</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Char Dham Yatra Heli</div>
                                <small class="text-muted">05 May 2027 &bull; 4 Pax</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Field Visit</span></td>
                            <td><span class="badge bg-success-subtle text-success">Priya Sharma (You)</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td><span class="badge badge-status-new">New</span></td>
                            <td><span class="small text-muted">Today, 10:15 AM</span></td>
                            <td><span class="small fw-bold text-danger">Today, 02:30 PM</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-outline btn-sm">
                                    <i class="bi bi-eye"></i> View Details
                                </a>
                            </td>
                        </tr>

                        <!-- Row 4 -->
                        <tr class="lead-item-row" data-status="Pending" data-priority="Warm" data-source="Google">
                            <td>
                                <div class="fw-bold">Preeti Agrawal</div>
                                <small class="text-muted"><a href="tel:+919918088990" class="text-decoration-none text-dark">+91 99180 88990</a> &bull; Basti</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Dubai 5N Luxury Package</div>
                                <small class="text-muted">25 Nov 2026 &bull; 5 Pax</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Google</span></td>
                            <td><span class="badge bg-success-subtle text-success">Priya Sharma (You)</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td><span class="badge badge-status-pending">Pending</span></td>
                            <td><span class="small text-muted">Today, 09:30 AM</span></td>
                            <td><span class="small fw-bold text-dark">Today, 06:00 PM</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10314" class="btn btn-nj-outline btn-sm">
                                    <i class="bi bi-eye"></i> View Details
                                </a>
                            </td>
                        </tr>

                        <!-- Row 5 -->
                        <tr class="lead-item-row" data-status="Interested" data-priority="Warm" data-source="Field Visit">
                            <td>
                                <div class="fw-bold">Shruti Srivastava</div>
                                <small class="text-muted"><a href="tel:+919161099887" class="text-decoration-none text-dark">+91 91610 99887</a> &bull; Gorakhpur</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Kerala Munnar & Houseboat</div>
                                <small class="text-muted">08 Dec 2026 &bull; 4 Pax</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Field Visit</span></td>
                            <td><span class="badge bg-light text-dark border">Admin</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td><span class="badge badge-status-interested">Interested</span></td>
                            <td><span class="small text-muted">Yesterday</span></td>
                            <td><span class="small text-muted">Tomorrow, 02:00 PM</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10317" class="btn btn-nj-outline btn-sm">
                                    <i class="bi bi-eye"></i> View Details
                                </a>
                            </td>
                        </tr>

                        <!-- Row 6 -->
                        <tr class="lead-item-row" data-status="Confirmed" data-priority="Hot" data-source="Referral">
                            <td>
                                <div class="fw-bold">Kavita Gupta</div>
                                <small class="text-muted"><a href="tel:+919839944332" class="text-decoration-none text-dark">+91 98399 44332</a> &bull; Kushinagar</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Maldives Overwater Villa</div>
                                <small class="text-muted">12 Jan 2027 &bull; 2 Pax</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Referral</span></td>
                            <td><span class="badge bg-light text-dark border">Admin</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                            <td><span class="small text-muted">2 days ago</span></td>
                            <td><span class="small text-muted">Voucher Sent</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10308" class="btn btn-nj-outline btn-sm">
                                    <i class="bi bi-eye"></i> View Details
                                </a>
                            </td>
                        </tr>

                        <!-- Row 7 -->
                        <tr class="lead-item-row" data-status="Not Interested" data-priority="Cold" data-source="Internet">
                            <td>
                                <div class="fw-bold">Dharmendra Maurya</div>
                                <small class="text-muted"><a href="tel:+919161233445" class="text-decoration-none text-dark">+91 91612 33445</a> &bull; Siddharthnagar</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Rajasthan Royal Heritage</div>
                                <small class="text-muted">Feb 2027 &bull; 3 Pax</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Internet</span></td>
                            <td><span class="badge bg-light text-dark border">Admin</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-priority-cold">Cold</span></td>
                            <td><span class="badge badge-status-notinterested">Not Interested</span></td>
                            <td><span class="small text-muted">2 days ago</span></td>
                            <td><span class="small text-muted">None (Closed)</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10309" class="btn btn-nj-outline btn-sm">
                                    <i class="bi bi-eye"></i> View Details
                                </a>
                            </td>
                        </tr>
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
                        <i class="bi bi-eye"></i> View Details
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
                        <i class="bi bi-eye"></i> View Details
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
                        <i class="bi bi-eye"></i> View Details
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
            var search = document.getElementById('leadSearchInput').value.toLowerCase();
            var status = document.getElementById('filterStatus').value;
            var priority = document.getElementById('filterPriority').value;
            var source = document.getElementById('filterSource').value;

            // Desktop Rows
            var rows = document.querySelectorAll('.lead-item-row');
            var visibleCount = 0;

            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                var rStatus = row.getAttribute('data-status');
                var rPriority = row.getAttribute('data-priority');
                var rSource = row.getAttribute('data-source');

                var mSearch = search === '' || text.indexOf(search) > -1;
                var mStatus = status === '' || rStatus === status;
                var mPriority = priority === '' || rPriority === priority;
                var mSource = source === '' || rSource === source;

                if (mSearch && mStatus && mPriority && mSource) {
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
                var cStatus = card.getAttribute('data-status');
                var cPriority = card.getAttribute('data-priority');
                var cSource = card.getAttribute('data-source');

                var mSearch = search === '' || text.indexOf(search) > -1;
                var mStatus = status === '' || cStatus === status;
                var mPriority = priority === '' || cPriority === priority;
                var mSource = source === '' || cSource === source;

                if (mSearch && mStatus && mPriority && mSource) {
                    card.style.display = '';
                } else {
                    card.style.display = 'none';
                }
            });

            var empty = document.getElementById('leadsEmptyState');
            if (visibleCount === 0) {
                empty.classList.remove('d-none');
            } else {
                empty.classList.add('d-none');
            }
        }

        function resetFilters() {
            document.getElementById('leadSearchInput').value = '';
            document.getElementById('filterStatus').selectedIndex = 0;
            document.getElementById('filterPriority').selectedIndex = 0;
            document.getElementById('filterSource').selectedIndex = 0;
            filterLeads();
        }
    </script>
</asp:Content>