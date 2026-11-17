<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="CallHistory.aspx.cs"
    Inherits="CallHistory" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Call History | New Journey Holidays CRM</title>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Page Header -->
        <div class="nj-page-header">
            <div>
                <h2 class="nj-page-title">Client Call History</h2>
                <p class="nj-page-subtitle">Personal communication audit log for all dials, discussions and client call
                    outcomes.</p>
            </div>
            <div class="d-flex align-items-center gap-2">
                <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal"
                    data-bs-target="#modalAddCallEntry">
                    <i class="bi bi-telephone-plus"></i>Add Call Record

                </button>
                <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">
                    <i class="bi bi-calendar-check"></i>Follow-up Tasks
                </a>
            </div>
        </div>

        <!-- Call History Table Card -->
        <div class="card">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <div>
                    <h6 class="mb-0"><i class="bi bi-telephone-outbound text-primary"></i> Call Records Directory</h6>
                    <small class="text-muted">History of interactions covering all standard call classification
                        outcomes</small>
                </div>
                <span class="badge bg-light text-dark border"><i class="bi bi-clock-history me-1"></i>Interaction
                    Log</span>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0" id="tableCallHistory">
                        <thead>
                            <tr>
                                <th>Lead ID</th>
                                <th>Customer Name</th>
                                <th>Mobile</th>
                                <th>Call Date & Time</th>
                                <th>Called By</th>
                                <th>Call Outcome</th>
                                <th>Next Follow-up</th>
                                <th>Priority / Status</th>
                                <th class="text-end">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptCallHistory" runat="server">
                                <ItemTemplate>
                                    <tr class="call-entry-row" data-outcome='<%# Eval("call_status") %>'
                                        data-date='<%# Eval("call_date") %>'>
                                        <!-- 1. Lead ID -->
                                        <td>
                                            <div class="d-flex align-items-center gap-1">
                                                <span class="badge bg-light text-primary border fw-semibold">#<%#
                                                        Eval("lead_code") %></span>
                                                <%# Eval("is_latest") != null && Eval("is_latest") != DBNull.Value && (Eval("is_latest").ToString() == "1" || Eval("is_latest").ToString().ToLower() == "true") ? "<span class=\"badge bg-info-subtle text-info border\" style=\"font-size:0.65rem;\">Latest</span>" : "" %>
                                            </div>
                                        </td>

                                        <!-- 2. Customer Name -->
                                        <td>
                                            <div class="fw-bold text-dark">
                                                <%# Eval("client_name") %>
                                            </div>
                                        </td>

                                        <!-- 3. Contact (Mobile) -->
                                        <td>
                                            <a href='tel:+91<%# Eval("mobile") %>'
                                                class="text-decoration-none text-dark fw-semibold">
                                                <i class="bi bi-telephone text-muted me-1"></i>
                                                <%# Eval("mobile") %>
                                            </a>
                                        </td>

                                        <!-- 4. Call Date & Time (Separate Column) -->
                                        <td>
                                            <div class="fw-semibold text-dark text-nowrap">
                                                <i class="bi bi-calendar-event me-1 text-muted"></i>
                                                <%# Eval("call_date")==DBNull.Value || Eval("call_date")==null ? "-" :
                                                    Eval("call_date") %>
                                            </div>
                                        </td>

                                        <!-- 5. Called By (Separate Column) -->
                                        <td>
                                            <div class="fw-semibold text-dark text-nowrap">
                                                <i class="bi bi-person me-1 text-muted"></i>
                                                <%# Eval("called_by") !=null && Eval("called_by") !=DBNull.Value ?
                                                    Eval("called_by") : "-" %>
                                            </div>
                                            <%# Eval("caller_role") != null && Eval("caller_role") != DBNull.Value && Eval("caller_role").ToString() != "" ? "<span class=\"badge bg-light text-secondary border\" style=\"font-size:0.65rem;\">" + Eval("caller_role") + "</span>" : "" %>
                                        </td>

                                        <!-- 6. Call Outcome -->
                                        <td>
                                            <span class='badge <%# 
                                            Eval("call_status") != null && Eval("call_status").ToString().ToLower().Contains("connected") ? "bg-success-subtle text-success border border-success-subtle" :
                                            (Eval("call_status") != null && Eval("call_status").ToString().ToLower().Contains("interested") && !Eval("call_status").ToString().ToLower().Contains("not") ? "bg-primary-subtle text-primary border border-primary-subtle" :
                                            (Eval("call_status") != null && Eval("call_status").ToString().ToLower().Contains("back") ? "bg-warning-subtle text-dark border border-warning-subtle" :
                                            (Eval("call_status") != null && Eval("call_status").ToString().ToLower().Contains("busy") ? "bg-secondary-subtle text-secondary border border-secondary-subtle" :
                                            (Eval("call_status") != null && Eval("call_status").ToString().ToLower().Contains("not") ? "bg-danger-subtle text-danger border border-danger-subtle" :
                                            "bg-light text-dark border")))) %>'>
                                                <%# Eval("call_status") !=null && Eval("call_status") !=DBNull.Value ?
                                                    Eval("call_status") : "-" %>
                                            </span>
                                        </td>

                                        <!-- 7. Next Follow-up -->
                                        <td>
                                            <span class="fw-bold text-danger text-nowrap">
                                                <i class="bi bi-clock me-1"></i>
                                                <%# Eval("next_followup_date")==DBNull.Value ||
                                                    Eval("next_followup_date")==null ? "-" : Eval("next_followup_date")
                                                    %>
                                            </span>
                                        </td>

                                        <!-- 8. Priority & Lead Status -->
                                        <td>
                                            <div class="d-flex flex-column gap-1">
                                                <span
                                                    class='badge <%# Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "hot" ? "badge-priority-hot" : (Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "warm" ? "badge-priority-warm" : "badge-priority-cold") %>'>
                                                    <%# Eval("lead_priority") !=null && Eval("lead_priority")
                                                        !=DBNull.Value ? Eval("lead_priority") : "-" %>
                                                </span>
                                                <span
                                                    class='badge <%# Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "confirmed" ? "bg-success-subtle text-success" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "interested" ? "badge-status-interested" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "new" ? "badge-status-new" : "badge-status-pending")) %>'>
                                                    <%# Eval("lead_status") !=null && Eval("lead_status") !=DBNull.Value
                                                        ? Eval("lead_status") : "-" %>
                                                </span>
                                            </div>
                                        </td>

                                        <!-- 9. Actions (View Lead Details) -->
                                        <td class="text-end">
                                            <a href='LeadDetails.aspx?id=<%# Eval("lead_code") %>' class="btn btn-nj-outline btn-sm text-nowrap"
                                                title="View Lead Details">
                                                <i class="bi bi-eye me-1"></i>View
                                            </a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                            <!-- Empty State Row when no records match filter -->
                            <tr class="call-empty-row d-none">
                                <td colspan="9" class="text-center py-4 text-muted">
                                    <i class="bi bi-inbox fs-2 d-block mb-2 text-muted"></i>
                                    <div class="fw-semibold text-dark">No call history records found</div>
                                    <small>No records match your search or outcome filter.</small>
                                </td>
                            </tr>
                        </tbody>
                        <div class="fw-semibold text-dark">No call history records found</div>
                        <small>No records match your search or outcome filter.</small>
                        </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="card-footer bg-white p-3 d-flex justify-content-between align-items-center">
                <span class="small text-muted">Call history and interactions audit log</span>
                <ul class="pagination pagination-sm mb-0">
                    <li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
        </div>






        <!-- Modal: Add Call Record -->
        <div class="modal fade" id="modalAddCallEntry" tabindex="-1" aria-labelledby="modalAddCallEntryTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom">
                        <h6 class="modal-title fw-bold" id="modalAddCallEntryTitle">
                            <i class="bi bi-telephone-plus text-success me-1"></i>Add Call Record
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
                            <textarea class="form-control" rows="3"
                                placeholder="Key points discussed during conversation, client preferences, quotation feedback..."></textarea>
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
                        <button type="button" class="btn btn-sm btn-outline-secondary"
                            data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-sm btn-nj-primary"
                            onclick="alert('Call record added to history (UI sample)!');" data-bs-dismiss="modal">Save
                            Call Record</button>
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