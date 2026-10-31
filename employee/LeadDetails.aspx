<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="LeadDetails.aspx.cs" Inherits="LeadDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Lead Details | New Journey Holidays CRM</title>
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

    <!-- Page Header & Actions -->
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
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addFollowUpModal">
                <i class="bi bi-calendar-plus"></i> Add Follow-up
            </button>
            <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#logCallModal">
                <i class="bi bi-telephone-plus"></i> Log Call
            </button>
            <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#editLeadModal">
                <i class="bi bi-pencil"></i> Edit Lead
            </button>
        </div>
    </div>

    <div class="row g-4">
        <!-- Main Details (col-lg-8) -->
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
                            <span class="text-muted small d-block">Location / City</span>
                            <span class="fw-semibold text-dark" id="txtDCity">Gorakhpur (Golghar)</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Email Address</span>
                            <span class="text-muted" id="txtDEmail">rohit.verma@example.com</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Inquiry Received</span>
                            <span class="text-muted">Today, 09:15 AM</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 2. Tour Requirements Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-geo-alt text-success"></i> Tour Requirements & Package Details</h6>
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
                            <span class="text-muted small d-block">Package Preference</span>
                            <span class="fw-semibold text-dark">Deluxe (4-Star Hotels + 1 Night Dal Lake Houseboat)</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Estimated Budget</span>
                            <span class="fw-bold text-success" id="txtDBudget">₹1,15,000 Total</span>
                        </div>
                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Lead Source</span>
                            <span class="badge bg-light text-dark border" id="txtDSource">Google / Internet Inquiry</span>
                        </div>
                    </div>

                    <hr class="my-3 text-muted" />

                    <div>
                        <span class="text-muted small d-block mb-1">Customer Notes / Special Requests</span>
                        <div class="p-3 bg-light rounded text-dark small" id="txtDNotes">
                            "Client requested a private non-stop Innova Crysta for all 6 days. Wants snow sledging in Gulmarg Phase-1 and Sonmarg Zero Point if weather permits. Flight tickets needed from Lucknow or Delhi."
                        </div>
                    </div>
                </div>
            </div>

            <!-- 3. Activity & Communications Timeline -->
            <div class="card">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-clock-history text-success"></i> Activity & Follow-up Timeline</h6>
                        <small class="text-muted">Previous interactions and notes for this client</small>
                    </div>
                    <button type="button" class="btn btn-nj-outline btn-sm" data-bs-toggle="modal" data-bs-target="#logCallModal">
                        <i class="bi bi-plus"></i> Add Note
                    </button>
                </div>
                <div class="card-body">
                    <ul class="timeline mb-0">
                        <!-- Timeline Item 1 -->
                        <li class="timeline-item">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <span class="fw-bold text-dark">Scheduled Follow-up Call</span>
                                <span class="badge bg-danger-subtle text-danger">Today, 05:15 PM</span>
                            </div>
                            <p class="small text-muted mb-1">Upcoming phone call to finalize flight options and review houseboat booking contract.</p>
                            <span class="badge bg-light text-dark border small">Assigned: Priya Sharma</span>
                        </li>

                        <!-- Timeline Item 2 -->
                        <li class="timeline-item">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <span class="fw-bold text-dark">Call Connected & Itinerary Shared</span>
                                <span class="text-muted small">Today, 11:45 AM</span>
                            </div>
                            <p class="small text-muted mb-1">Spoke with Mr. Rohit. Sent WhatsApp PDF of 5N/6D itinerary with 4-star options. Customer very positive, discussing with family.</p>
                            <span class="badge bg-success-subtle text-success small"><i class="bi bi-check-circle me-1"></i>Connected (8 mins)</span>
                        </li>

                        <!-- Timeline Item 3 -->
                        <li class="timeline-item">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <span class="fw-bold text-dark">Lead Assigned to Priya Sharma</span>
                                <span class="text-muted small">Today, 10:00 AM</span>
                            </div>
                            <p class="small text-muted mb-0">Admin assigned follow-up to Priya Sharma for fast sales conversion. Original owner Rakesh Yadav preserved.</p>
                        </li>

                        <!-- Timeline Item 4 -->
                        <li class="timeline-item mb-0">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <span class="fw-bold text-dark">Lead Created</span>
                                <span class="text-muted small">Today, 09:15 AM</span>
                            </div>
                            <p class="small text-muted mb-0">Inquiry captured via Google Ads campaign. Tagged as Hot Priority.</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Sidebar Details (col-lg-4) -->
        <div class="col-12 col-lg-4">
            <!-- Attribution & Assignment Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-shield-check text-success"></i> Sales Attribution</h6>
                </div>
                <div class="card-body">
                    <div class="mb-3 p-2 bg-success-subtle rounded border border-success-subtle">
                        <small class="text-success fw-bold d-block">Lead Owner (Sales Credit)</small>
                        <span class="fw-bold text-dark" id="txtDOwner">Rakesh Yadav (Field Team)</span>
                        <div class="text-muted" style="font-size: 0.725rem;">Original finder retains permanent sales credit.</div>
                    </div>

                    <div class="mb-3 p-2 bg-light rounded border">
                        <small class="text-muted d-block">Currently Assigned To</small>
                        <span class="fw-bold text-primary" id="txtDAssigned">Priya Sharma (You)</span>
                        <div class="text-muted" style="font-size: 0.725rem;">Handling active calls and conversion.</div>
                    </div>

                    <div>
                        <small class="text-muted d-block">Branch Responsibility</small>
                        <span class="fw-semibold text-dark">Gorakhpur HQ Desk</span>
                    </div>
                </div>
            </div>

            <!-- Quick Status Updater Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-arrow-repeat text-primary"></i> Update Status</h6>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label small">Change Lead Status</label>
                        <select class="form-select form-select-sm" id="ddlQuickStatus">
                            <option value="New">New</option>
                            <option value="Interested" selected="selected">Interested</option>
                            <option value="Pending">Pending Decision</option>
                            <option value="Confirmed">Confirmed (Booking Won)</option>
                            <option value="Not Interested">Not Interested</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label small">Change Priority</label>
                        <select class="form-select form-select-sm" id="ddlQuickPriority">
                            <option value="Hot" selected="selected">Hot</option>
                            <option value="Warm">Warm</option>
                            <option value="Cold">Cold</option>
                        </select>
                    </div>

                    <button type="button" class="btn btn-nj-primary btn-sm w-100" onclick="alert('Status updated successfully (UI sample).');">
                        Save Status Update
                    </button>
                </div>
            </div>

            <!-- Quick Communication Actions -->
            <div class="card">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-chat-dots text-success"></i> Quick Reach</h6>
                </div>
                <div class="card-body">
                    <div class="d-grid gap-2">
                        <a href="tel:+919876543210" class="btn btn-outline-success btn-sm text-start">
                            <i class="bi bi-telephone-outbound me-2"></i> Call: +91 98765 43210
                        </a>
                        <a href="https://wa.me/919876543210" target="_blank" class="btn btn-outline-primary btn-sm text-start">
                            <i class="bi bi-whatsapp me-2"></i> WhatsApp Customer
                        </a>
                        <button type="button" class="btn btn-outline-secondary btn-sm text-start" data-bs-toggle="modal" data-bs-target="#logCallModal">
                            <i class="bi bi-journal-plus me-2"></i> Log Call Outcome
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Add Follow-up -->
    <div class="modal fade" id="addFollowUpModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold"><i class="bi bi-calendar-plus text-success me-1"></i> Add Follow-up Reminder</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Customer</label>
                        <input type="text" class="form-control" value="Rohit Verma (#NJ-10301)" readonly="readonly" />
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Follow-up Date</label>
                            <input type="date" class="form-control" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Time Slot</label>
                            <input type="time" class="form-control" value="16:00" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Follow-up Goal / Agenda</label>
                        <input type="text" class="form-control" placeholder="e.g. Call to finalize flight quotes and take advance" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Follow-up scheduled (UI sample)!');" data-bs-dismiss="modal">Save Follow-up</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Log Call -->
    <div class="modal fade" id="logCallModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold"><i class="bi bi-telephone-outbound text-success me-1"></i> Log Client Call</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Call Outcome <span class="text-danger">*</span></label>
                        <select class="form-select">
                            <option value="Connected">Connected (Discussion held)</option>
                            <option value="Interested">Interested (Agreed on itinerary)</option>
                            <option value="Call Back Later">Call Back Later</option>
                            <option value="Busy">Busy</option>
                            <option value="No Answer">No Answer</option>
                            <option value="Not Interested">Not Interested</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Discussion Summary</label>
                        <textarea class="form-control" rows="3" placeholder="Key points discussed with customer..."></textarea>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Next Action Date</label>
                        <input type="datetime-local" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Call record logged (UI sample)!');" data-bs-dismiss="modal">Record Call</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal: Edit Lead -->
    <div class="modal fade" id="editLeadModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold"><i class="bi bi-pencil-square text-success me-1"></i> Edit Lead Information</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Customer Name</label>
                        <input type="text" class="form-control" value="Rohit Verma" />
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Mobile</label>
                            <input type="tel" class="form-control" value="+91 98765 43210" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" value="Gorakhpur (Golghar)" />
                        </div>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Destination</label>
                            <input type="text" class="form-control" value="Kashmir 5N/6D Deluxe" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Pax Count</label>
                            <input type="number" class="form-control" value="4" />
                        </div>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Budget</label>
                        <input type="text" class="form-control" value="₹1,15,000" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Lead updated (UI sample)!');" data-bs-dismiss="modal">Save Changes</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Script to customize preview by Query String ?id=... -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var params = new URLSearchParams(window.location.search);
            var leadId = params.get('id');

            var leadsData = {
                'NJ-10302': {
                    name: 'Ananya Mishra',
                    phone: '+91 94521 88321',
                    city: 'Deoria',
                    dest: 'Dubai Luxury Tour (5N/6D)',
                    date: '20 Dec 2026',
                    pax: '2 Pax (Couple)',
                    budget: '₹1,85,000',
                    source: 'Walk-in (Counter)',
                    owner: 'Priya Sharma (You)',
                    assigned: 'Priya Sharma (You)',
                    status: 'Confirmed',
                    statusClass: 'badge-status-confirmed',
                    priority: 'Hot',
                    notes: 'Advance booking deposit received ₹50,000. 5-Star Dubai Marina hotel confirmed. Desert Safari and Burj Khalifa tickets booked.'
                },
                'NJ-10306': {
                    name: 'Dr. Arvind Kumar',
                    phone: '+91 98390 12345',
                    city: 'Gorakhpur (Medical College)',
                    dest: 'Char Dham Yatra by Helicopter',
                    date: '05 May 2027',
                    pax: '4 Pax (Senior Citizens)',
                    budget: '₹4,50,000',
                    source: 'Walk-in (Client Consultation)',
                    owner: 'Priya Sharma (You)',
                    assigned: 'Priya Sharma (You)',
                    status: 'New',
                    statusClass: 'badge-status-new',
                    priority: 'Hot',
                    notes: 'High-budget pilgrimage VIP helicopter booking inquiry from Dehradun. Medical fitness forms requested.'
                },
                'NJ-10308': {
                    name: 'Kavita Gupta',
                    phone: '+91 98399 44332',
                    city: 'Kushinagar',
                    dest: 'Maldives Overwater Villa (4N/5D)',
                    date: '12 Jan 2027',
                    pax: '2 Pax (Honeymoon)',
                    budget: '₹2,40,000',
                    source: 'Client Referral',
                    owner: 'Admin',
                    assigned: 'Priya Sharma (You)',
                    status: 'Confirmed',
                    statusClass: 'badge-status-confirmed',
                    priority: 'Hot',
                    notes: 'All-inclusive resort package confirmed with speedboat transfers and complimentary candle-light beach dinner.'
                }
            };

            if (leadId && leadsData[leadId]) {
                var d = leadsData[leadId];
                document.getElementById('lblLeadId').textContent = '#' + leadId;
                document.getElementById('leadBreadcrumbId').textContent = '#' + leadId + ' Details';
                document.getElementById('lblCustomerName').textContent = d.name;
                document.getElementById('lblSubtitle').textContent = d.dest + ' • ' + d.pax + ' • ' + d.city;
                document.getElementById('txtDName').textContent = d.name;
                document.getElementById('txtDPhone').textContent = d.phone;
                document.getElementById('txtDPhone').href = 'tel:' + d.phone;
                document.getElementById('txtDCity').textContent = d.city;
                document.getElementById('txtDDest').textContent = d.dest;
                document.getElementById('txtDDate').textContent = d.date;
                document.getElementById('txtDPax').textContent = d.pax;
                document.getElementById('txtDBudget').textContent = d.budget;
                document.getElementById('txtDSource').textContent = d.source;
                document.getElementById('txtDOwner').textContent = d.owner;
                document.getElementById('txtDAssigned').textContent = d.assigned;
                document.getElementById('txtDNotes').textContent = d.notes;

                var statusEl = document.getElementById('lblLeadStatus');
                statusEl.textContent = d.status;
                statusEl.className = 'badge ' + d.statusClass;
            }
        });
    </script>
</asp:Content>
