<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AllLeads.aspx.cs" Inherits="AllLeads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>All Leads | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">All Travel Leads</h2>
            <p class="nj-page-subtitle">Central lead repository with attribution, ownership tracking and assignments.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <a href="AddLead.aspx" class="btn btn-nj-primary btn-sm">
                <i class="bi bi-plus-circle"></i> Add New Lead
            </a>
            <a href="AssignLeads.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-arrow-left-right"></i> Bulk Assign
            </a>
            <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Exporting filtered leads to CSV (sample)...');">
                <i class="bi bi-file-earmark-spreadsheet"></i> Export
            </button>
        </div>
    </div>

    <!-- Attribution Info Alert -->
    <div class="alert alert-light border py-2 px-3 mb-3 small d-flex align-items-center justify-content-between flex-wrap gap-2">
        <div class="d-flex align-items-center gap-2">
            <i class="bi bi-shield-check text-success fs-5"></i>
            <span><strong>CRM Attribution Rule:</strong> <em>Lead Owner</em> receives permanent sales credit for the lead. <em>Assigned Employee</em> handles active follow-ups.</span>
        </div>
        <span class="badge bg-light text-muted border">Total: 300 Leads</span>
    </div>

    <!-- Filters & Search Bar Card -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <!-- Search input -->
                <div class="col-12 col-md-3">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" id="leadSearch" class="form-control border-start-0" placeholder="Search client, mobile, city..." />
                    </div>
                </div>

                <!-- Status Filter -->
                <div class="col-6 col-md-2">
                    <select id="filterStatus" class="form-select form-select-sm">
                        <option value="">All Statuses</option>
                        <option value="New">New</option>
                        <option value="Interested">Interested</option>
                        <option value="Pending">Pending</option>
                        <option value="Confirmed">Confirmed</option>
                        <option value="Not Interested">Not Interested</option>
                        <option value="Closed">Closed</option>
                    </select>
                </div>

                <!-- Priority Filter -->
                <div class="col-6 col-md-2">
                    <select id="filterPriority" class="form-select form-select-sm">
                        <option value="">All Priorities</option>
                        <option value="Hot">Hot (High)</option>
                        <option value="Warm">Warm (Medium)</option>
                        <option value="Cold">Cold (Low)</option>
                    </select>
                </div>

                <!-- Lead Source Filter -->
                <div class="col-6 col-md-2">
                    <select id="filterSource" class="form-select form-select-sm">
                        <option value="">All Lead Sources</option>
                        <option value="Google / Internet">Google / Internet</option>
                        <option value="Field Visit">Field Visit</option>
                        <option value="Sales">Sales</option>
                        <option value="Admin Entry">Admin Entry</option>
                        <option value="Referral">Referral</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <!-- Employee Filter -->
                <div class="col-6 col-md-2">
                    <select id="filterEmployee" class="form-select form-select-sm">
                        <option value="">All Staff</option>
                        <option value="Priya Sharma">Priya Sharma (Sales)</option>
                        <option value="Rakesh Yadav">Rakesh Yadav (Field)</option>
                        <option value="Pooja Srivastava">Pooja Srivastava (Calling)</option>
                        <option value="Manoj Tiwari">Manoj Tiwari (Sales)</option>
                    </select>
                </div>

                <!-- Reset Filter Button -->
                <div class="col-12 col-md-1 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="document.getElementById('leadSearch').value=''; document.querySelectorAll('select').forEach(s => s.selectedIndex = 0);" title="Reset Filters">
                        <i class="bi bi-arrow-counterclockwise"></i> Reset
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Leads Table Card -->
    <div class="card">
        <div class="card-header">
            <div>
                <h6 class="mb-0"><i class="bi bi-table"></i> Leads Directory</h6>
                <small class="text-muted">Showing 10 of 300 active travel inquiries</small>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="badge bg-success-subtle text-success">Page 1 of 30</span>
            </div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead>
                        <tr>
                            <th>Lead ID</th>
                            <th>Client Name</th>
                            <th>Mobile</th>
                            <th>Location / Tour</th>
                            <th>Lead Source</th>
                            <th>Added By</th>
                            <th>Lead Owner</th>
                            <th>Assigned Employee</th>
                            <th>Status</th>
                            <th>Priority</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Row 1 -->
                        <tr>
                            <td><span class="fw-bold text-success">#NJ-10301</span></td>
                            <td>
                                <div class="fw-bold">Rohit Verma</div>
                                <small class="text-muted">Family (4 Pax)</small>
                            </td>
                            <td><a href="tel:+919876543210" class="text-decoration-none text-dark">+91 98765 43210</a></td>
                            <td>
                                <div>Gorakhpur</div>
                                <small class="text-muted">Kashmir 5N/6D</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Google / Internet</span></td>
                            <td>Admin Entry</td>
                            <td><span class="fw-semibold text-primary">Rakesh Yadav</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-status-interested">Interested</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadViewModal" title="View Details" onclick="showLeadDetails('NJ-10301', 'Rohit Verma', '+91 98765 43210', 'Gorakhpur', 'Kashmir 5N/6D', 'Google / Internet', 'Admin Entry', 'Rakesh Yadav', 'Priya Sharma', 'Interested', 'Hot', 'Client asked for 4-star houseboats in Srinagar and Sonmarg day tour.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadEditModal" title="Edit Lead">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 2 -->
                        <tr>
                            <td><span class="fw-bold text-success">#NJ-10302</span></td>
                            <td>
                                <div class="fw-bold">Ananya Mishra</div>
                                <small class="text-muted">Couple</small>
                            </td>
                            <td><a href="tel:+919452188321" class="text-decoration-none text-dark">+91 94521 88321</a></td>
                            <td>
                                <div>Deoria</div>
                                <small class="text-muted">Dubai Luxury 5N</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Sales</span></td>
                            <td>Priya Sharma</td>
                            <td><span class="fw-semibold text-primary">Priya Sharma</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadViewModal" title="View Details" onclick="showLeadDetails('NJ-10302', 'Ananya Mishra', '+91 94521 88321', 'Deoria', 'Dubai Luxury 5N', 'Sales', 'Priya Sharma', 'Priya Sharma', 'Priya Sharma', 'Confirmed', 'Hot', 'Booking advance received ₹50,000. Visa under process.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadEditModal" title="Edit Lead">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 3 -->
                        <tr>
                            <td><span class="fw-bold text-success">#NJ-10303</span></td>
                            <td>
                                <div class="fw-bold">Amit Pandey</div>
                                <small class="text-muted">Couple (Honeymoon)</small>
                            </td>
                            <td><a href="tel:+918876511234" class="text-decoration-none text-dark">+91 88765 11234</a></td>
                            <td>
                                <div>Basti</div>
                                <small class="text-muted">Goa Beach Villa 4N</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Referral</span></td>
                            <td>Admin Entry</td>
                            <td><span class="fw-semibold text-primary">Admin</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Manoj Tiwari</span></td>
                            <td><span class="badge badge-status-pending">Pending</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadViewModal" title="View Details" onclick="showLeadDetails('NJ-10303', 'Amit Pandey', '+91 88765 11234', 'Basti', 'Goa Beach Villa 4N', 'Referral', 'Admin Entry', 'Admin', 'Manoj Tiwari', 'Pending', 'Warm', 'Sent resort options in Candolim. Awaiting dates confirmation.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadEditModal" title="Edit Lead">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 4 -->
                        <tr>
                            <td><span class="fw-bold text-success">#NJ-10304</span></td>
                            <td>
                                <div class="fw-bold">Sunita Singh</div>
                                <small class="text-muted">Group (6 Pax)</small>
                            </td>
                            <td><a href="tel:+919123456789" class="text-decoration-none text-dark">+91 91234 56789</a></td>
                            <td>
                                <div>Gorakhpur</div>
                                <small class="text-muted">Himachal Adventure 6N</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Field Visit</span></td>
                            <td>Rakesh Yadav</td>
                            <td><span class="fw-semibold text-primary">Rakesh Yadav</span></td>
                            <td><span class="badge bg-info-subtle text-info">Pooja Srivastava</span></td>
                            <td><span class="badge badge-status-interested">Interested</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadViewModal" title="View Details" onclick="showLeadDetails('NJ-10304', 'Sunita Singh', '+91 91234 56789', 'Gorakhpur', 'Himachal Adventure 6N', 'Field Visit', 'Rakesh Yadav', 'Rakesh Yadav', 'Pooja Srivastava', 'Interested', 'Hot', 'Wants tempo traveler from Delhi to Shimla-Manali.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadEditModal" title="Edit Lead">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 5 -->
                        <tr>
                            <td><span class="fw-bold text-success">#NJ-10305</span></td>
                            <td>
                                <div class="fw-bold">Vikram Chauhan</div>
                                <small class="text-muted">Friends (3 Pax)</small>
                            </td>
                            <td><a href="tel:+919798123456" class="text-decoration-none text-dark">+91 97981 23456</a></td>
                            <td>
                                <div>Maharajganj</div>
                                <small class="text-muted">Thailand Bangkok-Pattaya</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Google / Internet</span></td>
                            <td>Admin Entry</td>
                            <td><span class="fw-semibold text-primary">Admin</span></td>
                            <td><span class="badge bg-info-subtle text-info">Pooja Srivastava</span></td>
                            <td><span class="badge badge-status-pending">Pending</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadViewModal" title="View Details" onclick="showLeadDetails('NJ-10305', 'Vikram Chauhan', '+91 97981 23456', 'Maharajganj', 'Thailand Bangkok-Pattaya', 'Google / Internet', 'Admin Entry', 'Admin', 'Pooja Srivastava', 'Pending', 'Warm', 'Follow-up requested on Monday after flight prices update.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadEditModal" title="Edit Lead">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 6 -->
                        <tr>
                            <td><span class="fw-bold text-success">#NJ-10306</span></td>
                            <td>
                                <div class="fw-bold">Dr. Arvind Kumar</div>
                                <small class="text-muted">Senior Citizens (4 Pax)</small>
                            </td>
                            <td><a href="tel:+919839012345" class="text-decoration-none text-dark">+91 98390 12345</a></td>
                            <td>
                                <div>Gorakhpur</div>
                                <small class="text-muted">Char Dham Yatra Heli</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Sales</span></td>
                            <td>Priya Sharma</td>
                            <td><span class="fw-semibold text-primary">Priya Sharma</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-status-new">New</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadViewModal" title="View Details" onclick="showLeadDetails('NJ-10306', 'Dr. Arvind Kumar', '+91 98390 12345', 'Gorakhpur', 'Char Dham Yatra Heli', 'Sales', 'Priya Sharma', 'Priya Sharma', 'Priya Sharma', 'New', 'Hot', 'High-budget pilgrimage VIP helicopter booking inquiry.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadEditModal" title="Edit Lead">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 7 -->
                        <tr>
                            <td><span class="fw-bold text-success">#NJ-10307</span></td>
                            <td>
                                <div class="fw-bold">Meera Rastogi</div>
                                <small class="text-muted">Family (5 Pax)</small>
                            </td>
                            <td><a href="tel:+919415098765" class="text-decoration-none text-dark">+91 94150 98765</a></td>
                            <td>
                                <div>Gorakhpur</div>
                                <small class="text-muted">Kerala 6N/7D Tour</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Field Visit</span></td>
                            <td>Rakesh Yadav</td>
                            <td><span class="fw-semibold text-primary">Rakesh Yadav</span></td>
                            <td><span class="badge bg-warning-subtle text-warning">Rakesh Yadav</span></td>
                            <td><span class="badge badge-status-interested">Interested</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadViewModal" title="View Details" onclick="showLeadDetails('NJ-10307', 'Meera Rastogi', '+91 94150 98765', 'Gorakhpur', 'Kerala 6N/7D Tour', 'Field Visit', 'Rakesh Yadav', 'Rakesh Yadav', 'Rakesh Yadav', 'Interested', 'Warm', 'Requested customized Alleppey houseboat + Munnar tea garden stay.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadEditModal" title="Edit Lead">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 8 -->
                        <tr>
                            <td><span class="fw-bold text-success">#NJ-10308</span></td>
                            <td>
                                <div class="fw-bold">Kavita Gupta</div>
                                <small class="text-muted">Honeymoon (2 Pax)</small>
                            </td>
                            <td><a href="tel:+919839944332" class="text-decoration-none text-dark">+91 98399 44332</a></td>
                            <td>
                                <div>Kushinagar</div>
                                <small class="text-muted">Maldives Overwater Villa</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Referral</span></td>
                            <td>Admin Entry</td>
                            <td><span class="fw-semibold text-primary">Admin</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadViewModal" title="View Details" onclick="showLeadDetails('NJ-10308', 'Kavita Gupta', '+91 98399 44332', 'Kushinagar', 'Maldives Overwater Villa', 'Referral', 'Admin Entry', 'Admin', 'Priya Sharma', 'Confirmed', 'Hot', 'All-inclusive resort package confirmed with speedboat transfers.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadEditModal" title="Edit Lead">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 9 -->
                        <tr>
                            <td><span class="fw-bold text-success">#NJ-10309</span></td>
                            <td>
                                <div class="fw-bold">Dharmendra Maurya</div>
                                <small class="text-muted">Family (3 Pax)</small>
                            </td>
                            <td><a href="tel:+919161233445" class="text-decoration-none text-dark">+91 91612 33445</a></td>
                            <td>
                                <div>Siddharthnagar</div>
                                <small class="text-muted">Rajasthan Royal Heritage</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Google / Internet</span></td>
                            <td>Admin Entry</td>
                            <td><span class="fw-semibold text-primary">Admin</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Manoj Tiwari</span></td>
                            <td><span class="badge badge-status-notinterested">Not Interested</span></td>
                            <td><span class="badge badge-priority-cold">Cold</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadViewModal" title="View Details" onclick="showLeadDetails('NJ-10309', 'Dharmendra Maurya', '+91 91612 33445', 'Siddharthnagar', 'Rajasthan Royal Heritage', 'Google / Internet', 'Admin Entry', 'Admin', 'Manoj Tiwari', 'Not Interested', 'Cold', 'Customer postponed trip due to exam schedule.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadEditModal" title="Edit Lead">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Row 10 -->
                        <tr>
                            <td><span class="fw-bold text-success">#NJ-10310</span></td>
                            <td>
                                <div class="fw-bold">Alok Dubey</div>
                                <small class="text-muted">Couple</small>
                            </td>
                            <td><a href="tel:+919793112233" class="text-decoration-none text-dark">+91 97931 12233</a></td>
                            <td>
                                <div>Gorakhpur</div>
                                <small class="text-muted">Singapore & Sentosa 5N</small>
                            </td>
                            <td><span class="badge bg-light text-dark border">Other</span></td>
                            <td>Field Visit</td>
                            <td><span class="fw-semibold text-primary">Rakesh Yadav</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                            <td><span class="badge badge-status-closed">Closed</span></td>
                            <td><span class="badge badge-priority-cold">Cold</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadViewModal" title="View Details" onclick="showLeadDetails('NJ-10310', 'Alok Dubey', '+91 97931 12233', 'Gorakhpur', 'Singapore & Sentosa 5N', 'Other', 'Field Visit', 'Rakesh Yadav', 'Priya Sharma', 'Closed', 'Cold', 'Customer booked directly with airlines.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#leadEditModal" title="Edit Lead">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Pagination UI -->
        <div class="card-footer bg-white border-top p-3 d-flex flex-wrap align-items-center justify-content-between gap-2">
            <div class="small text-muted">
                Showing <span class="fw-semibold text-dark">1</span> to <span class="fw-semibold text-dark">10</span> of <span class="fw-semibold text-dark">300</span> entries
            </div>
            <nav aria-label="Page navigation">
                <ul class="pagination pagination-sm mb-0">
                    <li class="page-item disabled"><a class="page-link" href="#"><i class="bi bi-chevron-left"></i> Previous</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                    <li class="page-item"><a class="page-link" href="#">30</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next <i class="bi bi-chevron-right"></i></a></li>
                </ul>
            </nav>
        </div>
    </div>

    <!-- Lead View Modal -->
    <div class="modal fade" id="leadViewModal" tabindex="-1" aria-labelledby="leadViewModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="leadViewModalTitle">
                        <i class="bi bi-info-circle text-success me-1"></i> Lead Information Details
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

    <!-- Lead Quick Edit Modal (UI only) -->
    <div class="modal fade" id="leadEditModal" tabindex="-1" aria-labelledby="leadEditModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="leadEditModalTitle">
                        <i class="bi bi-pencil-square text-success me-1"></i> Edit Lead Quick Info
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-2">
                        <label class="form-label">Client Name</label>
                        <input type="text" class="form-control form-control-sm" value="Rohit Verma" />
                    </div>
                    <div class="row g-2 mb-2">
                        <div class="col-6">
                            <label class="form-label">Mobile</label>
                            <input type="text" class="form-control form-control-sm" value="+91 98765 43210" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control form-control-sm" value="Gorakhpur" />
                        </div>
                    </div>
                    <div class="row g-2 mb-2">
                        <div class="col-6">
                            <label class="form-label">Lead Status</label>
                            <select class="form-select form-select-sm">
                                <option>New</option>
                                <option selected="selected">Interested</option>
                                <option>Pending</option>
                                <option>Confirmed</option>
                                <option>Not Interested</option>
                                <option>Closed</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label class="form-label">Priority</label>
                            <select class="form-select form-select-sm">
                                <option selected="selected">Hot</option>
                                <option>Warm</option>
                                <option>Cold</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Assigned Employee</label>
                        <select class="form-select form-select-sm">
                            <option selected="selected">Priya Sharma (Sales)</option>
                            <option>Rakesh Yadav (Field)</option>
                            <option>Pooja Srivastava (Calling)</option>
                            <option>Manoj Tiwari (Sales)</option>
                        </select>
                        <div class="form-text">Note: Changing the assigned employee does not alter the original Lead Owner.</div>
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Lead details updated successfully (UI sample).');" data-bs-dismiss="modal">Save Changes</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Script to populate lead details modal -->
    <script>
        function showLeadDetails(id, name, phone, loc, dest, source, addedby, owner, assigned, status, priority, remarks) {
            document.getElementById('v-id').textContent = '#' + id;
            document.getElementById('v-name').textContent = name;
            document.getElementById('v-phone').textContent = phone;
            document.getElementById('v-location').textContent = loc;
            document.getElementById('v-destination').textContent = dest;
            document.getElementById('v-source').textContent = source;
            document.getElementById('v-addedby').textContent = addedby;
            document.getElementById('v-owner').textContent = owner;
            document.getElementById('v-assigned').textContent = assigned;
            document.getElementById('v-remarks').textContent = remarks;

            // Badges
            var pBadge = document.getElementById('v-priority-badge');
            pBadge.innerHTML = '<span class="badge badge-priority-' + priority.toLowerCase() + '">' + priority + '</span>';

            var sClass = 'badge-status-' + status.toLowerCase().replace(/\s+/g, '');
            var sBadge = document.getElementById('v-status-badge');
            sBadge.innerHTML = '<span class="badge ' + sClass + '">' + status + '</span>';
        }
    </script>
</asp:Content>
