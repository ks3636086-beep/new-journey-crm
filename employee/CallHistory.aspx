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
       
    </div>

     <!-- Call History Table Card -->
    <div class="card">
        <div class="card-header bg-white d-flex justify-content-between align-items-center">
            <div>
                <h6 class="mb-0"><i class="bi bi-telephone-outbound text-primary"></i> Call Records Directory</h6>
                <small class="text-muted">History of interactions covering all standard call classification outcomes</small>
            </div>
            <span class="badge bg-light text-dark border"><i class="bi bi-clock-history me-1"></i>Interaction Log</span>
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
                                <tr class="call-entry-row" data-outcome='<%# Eval("call_status") %>' data-date='<%# Eval("call_date") %>'>
                                    <!-- 1. Lead ID -->
                                    <td>
                                        <div class="d-flex align-items-center gap-1">
                                            <span class="badge bg-light text-primary border fw-semibold">#<%# Eval("lead_code") %></span>
                                            <%# Eval("is_latest") != null && Eval("is_latest") != DBNull.Value && (Eval("is_latest").ToString() == "1" || Eval("is_latest").ToString().ToLower() == "true") ? "<span class=\"badge bg-info-subtle text-info border\" style=\"font-size:0.65rem;\">Latest</span>" : "" %>
                                        </div>
                                    </td>

                                    <!-- 2. Customer Name -->
                                    <td>
                                        <div class="fw-bold text-dark"><%# Eval("client_name") %></div>
                                    </td>

                                    <!-- 3. Contact (Mobile) -->
                                    <td>
                                        <a href='tel:+91<%# Eval("mobile") %>' class="text-decoration-none text-dark fw-semibold">
                                            <i class="bi bi-telephone text-muted me-1"></i><%# Eval("mobile") %>
                                        </a>
                                    </td>

                                    <!-- 4. Call Date & Time (Separate Column) -->
                                    <td>
                                        <div class="fw-semibold text-dark text-nowrap">
                                            <i class="bi bi-calendar-event me-1 text-muted"></i><%# Eval("call_date") == DBNull.Value || Eval("call_date") == null ? "-" : Eval("call_date") %>
                                        </div>
                                    </td>

                                    <!-- 5. Called By (Separate Column) -->
                                    <td>
                                        <div class="fw-semibold text-dark text-nowrap">
                                            <i class="bi bi-person me-1 text-muted"></i><%# Eval("called_by") != null && Eval("called_by") != DBNull.Value ? Eval("called_by") : "-" %>
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
                                            <%# Eval("call_status") != null && Eval("call_status") != DBNull.Value ? Eval("call_status") : "-" %>
                                        </span>
                                    </td>

                                    <!-- 7. Next Follow-up -->
                                    <td>
                                        <span class="fw-bold text-danger text-nowrap">
                                            <i class="bi bi-clock me-1"></i><%# Eval("next_followup_date") == DBNull.Value || Eval("next_followup_date") == null ? "-" : Eval("next_followup_date") %>
                                        </span>
                                    </td>

                                    <!-- 8. Priority & Lead Status -->
                                    <td>
                                        <div class="d-flex flex-column gap-1">
                                            <span class='badge <%# Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "hot" ? "badge-priority-hot" : (Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "warm" ? "badge-priority-warm" : "badge-priority-cold") %>'>
                                                <%# Eval("lead_priority") != null && Eval("lead_priority") != DBNull.Value ? Eval("lead_priority") : "-" %>
                                            </span>
                                            <span class='badge <%# Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "confirmed" ? "bg-success-subtle text-success" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "interested" ? "badge-status-interested" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "new" ? "badge-status-new" : "badge-status-pending")) %>'>
                                                <%# Eval("lead_status") != null && Eval("lead_status") != DBNull.Value ? Eval("lead_status") : "-" %>
                                            </span>
                                        </div>
                                    </td>

                                    <!-- 9. Actions (View Modal Trigger) -->
                                    <td class="text-end">
                                        <button type="button" class="btn btn-nj-outline btn-sm text-nowrap"
                                            title="View Call Details"
                                            onclick="openCallDetailsModal(this);"
                                            data-leadcode='<%# Eval("lead_code") %>'
                                            data-callid='<%# Eval("call_id") %>'
                                            data-srno='<%# Eval("srno") %>'
                                            data-name='<%# Eval("client_name") %>'
                                            data-mobile='<%# Eval("mobile") %>'
                                            data-altmobile='<%# Eval("alternate_mobile") %>'
                                            data-dest='<%# Eval("destination") %>'
                                            data-city='<%# Eval("city") %>'
                                            data-traveldate='<%# Eval("travel_date") %>'
                                            data-calldate='<%# Eval("call_date") %>'
                                            data-calledby='<%# Eval("called_by") %>'
                                            data-callerrole='<%# Eval("caller_role") %>'
                                            data-outcome='<%# Eval("call_status") %>'
                                            data-nextfollowup='<%# Eval("next_followup_date") %>'
                                            data-remarks='<%# Eval("remarks") %>'
                                            data-priority='<%# Eval("lead_priority") %>'
                                            data-status='<%# Eval("lead_status") %>'>
                                            <i class="bi bi-eye me-1"></i>View
                                        </button>
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
        <div class="modal fade" id="modalAddCallEntry" tabindex="-1" aria-labelledby="modalAddCallEntryTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom">
                        <h6 class="modal-title fw-bold" id="modalAddCallEntryTitle">
                          
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

        <!-- Modal: Call & Lead Details -->
        <div class="modal fade" id="modalCallDetails" tabindex="-1" aria-labelledby="modalCallDetailsTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content border-0 shadow">
                    <div class="modal-header border-bottom py-3">
                        <h6 class="modal-title fw-bold" id="modalCallDetailsTitle">
                            <i class="bi bi-telephone-inbound text-primary me-2"></i>Call Record Details
                        </h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4">
                        <!-- Top Customer Banner -->
                        <div class="d-flex justify-content-between align-items-center p-3 bg-light rounded border mb-3">
                            <div>
                                <asp:Label ID="lblModalCustomerName" runat="server" ClientIDMode="Static" CssClass="h5 mb-1 fw-bold text-dark d-block" />
                                <div class="text-muted small">
                                    <i class="bi bi-telephone text-muted me-1"></i><asp:Label ID="lblModalMobile" runat="server" ClientIDMode="Static" CssClass="fw-semibold text-dark me-3" />
                                    <i class="bi bi-phone text-muted me-1"></i>Alt: <asp:Label ID="lblModalAltMobile" runat="server" ClientIDMode="Static" CssClass="fw-semibold text-dark" />
                                </div>
                            </div>
                            <div class="text-end">
                                <span class="badge bg-primary-subtle text-primary border px-2 py-1 mb-1 d-inline-block">
                                    <asp:Label ID="lblModalLeadCode" runat="server" ClientIDMode="Static" />
                                </span>
                                <div class="text-muted small" style="font-size: 0.75rem;">
                                    <asp:Label ID="lblModalCallId" runat="server" ClientIDMode="Static" />
                                </div>
                            </div>
                        </div>

                        <!-- Details Grid -->
                        <div class="row g-3 mb-3">
                            <div class="col-12 col-md-6">
                                <div class="p-3 border rounded bg-white h-100">
                                    <span class="text-muted small d-block mb-1"><i class="bi bi-geo-alt me-1 text-primary"></i>Destination &amp; City</span>
                                    <asp:Label ID="lblModalDestCity" runat="server" ClientIDMode="Static" CssClass="fw-bold text-dark d-block" />
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="p-3 border rounded bg-white h-100">
                                    <span class="text-muted small d-block mb-1"><i class="bi bi-airplane me-1 text-primary"></i>Travel Date</span>
                                    <asp:Label ID="lblModalTravelDate" runat="server" ClientIDMode="Static" CssClass="fw-bold text-dark d-block" />
                                </div>
                            </div>

                            <div class="col-12 col-md-4">
                                <div class="p-2 border rounded bg-white">
                                    <span class="text-muted small d-block mb-1"><i class="bi bi-calendar-event me-1 text-muted"></i>Call Date &amp; Time</span>
                                    <asp:Label ID="lblModalCallDate" runat="server" ClientIDMode="Static" CssClass="fw-semibold small text-dark d-block" />
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="p-2 border rounded bg-white">
                                    <span class="text-muted small d-block mb-1"><i class="bi bi-person-badge me-1 text-muted"></i>Called By</span>
                                    <asp:Label ID="lblModalCalledBy" runat="server" ClientIDMode="Static" CssClass="fw-semibold small text-dark d-block" />
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="p-2 border rounded bg-white">
                                    <span class="text-muted small d-block mb-1"><i class="bi bi-telephone-forward me-1 text-muted"></i>Call Outcome</span>
                                    <asp:Label ID="lblModalOutcome" runat="server" ClientIDMode="Static" CssClass="badge bg-success-subtle text-success border border-success-subtle" />
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <div class="p-2 border rounded bg-white">
                                    <span class="text-muted small d-block mb-1"><i class="bi bi-clock me-1 text-danger"></i>Next Follow-up</span>
                                    <asp:Label ID="lblModalNextFollowup" runat="server" ClientIDMode="Static" CssClass="fw-bold text-danger small d-block" />
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="p-2 border rounded bg-white">
                                    <span class="text-muted small d-block mb-1"><i class="bi bi-flag me-1 text-muted"></i>Priority &amp; Status</span>
                                    <span class="d-inline-flex gap-1">
                                        <asp:Label ID="lblModalPriority" runat="server" ClientIDMode="Static" CssClass="badge badge-priority-hot" />
                                        <asp:Label ID="lblModalStatus" runat="server" ClientIDMode="Static" CssClass="badge bg-light text-dark border" />
                                    </span>
                                </div>
                            </div>
                        </div>

                        <!-- Remarks & Discussion -->
                        <div>
                            <label class="form-label text-muted small fw-semibold mb-1"><i class="bi bi-chat-left-text me-1 text-primary"></i>Call Remarks &amp; Discussion</label>
                            <div class="p-3 bg-light border rounded small text-dark" style="min-height: 70px; white-space: pre-wrap;">
                                <asp:Label ID="lblModalRemarks" runat="server" ClientIDMode="Static" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer border-top py-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                        <a id="lnkModalViewLead" href="#" class="btn btn-sm btn-nj-primary">
                            <i class="bi bi-person-lines-fill me-1"></i>View Full Lead
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function openCallDetailsModal(btn) {
                var getVal = function (attr) { return btn.getAttribute(attr) || '-'; };

                var callId = getVal('data-callid');
                var srno = getVal('data-srno');
                var callFull = callId;
                if (srno && srno !== '-') {
                    callFull += ' • #' + srno;
                }

                var dest = getVal('data-dest');
                var city = getVal('data-city');
                var destCity = dest;
                if (city && city !== '-') {
                    destCity += (dest !== '-' ? ' • ' : '') + city;
                }

                var leadCode = getVal('data-leadcode');

                document.getElementById('lblModalCustomerName').innerText = getVal('data-name');
                document.getElementById('lblModalLeadCode').innerText = leadCode !== '-' ? ('#' + leadCode) : '-';
                document.getElementById('lblModalCallId').innerText = callFull;
                document.getElementById('lblModalMobile').innerText = getVal('data-mobile');
                document.getElementById('lblModalAltMobile').innerText = getVal('data-altmobile');
                document.getElementById('lblModalDestCity').innerText = destCity;
                document.getElementById('lblModalTravelDate').innerText = getVal('data-traveldate');
                document.getElementById('lblModalCallDate').innerText = getVal('data-calldate');
                document.getElementById('lblModalCalledBy').innerText = getVal('data-calledby') + (getVal('data-callerrole') !== '-' ? ' (' + getVal('data-callerrole') + ')' : '');
                document.getElementById('lblModalOutcome').innerText = getVal('data-outcome');
                document.getElementById('lblModalNextFollowup').innerText = getVal('data-nextfollowup');
                document.getElementById('lblModalPriority').innerText = getVal('data-priority');
                document.getElementById('lblModalStatus').innerText = getVal('data-status');
                document.getElementById('lblModalRemarks').innerText = getVal('data-remarks');

                var lnk = document.getElementById('lnkModalViewLead');
                if (lnk) {
                    lnk.href = 'LeadDetails.aspx?id=' + encodeURIComponent(leadCode);
                }

                var modalEl = document.getElementById('modalCallDetails');
                if (modalEl && typeof bootstrap !== 'undefined') {
                    var modal = bootstrap.Modal.getOrCreateInstance(modalEl);
                    modal.show();
                }
            }

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
