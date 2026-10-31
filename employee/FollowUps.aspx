<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="FollowUps.aspx.cs" Inherits="FollowUps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Follow-ups | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Follow-up Tasks</h2>
            <p class="nj-page-subtitle">Scheduled calls and client reminders assigned to your desk.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#newFollowupModal">
                <i class="bi bi-calendar-plus"></i> Add Follow-up
            </button>
            <a href="CallHistory.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-clock-history"></i> My Call History
            </a>
        </div>
    </div>

    <!-- Navigation Tabs for Follow-up Queues -->
    <ul class="nav nav-pills mb-3 gap-2" id="empFollowupTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active d-flex align-items-center gap-2 border" id="today-tab" data-bs-toggle="pill" data-bs-target="#tab-today" type="button" role="tab">
                <i class="bi bi-calendar-check"></i>
                <span>Today's Follow-ups</span>
                <span class="badge bg-danger">8</span>
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link d-flex align-items-center gap-2 border" id="upcoming-tab" data-bs-toggle="pill" data-bs-target="#tab-upcoming" type="button" role="tab">
                <i class="bi bi-calendar-range"></i>
                <span>Upcoming</span>
                <span class="badge bg-secondary">16</span>
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link d-flex align-items-center gap-2 border text-danger" id="overdue-tab" data-bs-toggle="pill" data-bs-target="#tab-overdue" type="button" role="tab">
                <i class="bi bi-exclamation-triangle"></i>
                <span>Overdue</span>
                <span class="badge bg-danger">2</span>
            </button>
        </li>
    </ul>

    <!-- Quick Search Bar -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" class="form-control border-start-0" placeholder="Search customer, phone or destination..." />
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <select class="form-select form-select-sm">
                        <option value="">All Priorities</option>
                        <option>Hot Priority</option>
                        <option>Warm Priority</option>
                    </select>
                </div>
                <div class="col-6 col-md-3 text-md-end">
                    <span class="small text-muted">Desk: <strong>Priya Sharma</strong></span>
                </div>
            </div>
        </div>
    </div>

    <!-- Tab Content -->
    <div class="tab-content" id="empFollowupTabContent">
        <!-- 1. Today's Follow-ups -->
        <div class="tab-pane fade show active" id="tab-today" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-calendar2-day text-success"></i> Due Today (8 Calls Scheduled)</h6>
                        <small class="text-muted">High priority client calls requiring contact before 07:30 PM</small>
                    </div>
                    <span class="badge bg-danger-subtle text-danger">3 Calls Pending</span>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Customer Name</th>
                                    <th>Mobile</th>
                                    <th>Destination / Package</th>
                                    <th>Follow-up Time</th>
                                    <th>Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Call 1 -->
                                <tr>
                                    <td>
                                        <div class="fw-bold">Dr. Arvind Kumar</div>
                                        <small class="text-muted">Gorakhpur</small>
                                    </td>
                                    <td><a href="tel:+919839012345" class="text-decoration-none text-dark">+91 98390 12345</a></td>
                                    <td>
                                        <div>Char Dham Yatra Heli</div>
                                        <small class="text-muted">4 Pax &bull; VIP Package</small>
                                    </td>
                                    <td><span class="fw-bold text-danger">Today, 02:30 PM</span></td>
                                    <td><span class="badge badge-status-new">Pending Call</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="openUpdateModal('Dr. Arvind Kumar', '+91 98390 12345', 'Char Dham Yatra');">
                                            <i class="bi bi-telephone-outbound"></i> Update Outcome
                                        </button>
                                        <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-outline btn-sm" title="View Lead">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                    </td>
                                </tr>

                                <!-- Call 2 -->
                                <tr>
                                    <td>
                                        <div class="fw-bold">Rohit Verma</div>
                                        <small class="text-muted">Gorakhpur</small>
                                    </td>
                                    <td><a href="tel:+919876543210" class="text-decoration-none text-dark">+91 98765 43210</a></td>
                                    <td>
                                        <div>Kashmir 5N/6D Deluxe</div>
                                        <small class="text-muted">Family (4 Pax)</small>
                                    </td>
                                    <td><span class="fw-bold text-dark">Today, 05:15 PM</span></td>
                                    <td><span class="badge badge-status-interested">Itinerary Sent</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="openUpdateModal('Rohit Verma', '+91 98765 43210', 'Kashmir Deluxe');">
                                            <i class="bi bi-telephone-outbound"></i> Update Outcome
                                        </button>
                                        <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-outline btn-sm" title="View Lead">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                    </td>
                                </tr>

                                <!-- Call 3 -->
                                <tr>
                                    <td>
                                        <div class="fw-bold">Preeti Agrawal</div>
                                        <small class="text-muted">Basti</small>
                                    </td>
                                    <td><a href="tel:+919918088990" class="text-decoration-none text-dark">+91 99180 88990</a></td>
                                    <td>
                                        <div>Dubai 5N Luxury Package</div>
                                        <small class="text-muted">5 Pax</small>
                                    </td>
                                    <td><span class="fw-bold text-dark">Today, 06:00 PM</span></td>
                                    <td><span class="badge badge-status-pending">Awaiting Decision</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="openUpdateModal('Preeti Agrawal', '+91 99180 88990', 'Dubai Package');">
                                            <i class="bi bi-telephone-outbound"></i> Update Outcome
                                        </button>
                                        <a href="LeadDetails.aspx?id=NJ-10314" class="btn btn-nj-outline btn-sm" title="View Lead">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                    </td>
                                </tr>

                                <!-- Call 4 -->
                                <tr>
                                    <td>
                                        <div class="fw-bold text-muted">Ananya Mishra</div>
                                        <small class="text-muted">Deoria</small>
                                    </td>
                                    <td>+91 94521 88321</td>
                                    <td>
                                        <div>Dubai Luxury Tour</div>
                                        <small class="text-muted">2 Pax</small>
                                    </td>
                                    <td>Today, 11:30 AM</td>
                                    <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Completed / Won</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-light btn-sm text-success" disabled="disabled">
                                            <i class="bi bi-check-all"></i> Completed
                                        </button>
                                        <a href="LeadDetails.aspx?id=NJ-10302" class="btn btn-nj-outline btn-sm" title="View Lead">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 2. Upcoming Follow-ups -->
        <div class="tab-pane fade" id="tab-upcoming" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-calendar-range text-primary"></i> Upcoming Pipeline (16 Calls)</h6>
                        <small class="text-muted">Scheduled for tomorrow and next week</small>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Customer Name</th>
                                    <th>Mobile</th>
                                    <th>Destination</th>
                                    <th>Scheduled Date & Time</th>
                                    <th>Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Alok Dubey</div>
                                        <small class="text-muted">Gorakhpur</small>
                                    </td>
                                    <td>+91 97931 12233</td>
                                    <td>Singapore & Sentosa 5N</td>
                                    <td>Tomorrow, 11:00 AM</td>
                                    <td><span class="badge badge-status-interested">Itinerary Sent</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="openUpdateModal('Alok Dubey', '+91 97931 12233', 'Singapore');">
                                            <i class="bi bi-telephone"></i> Call
                                        </button>
                                        <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm"><i class="bi bi-eye"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Amit Pandey</div>
                                        <small class="text-muted">Basti</small>
                                    </td>
                                    <td>+91 88765 11234</td>
                                    <td>Goa Beach Villa 4N</td>
                                    <td>Tomorrow, 03:00 PM</td>
                                    <td><span class="badge badge-status-pending">Pending Dates</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="openUpdateModal('Amit Pandey', '+91 88765 11234', 'Goa');">
                                            <i class="bi bi-telephone"></i> Call
                                        </button>
                                        <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm"><i class="bi bi-eye"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3. Overdue Follow-ups -->
        <div class="tab-pane fade" id="tab-overdue" role="tabpanel">
            <div class="card border-danger">
                <div class="card-header bg-danger-subtle text-danger">
                    <h6 class="mb-0 text-danger"><i class="bi bi-exclamation-octagon"></i> Overdue Reminders (2 Inquiries)</h6>
                    <small>Requires immediate call to prevent customer from going to another agency</small>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Customer Name</th>
                                    <th>Mobile</th>
                                    <th>Destination</th>
                                    <th>Due Date</th>
                                    <th>Delay</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="fw-bold text-danger">Vikram Chauhan</div>
                                        <small class="text-muted">Maharajganj</small>
                                    </td>
                                    <td>+91 97981 23456</td>
                                    <td>Thailand 4N/5D Pattaya-BKK</td>
                                    <td>Yesterday, 04:00 PM</td>
                                    <td><span class="badge bg-danger">1 Day Overdue</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-danger btn-sm" onclick="openUpdateModal('Vikram Chauhan', '+91 97981 23456', 'Thailand');">
                                            <i class="bi bi-telephone"></i> Call Now
                                        </button>
                                        <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm"><i class="bi bi-eye"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Update Outcome / Log Call -->
    <div class="modal fade" id="updateOutcomeModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold"><i class="bi bi-telephone-outbound text-success me-1"></i> Update Follow-up Call Outcome</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="p-2 bg-light rounded mb-3">
                        <div class="fw-bold text-dark" id="modalCustomerName">Customer Name</div>
                        <div class="text-muted small" id="modalCustomerInfo">+91 00000 00000 &bull; Destination</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Call Outcome <span class="text-danger">*</span></label>
                        <select class="form-select" id="ddlCallOutcome">
                            <option value="Connected">Connected (Discussion held)</option>
                            <option value="Interested">Interested (Agreed on quote)</option>
                            <option value="Call Back Later">Call Back Later (Customer driving / busy)</option>
                            <option value="Busy">Busy / Not reachable</option>
                            <option value="No Answer">No Answer / Rang out</option>
                            <option value="Not Interested">Not Interested (Plan dropped)</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Notes & Summary</label>
                        <textarea class="form-control" rows="3" placeholder="Enter conversation details, client objections, hotel preferences..."></textarea>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Schedule Next Follow-up (Optional)</label>
                        <input type="datetime-local" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Follow-up outcome updated (UI sample)!');" data-bs-dismiss="modal">Save Outcome</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: New Follow-up Schedule -->
    <div class="modal fade" id="newFollowupModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold"><i class="bi bi-calendar-plus text-success me-1"></i> Schedule Client Reminder</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Select Client Lead</label>
                        <select class="form-select">
                            <option>Rohit Verma (#NJ-10301 - Kashmir)</option>
                            <option>Dr. Arvind Kumar (#NJ-10306 - Char Dham)</option>
                            <option>Preeti Agrawal (#NJ-10314 - Dubai)</option>
                            <option>Shruti Srivastava (#NJ-10317 - Kerala)</option>
                        </select>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Date</label>
                            <input type="date" class="form-control" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Time</label>
                            <input type="time" class="form-control" value="15:00" />
                        </div>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Agenda Note</label>
                        <input type="text" class="form-control" placeholder="e.g. Check if visa documents received" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Follow-up reminder set (UI sample)!');" data-bs-dismiss="modal">Save Reminder</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openUpdateModal(name, phone, dest) {
            document.getElementById('modalCustomerName').textContent = name;
            document.getElementById('modalCustomerInfo').textContent = phone + ' • ' + dest;
            var modal = new bootstrap.Modal(document.getElementById('updateOutcomeModal'));
            modal.show();
        }
    </script>
</asp:Content>
