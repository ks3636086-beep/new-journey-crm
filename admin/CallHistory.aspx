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
         
    </div>

    <!-- Search & Filter Card -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">

                <!-- Search Calls -->
                <%-- sakshi - Search Calls Filter --%>
                <div class="col-12 col-md-4">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0">
                            <i class="bi bi-search text-muted"></i>
                        </span>

                        <asp:TextBox
                            ID="txtSearchCalls"
                            runat="server"
                            CssClass="form-control border-start-0"
                            placeholder="Search client name, phone or remarks..."
                            AutoPostBack="true"
                            OnTextChanged="txtSearchCalls_TextChanged" />
                    </div>
                </div>

                <%-- sakshi - Call Outcome Filter --%>
                <div class="col-6 col-md-3">
                    <asp:DropDownList
                        ID="ddlOutcomeFilter"
                        runat="server"
                        CssClass="form-select form-select-sm"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlOutcomeFilter_SelectedIndexChanged">

                        <asp:ListItem Text="All Call Outcomes" Value="" />
                        <asp:ListItem Text="Connected" Value="Connected" />
                        <asp:ListItem Text="Interested" Value="Interested" />
                        <asp:ListItem Text="Call Back Later" Value="Call Back Later" />
                        <asp:ListItem Text="Busy" Value="Busy" />
                        <asp:ListItem Text="No Answer" Value="No Answer" />
                        <asp:ListItem Text="Not Interested" Value="Not Interested" />

                    </asp:DropDownList>
                </div>

                <%-- sakshi - Staff Filter --%>
                <div class="col-6 col-md-3">
                    <asp:DropDownList
                        ID="ddlStaffFilter"
                        runat="server"
                        CssClass="form-select form-select-sm"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlStaffFilter_SelectedIndexChanged">

                        <asp:ListItem Text="All Staff" Value="" />

                    </asp:DropDownList>
                </div>

                <%-- sakshi - Reset Button --%>
                <div class="col-12 col-md-2 text-md-end">
                    <asp:Button
                        ID="btnResetCallFilters"
                        runat="server"
                        Text="Reset"
                        CssClass="btn btn-outline-secondary btn-sm w-100"
                        OnClick="btnResetCallFilters_Click" />
                </div>

            </div>
        </div>
    </div>

    <!-- Call Activity Table Card -->
    <div class="card">
        <div class="card-header bg-white d-flex justify-content-between align-items-center">
            <div>
                <h6 class="mb-0"><i class="bi bi-telephone-outbound text-primary"></i>Communication Log Records</h6>
                <small class="text-muted">History of interactions covering all standard call classification outcomes</small>
            </div>
            <span class="badge bg-light text-dark border"><i class="bi bi-clock-history me-1"></i>Interaction Log</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0" id="tableCallHistory">
                    <thead>
                        <tr>
                            <th>Client Name</th>
                            <th>Contact</th>
                            <th>Called By</th>
                            <th>Call Date & Time</th>
                            <th>Call Outcome</th>
                            <th>Next Follow-up</th>
                            <th>Priority / Status</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptCallHistory" runat="server">
                            <ItemTemplate>
                                <tr class="call-entry-row" data-outcome='<%# Eval("call_status") %>' data-staff='<%# Eval("called_by") %>' data-date='<%# Eval("call_date") %>'>
                                    <!-- 1. Client Name -->
                                    <td>
                                        <div class="fw-bold text-dark"><%# Eval("client_name") %></div>
                                        <%# Eval("city") != null && Eval("city") != DBNull.Value && Eval("city").ToString() != "" ? "<small class=\"text-muted\"><i class=\"bi bi-geo-alt me-1\"></i>" + Eval("city") + "</small>" : "" %>
                                    </td>

                                    <!-- 2. Contact -->
                                    <td>
                                        <a href='tel:+91<%# Eval("mobile") %>' class="text-decoration-none text-dark fw-semibold">
                                            <i class="bi bi-telephone text-muted me-1"></i><%# Eval("mobile") %>
                                        </a>
                                    </td>

                                    <!-- 3. Called By -->
                                    <td>
                                        <div class="fw-semibold text-dark">
                                            <i class="bi bi-person me-1"></i><%# Eval("called_by") != null && Eval("called_by") != DBNull.Value ? Eval("called_by") : "-" %>
                                        </div>
                                        <%# Eval("assigned_employee_id") != null && Eval("assigned_employee_id") != DBNull.Value && Eval("assigned_employee_id").ToString() != "" ? "<small class=\"text-muted\" style=\"font-size:0.68rem;\">Emp #" + Eval("assigned_employee_id") + "</small>" : "" %>
                                    </td>

                                    <!-- 4. Call Date & Time -->
                                    <td>
                                        <div class="fw-semibold text-dark">
                                            <i class="bi bi-calendar-event me-1 text-muted"></i><%# Eval("call_date") == DBNull.Value || Eval("call_date") == null ? "-" : Eval("call_date") %>
                                        </div>
                                    </td>

                                    <!-- 5. Call Outcome -->
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

                                    <!-- 6. Next Follow-up -->
                                    <td>
                                        <span class="fw-bold text-danger">
                                            <i class="bi bi-clock me-1"></i><%# Eval("next_followup_date") == DBNull.Value || Eval("next_followup_date") == null ? "-" : Eval("next_followup_date") %>
                                        </span>
                                    </td>

                                    <!-- 7. Priority & Lead Status -->
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

                                    <!-- 8. Actions (ASP Button to Open Modal via JS) -->
                                    <td class="text-end">
                                        <asp:LinkButton ID="btnViewCall" runat="server"
                                            CssClass="btn btn-nj-outline btn-sm text-nowrap"
                                            title="View Call Details"
                                            data-callid='<%# Eval("call_id") %>'
                                            data-leadcode='<%# Eval("lead_code") %>'
                                            data-altmob='<%# Eval("alternate_mobile") %>'
                                            data-travel='<%# Eval("travel_date") %>'
                                            data-dest='<%# Eval("destination") %>'
                                            data-role='<%# Eval("caller_role") %>'
                                            data-remarks='<%# Eval("remarks") %>'
                                            OnClientClick="openCallDetailModal(this); return false;">
                                            <i class="bi bi-eye me-1"></i>View
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                        <%-- sakshi - Empty State Row when no records match filter --%>
                        <tr id="trNoRecords" runat="server" visible="false">
                            <td colspan="8" class="text-center py-4 text-muted">
                                <i class="bi bi-inbox fs-2 d-block mb-2 text-muted"></i>
                                <div class="fw-semibold text-dark">No call history records found</div>
                                <small>No records match your search or filter.</small>
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

    <!-- Modal: View Call & Lead Details (ASP Controls) -->
    <div class="modal fade" id="modalCallDetail" tabindex="-1" aria-labelledby="modalCallDetailLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="modalCallDetailLabel">
                        <i class="bi bi-info-circle-fill text-primary me-2"></i>Call & Lead Information
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row g-3">
                        <!-- 1. Call ID -->
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold text-muted mb-1">Call ID</label>
                            <asp:TextBox ID="txtModalCallId" runat="server" ClientIDMode="Static" ReadOnly="true" CssClass="form-control form-control-sm bg-light" />
                        </div>

                        <!-- 2. Lead Code -->
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold text-muted mb-1">Lead Code</label>
                            <asp:TextBox ID="txtModalLeadCode" runat="server" ClientIDMode="Static" ReadOnly="true" CssClass="form-control form-control-sm bg-light" />
                        </div>

                        <!-- 3. Alternate Mobile Number -->
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold text-muted mb-1">Alternate Mobile Number</label>
                            <asp:TextBox ID="txtModalAltMobile" runat="server" ClientIDMode="Static" ReadOnly="true" CssClass="form-control form-control-sm bg-light" />
                        </div>

                        <!-- 4. Travel Date -->
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold text-muted mb-1">Travel Date</label>
                            <asp:TextBox ID="txtModalTravelDate" runat="server" ClientIDMode="Static" ReadOnly="true" CssClass="form-control form-control-sm bg-light" />
                        </div>

                        <!-- 5. Destination (Tour Destination) -->
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold text-muted mb-1">Destination</label>
                            <asp:TextBox ID="txtModalDestination" runat="server" ClientIDMode="Static" ReadOnly="true" CssClass="form-control form-control-sm bg-light" />
                        </div>

                        <!-- 6. Designation / Role -->
                        <div class="col-12 col-md-6">
                            <label class="form-label small fw-semibold text-muted mb-1">Designation / Role</label>
                            <asp:TextBox ID="txtModalDesignation" runat="server" ClientIDMode="Static" ReadOnly="true" CssClass="form-control form-control-sm bg-light" />
                        </div>

                        <!-- 7. Remarks -->
                        <div class="col-12">
                            <label class="form-label small fw-semibold text-muted mb-1">Remarks & Discussion</label>
                            <asp:TextBox ID="txtModalRemarks" runat="server" TextMode="MultiLine" Rows="3" ClientIDMode="Static" ReadOnly="true" CssClass="form-control form-control-sm bg-light" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-top py-2">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Record New Call Modal -->
    <div class="modal fade" id="newCallModal" tabindex="-1" aria-labelledby="newCallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="newCallModalLabel">
                        <i class="bi bi-telephone-plus text-success me-1"></i>Record Client Call Entry
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

    <script>
        // sakshi - Open Modal with Call Details
        function openCallDetailModal(btn) {
            document.getElementById('txtModalCallId').value = btn.getAttribute('data-callid') || '-';
            document.getElementById('txtModalLeadCode').value = btn.getAttribute('data-leadcode') || '-';
            document.getElementById('txtModalAltMobile').value = btn.getAttribute('data-altmob') || '-';
            document.getElementById('txtModalTravelDate').value = btn.getAttribute('data-travel') || '-';
            document.getElementById('txtModalDestination').value = btn.getAttribute('data-dest') || '-';
            document.getElementById('txtModalDesignation').value = btn.getAttribute('data-role') || '-';
            document.getElementById('txtModalRemarks').value = btn.getAttribute('data-remarks') || '-';

            var modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('modalCallDetail'));
            modal.show();
        }
    </script>
</asp:Content>
