<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="FollowUps.aspx.cs" Inherits="FollowUps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Follow-ups | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Follow-up Management</h2>
            <p class="nj-page-subtitle">Track scheduled calls, client reminders, and outreach tasks across all employees.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#scheduleFollowupModal">
                <i class="bi bi-calendar-plus"></i> Schedule Follow-up
            </button>
            <a href="CallHistory.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-clock-history"></i> Call Log
            </a>
        </div>
    </div>

    <!-- Navigation Tabs for Follow-up Queues -->
    <ul class="nav nav-pills mb-3 gap-2" id="followupTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active d-flex align-items-center gap-2 border" id="today-tab" data-bs-toggle="pill" data-bs-target="#tab-today" type="button" role="tab">
                <i class="bi bi-calendar-check"></i>
                <span>Today's Follow-ups</span>
                <span class="badge bg-danger">24</span>
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link d-flex align-items-center gap-2 border" id="upcoming-tab" data-bs-toggle="pill" data-bs-target="#tab-upcoming" type="button" role="tab">
                <i class="bi bi-calendar-range"></i>
                <span>Upcoming</span>
                <span class="badge bg-secondary">48</span>
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link d-flex align-items-center gap-2 border text-danger" id="overdue-tab" data-bs-toggle="pill" data-bs-target="#tab-overdue" type="button" role="tab">
                <i class="bi bi-exclamation-triangle"></i>
                <span>Overdue</span>
                <span class="badge bg-danger">7</span>
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link d-flex align-items-center gap-2 border" id="completed-tab" data-bs-toggle="pill" data-bs-target="#tab-completed" type="button" role="tab">
                <i class="bi bi-check2-all"></i>
                <span>Completed</span>
                <span class="badge bg-success">142</span>
            </button>
        </li>
    </ul>

    <!-- Filter & Search Bar -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-4">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" class="form-control border-start-0" placeholder="Search client name, phone or tour..." />
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <select class="form-select form-select-sm">
                        <option value="">All Staff Members</option>
                        <option>Priya Sharma (Sales)</option>
                        <option>Rakesh Yadav (Field)</option>
                        <option>Pooja Srivastava (Calling)</option>
                        <option>Manoj Tiwari (Sales)</option>
                    </select>
                </div>
                <div class="col-6 col-md-3">
                    <select class="form-select form-select-sm">
                        <option value="">All Priorities</option>
                        <option>Hot Priority</option>
                        <option>Warm Priority</option>
                        <option>Cold Priority</option>
                    </select>
                </div>
                <div class="col-12 col-md-2 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="alert('Filtered follow-ups.');">
                        <i class="bi bi-funnel"></i> Apply Filter
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Tab Content -->
    <div class="tab-content" id="followupTabContent">
        <!-- 1. Today's Follow-ups Tab -->
        <div class="tab-pane fade show active" id="tab-today" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-calendar2-day text-success"></i> Today's Schedule (24 Inquiries)</h6>
                        <small class="text-muted">Calls due today for Gorakhpur branch clients</small>
                    </div>
                    <span class="badge bg-light text-dark border">Auto-sorted by due time</span>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Client Name</th>
                                    <th>Mobile</th>
                                    <th>Assigned Employee</th>
                                    <th>Follow-up Date & Time</th>
                                    <th>Last Remarks</th>
                                    <th>Status</th>
                                    <th class="text-end">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Item 1 -->
                                <tr>
                                    <td>
                                        <div class="fw-bold">Dr. Arvind Kumar</div>
                                        <small class="text-muted">Char Dham Yatra Heli (4 Pax)</small>
                                    </td>
                                    <td><a href="tel:+919839012345" class="text-decoration-none text-dark">+91 98390 12345</a></td>
                                    <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                                    <td><span class="fw-bold text-danger">Today, 02:30 PM</span></td>
                                    <td><span class="text-truncate d-inline-block" style="max-width: 200px;">Reviewing customized helicopter itinerary options.</span></td>
                                    <td><span class="badge badge-status-pending">Pending Call</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="openLogCallModal('Dr. Arvind Kumar', '+91 98390 12345', 'Char Dham Yatra Heli');">
                                            <i class="bi bi-telephone"></i> Call
                                        </button>
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="openRescheduleModal('Dr. Arvind Kumar');">
                                            <i class="bi bi-clock"></i>
                                        </button>
                                    </td>
                                </tr>

                                <!-- Item 2 -->
                                <tr>
                                    <td>
                                        <div class="fw-bold">Meera Rastogi</div>
                                        <small class="text-muted">Kerala 6N/7D Tour</small>
                                    </td>
                                    <td><a href="tel:+919415098765" class="text-decoration-none text-dark">+91 94150 98765</a></td>
                                    <td><span class="badge bg-warning-subtle text-warning">Rakesh Yadav</span></td>
                                    <td><span class="fw-bold text-danger">Today, 04:00 PM</span></td>
                                    <td><span class="text-truncate d-inline-block" style="max-width: 200px;">Wants quote revision with 4-star Munnar resort.</span></td>
                                    <td><span class="badge badge-status-interested">Itinerary Sent</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="openLogCallModal('Meera Rastogi', '+91 94150 98765', 'Kerala 6N/7D Tour');">
                                            <i class="bi bi-telephone"></i> Call
                                        </button>
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="openRescheduleModal('Meera Rastogi');">
                                            <i class="bi bi-clock"></i>
                                        </button>
                                    </td>
                                </tr>

                                <!-- Item 3 -->
                                <tr>
                                    <td>
                                        <div class="fw-bold">Rohit Verma</div>
                                        <small class="text-muted">Kashmir 5N/6D Deluxe</small>
                                    </td>
                                    <td><a href="tel:+919876543210" class="text-decoration-none text-dark">+91 98765 43210</a></td>
                                    <td><span class="badge bg-primary-subtle text-primary">Priya Sharma</span></td>
                                    <td><span class="fw-bold text-dark">Today, 05:15 PM</span></td>
                                    <td><span class="text-truncate d-inline-block" style="max-width: 200px;">Confirming flight tickets from Gorakhpur to Srinagar via Delhi.</span></td>
                                    <td><span class="badge badge-status-interested">In Discussion</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="openLogCallModal('Rohit Verma', '+91 98765 43210', 'Kashmir 5N/6D');">
                                            <i class="bi bi-telephone"></i> Call
                                        </button>
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="openRescheduleModal('Rohit Verma');">
                                            <i class="bi bi-clock"></i>
                                        </button>
                                    </td>
                                </tr>

                                <!-- Item 4 -->
                                <tr>
                                    <td>
                                        <div class="fw-bold">Sunita Singh</div>
                                        <small class="text-muted">Himachal Adventure (4 Pax)</small>
                                    </td>
                                    <td><a href="tel:+919123456789" class="text-decoration-none text-dark">+91 91234 56789</a></td>
                                    <td><span class="badge bg-info-subtle text-info">Pooja Srivastava</span></td>
                                    <td><span class="fw-bold text-dark">Today, 06:00 PM</span></td>
                                    <td><span class="text-truncate d-inline-block" style="max-width: 200px;">Group lead. Needs tempo traveler cost breakdown.</span></td>
                                    <td><span class="badge badge-status-pending">Follow-up Due</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-primary btn-sm" onclick="openLogCallModal('Sunita Singh', '+91 91234 56789', 'Himachal Adventure');">
                                            <i class="bi bi-telephone"></i> Call
                                        </button>
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="openRescheduleModal('Sunita Singh');">
                                            <i class="bi bi-clock"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 2. Upcoming Tab -->
        <div class="tab-pane fade" id="tab-upcoming" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-calendar-range text-primary"></i> Scheduled Upcoming Calls (48 Inquiries)</h6>
                        <small class="text-muted">Due tomorrow and later this week</small>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Client Name</th>
                                    <th>Mobile</th>
                                    <th>Assigned Employee</th>
                                    <th>Follow-up Date</th>
                                    <th>Last Remarks</th>
                                    <th>Status</th>
                                    <th class="text-end">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Rajesh Gupta</div>
                                        <small class="text-muted">Vietnam & Cambodia 8D</small>
                                    </td>
                                    <td>+91 97210 54321</td>
                                    <td><span class="badge bg-info-subtle text-info">Pooja Srivastava</span></td>
                                    <td>Tomorrow, 11:00 AM</td>
                                    <td>Passport copies submitted for e-visa.</td>
                                    <td><span class="badge bg-light text-dark border">Scheduled</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="openLogCallModal('Rajesh Gupta', '+91 97210 54321', 'Vietnam Tour');">
                                            <i class="bi bi-pencil"></i> Note
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Sanjay Tripathi</div>
                                        <small class="text-muted">Andaman Honeymoon 5N</small>
                                    </td>
                                    <td>+91 99351 77665</td>
                                    <td><span class="badge bg-primary-subtle text-primary">Manoj Tiwari</span></td>
                                    <td>Tomorrow, 03:00 PM</td>
                                    <td>Client will discuss with spouse tonight.</td>
                                    <td><span class="badge badge-status-interested">Interested</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm" onclick="openLogCallModal('Sanjay Tripathi', '+91 99351 77665', 'Andaman');">
                                            <i class="bi bi-pencil"></i> Note
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3. Overdue Tab -->
        <div class="tab-pane fade" id="tab-overdue" role="tabpanel">
            <div class="card border-danger">
                <div class="card-header bg-danger-subtle text-danger">
                    <h6 class="mb-0 text-danger"><i class="bi bi-exclamation-octagon"></i> Overdue Follow-ups (7 Inquiries)</h6>
                    <small>Requires immediate supervisor attention</small>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Client Name</th>
                                    <th>Mobile</th>
                                    <th>Assigned Employee</th>
                                    <th>Original Date</th>
                                    <th>Last Remarks</th>
                                    <th>Delay</th>
                                    <th class="text-end">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="fw-bold text-danger">Vikram Chauhan</div>
                                        <small class="text-muted">Thailand Tour</small>
                                    </td>
                                    <td>+91 97981 23456</td>
                                    <td><span class="badge bg-info-subtle text-info">Pooja Srivastava</span></td>
                                    <td>Yesterday, 04:00 PM</td>
                                    <td>Client didn't answer on first attempt.</td>
                                    <td><span class="badge bg-danger">1 Day Overdue</span></td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-danger btn-sm" onclick="openLogCallModal('Vikram Chauhan', '+91 97981 23456', 'Thailand Tour');">
                                            <i class="bi bi-telephone"></i> Call Now
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 4. Completed Tab -->
        <div class="tab-pane fade" id="tab-completed" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white">
                    <h6 class="mb-0"><i class="bi bi-check-circle text-success"></i> Completed Follow-ups Log</h6>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Client Name</th>
                                    <th>Mobile</th>
                                    <th>Handled By</th>
                                    <th>Completion Date</th>
                                    <th>Call Result</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Ananya Mishra</div>
                                        <small class="text-muted">Dubai Tour</small>
                                    </td>
                                    <td>+91 94521 88321</td>
                                    <td>Priya Sharma (Sales)</td>
                                    <td>Today, 11:30 AM</td>
                                    <td>Advance booking deposit received & confirmed.</td>
                                    <td><span class="badge badge-status-confirmed">Converted / Closed</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Log Call / Follow-up Note Modal -->
    <div class="modal fade" id="logCallModal" tabindex="-1" aria-labelledby="logCallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="logCallModalLabel">
                        <i class="bi bi-telephone-outbound text-success me-1"></i> Log Client Call & Follow-up Note
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="p-2 bg-light rounded mb-3">
                        <div class="fw-bold text-dark" id="modal-call-client">Dr. Arvind Kumar</div>
                        <div class="text-muted small" id="modal-call-phone">+91 98390 12345 &bull; Char Dham Yatra Heli</div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Call Outcome <span class="text-danger">*</span></label>
                        <select class="form-select" id="call_outcome">
                            <option value="Connected">Connected (Detailed discussion held)</option>
                            <option value="Interested">Interested (Requested revised package)</option>
                            <option value="Call Back Later">Call Back Later (Customer asked to call back)</option>
                            <option value="Busy">Busy / Line Engaged</option>
                            <option value="No Answer">No Answer / Switched Off</option>
                            <option value="Not Interested">Not Interested (Trip cancelled or budget mismatch)</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Call Notes / Discussion Summary</label>
                        <textarea class="form-control" rows="3" placeholder="Enter key points from conversation, date changes, pricing expectations..."></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Next Follow-up Date (Optional)</label>
                        <input type="datetime-local" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Follow-up call logged successfully (UI sample)!');" data-bs-dismiss="modal">
                        <i class="bi bi-save"></i> Save Call Log
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Reschedule Modal -->
    <div class="modal fade" id="rescheduleModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold">Reschedule Follow-up</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="small text-muted mb-2">Select new follow-up time for <strong id="resched-client"></strong>:</p>
                    <input type="datetime-local" class="form-control form-control-sm mb-2" />
                    <textarea class="form-control form-control-sm" rows="2" placeholder="Reason for rescheduling..."></textarea>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Follow-up rescheduled (UI sample)!');" data-bs-dismiss="modal">Update</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Schedule New Follow-up Modal -->
    <div class="modal fade" id="scheduleFollowupModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold"><i class="bi bi-calendar-plus text-success me-1"></i> Schedule New Follow-up</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Select Lead / Client</label>
                        <select class="form-select">
                            <option>Rohit Verma (+91 98765 43210 - Kashmir)</option>
                            <option>Amit Pandey (+91 88765 11234 - Goa)</option>
                            <option>Sunita Singh (+91 91234 56789 - Himachal)</option>
                            <option>Vikram Chauhan (+91 97981 23456 - Thailand)</option>
                        </select>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Assigned Staff</label>
                            <select class="form-select">
                                <option>Priya Sharma (Sales)</option>
                                <option>Rakesh Yadav (Field)</option>
                                <option>Pooja Srivastava (Calling)</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label class="form-label">Date & Time</label>
                            <input type="datetime-local" class="form-control" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Follow-up Agenda / Note</label>
                        <input type="text" class="form-control" placeholder="e.g. Discuss revised quote, check flight availability" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Follow-up scheduled (UI sample)!');" data-bs-dismiss="modal">Schedule</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openLogCallModal(name, phone, tour) {
            document.getElementById('modal-call-client').textContent = name;
            document.getElementById('modal-call-phone').textContent = phone + ' • ' + tour;
            var modal = new bootstrap.Modal(document.getElementById('logCallModal'));
            modal.show();
        }

        function openRescheduleModal(name) {
            document.getElementById('resched-client').textContent = name;
            var modal = new bootstrap.Modal(document.getElementById('rescheduleModal'));
            modal.show();
        }
    </script>
</asp:Content>
