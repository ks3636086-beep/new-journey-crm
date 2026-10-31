<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="CallHistory.aspx.cs" Inherits="CallHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Call History | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">My Call History</h2>
            <p class="nj-page-subtitle">Personal communication log of phone interactions and call outcomes with holiday travelers.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addCallModal">
                <i class="bi bi-telephone-plus"></i> Add Call Record
            </button>
            <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-calendar-check"></i> Today's Schedule
            </a>
        </div>
    </div>

    <!-- Daily Calling Summary Pills -->
    <div class="row g-2 mb-3">
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Today's Dials</span>
                    <h5 class="fw-bold mb-0 text-dark">12 Calls</h5>
                </div>
                <span class="badge bg-light text-primary border p-2"><i class="bi bi-telephone"></i></span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Connected</span>
                    <h5 class="fw-bold mb-0 text-success">9 Calls</h5>
                </div>
                <span class="badge bg-success-subtle text-success border p-2"><i class="bi bi-check-circle"></i></span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Interested</span>
                    <h5 class="fw-bold mb-0 text-primary">4 Leads</h5>
                </div>
                <span class="badge bg-primary-subtle text-primary border p-2"><i class="bi bi-star"></i></span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Call Back Scheduled</span>
                    <h5 class="fw-bold mb-0 text-warning">2 Leads</h5>
                </div>
                <span class="badge bg-warning-subtle text-warning border p-2"><i class="bi bi-clock-history"></i></span>
            </div>
        </div>
    </div>

    <!-- Search & Filter Card -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" class="form-control border-start-0" id="callSearch" placeholder="Search customer name, phone or remarks..." onkeyup="filterCalls();" />
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <select class="form-select form-select-sm" id="callOutcomeFilter" onchange="filterCalls();">
                        <option value="">All Call Outcomes</option>
                        <option value="Connected">Connected</option>
                        <option value="Interested">Interested</option>
                        <option value="Call Back Later">Call Back Later</option>
                        <option value="Busy">Busy</option>
                        <option value="No Answer">No Answer</option>
                        <option value="Not Interested">Not Interested</option>
                    </select>
                </div>
                <div class="col-6 col-md-2 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="document.getElementById('callSearch').value=''; document.getElementById('callOutcomeFilter').selectedIndex=0; filterCalls();">
                        <i class="bi bi-arrow-counterclockwise"></i> Reset
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Call History Table Card -->
    <div class="card">
        <div class="card-header bg-white">
            <div>
                <h6 class="mb-0"><i class="bi bi-telephone-outbound"></i> Client Communication Log</h6>
                <small class="text-muted">Calls made by Priya Sharma across all outcomes</small>
            </div>
            <span class="badge bg-light text-dark border">Recent Calls</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0" id="callHistoryTable">
                    <thead>
                        <tr>
                            <th>Customer Name</th>
                            <th>Date & Time</th>
                            <th>Call Outcome</th>
                            <th>Remarks & Discussion Summary</th>
                            <th>Next Action Date</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Call 1: Connected -->
                        <tr class="call-row" data-outcome="Connected">
                            <td>
                                <div class="fw-bold">Rohit Verma</div>
                                <small class="text-muted"><a href="tel:+919876543210" class="text-decoration-none text-dark">+91 98765 43210</a> &bull; Kashmir</small>
                            </td>
                            <td>Today, 11:45 AM</td>
                            <td>
                                <span class="badge bg-success-subtle text-success border border-success-subtle">
                                    <i class="bi bi-telephone-inbound-fill me-1"></i> Connected
                                </span>
                            </td>
                            <td>Discussed 5N/6D Kashmir itinerary with Sonmarg snow point. Client positive about Srinagar houseboat.</td>
                            <td><span class="fw-bold text-danger">Today, 05:15 PM</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-outline btn-sm" title="View Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- Call 2: Interested -->
                        <tr class="call-row" data-outcome="Interested">
                            <td>
                                <div class="fw-bold">Dr. Arvind Kumar</div>
                                <small class="text-muted"><a href="tel:+919839012345" class="text-decoration-none text-dark">+91 98390 12345</a> &bull; Char Dham</small>
                            </td>
                            <td>Today, 10:15 AM</td>
                            <td>
                                <span class="badge bg-primary-subtle text-primary border border-primary-subtle">
                                    <i class="bi bi-star-fill me-1"></i> Interested
                                </span>
                            </td>
                            <td>Customer verified pilgrimage intent. Requested helicopter VIP pricing for 4 senior family members.</td>
                            <td><span class="fw-bold text-danger">Today, 02:30 PM</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-outline btn-sm" title="View Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- Call 3: Call Back Later -->
                        <tr class="call-row" data-outcome="Call Back Later">
                            <td>
                                <div class="fw-bold">Preeti Agrawal</div>
                                <small class="text-muted"><a href="tel:+919918088990" class="text-decoration-none text-dark">+91 99180 88990</a> &bull; Dubai</small>
                            </td>
                            <td>Today, 09:30 AM</td>
                            <td>
                                <span class="badge bg-warning-subtle text-dark border border-warning-subtle">
                                    <i class="bi bi-clock-history me-1"></i> Call Back Later
                                </span>
                            </td>
                            <td>Customer was at clinic; asked to call back in evening after 06:00 PM for package options.</td>
                            <td><span class="fw-bold text-dark">Today, 06:00 PM</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10314" class="btn btn-nj-outline btn-sm" title="View Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- Call 4: Busy -->
                        <tr class="call-row" data-outcome="Busy">
                            <td>
                                <div class="fw-bold">Harsh Vardhan</div>
                                <small class="text-muted"><a href="tel:+919793022334" class="text-decoration-none text-dark">+91 97930 22334</a> &bull; Himachal</small>
                            </td>
                            <td>Yesterday, 04:20 PM</td>
                            <td>
                                <span class="badge bg-secondary-subtle text-secondary border border-secondary-subtle">
                                    <i class="bi bi-dash-circle me-1"></i> Busy
                                </span>
                            </td>
                            <td>Call was waiting / line engaged. Sent WhatsApp message with Manali summer package link.</td>
                            <td>Tomorrow, 10:30 AM</td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm" title="View Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- Call 5: No Answer -->
                        <tr class="call-row" data-outcome="No Answer">
                            <td>
                                <div class="fw-bold">Vikram Chauhan</div>
                                <small class="text-muted"><a href="tel:+919798123456" class="text-decoration-none text-dark">+91 97981 23456</a> &bull; Thailand</small>
                            </td>
                            <td>Yesterday, 03:00 PM</td>
                            <td>
                                <span class="badge bg-light text-muted border">
                                    <i class="bi bi-telephone-x me-1"></i> No Answer
                                </span>
                            </td>
                            <td>Call rang completely, no answer. Follow-up queued for re-dial.</td>
                            <td><span class="text-danger fw-bold">Overdue</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm" title="View Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- Call 6: Not Interested -->
                        <tr class="call-row" data-outcome="Not Interested">
                            <td>
                                <div class="fw-bold">Dharmendra Maurya</div>
                                <small class="text-muted"><a href="tel:+919161233445" class="text-decoration-none text-dark">+91 91612 33445</a> &bull; Rajasthan</small>
                            </td>
                            <td>2 days ago</td>
                            <td>
                                <span class="badge bg-danger-subtle text-danger border border-danger-subtle">
                                    <i class="bi bi-x-circle me-1"></i> Not Interested
                                </span>
                            </td>
                            <td>Customer cancelled vacation plans due to children's upcoming semester exams.</td>
                            <td><span class="text-muted">None (Closed)</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10309" class="btn btn-nj-outline btn-sm" title="View Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="card-footer bg-white p-3 d-flex justify-content-between align-items-center">
            <span class="small text-muted">Showing 6 sample calls</span>
            <ul class="pagination pagination-sm mb-0">
                <li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
    </div>

    <!-- Modal: Add Call Record -->
    <div class="modal fade" id="addCallModal" tabindex="-1" aria-labelledby="addCallTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="addCallTitle">
                        <i class="bi bi-telephone-plus text-success me-1"></i> Add Call Record
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Customer / Lead <span class="text-danger">*</span></label>
                        <select class="form-select" id="call_customer">
                            <option>Dr. Arvind Kumar (+91 98390 12345 - Char Dham)</option>
                            <option>Rohit Verma (+91 98765 43210 - Kashmir)</option>
                            <option>Preeti Agrawal (+91 99180 88990 - Dubai)</option>
                            <option>Shruti Srivastava (+91 91610 99887 - Kerala)</option>
                        </select>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Call Date & Time <span class="text-danger">*</span></label>
                            <input type="datetime-local" class="form-control" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Call Outcome <span class="text-danger">*</span></label>
                            <select class="form-select" id="call_outcome_input">
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
                        <textarea class="form-control" rows="3" placeholder="Summary of client conversation, price objections, destination questions..."></textarea>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Next Follow-up Date (Optional)</label>
                        <input type="datetime-local" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Call record added successfully (UI sample)!');" data-bs-dismiss="modal">Save Record</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function filterCalls() {
            var search = document.getElementById('callSearch').value.toLowerCase();
            var outcome = document.getElementById('callOutcomeFilter').value;

            var rows = document.querySelectorAll('.call-row');
            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                var rOutcome = row.getAttribute('data-outcome');

                var matchSearch = search === '' || text.indexOf(search) > -1;
                var matchOutcome = outcome === '' || rOutcome === outcome;

                if (matchSearch && matchOutcome) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</asp:Content>
