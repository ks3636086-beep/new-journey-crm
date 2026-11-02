<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="LeadDetails.aspx.cs" Inherits="LeadDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Lead Details & History | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-2">
        <ol class="breadcrumb small mb-0">
            <li class="breadcrumb-item"><a href="Dashboard.aspx" class="text-decoration-none text-success">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="MyLeads.aspx" class="text-decoration-none text-success">My Leads</a></li>
            <li class="breadcrumb-item active" aria-current="page" id="leadBreadcrumbId">#NJ-10301 Details</li>
        </ol>
    </nav>

    <!-- Page Header & Action Buttons -->
    <div class="nj-page-header">
        <div>
            <div class="d-flex align-items-center gap-2 mb-1">
                <span class="badge bg-secondary" id="lblLeadId">#NJ-10301</span>
                <span class="badge badge-priority-hot" id="lblLeadPriority"><i class="bi bi-fire me-1"></i>Hot Priority</span>
                <span class="badge badge-status-interested" id="lblLeadStatus">Interested</span>
            </div>
            <h2 class="nj-page-title" id="lblCustomerName">Rohit Verma</h2>
            <p class="nj-page-subtitle" id="lblSubtitle">Kashmir 5N/6D Deluxe Tour &bull; Inquired for 4 Pax &bull; Gorakhpur</p>
        </div>
        <div class="d-flex align-items-center gap-2 flex-wrap">
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalAddCall">
                <i class="bi bi-telephone-plus"></i> Add Call Record
            </button>
            <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#modalAddFollowUp">
                <i class="bi bi-calendar-plus"></i> Add Follow-up
            </button>
            <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#modalEditLead">
                <i class="bi bi-pencil"></i> Edit Lead
            </button>
        </div>
    </div>

    <!-- Core Attribution Alert -->
    <div class="alert alert-light border py-2 px-3 mb-4 small d-flex align-items-center justify-content-between flex-wrap gap-2">
        <div class="d-flex align-items-center gap-2">
            <i class="bi bi-award-fill text-success fs-5"></i>
            <span><strong>Attribution Tracking:</strong> Lead Owner = <strong id="alertOwnerName">Rakesh Yadav (Sales)</strong> &bull; Added By = <strong id="alertAddedBy">Rakesh Yadav</strong> &bull; Assigned Employee = <strong id="alertAssignedName" class="text-primary">Priya Sharma</strong>.</span>
        </div>
        <span class="badge bg-success-subtle text-success">Credit Protected</span>
    </div>

    <div class="row g-4">
        <!-- Main Column (col-lg-8) -->
        <div class="col-12 col-lg-8">
            <!-- 1. Customer Information Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-person text-success"></i> Customer Information</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Customer Name</span>
                            <span class="fw-bold text-dark" id="txtDName">Rohit Verma</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Primary Mobile</span>
                            <span class="fw-bold text-dark"><a href="tel:+919876543210" class="text-decoration-none text-dark" id="txtDPhone">+91 98765 43210</a></span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Alternate Mobile</span>
                            <span class="text-muted" id="txtDAltPhone">+91 94521 00000</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Customer Location / City</span>
                            <span class="fw-semibold text-dark" id="txtDCity">Gorakhpur (Golghar)</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Email Address</span>
                            <span class="text-muted" id="txtDEmail">rohit.verma@example.com</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Inquiry Date</span>
                            <span class="text-muted">Today, 09:15 AM</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 2. Travel Requirements Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-geo-alt text-success"></i> Travel Requirements & Preferences</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Destination</span>
                            <span class="fw-bold text-primary" id="txtDDest">Kashmir (Srinagar, Gulmarg, Pahalgam, Sonmarg)</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Tentative Travel Date</span>
                            <span class="fw-semibold text-dark" id="txtDDate">15 November 2026 (5N/6D)</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Number of Travellers</span>
                            <span class="fw-semibold text-dark" id="txtDPax">4 Pax (2 Adults, 2 Children)</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Package Rating</span>
                            <span class="fw-semibold text-dark">4-Star Deluxe + 1 Night Houseboat</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Estimated Budget</span>
                            <span class="fw-bold text-success" id="txtDBudget">₹1,15,000 Total</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Lead Source</span>
                            <span class="badge bg-light text-dark border" id="txtDSource">Google</span>
                        </div>
                    </div>

                    <hr class="my-3 text-muted" />

                    <div>
                        <span class="text-muted small d-block mb-1">Customer Remarks & Specific Requests</span>
                        <div class="p-3 bg-light rounded text-dark small" id="txtDNotes">
                            "Client requested private non-stop Innova Crysta for all 6 days. Wants snow sledging in Gulmarg Phase-1 and Sonmarg Zero Point. Flight tickets needed from Lucknow or Delhi."
                        </div>
                    </div>
                </div>
            </div>

            <!-- 3. Dedicated Call History Timeline -->
            <div class="card mb-3">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-telephone-outbound text-primary"></i> Call History Timeline</h6>
                        <small class="text-muted">Chronological audit of calls made to this customer</small>
                    </div>
                    <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalAddCall">
                        <i class="bi bi-plus-lg"></i> Log New Call
                    </button>
                </div>
                <div class="card-body">
                    <ul class="timeline mb-0" id="callTimelineList">
                        <!-- Call 1 -->
                        <li class="timeline-item">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <div>
                                    <span class="fw-bold text-dark">Call by Priya Sharma (Sales)</span>
                                    <span class="badge bg-success-subtle text-success border border-success-subtle ms-2">
                                        <i class="bi bi-check-circle me-1"></i> Connected
                                    </span>
                                </div>
                                <span class="text-muted small">Today, 11:45 AM</span>
                            </div>
                            <p class="small text-muted mb-1">
                                <strong>Remarks:</strong> Spoke with Mr. Rohit. Sent WhatsApp PDF of 5N/6D Kashmir itinerary with 4-star options. Customer very positive about Dal Lake houseboat.
                            </p>
                            <div class="d-flex align-items-center gap-2 small">
                                <span class="badge bg-light text-dark border">
                                    <i class="bi bi-calendar-event me-1"></i> Next Follow-up: Today, 05:15 PM
                                </span>
                                <span class="text-muted">Duration: 7 mins 30 secs</span>
                            </div>
                        </li>

                        <!-- Call 2 -->
                        <li class="timeline-item">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <div>
                                    <span class="fw-bold text-dark">Call by Pooja Srivastava (Calling Desk)</span>
                                    <span class="badge bg-primary-subtle text-primary border border-primary-subtle ms-2">
                                        <i class="bi bi-star-fill me-1"></i> Interested
                                    </span>
                                </div>
                                <span class="text-muted small">Today, 10:15 AM</span>
                            </div>
                            <p class="small text-muted mb-1">
                                <strong>Remarks:</strong> Initial qualification call. Verified travel dates (15 Nov) and 4 family members. Handed over to Priya Sharma for custom pricing.
                            </p>
                            <div class="small">
                                <span class="badge bg-light text-dark border">
                                    <i class="bi bi-calendar-event me-1"></i> Next Follow-up: Today, 11:30 AM
                                </span>
                            </div>
                        </li>

                        <!-- Call 3 -->
                        <li class="timeline-item mb-0">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <div>
                                    <span class="fw-bold text-dark">Call by Pooja Srivastava (Calling Desk)</span>
                                    <span class="badge bg-warning-subtle text-dark border border-warning-subtle ms-2">
                                        <i class="bi bi-clock-history me-1"></i> Call Back Later
                                    </span>
                                </div>
                                <span class="text-muted small">Today, 09:30 AM</span>
                            </div>
                            <p class="small text-muted mb-1">
                                <strong>Remarks:</strong> Customer was at office meeting; asked to call back in 45 minutes for Kashmir holiday details.
                            </p>
                            <div class="small">
                                <span class="badge bg-light text-dark border">
                                    <i class="bi bi-calendar-event me-1"></i> Next Follow-up: Today, 10:15 AM
                                </span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Sidebar Actions Column (col-lg-4) -->
        <div class="col-12 col-lg-4">
            <!-- Lead Attribution Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-award text-success"></i> Lead Attribution</h6>
                </div>
                <div class="card-body">
                    <div class="mb-3 p-2 bg-success-subtle rounded border border-success-subtle">
                        <small class="text-success fw-bold d-block">Lead Owner (Sales Credit)</small>
                        <span class="fw-bold text-dark" id="sideLeadOwner">Rakesh Yadav (Sales)</span>
                        <div class="text-muted" style="font-size: 0.725rem;">Originally acquired the customer lead.</div>
                    </div>

                    <div class="mb-3 p-2 bg-light rounded border">
                        <small class="text-muted d-block">Added By (Created In CRM)</small>
                        <span class="fw-semibold text-dark" id="sideAddedBy">Rakesh Yadav</span>
                        <div class="text-muted" style="font-size: 0.725rem;">Captured through Field Visit.</div>
                    </div>

                    <div class="mb-3 p-2 bg-primary-subtle rounded border border-primary-subtle">
                        <small class="text-primary fw-bold d-block">Assigned Employee (Current Follow-up)</small>
                        <span class="fw-bold text-dark" id="sideAssignedEmp">Priya Sharma (Sales)</span>
                        <div class="text-muted" style="font-size: 0.725rem;">Handling active calling & bookings.</div>
                    </div>

                    <div>
                        <small class="text-muted d-block">Lead Source</small>
                        <span class="badge bg-light text-dark border" id="sideLeadSource">Google</span>
                    </div>
                </div>
            </div>

            <!-- Update Lead Status & Priority Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-arrow-repeat text-primary"></i> Update Status & Priority</h6>
                </div>
                <div class="card-body">
                    <!-- Update Status -->
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Update Lead Status</label>
                        <select class="form-select form-select-sm" id="ddlUpdateStatus">
                            <option value="New">New</option>
                            <option value="Interested" selected="selected">Interested</option>
                            <option value="Pending">Pending</option>
                            <option value="Confirmed">Confirmed (Booking Won)</option>
                            <option value="Not Interested">Not Interested</option>
                            <option value="Closed">Closed</option>
                        </select>
                    </div>

                    <!-- Update Priority: Hot / Warm / Cold -->
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Update Priority (Urgency)</label>
                        <select class="form-select form-select-sm" id="ddlUpdatePriority">
                            <option value="Hot" selected="selected" class="text-danger fw-bold">Hot (&lt; 30 Days)</option>
                            <option value="Warm" class="text-warning fw-bold">Warm (1-2 Months)</option>
                            <option value="Cold" class="text-info fw-bold">Cold (Long-term)</option>
                        </select>
                    </div>

                    <button type="button" class="btn btn-nj-primary btn-sm w-100" onclick="alert('Status and Priority updated successfully (UI sample).');">
                        <i class="bi bi-save me-1"></i> Save Status & Priority
                    </button>
                </div>
            </div>

            <!-- Direct Outreach Buttons -->
            <div class="card">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-chat-dots text-success"></i> Customer Outreach</h6>
                </div>
                <div class="card-body">
                    <div class="d-grid gap-2">
                        <a href="tel:+919876543210" class="btn btn-outline-success btn-sm text-start" id="btnCallCustomer">
                            <i class="bi bi-telephone-outbound me-2"></i> Call: +91 98765 43210
                        </a>
                        <a href="https://wa.me/919876543210" target="_blank" class="btn btn-outline-primary btn-sm text-start" id="btnWhatsAppCustomer">
                            <i class="bi bi-whatsapp me-2"></i> WhatsApp Customer
                        </a>
                        <button type="button" class="btn btn-outline-secondary btn-sm text-start" data-bs-toggle="modal" data-bs-target="#modalAddFollowUp">
                            <i class="bi bi-clock-history me-2"></i> Schedule Follow-up
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Add Call Record -->
    <div class="modal fade" id="modalAddCall" tabindex="-1" aria-labelledby="modalAddCallTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="modalAddCallTitle">
                        <i class="bi bi-telephone-plus text-success me-1"></i> Add Call Record
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3 p-2 bg-light rounded">
                        <div class="fw-bold text-dark" id="modalCallCustName">Rohit Verma (#NJ-10301)</div>
                        <div class="text-muted small" id="modalCallCustPhone">+91 98765 43210 &bull; Kashmir 5N/6D</div>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Call Date & Time <span class="text-danger">*</span></label>
                            <input type="datetime-local" class="form-control form-control-sm" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Call Outcome <span class="text-danger">*</span></label>
                            <select class="form-select form-select-sm" id="ddlModalOutcome">
                                <option value="Connected">Connected</option>
                                <option value="Interested">Interested</option>
                                <option value="Call Back Later">Call Back Later</option>
                                <option value="Busy">Busy</option>
                                <option value="No Answer">No Answer</option>
                                <option value="Not Interested">Not Interested</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Call Remarks <span class="text-danger">*</span></label>
                        <textarea class="form-control form-control-sm" rows="3" placeholder="Key points discussed during the phone conversation..."></textarea>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Next Follow-up Date & Time (Optional)</label>
                        <input type="datetime-local" class="form-control form-control-sm" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Call record logged to timeline (UI sample)!');" data-bs-dismiss="modal">Save Call Record</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Add Follow-up -->
    <div class="modal fade" id="modalAddFollowUp" tabindex="-1" aria-labelledby="modalAddFupTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="modalAddFupTitle">
                        <i class="bi bi-calendar-plus text-success me-1"></i> Add Follow-up Reminder
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Follow-up Date <span class="text-danger">*</span></label>
                            <input type="date" class="form-control form-control-sm" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Time Slot <span class="text-danger">*</span></label>
                            <input type="time" class="form-control form-control-sm" value="17:15" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Agenda / Follow-up Goal <span class="text-danger">*</span></label>
                        <input type="text" class="form-control form-control-sm" placeholder="e.g. Call to finalize flight quotes and confirm advance payment" />
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Priority</label>
                        <select class="form-select form-select-sm">
                            <option value="Hot">Hot (Urgent)</option>
                            <option value="Warm">Warm (Standard)</option>
                            <option value="Cold">Cold</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Follow-up reminder scheduled (UI sample)!');" data-bs-dismiss="modal">Save Follow-up</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Edit Lead -->
    <div class="modal fade" id="modalEditLead" tabindex="-1" aria-labelledby="modalEditLeadTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="modalEditLeadTitle">
                        <i class="bi bi-pencil-square text-success me-1"></i> Edit Customer & Tour Info
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-2">
                        <label class="form-label">Customer Name</label>
                        <input type="text" class="form-control form-control-sm" id="editCustName" value="Rohit Verma" />
                    </div>
                    <div class="row g-2 mb-2">
                        <div class="col-6">
                            <label class="form-label">Mobile</label>
                            <input type="tel" class="form-control form-control-sm" id="editCustPhone" value="+91 98765 43210" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control form-control-sm" id="editCustCity" value="Gorakhpur (Golghar)" />
                        </div>
                    </div>
                    <div class="row g-2 mb-2">
                        <div class="col-6">
                            <label class="form-label">Destination</label>
                            <input type="text" class="form-control form-control-sm" id="editCustDest" value="Kashmir 5N/6D Deluxe" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Pax Count</label>
                            <input type="number" class="form-control form-control-sm" id="editCustPax" value="4" />
                        </div>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Budget</label>
                        <input type="text" class="form-control form-control-sm" id="editCustBudget" value="₹1,15,000" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Lead details updated (UI sample)!');" data-bs-dismiss="modal">Update Lead</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Script to dynamically load customer details from Query String ?id=... -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var params = new URLSearchParams(window.location.search);
            var leadId = params.get('id');

            var leadsDatabase = {
                'NJ-10302': {
                    name: 'Ananya Mishra',
                    phone: '+91 94521 88321',
                    altPhone: '+91 94150 11000',
                    city: 'Deoria',
                    email: 'ananya.mishra@example.com',
                    dest: 'Dubai Luxury Tour (5N/6D)',
                    date: '20 Dec 2026',
                    pax: '2 Pax (Couple)',
                    budget: '₹1,85,000',
                    source: 'Walk-in',
                    owner: 'Priya Sharma (Sales)',
                    addedBy: 'Priya Sharma',
                    assigned: 'Priya Sharma',
                    status: 'Confirmed',
                    statusClass: 'badge-status-confirmed',
                    priority: 'Hot',
                    notes: 'Advance booking deposit received ₹50,000. 5-Star Dubai Marina hotel confirmed. Desert Safari and Burj Khalifa tickets booked.',
                    calls: [
                        { employee: 'Priya Sharma (Sales)', outcome: 'Connected', badge: 'bg-success-subtle text-success', time: 'Today, 11:30 AM', remarks: 'Advance payment received. Shared payment receipt and passport verification forms.', next: 'Completed' },
                        { employee: 'Priya Sharma (Sales)', outcome: 'Interested', badge: 'bg-primary-subtle text-primary', time: 'Yesterday, 04:00 PM', remarks: 'Discussed luxury hotel options and flight timings from Lucknow. Client agreed on final package price.', next: 'Today, 11:30 AM' }
                    ]
                },
                'NJ-10306': {
                    name: 'Dr. Arvind Kumar',
                    phone: '+91 98390 12345',
                    altPhone: '+91 94500 22334',
                    city: 'Gorakhpur (Medical College)',
                    email: 'dr.arvind@example.com',
                    dest: 'Char Dham Yatra by Helicopter',
                    date: '05 May 2027',
                    pax: '4 Pax (Senior Citizens)',
                    budget: '₹4,50,000',
                    source: 'Field Visit',
                    owner: 'Priya Sharma (Sales)',
                    addedBy: 'Priya Sharma',
                    assigned: 'Priya Sharma',
                    status: 'New',
                    statusClass: 'badge-status-new',
                    priority: 'Hot',
                    notes: 'High-budget pilgrimage VIP helicopter booking inquiry from Dehradun. Senior citizens require wheelchair assistance.',
                    calls: [
                        { employee: 'Priya Sharma (Sales)', outcome: 'Interested', badge: 'bg-primary-subtle text-primary', time: 'Today, 10:15 AM', remarks: 'Client verified pilgrimage intent. Requested helicopter VIP pricing for 4 senior family members.', next: 'Today, 02:30 PM' }
                    ]
                },
                'NJ-10314': {
                    name: 'Preeti Agrawal',
                    phone: '+91 99180 88990',
                    altPhone: '+91 98390 44556',
                    city: 'Basti',
                    email: 'preeti.agrawal@example.com',
                    dest: 'Dubai 5N Luxury Package',
                    date: '25 Nov 2026',
                    pax: '5 Pax (Family)',
                    budget: '₹2,60,000',
                    source: 'Google',
                    owner: 'Priya Sharma (Sales)',
                    addedBy: 'Priya Sharma',
                    assigned: 'Priya Sharma',
                    status: 'Pending',
                    statusClass: 'badge-status-pending',
                    priority: 'Warm',
                    notes: 'Family trip. Requested family connecting rooms in Bur Dubai or Downtown.',
                    calls: [
                        { employee: 'Priya Sharma (Sales)', outcome: 'Call Back Later', badge: 'bg-warning-subtle text-dark', time: 'Today, 09:30 AM', remarks: 'Customer was at clinic; asked to call back after 06:00 PM for Dubai hotel comparison.', next: 'Today, 06:00 PM' }
                    ]
                }
            };

            if (leadId && leadsDatabase[leadId]) {
                var d = leadsDatabase[leadId];
                document.getElementById('lblLeadId').textContent = '#' + leadId;
                document.getElementById('leadBreadcrumbId').textContent = '#' + leadId + ' Details';
                document.getElementById('lblCustomerName').textContent = d.name;
                document.getElementById('lblSubtitle').textContent = d.dest + ' • ' + d.pax + ' • ' + d.city;
                document.getElementById('txtDName').textContent = d.name;
                document.getElementById('txtDPhone').textContent = d.phone;
                document.getElementById('txtDPhone').href = 'tel:' + d.phone;
                document.getElementById('txtDAltPhone').textContent = d.altPhone;
                document.getElementById('txtDCity').textContent = d.city;
                document.getElementById('txtDEmail').textContent = d.email;
                document.getElementById('txtDDest').textContent = d.dest;
                document.getElementById('txtDDate').textContent = d.date;
                document.getElementById('txtDPax').textContent = d.pax;
                document.getElementById('txtDBudget').textContent = d.budget;
                document.getElementById('txtDSource').textContent = d.source;
                document.getElementById('txtDNotes').textContent = d.notes;

                document.getElementById('alertOwnerName').textContent = d.owner;
                document.getElementById('alertAddedBy').textContent = d.addedBy;
                document.getElementById('alertAssignedName').textContent = d.assigned;

                document.getElementById('sideLeadOwner').textContent = d.owner;
                document.getElementById('sideAddedBy').textContent = d.addedBy;
                document.getElementById('sideAssignedEmp').textContent = d.assigned;
                document.getElementById('sideLeadSource').textContent = d.source;

                var statusEl = document.getElementById('lblLeadStatus');
                statusEl.textContent = d.status;
                statusEl.className = 'badge ' + d.statusClass;

                var pEl = document.getElementById('lblLeadPriority');
                pEl.className = 'badge badge-priority-' + d.priority.toLowerCase();
                pEl.innerHTML = (d.priority === 'Hot' ? '<i class="bi bi-fire me-1"></i>' : '') + d.priority + ' Priority';

                // Edit inputs
                document.getElementById('editCustName').value = d.name;
                document.getElementById('editCustPhone').value = d.phone;
                document.getElementById('editCustCity').value = d.city;
                document.getElementById('editCustDest').value = d.dest;
                document.getElementById('editCustBudget').value = d.budget;
                document.getElementById('modalCallCustName').textContent = d.name + ' (#' + leadId + ')';
                document.getElementById('modalCallCustPhone').textContent = d.phone + ' • ' + d.dest;

                // Quick dial
                var callBtn = document.getElementById('btnCallCustomer');
                if (callBtn) {
                    callBtn.href = 'tel:' + d.phone;
                    callBtn.innerHTML = '<i class="bi bi-telephone-outbound me-2"></i> Call: ' + d.phone;
                }
            }
        });
    </script>
</asp:Content>