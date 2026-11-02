<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="CallHistory.aspx.cs" Inherits="CallHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Call History | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Client Call History</h2>
            <p class="nj-page-subtitle">Personal communication audit log for all dials, discussions and client call outcomes.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalAddCallEntry">
                <i class="bi bi-telephone-plus"></i> Add Call Record
            </button>
            <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-calendar-check"></i> Follow-up Tasks
            </a>
        </div>
    </div>

    <!-- Calling Metrics Row -->
    <div class="row g-2 mb-3">
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Today's Calls</span>
                    <h5 class="fw-bold mb-0 text-dark">14 Calls</h5>
                </div>
                <span class="badge bg-light text-primary border p-2"><i class="bi bi-telephone"></i></span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Connected / Interested</span>
                    <h5 class="fw-bold mb-0 text-success">10 Calls</h5>
                </div>
                <span class="badge bg-success-subtle text-success border p-2"><i class="bi bi-check-circle"></i></span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">Call Back Scheduled</span>
                    <h5 class="fw-bold mb-0 text-warning">3 Leads</h5>
                </div>
                <span class="badge bg-warning-subtle text-warning border p-2"><i class="bi bi-clock-history"></i></span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="p-2 px-3 bg-white border rounded d-flex align-items-center justify-content-between">
                <div>
                    <span class="text-muted" style="font-size: 0.75rem;">No Answer / Busy</span>
                    <h5 class="fw-bold mb-0 text-secondary">1 Call</h5>
                </div>
                <span class="badge bg-secondary-subtle text-secondary border p-2"><i class="bi bi-telephone-x"></i></span>
            </div>
        </div>
    </div>

    <!-- Search & Filter Card -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <!-- Search text -->
                <div class="col-12 col-md-4">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" class="form-control border-start-0" id="txtSearchCalls" placeholder="Search customer, phone or remarks..." onkeyup="filterCallRecords();" />
                    </div>
                </div>

                <!-- Call Outcome Filter -->
                <div class="col-6 col-md-3">
                    <select class="form-select form-select-sm" id="ddlOutcomeFilter" onchange="filterCallRecords();">
                        <option value="">All Call Outcomes</option>
                        <option value="Connected">Connected</option>
                        <option value="Interested">Interested</option>
                        <option value="Call Back Later">Call Back Later</option>
                        <option value="Busy">Busy</option>
                        <option value="No Answer">No Answer</option>
                        <option value="Not Interested">Not Interested</option>
                    </select>
                </div>

                <!-- Date Filter -->
                <div class="col-6 col-md-3">
                    <select class="form-select form-select-sm" id="ddlDateFilter" onchange="filterCallRecords();">
                        <option value="">All Dates</option>
                        <option value="Today">Today's Calls</option>
                        <option value="Yesterday">Yesterday</option>
                        <option value="This Week">Earlier This Week</option>
                    </select>
                </div>

                <!-- Reset button -->
                <div class="col-12 col-md-2 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="resetCallFilters();">
                        <i class="bi bi-arrow-counterclockwise"></i> Reset
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Call History Table Card -->
    <div class="card">
        <div class="card-header bg-white d-flex justify-content-between align-items-center">
            <div>
                <h6 class="mb-0"><i class="bi bi-telephone-outbound text-primary"></i> Call Records Directory</h6>
                <small class="text-muted">History of interactions covering all standard call classification outcomes</small>
            </div>
            <span class="badge bg-light text-dark border">Static Activity Sample</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0" id="tableCallHistory">
                    <thead>
                        <tr>
                            <th>Customer Name</th>
                            <th>Mobile Number</th>
                            <th>Call Date</th>
                            <th>Call Time</th>
                            <th>Call Outcome</th>
                            <th>Remarks & Discussion</th>
                            <th>Next Follow-up</th>
                            <th>Lead Priority</th>
                            <th class="text-end">View Lead</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 1. Connected -->
                        <tr class="call-entry-row" data-outcome="Connected" data-date="Today">
                            <td>
                                <div class="fw-bold">Rohit Verma</div>
                                <small class="text-muted">Kashmir Tour</small>
                            </td>
                            <td><a href="tel:+919876543210" class="text-decoration-none text-dark">+91 98765 43210</a></td>
                            <td>Today (02 Nov)</td>
                            <td>11:45 AM</td>
                            <td>
                                <span class="badge bg-success-subtle text-success border border-success-subtle">
                                    <i class="bi bi-telephone-inbound-fill me-1"></i> Connected
                                </span>
                            </td>
                            <td>
                                <span class="text-truncate d-inline-block" style="max-width: 240px;">
                                    Discussed 5N/6D Kashmir itinerary with Sonmarg snow point. Client positive about Srinagar houseboat.
                                </span>
                            </td>
                            <td><span class="fw-bold text-danger">Today, 05:15 PM</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10301" class="btn btn-nj-outline btn-sm" title="View Customer Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- 2. Interested -->
                        <tr class="call-entry-row" data-outcome="Interested" data-date="Today">
                            <td>
                                <div class="fw-bold">Dr. Arvind Kumar</div>
                                <small class="text-muted">Char Dham Heli</small>
                            </td>
                            <td><a href="tel:+919839012345" class="text-decoration-none text-dark">+91 98390 12345</a></td>
                            <td>Today (02 Nov)</td>
                            <td>10:15 AM</td>
                            <td>
                                <span class="badge bg-primary-subtle text-primary border border-primary-subtle">
                                    <i class="bi bi-star-fill me-1"></i> Interested
                                </span>
                            </td>
                            <td>
                                <span class="text-truncate d-inline-block" style="max-width: 240px;">
                                    Customer verified pilgrimage intent. Requested helicopter VIP pricing for 4 senior family members.
                                </span>
                            </td>
                            <td><span class="fw-bold text-danger">Today, 02:30 PM</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10306" class="btn btn-nj-outline btn-sm" title="View Customer Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- 3. Call Back Later -->
                        <tr class="call-entry-row" data-outcome="Call Back Later" data-date="Today">
                            <td>
                                <div class="fw-bold">Preeti Agrawal</div>
                                <small class="text-muted">Dubai Tour</small>
                            </td>
                            <td><a href="tel:+919918088990" class="text-decoration-none text-dark">+91 99180 88990</a></td>
                            <td>Today (02 Nov)</td>
                            <td>09:30 AM</td>
                            <td>
                                <span class="badge bg-warning-subtle text-dark border border-warning-subtle">
                                    <i class="bi bi-clock-history me-1"></i> Call Back Later
                                </span>
                            </td>
                            <td>
                                <span class="text-truncate d-inline-block" style="max-width: 240px;">
                                    Customer was at medical clinic; asked to call back in evening after 06:00 PM for package options.
                                </span>
                            </td>
                            <td><span class="fw-bold text-dark">Today, 06:00 PM</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10314" class="btn btn-nj-outline btn-sm" title="View Customer Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- 4. Busy -->
                        <tr class="call-entry-row" data-outcome="Busy" data-date="Yesterday">
                            <td>
                                <div class="fw-bold">Harsh Vardhan</div>
                                <small class="text-muted">Himachal Tour</small>
                            </td>
                            <td><a href="tel:+919793022334" class="text-decoration-none text-dark">+91 97930 22334</a></td>
                            <td>Yesterday (01 Nov)</td>
                            <td>04:20 PM</td>
                            <td>
                                <span class="badge bg-secondary-subtle text-secondary border border-secondary-subtle">
                                    <i class="bi bi-dash-circle me-1"></i> Busy
                                </span>
                            </td>
                            <td>
                                <span class="text-truncate d-inline-block" style="max-width: 240px;">
                                    Line was busy on both attempts. Sent WhatsApp message with Manali summer package link.
                                </span>
                            </td>
                            <td>Tomorrow, 10:30 AM</td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm" title="View Customer Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- 5. No Answer -->
                        <tr class="call-entry-row" data-outcome="No Answer" data-date="Yesterday">
                            <td>
                                <div class="fw-bold">Vikram Chauhan</div>
                                <small class="text-muted">Thailand Tour</small>
                            </td>
                            <td><a href="tel:+919798123456" class="text-decoration-none text-dark">+91 97981 23456</a></td>
                            <td>Yesterday (01 Nov)</td>
                            <td>03:00 PM</td>
                            <td>
                                <span class="badge bg-light text-muted border">
                                    <i class="bi bi-telephone-x me-1"></i> No Answer
                                </span>
                            </td>
                            <td>
                                <span class="text-truncate d-inline-block" style="max-width: 240px;">
                                    Rang out completely. No response on phone. Scheduled for morning retry.
                                </span>
                            </td>
                            <td><span class="text-danger fw-bold">Overdue</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm" title="View Customer Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- 6. Not Interested -->
                        <tr class="call-entry-row" data-outcome="Not Interested" data-date="This Week">
                            <td>
                                <div class="fw-bold">Dharmendra Maurya</div>
                                <small class="text-muted">Rajasthan Tour</small>
                            </td>
                            <td><a href="tel:+919161233445" class="text-decoration-none text-dark">+91 91612 33445</a></td>
                            <td>31 Oct 2026</td>
                            <td>02:15 PM</td>
                            <td>
                                <span class="badge bg-danger-subtle text-danger border border-danger-subtle">
                                    <i class="bi bi-x-circle me-1"></i> Not Interested
                                </span>
                            </td>
                            <td>
                                <span class="text-truncate d-inline-block" style="max-width: 240px;">
                                    Customer cancelled vacation plans due to children's school examination timetable.
                                </span>
                            </td>
                            <td><span class="text-muted">None (Closed)</span></td>
                            <td><span class="badge badge-priority-cold">Cold</span></td>
                            <td class="text-end">
                                <a href="LeadDetails.aspx?id=NJ-10309" class="btn btn-nj-outline btn-sm" title="View Customer Lead">
                                    <i class="bi bi-eye"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="card-footer bg-white p-3 d-flex justify-content-between align-items-center">
            <span class="small text-muted">Showing 6 sample calls covering all outcomes</span>
            <ul class="pagination pagination-sm mb-0">
                <li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
    </div>

    <!-- Modal: Add Call Record -->
    <div class="modal fade" id="modalAddCallEntry" tabindex="-1" aria-labelledby="modalAddCallEntryTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="modalAddCallEntryTitle">
                        <i class="bi bi-telephone-plus text-success me-1"></i> Add Call Record
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Select Customer / Lead <span class="text-danger">*</span></label>
                        <select class="form-select">
                            <option>Rohit Verma (+91 98765 43210 - Kashmir 5N/6D)</option>
                            <option>Dr. Arvind Kumar (+91 98390 12345 - Char Dham Heli)</option>
                            <option>Preeti Agrawal (+91 99180 88990 - Dubai 5N)</option>
                            <option>Alok Dubey (+91 97931 12233 - Singapore 5N)</option>
                        </select>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Call Date & Time <span class="text-danger">*</span></label>
                            <input type="datetime-local" class="form-control" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Call Outcome <span class="text-danger">*</span></label>
                            <select class="form-select" id="newCallOutcome">
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
                        <textarea class="form-control" rows="3" placeholder="Key points discussed during conversation, client preferences, quotation feedback..."></textarea>
                    </div>
                    <div class="row g-2 mb-2">
                        <div class="col-6">
                            <label class="form-label">Next Follow-up Date</label>
                            <input type="datetime-local" class="form-control" />
                        </div>
                        <div class="col-6">
                            <label class="form-label">Lead Priority (Urgency)</label>
                            <select class="form-select">
                                <option value="Hot">Hot (&lt; 30 Days)</option>
                                <option value="Warm">Warm (1-2 Months)</option>
                                <option value="Cold">Cold</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Call record added to history (UI sample)!');" data-bs-dismiss="modal">Save Call Record</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function filterCallRecords() {
            var search = document.getElementById('txtSearchCalls').value.toLowerCase();
            var outcome = document.getElementById('ddlOutcomeFilter').value;
            var date = document.getElementById('ddlDateFilter').value;

            var rows = document.querySelectorAll('.call-entry-row');
            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                var rOutcome = row.getAttribute('data-outcome');
                var rDate = row.getAttribute('data-date');

                var mSearch = search === '' || text.indexOf(search) > -1;
                var mOutcome = outcome === '' || rOutcome === outcome;
                var mDate = date === '' || rDate === date;

                if (mSearch && mOutcome && mDate) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        function resetCallFilters() {
            document.getElementById('txtSearchCalls').value = '';
            document.getElementById('ddlOutcomeFilter').selectedIndex = 0;
            document.getElementById('ddlDateFilter').selectedIndex = 0;
            filterCallRecords();
        }
    </script>
</asp:Content>