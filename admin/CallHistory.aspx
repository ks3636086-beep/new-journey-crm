<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="CallHistory.aspx.cs" Inherits="CallHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Call History | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Call History & Activity</h2>
            <p class="nj-page-subtitle">Audit log of all client interactions and communications conducted by sales & calling executives.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#newCallModal">
                <i class="bi bi-telephone-plus"></i> Record Call
            </button>
            <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Exporting call logs (sample)...');">
                <i class="bi bi-download"></i> Export Logs
            </button>
        </div>
    </div>

    <!-- Calling Summary Metric Cards -->
    <div class="row g-3 mb-3">
        <div class="col-6 col-md-3">
            <div class="card p-3 h-100">
                <span class="text-muted small">Total Calls Logged</span>
                <h4 class="fw-bold mb-0 text-dark">184</h4>
                <div class="text-muted small mt-1">This month</div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card p-3 h-100">
                <span class="text-muted small">Connected Calls</span>
                <h4 class="fw-bold mb-0 text-success">126</h4>
                <div class="text-success small mt-1"><i class="bi bi-check-circle"></i> 68.5% reach rate</div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card p-3 h-100">
                <span class="text-muted small">Positive Interested</span>
                <h4 class="fw-bold mb-0 text-primary">52</h4>
                <div class="text-primary small mt-1">High conversion potential</div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card p-3 h-100">
                <span class="text-muted small">Call Back Queued</span>
                <h4 class="fw-bold mb-0 text-warning">31</h4>
                <div class="text-muted small mt-1">Scheduled for follow-up</div>
            </div>
        </div>
    </div>

    <!-- Search & Filter Card -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-4">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" class="form-control border-start-0" placeholder="Search client name, phone or remarks..." />
                    </div>
                </div>

                <!-- Call Outcome Filter -->
                <div class="col-6 col-md-3">
                    <select class="form-select form-select-sm">
                        <option value="">All Call Outcomes</option>
                        <option value="Connected">Connected</option>
                        <option value="No Answer">No Answer</option>
                        <option value="Busy">Busy</option>
                        <option value="Call Back Later">Call Back Later</option>
                        <option value="Interested">Interested</option>
                        <option value="Not Interested">Not Interested</option>
                    </select>
                </div>

                <!-- Called By Employee Filter -->
                <div class="col-6 col-md-3">
                    <select class="form-select form-select-sm">
                        <option value="">All Staff</option>
                        <option>Priya Sharma (Sales)</option>
                        <option>Rakesh Yadav (Field)</option>
                        <option>Pooja Srivastava (Calling)</option>
                        <option>Manoj Tiwari (Sales)</option>
                        <option>Ankita Verma (Calling)</option>
                    </select>
                </div>

                <div class="col-12 col-md-2 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="alert('Filtering call logs.');">
                        <i class="bi bi-funnel"></i> Filter Logs
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Call Activity Table Card -->
    <div class="card">
        <div class="card-header bg-white">
            <div>
                <h6 class="mb-0"><i class="bi bi-telephone-outbound"></i> Communication Log Records</h6>
                <small class="text-muted">Detailed outcomes covering all mandatory call classification states</small>
            </div>
            <span class="badge bg-light text-dark border">Static Activity Sample</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead>
                        <tr>
                            <th>Client Name</th>
                            <th>Called By</th>
                            <th>Call Date & Time</th>
                            <th>Call Outcome</th>
                            <th>Remarks</th>
                            <th>Next Follow-up Date</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Outcome 1: Connected -->
                        <tr>
                            <td>
                                <div class="fw-bold">Rohit Verma</div>
                                <small class="text-muted">+91 98765 43210 (Gorakhpur)</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Priya Sharma</div>
                                <span class="badge bg-primary-subtle text-primary">Sales</span>
                            </td>
                            <td>Today, 11:45 AM</td>
                            <td>
                                <span class="badge bg-success-subtle text-success border border-success-subtle">
                                    <i class="bi bi-telephone-inbound-fill me-1"></i> Connected
                                </span>
                            </td>
                            <td>Discussed 5N/6D Kashmir itinerary with Sonmarg snow point. Client positive.</td>
                            <td><span class="fw-semibold text-danger">Today, 05:15 PM</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Viewing call summary details.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Outcome 2: Interested -->
                        <tr>
                            <td>
                                <div class="fw-bold">Dr. Arvind Kumar</div>
                                <small class="text-muted">+91 98390 12345 (Gorakhpur)</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Priya Sharma</div>
                                <span class="badge bg-primary-subtle text-primary">Sales</span>
                            </td>
                            <td>Today, 10:15 AM</td>
                            <td>
                                <span class="badge bg-primary-subtle text-primary border border-primary-subtle">
                                    <i class="bi bi-star-fill me-1"></i> Interested
                                </span>
                            </td>
                            <td>Client showed high interest in Char Dham VIP Helicopter slots for 4 senior family members.</td>
                            <td><span class="fw-semibold text-danger">Today, 02:30 PM</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Viewing call summary details.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Outcome 3: Call Back Later -->
                        <tr>
                            <td>
                                <div class="fw-bold">Suresh Chandra</div>
                                <small class="text-muted">+91 97920 66778 (Kushinagar)</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Pooja Srivastava</div>
                                <span class="badge bg-info-subtle text-info">Calling</span>
                            </td>
                            <td>Today, 09:30 AM</td>
                            <td>
                                <span class="badge bg-warning-subtle text-dark border border-warning-subtle">
                                    <i class="bi bi-clock-history me-1"></i> Call Back Later
                                </span>
                            </td>
                            <td>Customer was driving; requested call back after 04:00 PM for group package details.</td>
                            <td><span class="fw-semibold text-dark">Today, 04:30 PM</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Viewing call summary details.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Outcome 4: Busy -->
                        <tr>
                            <td>
                                <div class="fw-bold">Harsh Vardhan</div>
                                <small class="text-muted">+91 97930 22334 (Siddharthnagar)</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Ankita Verma</div>
                                <span class="badge bg-info-subtle text-info">Calling</span>
                            </td>
                            <td>Yesterday, 04:20 PM</td>
                            <td>
                                <span class="badge bg-secondary-subtle text-secondary border border-secondary-subtle">
                                    <i class="bi bi-dash-circle me-1"></i> Busy
                                </span>
                            </td>
                            <td>Line was busy on both attempts. Automated SMS sent with brochure link.</td>
                            <td>Tomorrow, 10:30 AM</td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Viewing call summary details.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Outcome 5: No Answer -->
                        <tr>
                            <td>
                                <div class="fw-bold">Vikram Chauhan</div>
                                <small class="text-muted">+91 97981 23456 (Maharajganj)</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Pooja Srivastava</div>
                                <span class="badge bg-info-subtle text-info">Calling</span>
                            </td>
                            <td>Yesterday, 03:00 PM</td>
                            <td>
                                <span class="badge bg-light text-muted border">
                                    <i class="bi bi-telephone-x me-1"></i> No Answer
                                </span>
                            </td>
                            <td>Rang full duration, no response. Follow-up queued for next morning.</td>
                            <td><span class="text-danger fw-bold">Overdue (Queued)</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Viewing call summary details.');">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Outcome 6: Not Interested -->
                        <tr>
                            <td>
                                <div class="fw-bold">Dharmendra Maurya</div>
                                <small class="text-muted">+91 91612 33445 (Siddharthnagar)</small>
                            </td>
                            <td>
                                <div class="fw-semibold">Manoj Tiwari</div>
                                <span class="badge bg-primary-subtle text-primary">Sales</span>
                            </td>
                            <td>2 days ago</td>
                            <td>
                                <span class="badge bg-danger-subtle text-danger border border-danger-subtle">
                                    <i class="bi bi-x-circle me-1"></i> Not Interested
                                </span>
                            </td>
                            <td>Customer postponed vacation plans due to children school examinations.</td>
                            <td><span class="text-muted">None (Closed)</span></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-nj-outline btn-sm" onclick="alert('Viewing call summary details.');">
                                    <i class="bi bi-eye"></i>
                                </button>
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

    <!-- Record New Call Modal -->
    <div class="modal fade" id="newCallModal" tabindex="-1" aria-labelledby="newCallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="newCallModalLabel">
                        <i class="bi bi-telephone-plus text-success me-1"></i> Record Client Call Entry
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Client Name / Tour Lead <span class="text-danger">*</span></label>
                        <select class="form-select">
                            <option>Rohit Verma (+91 98765 43210 - Kashmir)</option>
                            <option>Ananya Mishra (+91 94521 88321 - Dubai)</option>
                            <option>Amit Pandey (+91 88765 11234 - Goa)</option>
                            <option>Sunita Singh (+91 91234 56789 - Himachal)</option>
                        </select>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label">Called By <span class="text-danger">*</span></label>
                            <select class="form-select">
                                <option>Priya Sharma (Sales)</option>
                                <option>Rakesh Yadav (Field)</option>
                                <option>Pooja Srivastava (Calling)</option>
                                <option>Manoj Tiwari (Sales)</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label class="form-label">Call Outcome <span class="text-danger">*</span></label>
                            <select class="form-select">
                                <option value="Connected">Connected</option>
                                <option value="No Answer">No Answer</option>
                                <option value="Busy">Busy</option>
                                <option value="Call Back Later">Call Back Later</option>
                                <option value="Interested">Interested</option>
                                <option value="Not Interested">Not Interested</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Call Notes / Discussion Summary</label>
                        <textarea class="form-control" rows="3" placeholder="Key points from the conversation..."></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Next Follow-up Date (Optional)</label>
                        <input type="datetime-local" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="alert('Call entry recorded (UI sample)!');" data-bs-dismiss="modal">Save Entry</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
