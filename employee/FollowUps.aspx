<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="FollowUps.aspx.cs" Inherits="FollowUps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Follow-ups Management | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Follow-ups Management</h2>
            <p class="nj-page-subtitle">Track scheduled calls, client reminders, and touchpoints across all your assigned inquiries.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalScheduleReminder">
                <i class="bi bi-calendar-plus"></i> Schedule Follow-up
            </button>
            <a href="CallHistory.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-clock-history"></i> Call Log
            </a>
        </div>
    </div>

    <!-- Navigation Tabs for the Three Follow-up Sections -->
    <ul class="nav nav-pills mb-3 gap-2" id="followupSectionTabs" role="tablist">
        <!-- 1. Today's Follow-ups -->
        <li class="nav-item" role="presentation">
            <button class="nav-link active d-flex align-items-center gap-2 border" id="tab-btn-today" data-bs-toggle="pill" data-bs-target="#section-today" type="button" role="tab">
                <i class="bi bi-calendar-check-fill text-success"></i>
                <span>Today's Follow-ups</span>
                <span class="badge bg-danger">8</span>
            </button>
        </li>
        <!-- 2. Upcoming Follow-ups -->
        <li class="nav-item" role="presentation">
            <button class="nav-link d-flex align-items-center gap-2 border" id="tab-btn-upcoming" data-bs-toggle="pill" data-bs-target="#section-upcoming" type="button" role="tab">
                <i class="bi bi-calendar-range text-primary"></i>
                <span>Upcoming Follow-ups</span>
                <span class="badge bg-secondary">16</span>
            </button>
        </li>
        <!-- 3. Overdue Follow-ups -->
        <li class="nav-item" role="presentation">
            <button class="nav-link d-flex align-items-center gap-2 border text-danger" id="tab-btn-overdue" data-bs-toggle="pill" data-bs-target="#section-overdue" type="button" role="tab">
                <i class="bi bi-exclamation-triangle-fill"></i>
                <span>Overdue Follow-ups</span>
                <span class="badge bg-danger">2</span>
            </button>
        </li>
    </ul>

    <!-- Quick Search & Priority Filter Toolbar -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" class="form-control border-start-0" id="followUpSearch" placeholder="Search customer, phone or destination..." onkeyup="filterFollowUps();" />
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <select class="form-select form-select-sm" id="followUpPriorityFilter" onchange="filterFollowUps();">
                        <option value="">All Priorities</option>
                        <option value="Hot">Hot Priority Only</option>
                        <option value="Warm">Warm Priority</option>
                        <option value="Cold">Cold Priority</option>
                    </select>
                </div>
                <div class="col-6 col-md-2 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="document.getElementById('followUpSearch').value=''; document.getElementById('followUpPriorityFilter').selectedIndex=0; filterFollowUps();">
                        <i class="bi bi-arrow-counterclockwise"></i> Reset
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Tab Sections Content -->
    <div class="tab-content" id="followupSectionsContent">
        <!-- Section 1: Today's Follow-ups -->
        <div class="tab-pane fade show active" id="section-today" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-0 text-success"><i class="bi bi-calendar2-day-fill"></i> Today's Follow-ups (8 Calls)</h6>
                        <small class="text-muted">High priority calls due today for active conversion</small>
                    </div>
                    <span class="badge bg-danger-subtle text-danger">3 Calls Pending</span>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Customer Name & Mobile</th>
                                    <th>Destination</th>
                                    <th>Date & Time</th>
                                    <th>Last Call Remarks</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Call 1 -->
                                <tr class="fup-row" data-priority="Hot">
                                    <td>
                                        <div class="fw-bold">Dr. Arvind Kumar</div>
                                        <small class="text-muted"><a href="tel:+919839012345" class="text-decoration-none text-dark">+91 98390 12345</a> &bull; Gorakhpur</small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold">Char Dham Yatra Heli</div>
                                        <small class="text-muted">4 Pax &bull; VIP Package</small>
                                    </td>
                                    <td><span class="fw-bold text-danger">Today, 02:30 PM</span></td>
                                    <td>
                                        <span class="text-truncate d-inline-block" style="max-width: 220px;">
                                            Customer requested helicopter VIP slot pricing for 4 senior citizens.
                                        </span>
                                    </td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td><span class="badge badge-status-new">Pending Call</span></td>
                                    <td class="text-end">
                                        <div class="btn-group btn-group-sm" role="group">
                                            <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-outline" title="View Lead Details">
                                                <i class="bi bi-eye"></i>
                                            </a>
                                            <button type="button" class="btn btn-nj-primary" onclick="openAddCallModal('Dr. Arvind Kumar', '+91 98390 12345', 'Char Dham Heli');" title="Add Call Record">
                                                <i class="bi bi-telephone"></i> Call
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary" onclick="openRescheduleModal('Dr. Arvind Kumar');" title="Reschedule Follow-up">
                                                <i class="bi bi-clock"></i>
                                            </button>
                                            <button type="button" class="btn btn-outline-success" onclick="completeFollowUp(this, 'Dr. Arvind Kumar');" title="Complete Follow-up">
                                                <i class="bi bi-check2"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>

                                <!-- Call 2 -->
                                <tr class="fup-row" data-priority="Hot">
                                    <td>
                                        <div class="fw-bold">Rohit Verma</div>
                                        <small class="text-muted"><a href="tel:+919876543210" class="text-decoration-none text-dark">+91 98765 43210</a> &bull; Gorakhpur</small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold">Kashmir 5N/6D Deluxe</div>
                                        <small class="text-muted">Family (4 Pax)</small>
                                    </td>
                                    <td><span class="fw-bold text-dark">Today, 05:15 PM</span></td>
                                    <td>
                                        <span class="text-truncate d-inline-block" style="max-width: 220px;">
                                            Sent Kashmir PDF quote. Reviewing Dal Lake houseboat with family.
                                        </span>
                                    </td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td><span class="badge badge-status-interested">Interested</span></td>
                                    <td class="text-end">
                                        <div class="btn-group btn-group-sm" role="group">
                                            <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-outline" title="View Lead Details">
                                                <i class="bi bi-eye"></i>
                                            </a>
                                            <button type="button" class="btn btn-nj-primary" onclick="openAddCallModal('Rohit Verma', '+91 98765 43210', 'Kashmir Deluxe');" title="Add Call Record">
                                                <i class="bi bi-telephone"></i> Call
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary" onclick="openRescheduleModal('Rohit Verma');" title="Reschedule Follow-up">
                                                <i class="bi bi-clock"></i>
                                            </button>
                                            <button type="button" class="btn btn-outline-success" onclick="completeFollowUp(this, 'Rohit Verma');" title="Complete Follow-up">
                                                <i class="bi bi-check2"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>

                                <!-- Call 3 -->
                                <tr class="fup-row" data-priority="Warm">
                                    <td>
                                        <div class="fw-bold">Preeti Agrawal</div>
                                        <small class="text-muted"><a href="tel:+919918088990" class="text-decoration-none text-dark">+91 99180 88990</a> &bull; Basti</small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold">Dubai 5N Luxury Package</div>
                                        <small class="text-muted">5 Pax</small>
                                    </td>
                                    <td><span class="fw-bold text-dark">Today, 06:00 PM</span></td>
                                    <td>
                                        <span class="text-truncate d-inline-block" style="max-width: 220px;">
                                            Customer requested evening callback after 06:00 PM for flight comparison.
                                        </span>
                                    </td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td><span class="badge badge-status-pending">Awaiting Decision</span></td>
                                    <td class="text-end">
                                        <div class="btn-group btn-group-sm" role="group">
                                            <a href="LeadDetails.aspx?id=NJ-10314" class="btn btn-nj-outline" title="View Lead Details">
                                                <i class="bi bi-eye"></i>
                                            </a>
                                            <button type="button" class="btn btn-nj-primary" onclick="openAddCallModal('Preeti Agrawal', '+91 99180 88990', 'Dubai Package');" title="Add Call Record">
                                                <i class="bi bi-telephone"></i> Call
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary" onclick="openRescheduleModal('Preeti Agrawal');" title="Reschedule Follow-up">
                                                <i class="bi bi-clock"></i>
                                            </button>
                                            <button type="button" class="btn btn-outline-success" onclick="completeFollowUp(this, 'Preeti Agrawal');" title="Complete Follow-up">
                                                <i class="bi bi-check2"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>

                                <!-- Call 4 -->
                                <tr class="fup-row" data-priority="Hot">
                                    <td>
                                        <div class="fw-bold text-muted">Ananya Mishra</div>
                                        <small class="text-muted">+91 94521 88321 &bull; Deoria</small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold text-muted">Dubai Luxury Tour</div>
                                        <small class="text-muted">2 Pax</small>
                                    </td>
                                    <td>Today, 11:30 AM</td>
                                    <td>
                                        <span class="text-truncate d-inline-block text-muted" style="max-width: 220px;">
                                            Advance ₹50,000 received. Tour confirmed and supplier notified.
                                        </span>
                                    </td>
                                    <td><span class="badge badge-priority-hot">Hot</span></td>
                                    <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                                    <td class="text-end">
                                        <div class="btn-group btn-group-sm" role="group">
                                            <a href="LeadDetails.aspx?id=NJ-10302" class="btn btn-nj-outline" title="View Lead Details">
                                                <i class="bi bi-eye"></i>
                                            </a>
                                            <span class="btn btn-light text-success small disabled"><i class="bi bi-check-all"></i> Completed</span>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section 2: Upcoming Follow-ups -->
        <div class="tab-pane fade" id="section-upcoming" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0 text-primary"><i class="bi bi-calendar-range-fill"></i> Upcoming Follow-ups (16 Calls)</h6>
                        <small class="text-muted">Scheduled client reminders for tomorrow and next week</small>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Customer Name & Mobile</th>
                                    <th>Destination</th>
                                    <th>Follow-up Date & Time</th>
                                    <th>Last Call Remarks</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="fup-row" data-priority="Warm">
                                    <td>
                                        <div class="fw-bold">Alok Dubey</div>
                                        <small class="text-muted">+91 97931 12233 &bull; Gorakhpur</small>
                                    </td>
                                    <td>Singapore & Sentosa 5N</td>
                                    <td>Tomorrow, 11:00 AM</td>
                                    <td>Requested flight quotation from Gorakhpur via Kolkata.</td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td><span class="badge badge-status-interested">Interested</span></td>
                                    <td class="text-end">
                                        <div class="btn-group btn-group-sm" role="group">
                                            <a href="LeadDetails.aspx" class="btn btn-nj-outline" title="View Details"><i class="bi bi-eye"></i></a>
                                            <button type="button" class="btn btn-nj-primary" onclick="openAddCallModal('Alok Dubey', '+91 97931 12233', 'Singapore');"><i class="bi bi-telephone"></i> Call</button>
                                            <button type="button" class="btn btn-outline-secondary" onclick="openRescheduleModal('Alok Dubey');"><i class="bi bi-clock"></i></button>
                                            <button type="button" class="btn btn-outline-success" onclick="completeFollowUp(this, 'Alok Dubey');"><i class="bi bi-check2"></i></button>
                                        </div>
                                    </td>
                                </tr>

                                <tr class="fup-row" data-priority="Warm">
                                    <td>
                                        <div class="fw-bold">Amit Pandey</div>
                                        <small class="text-muted">+91 88765 11234 &bull; Basti</small>
                                    </td>
                                    <td>Goa Beach Villa 4N</td>
                                    <td>Tomorrow, 03:00 PM</td>
                                    <td>Will confirm travel dates after consulting with spouse.</td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td><span class="badge badge-status-pending">Pending Dates</span></td>
                                    <td class="text-end">
                                        <div class="btn-group btn-group-sm" role="group">
                                            <a href="LeadDetails.aspx" class="btn btn-nj-outline" title="View Details"><i class="bi bi-eye"></i></a>
                                            <button type="button" class="btn btn-nj-primary" onclick="openAddCallModal('Amit Pandey', '+91 88765 11234', 'Goa');"><i class="bi bi-telephone"></i> Call</button>
                                            <button type="button" class="btn btn-outline-secondary" onclick="openRescheduleModal('Amit Pandey');"><i class="bi bi-clock"></i></button>
                                            <button type="button" class="btn btn-outline-success" onclick="completeFollowUp(this, 'Amit Pandey');"><i class="bi bi-check2"></i></button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section 3: Overdue Follow-ups -->
        <div class="tab-pane fade" id="section-overdue" role="tabpanel">
            <div class="card border-danger">
                <div class="card-header bg-danger-subtle text-danger">
                    <div>
                        <h6 class="mb-0 text-danger"><i class="bi bi-exclamation-octagon-fill"></i> Overdue Follow-ups (2 Calls)</h6>
                        <small>Missed follow-up time. Contact customer immediately to prevent lead drop.</small>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Customer Name & Mobile</th>
                                    <th>Destination</th>
                                    <th>Original Date & Time</th>
                                    <th>Last Call Remarks</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="fup-row" data-priority="Hot">
                                    <td>
                                        <div class="fw-bold text-danger">Vikram Chauhan</div>
                                        <small class="text-muted">+91 97981 23456 &bull; Maharajganj</small>
                                    </td>
                                    <td>Thailand 4N/5D Pattaya-BKK</td>
                                    <td><span class="fw-bold text-danger">Yesterday, 04:00 PM</span></td>
                                    <td>Rang out on first dial. Follow-up queued for re-dial.</td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td><span class="badge badge-status-new">Overdue</span></td>
                                    <td class="text-end">
                                        <div class="btn-group btn-group-sm" role="group">
                                            <a href="LeadDetails.aspx" class="btn btn-nj-outline" title="View Details"><i class="bi bi-eye"></i></a>
                                            <button type="button" class="btn btn-danger" onclick="openAddCallModal('Vikram Chauhan', '+91 97981 23456', 'Thailand');"><i class="bi bi-telephone"></i> Call Now</button>
                                            <button type="button" class="btn btn-outline-secondary" onclick="openRescheduleModal('Vikram Chauhan');"><i class="bi bi-clock"></i></button>
                                            <button type="button" class="btn btn-outline-success" onclick="completeFollowUp(this, 'Vikram Chauhan');"><i class="bi bi-check2"></i></button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Add Call Record -->
    <div class="modal fade" id="modalAddCallFromFup" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold"><i class="bi bi-telephone-plus text-success me-1"></i> Add Call Record</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="p-2 bg-light rounded mb-3">
                        <div class="fw-bold text-dark" id="fupModalCustName">Customer Name</div>
                        <div class="text-muted small" id="fupModalCustInfo">+91 00000 00000 &bull; Destination</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Call Outcome <span class="text-danger">*</span></label>
                        <select class="form-select">
                            <option value="Connected">Connected</option>
                            <option value="Interested">Interested</option>
                            <option value="Call Back Later">Call Back Later</option>
                            <option value="Busy">Busy</option>
                            <option value="No Answer">No Answer</option>
                            <option value="Not Interested">Not Interested</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Call Remarks <span class="text-danger">*</span></label>
                        <textarea class="form-control" rows="3" placeholder="Key points from the conversation..."></textarea>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Next Action / Follow-up Date</label>
                        <input type="datetime-local" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Call record logged successfully (UI sample)!');" data-bs-dismiss="modal">Save Call</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Reschedule Follow-up -->
    <div class="modal fade" id="modalRescheduleFup" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold">Reschedule Follow-up</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="small text-muted mb-2">Select new follow-up slot for <strong id="rescheduleTargetCust">Customer</strong>:</p>
                    <div class="mb-2">
                        <label class="form-label small">New Date & Time</label>
                        <input type="datetime-local" class="form-control form-control-sm" />
                    </div>
                    <div class="mb-2">
                        <label class="form-label small">Reason / Note</label>
                        <textarea class="form-control form-control-sm" rows="2" placeholder="e.g. Client requested evening call"></textarea>
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Follow-up rescheduled (UI sample)!');" data-bs-dismiss="modal">Update Slot</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Schedule New Follow-up Reminder -->
    <div class="modal fade" id="modalScheduleReminder" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold"><i class="bi bi-calendar-plus text-success me-1"></i> Schedule Client Follow-up</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Select Customer Lead</label>
                        <select class="form-select">
                            <option>Dr. Arvind Kumar (+91 98390 12345 - Char Dham Heli)</option>
                            <option>Rohit Verma (+91 98765 43210 - Kashmir 5N/6D)</option>
                            <option>Preeti Agrawal (+91 99180 88990 - Dubai 5N)</option>
                            <option>Alok Dubey (+91 97931 12233 - Singapore 5N)</option>
                        </select>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Date</label>
                            <input type="date" class="form-control" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Time Slot</label>
                            <input type="time" class="form-control" value="16:00" />
                        </div>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Follow-up Objective</label>
                        <input type="text" class="form-control" placeholder="e.g. Discuss revised quote, check flight availability" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Follow-up reminder saved (UI sample)!');" data-bs-dismiss="modal">Schedule</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openAddCallModal(name, phone, dest) {
            document.getElementById('fupModalCustName').textContent = name;
            document.getElementById('fupModalCustInfo').textContent = phone + ' • ' + dest;
            var modal = new bootstrap.Modal(document.getElementById('modalAddCallFromFup'));
            modal.show();
        }

        function openRescheduleModal(name) {
            document.getElementById('rescheduleTargetCust').textContent = name;
            var modal = new bootstrap.Modal(document.getElementById('modalRescheduleFup'));
            modal.show();
        }

        function completeFollowUp(btn, name) {
            if (confirm('Mark follow-up for ' + name + ' as completed?')) {
                var row = btn.closest('tr');
                if (row) {
                    var statusCell = row.cells[5];
                    if (statusCell) statusCell.innerHTML = '<span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Completed</span>';
                    btn.outerHTML = '<span class="btn btn-light text-success small disabled"><i class="bi bi-check-all"></i> Done</span>';
                }
            }
        }

        function filterFollowUps() {
            var search = document.getElementById('followUpSearch').value.toLowerCase();
            var priority = document.getElementById('followUpPriorityFilter').value;

            var rows = document.querySelectorAll('.fup-row');
            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                var rPriority = row.getAttribute('data-priority');

                var mSearch = search === '' || text.indexOf(search) > -1;
                var mPriority = priority === '' || rPriority === priority;

                if (mSearch && mPriority) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</asp:Content>