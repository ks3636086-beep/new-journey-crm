<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="MyLeads.aspx.cs" Inherits="MyLeads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Leads | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">My Travel Leads</h2>
            <p class="nj-page-subtitle">Track and manage customer inquiries created by you or assigned for your active follow-ups.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <a href="AddLead.aspx" class="btn btn-nj-primary btn-sm">
                <i class="bi bi-plus-circle"></i> Add New Lead
            </a>
            <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-calendar-check"></i> Today's Follow-ups
            </a>
        </div>
    </div>

    <!-- Quick Stats Pills -->
    <div class="row g-2 mb-3">
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Total My Inquiries</span>
                    <h5 class="fw-bold mb-0 text-dark">38</h5>
                </div>
                <span class="badge bg-light text-primary border p-2"><i class="bi bi-people"></i></span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Hot Leads</span>
                    <h5 class="fw-bold mb-0 text-danger">9</h5>
                </div>
                <span class="badge bg-danger-subtle text-danger border p-2"><i class="bi bi-fire"></i></span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Pending Discussion</span>
                    <h5 class="fw-bold mb-0 text-warning">15</h5>
                </div>
                <span class="badge bg-warning-subtle text-warning border p-2"><i class="bi bi-hourglass-split"></i></span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Confirmed Bookings</span>
                    <h5 class="fw-bold mb-0 text-success">14</h5>
                </div>
                <span class="badge bg-success-subtle text-success border p-2"><i class="bi bi-check2-circle"></i></span>
            </div>
        </div>
    </div>

    <!-- Filters & Search Toolbar -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <!-- Search input -->
                <div class="col-12 col-md-3">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" id="leadSearchInput" class="form-control border-start-0" placeholder="Search customer, phone, city..." onkeyup="filterTable();" />
                    </div>
                </div>

                <!-- Status Filter -->
                <div class="col-6 col-md-3">
                    <select id="filterStatus" class="form-select form-select-sm" onchange="filterTable();">
                        <option value="">All Statuses</option>
                        <option value="New">New</option>
                        <option value="Interested">Interested</option>
                        <option value="Pending">Pending</option>
                        <option value="Confirmed">Confirmed</option>
                        <option value="Not Interested">Not Interested</option>
                    </select>
                </div>

                <!-- Priority Filter -->
                <div class="col-6 col-md-3">
                    <select id="filterPriority" class="form-select form-select-sm" onchange="filterTable();">
                        <option value="">All Priorities</option>
                        <option value="Hot">Hot (Urgent)</option>
                        <option value="Warm">Warm (Medium)</option>
                        <option value="Cold">Cold (Low)</option>
                    </select>
                </div>

                <!-- Source Filter -->
                <div class="col-6 col-md-2">
                    <select id="filterSource" class="form-select form-select-sm" onchange="filterTable();">
                        <option value="">All Sources</option>
                        <option value="Google">Google / Internet</option>
                        <option value="Field Visit">Field Visit</option>
                        <option value="Walk-in">Walk-in</option>
                        <option value="Referral">Referral</option>
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

    <!-- Leads Table Card -->
    <div class="card">
        <div class="card-header bg-white">
            <div>
                <h6 class="mb-0"><i class="bi bi-person-lines-fill"></i> My Active Leads</h6>
                <small class="text-muted">Showing 7 active inquiries assigned to Priya Sharma</small>
            </div>
            <span class="badge bg-light text-dark border">7 of 38 Shown</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0" id="myLeadsTable">
                    <thead>
                        <tr>
                            <th>Lead ID</th>
                            <th>Customer Name</th>
                            <th>Mobile</th>
                            <th>Destination</th>
                            <th>Travel Date</th>
                            <th>Status</th>
                            <th>Priority</th>
                            <th>Lead Owner</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Lead 1 -->
                        <tr class="lead-row-item" data-status="Interested" data-priority="Hot" data-source="Google">
                            <td><span class="fw-bold text-success">#NJ-10301</span></td>
                            <td>
                                <div class="fw-bold">Rohit Verma</div>
                                <small class="text-muted">Gorakhpur (Golghar)</small>
                            </td>
                            <td><a href="tel:+919876543210" class="text-decoration-none text-dark">+91 98765 43210</a></td>
                            <td>
                                <div class="fw-semibold">Kashmir 5N/6D Deluxe</div>
                                <small class="text-muted">4 Pax &bull; Houseboat incl.</small>
                            </td>
                            <td>15 Nov 2026</td>
                            <td><span class="badge badge-status-interested">Interested</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td><span class="badge bg-light text-dark border">Rakesh Yadav</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-outline btn-sm" title="View Full Details">
                                    <i class="bi bi-eye"></i> View
                                </a>
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="openEditModal('NJ-10301', 'Rohit Verma', '+91 98765 43210', 'Kashmir 5N/6D Deluxe', 'Interested', 'Hot');" title="Quick Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Lead 2 -->
                        <tr class="lead-row-item" data-status="Confirmed" data-priority="Hot" data-source="Walk-in">
                            <td><span class="fw-bold text-success">#NJ-10302</span></td>
                            <td>
                                <div class="fw-bold">Ananya Mishra</div>
                                <small class="text-muted">Deoria</small>
                            </td>
                            <td><a href="tel:+919452188321" class="text-decoration-none text-dark">+91 94521 88321</a></td>
                            <td>
                                <div class="fw-semibold">Dubai Luxury Tour</div>
                                <small class="text-muted">2 Pax &bull; 5-Star Marina</small>
                            </td>
                            <td>20 Dec 2026</td>
                            <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td><span class="badge bg-success-subtle text-success">Priya Sharma (You)</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10302" class="btn btn-nj-outline btn-sm" title="View Full Details">
                                    <i class="bi bi-eye"></i> View
                                </a>
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="openEditModal('NJ-10302', 'Ananya Mishra', '+91 94521 88321', 'Dubai Luxury Tour', 'Confirmed', 'Hot');" title="Quick Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Lead 3 -->
                        <tr class="lead-row-item" data-status="New" data-priority="Hot" data-source="Walk-in">
                            <td><span class="fw-bold text-success">#NJ-10306</span></td>
                            <td>
                                <div class="fw-bold">Dr. Arvind Kumar</div>
                                <small class="text-muted">Gorakhpur (Medical College)</small>
                            </td>
                            <td><a href="tel:+919839012345" class="text-decoration-none text-dark">+91 98390 12345</a></td>
                            <td>
                                <div class="fw-semibold">Char Dham Yatra Heli</div>
                                <small class="text-muted">4 Pax &bull; VIP Darshan</small>
                            </td>
                            <td>05 May 2027</td>
                            <td><span class="badge badge-status-new">New</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td><span class="badge bg-success-subtle text-success">Priya Sharma (You)</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-outline btn-sm" title="View Full Details">
                                    <i class="bi bi-eye"></i> View
                                </a>
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="openEditModal('NJ-10306', 'Dr. Arvind Kumar', '+91 98390 12345', 'Char Dham Yatra Heli', 'New', 'Hot');" title="Quick Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Lead 4 -->
                        <tr class="lead-row-item" data-status="Confirmed" data-priority="Hot" data-source="Referral">
                            <td><span class="fw-bold text-success">#NJ-10308</span></td>
                            <td>
                                <div class="fw-bold">Kavita Gupta</div>
                                <small class="text-muted">Kushinagar</small>
                            </td>
                            <td><a href="tel:+919839944332" class="text-decoration-none text-dark">+91 98399 44332</a></td>
                            <td>
                                <div class="fw-semibold">Maldives Overwater Villa</div>
                                <small class="text-muted">Honeymoon &bull; 4N/5D</small>
                            </td>
                            <td>12 Jan 2027</td>
                            <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td><span class="badge bg-light text-dark border">Admin</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10308" class="btn btn-nj-outline btn-sm" title="View Full Details">
                                    <i class="bi bi-eye"></i> View
                                </a>
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="openEditModal('NJ-10308', 'Kavita Gupta', '+91 98399 44332', 'Maldives Overwater Villa', 'Confirmed', 'Hot');" title="Quick Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Lead 5 -->
                        <tr class="lead-row-item" data-status="Pending" data-priority="Warm" data-source="Google">
                            <td><span class="fw-bold text-success">#NJ-10314</span></td>
                            <td>
                                <div class="fw-bold">Preeti Agrawal</div>
                                <small class="text-muted">Basti</small>
                            </td>
                            <td><a href="tel:+919918088990" class="text-decoration-none text-dark">+91 99180 88990</a></td>
                            <td>
                                <div class="fw-semibold">Dubai 5N Luxury Tour</div>
                                <small class="text-muted">Family (5 Pax)</small>
                            </td>
                            <td>25 Nov 2026</td>
                            <td><span class="badge badge-status-pending">Pending</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td><span class="badge bg-success-subtle text-success">Priya Sharma (You)</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10314" class="btn btn-nj-outline btn-sm" title="View Full Details">
                                    <i class="bi bi-eye"></i> View
                                </a>
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="openEditModal('NJ-10314', 'Preeti Agrawal', '+91 99180 88990', 'Dubai 5N Luxury Tour', 'Pending', 'Warm');" title="Quick Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Lead 6 -->
                        <tr class="lead-row-item" data-status="Interested" data-priority="Warm" data-source="Field Visit">
                            <td><span class="fw-bold text-success">#NJ-10317</span></td>
                            <td>
                                <div class="fw-bold">Shruti Srivastava</div>
                                <small class="text-muted">Gorakhpur (Basharatpur)</small>
                            </td>
                            <td><a href="tel:+919161099887" class="text-decoration-none text-dark">+91 91610 99887</a></td>
                            <td>
                                <div class="fw-semibold">Kerala Munnar & Houseboat</div>
                                <small class="text-muted">4 Pax &bull; 6N/7D</small>
                            </td>
                            <td>08 Dec 2026</td>
                            <td><span class="badge badge-status-interested">Interested</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td><span class="badge bg-light text-dark border">Admin</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10317" class="btn btn-nj-outline btn-sm" title="View Full Details">
                                    <i class="bi bi-eye"></i> View
                                </a>
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="openEditModal('NJ-10317', 'Shruti Srivastava', '+91 91610 99887', 'Kerala Munnar & Houseboat', 'Interested', 'Warm');" title="Quick Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Lead 7 -->
                        <tr class="lead-row-item" data-status="Not Interested" data-priority="Cold" data-source="Google">
                            <td><span class="fw-bold text-success">#NJ-10309</span></td>
                            <td>
                                <div class="fw-bold">Dharmendra Maurya</div>
                                <small class="text-muted">Siddharthnagar</small>
                            </td>
                            <td><a href="tel:+919161233445" class="text-decoration-none text-dark">+91 91612 33445</a></td>
                            <td>
                                <div class="fw-semibold">Rajasthan Royal Heritage</div>
                                <small class="text-muted">3 Pax &bull; Postponed</small>
                            </td>
                            <td>Feb 2027</td>
                            <td><span class="badge badge-status-notinterested">Not Interested</span></td>
                            <td><span class="badge badge-priority-cold">Cold</span></td>
                            <td><span class="badge bg-light text-dark border">Admin</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10309" class="btn btn-nj-outline btn-sm" title="View Full Details">
                                    <i class="bi bi-eye"></i> View
                                </a>
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="openEditModal('NJ-10309', 'Dharmendra Maurya', '+91 91612 33445', 'Rajasthan Royal Heritage', 'Not Interested', 'Cold');" title="Quick Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Empty State (Hidden unless filtered out) -->
            <div id="noResultsState" class="text-center p-5 d-none">
                <i class="bi bi-search text-muted fs-1 mb-2"></i>
                <h6 class="fw-bold text-dark">No matching leads found</h6>
                <p class="text-muted small mb-3">Try adjusting your search terms or clearing the filters.</p>
                <button type="button" class="btn btn-nj-outline btn-sm" onclick="resetFilters();">Clear Filters</button>
            </div>
        </div>

        <div class="card-footer bg-white p-3 d-flex flex-wrap justify-content-between align-items-center gap-2">
            <span class="small text-muted">Showing 7 of 38 total leads</span>
            <ul class="pagination pagination-sm mb-0">
                <li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
    </div>

    <!-- Quick Edit Modal -->
    <div class="modal fade" id="quickEditModal" tabindex="-1" aria-labelledby="quickEditTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="quickEditTitle">
                        <i class="bi bi-pencil-square text-success me-1"></i> Quick Update Lead Status
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="edit_lead_id" />
                    <div class="mb-3 p-2 bg-light rounded">
                        <div class="fw-bold text-dark" id="modal_edit_name">Rohit Verma</div>
                        <div class="text-muted small" id="modal_edit_dest">Kashmir 5N/6D Deluxe</div>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Update Status</label>
                            <select class="form-select form-select-sm" id="edit_status">
                                <option value="New">New</option>
                                <option value="Interested">Interested</option>
                                <option value="Pending">Pending</option>
                                <option value="Confirmed">Confirmed</option>
                                <option value="Not Interested">Not Interested</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label class="form-label">Priority</label>
                            <select class="form-select form-select-sm" id="edit_priority">
                                <option value="Hot">Hot</option>
                                <option value="Warm">Warm</option>
                                <option value="Cold">Cold</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Follow-up Note</label>
                        <textarea class="form-control form-control-sm" rows="2" placeholder="Brief note on latest discussion..."></textarea>
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Lead status updated (UI sample)!');" data-bs-dismiss="modal">Save Update</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openEditModal(id, name, phone, dest, status, priority) {
            document.getElementById('edit_lead_id').value = id;
            document.getElementById('modal_edit_name').textContent = name + ' (' + id + ')';
            document.getElementById('modal_edit_dest').textContent = dest + ' • ' + phone;
            document.getElementById('edit_status').value = status;
            document.getElementById('edit_priority').value = priority;

            var modal = new bootstrap.Modal(document.getElementById('quickEditModal'));
            modal.show();
        }

        function filterTable() {
            var search = document.getElementById('leadSearchInput').value.toLowerCase();
            var status = document.getElementById('filterStatus').value;
            var priority = document.getElementById('filterPriority').value;
            var source = document.getElementById('filterSource').value;

            var rows = document.querySelectorAll('.lead-row-item');
            var visibleCount = 0;

            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                var rStatus = row.getAttribute('data-status');
                var rPriority = row.getAttribute('data-priority');
                var rSource = row.getAttribute('data-source');

                var matchSearch = search === '' || text.indexOf(search) > -1;
                var matchStatus = status === '' || rStatus === status;
                var matchPriority = priority === '' || rPriority === priority;
                var matchSource = source === '' || rSource === source;

                if (matchSearch && matchStatus && matchPriority && matchSource) {
                    row.style.display = '';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            });

            var empty = document.getElementById('noResultsState');
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
            filterTable();
        }
    </script>
</asp:Content>
