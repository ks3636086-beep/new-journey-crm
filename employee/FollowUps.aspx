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
            <a href="CallHistory.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-clock-history"></i>Call Log
            </a>
        </div>
    </div>

    <!-- 1. Three Follow-up Section Tabs -->
    <ul class="nav nav-pills mb-3 gap-2" id="followupSectionTabs" role="tablist">

        <!-- Today's Follow-ups -->
        <li class="nav-item" role="presentation">
            <button class='nav-link d-flex align-items-center gap-2 border <%= IsTodayTab ? "active" : "" %>'
                id="tab-btn-today" type="button"
                onclick="loadFollowups('today', this)">

                <i class="bi bi-calendar-check-fill text-primary"></i>
                <span>Today's Follow-ups</span>
            </button>
        </li>

        <!-- Upcoming Follow-ups -->
        <li class="nav-item" role="presentation">
            <button class='nav-link d-flex align-items-center gap-2 border <%= CurrentTab == "upcoming" ? "active" : "" %>'
                id="tab-btn-upcoming" type="button"
                onclick="loadFollowups('upcoming', this)">

                <i class="bi bi-calendar-range text-primary"></i>
                <span>Upcoming Follow-ups</span>
            </button>
        </li>

        <!-- Overdue Follow-ups -->
        <li class="nav-item" role="presentation">
            <button class='nav-link d-flex align-items-center gap-2 border text-danger <%= CurrentTab == "overdue" ? "active" : "" %>'
                id="tab-btn-overdue" type="button"
                onclick="loadFollowups('overdue', this)">

                <i class="bi bi-exclamation-triangle-fill"></i>
                <span>Overdue Follow-ups</span>
            </button>
        </li>

    </ul>


    <asp:HiddenField ID="hdnFollowupType" runat="server" Value="today" />

    <asp:Button ID="btnLoadFollowups" runat="server"
        OnClick="btnLoadFollowups_Click"
        Style="display: none;" />

    <!-- 2. Search & Priority Filter Toolbar (Works across all 3 tabs) -->
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
                        <option value="Hot">Hot Priority</option>
                        <option value="Warm">Warm Priority</option>
                        <option value="Cold">Cold Priority</option>
                    </select>
                </div>
                <div class="col-6 col-md-2 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="resetFollowUpFilters();">
                        <i class="bi bi-arrow-counterclockwise"></i>Reset
                   
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- 3. Tab Sections Content -->
    <div class="tab-content" id="followupSectionsContent">

        <!-- ========================================== -->
        <!-- Tab 1: Today's Follow-ups                  -->
        <!-- ========================================== -->
        <div class="tab-pane fade show active" id="section-today" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-0" id="followupHeading"><asp:Literal ID="litFollowupHeading" runat="server" Text="Today's Follow-ups" /></h6>
                        <small class="text-muted"><asp:Literal ID="litFollowupSubHeading" runat="server" Text="High priority client calls scheduled for today" /></small>
                    </div>
                    <span class="badge bg-danger-subtle text-danger"><asp:Literal ID="litFollowupBadge" runat="server" Text="Pending Calls" /></span>
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
                                <asp:Repeater ID="rptTodayFollowups" runat="server">
                                    <itemtemplate>
                                        <tr class="fup-row" data-priority='<%# Eval("lead_priority") %>'>
                                            <!-- 1. Customer Name & Mobile -->
                                            <td>
                                                <div class="fw-bold text-dark"><%# Eval("client_name") %></div>
                                                <small class="text-muted">
                                                    <a href='tel:+91<%# Eval("mobile") %>' class="text-decoration-none text-dark">
                                                        <i class="bi bi-telephone text-muted me-1"></i><%# Eval("mobile") %>
                                                    </a>
                                                </small>
                                            </td>

                                            <!-- 2. Destination -->
                                            <td>
                                                <div class="fw-semibold text-dark"><%# Eval("destination") %></div>
                                            </td>

                                            <!-- 3. Follow-up Date & Time (followup_date) -->
                                            <td>
                                                <span class="fw-bold text-danger">
                                                    <i class="bi bi-clock me-1"></i><%# Eval("followup_date") == DBNull.Value || Eval("followup_date") == null ? "-" : Eval("followup_date") %>
                                                </span>
                                            </td>

                                            <!-- 4. Last Call Remarks -->
                                            <td>
                                                <span class="text-truncate d-inline-block" style="max-width: 240px;" title='<%# Eval("remarks") %>'>
                                                    <%# Eval("remarks") == DBNull.Value || Eval("remarks") == null ? "-" : Eval("remarks") %>
                                                </span>
                                            </td>

                                            <!-- 5. Priority (Hot/Warm/Cold) -->
                                            <td>
                                                <span class='badge <%# Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "hot" ? "badge-priority-hot" : (Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "warm" ? "badge-priority-warm" : "badge-priority-cold") %>'>
                                                    <%# Eval("lead_priority") %>
                                                </span>
                                            </td>

                                            <!-- 6. Lead Status -->
                                            <td>
                                                <span class='badge <%# Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "confirmed" ? "bg-success-subtle text-success" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "interested" ? "badge-status-interested" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "new" ? "badge-status-new" : "badge-status-pending")) %>'>
                                                    <%# Eval("lead_status") %>
                                                </span>
                                            </td>

                                            <!-- 7. Actions: View Lead, Update Call (Change allowed only in Today) -->
                                            <td class="text-end">
                                                <div class="d-inline-flex gap-1 justify-content-end">
                                                    <a href='LeadDetails.aspx?id=<%# Eval("lead_code") %>' class="btn btn-nj-outline btn-sm text-nowrap" title="View Lead Details">
                                                        <i class="bi bi-eye me-1"></i>View Lead
                                                    </a>
                                                    <asp:PlaceHolder ID="phUpdateCall" runat="server" Visible='<%# IsTodayTab %>'>
                                                        <asp:LinkButton ID="btnUpdateCall" runat="server"
                                                            CssClass="btn btn-nj-primary btn-sm text-nowrap"
                                                            CommandArgument='<%# Eval("lead_code") %>'
                                                            OnClick="btnUpdateCall_Click"
                                                            CausesValidation="false"
                                                            title="Update Call Details">
                                                            <i class="bi bi-telephone-forward me-1"></i>Update Call
                                                        </asp:LinkButton>
                                                    </asp:PlaceHolder>
                                                </div>
                                            </td>
                                        </tr>
                                    </itemtemplate>
                                </asp:Repeater>

                                <!-- Empty State Row for Today's Follow-ups -->
                                <tr class="fup-empty-row d-none">
                                    <td colspan="7" class="text-center py-4 text-muted">
                                        <i class="bi bi-inbox fs-2 d-block mb-2 text-muted"></i>
                                        <div class="fw-semibold text-dark">No follow-ups found</div>
                                        <small>No scheduled calls match your current search or priority filter.</small>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- ========================================== -->
        <!-- Tab 2: Upcoming Follow-ups               -->
        <!-- ========================================== -->
        <%--<div class="tab-pane fade" id="section-upcoming" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-calendar-range-fill text-primary"></i> Upcoming Follow-ups</h6>
                        <small class="text-muted">Scheduled client reminders for tomorrow and next week</small>
                    </div>
                    <span class="badge bg-secondary">3 Scheduled</span>
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
                                <!-- Upcoming 1 -->
                                <tr class="fup-row" data-priority="Warm">
                                    <td>
                                        <div class="fw-bold text-dark">Alok Dubey</div>
                                        <small class="text-muted">
                                            <a href="tel:+919793112233" class="text-decoration-none text-dark">
                                                <i class="bi bi-telephone text-muted me-1"></i>+91 97931 12233
                                            </a> &bull; Gorakhpur
                                        </small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold text-dark">Singapore & Sentosa 5N</div>
                                        <small class="text-muted">Family (3 Pax)</small>
                                    </td>
                                    <td><span class="fw-bold text-dark"><i class="bi bi-calendar-event me-1"></i>Tomorrow, 11:00 AM</span></td>
                                    <td>
                                        <span class="text-truncate d-inline-block" style="max-width: 220px;" title="Requested flight quotation from Gorakhpur via Kolkata.">
                                            Requested flight quotation from Gorakhpur via Kolkata.
                                        </span>
                                    </td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td><span class="badge badge-status-interested">Interested</span></td>
                                    <td class="text-end">
                                        <div class="d-inline-flex gap-1 justify-content-end">
                                            <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm text-nowrap" title="View Lead Details">
                                                <i class="bi bi-eye me-1"></i>View Lead
                                            </a>
                                            <button type="button" class="btn btn-nj-primary btn-sm text-nowrap" onclick="openUpdateCallModal('Alok Dubey', '+91 97931 12233', 'Singapore');" title="Update Call Details">
                                                <i class="bi bi-telephone-forward me-1"></i>Update Call
                                            </button>
                                        </div>
                                    </td>
                                </tr>

                                <!-- Upcoming 2 -->
                                <tr class="fup-row" data-priority="Warm">
                                    <td>
                                        <div class="fw-bold text-dark">Amit Pandey</div>
                                        <small class="text-muted">
                                            <a href="tel:+918876511234" class="text-decoration-none text-dark">
                                                <i class="bi bi-telephone text-muted me-1"></i>+91 88765 11234
                                            </a> &bull; Basti
                                        </small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold text-dark">Goa Beach Villa 4N</div>
                                        <small class="text-muted">Couples Getaway</small>
                                    </td>
                                    <td><span class="fw-bold text-dark"><i class="bi bi-calendar-event me-1"></i>Tomorrow, 03:00 PM</span></td>
                                    <td>
                                        <span class="text-truncate d-inline-block" style="max-width: 220px;" title="Will confirm travel dates after consulting with spouse.">
                                            Will confirm travel dates after consulting with spouse.
                                        </span>
                                    </td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td><span class="badge badge-status-pending">Pending Dates</span></td>
                                    <td class="text-end">
                                        <div class="d-inline-flex gap-1 justify-content-end">
                                            <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm text-nowrap" title="View Lead Details">
                                                <i class="bi bi-eye me-1"></i>View Lead
                                            </a>
                                            <button type="button" class="btn btn-nj-primary btn-sm text-nowrap" onclick="openUpdateCallModal('Amit Pandey', '+91 88765 11234', 'Goa');" title="Update Call Details">
                                                <i class="bi bi-telephone-forward me-1"></i>Update Call
                                            </button>
                                        </div>
                                    </td>
                                </tr>

                                <!-- Upcoming 3 -->
                                <tr class="fup-row" data-priority="Cold">
                                    <td>
                                        <div class="fw-bold text-dark">Neha Singhania</div>
                                        <small class="text-muted">
                                            <a href="tel:+919811233445" class="text-decoration-none text-dark">
                                                <i class="bi bi-telephone text-muted me-1"></i>+91 98112 33445
                                            </a> &bull; Lucknow
                                        </small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold text-dark">Kerala Backwaters 6N</div>
                                        <small class="text-muted">Premium Alleppey Houseboat</small>
                                    </td>
                                    <td><span class="fw-bold text-dark"><i class="bi bi-calendar-event me-1"></i>15 Nov, 02:00 PM</span></td>
                                    <td>
                                        <span class="text-truncate d-inline-block" style="max-width: 220px;" title="Requested houseboat upgrade and itinerary customization.">
                                            Requested houseboat upgrade and itinerary customization.
                                        </span>
                                    </td>
                                    <td><span class="badge badge-priority-cold">Cold</span></td>
                                    <td><span class="badge badge-status-new">In Negotiation</span></td>
                                    <td class="text-end">
                                        <div class="d-inline-flex gap-1 justify-content-end">
                                            <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm text-nowrap" title="View Lead Details">
                                                <i class="bi bi-eye me-1"></i>View Lead
                                            </a>
                                            <button type="button" class="btn btn-nj-primary btn-sm text-nowrap" onclick="openUpdateCallModal('Neha Singhania', '+91 98112 33445', 'Kerala');" title="Update Call Details">
                                                <i class="bi bi-telephone-forward me-1"></i>Update Call
                                            </button>
                                        </div>
                                    </td>
                                </tr>

                                <!-- Empty State Row for Upcoming Follow-ups -->
                                <tr class="fup-empty-row d-none">
                                    <td colspan="7" class="text-center py-4 text-muted">
                                        <i class="bi bi-inbox fs-2 d-block mb-2 text-muted"></i>
                                        <div class="fw-semibold text-dark">No follow-ups found</div>
                                        <small>No scheduled calls match your current search or priority filter.</small>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>--%>

        <!-- ========================================== -->
        <!-- Tab 3: Overdue Follow-ups                 -->
        <!-- ========================================== -->
        <%--<div class="tab-pane fade" id="section-overdue" role="tabpanel">
            <div class="card border-danger">
                <div class="card-header bg-danger-subtle text-danger d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-0 text-danger"><i class="bi bi-exclamation-octagon-fill"></i> Overdue Follow-ups</h6>
                        <small>Missed follow-up schedule. Contact customer immediately to prevent lead drop.</small>
                    </div>
                    <span class="badge bg-danger">1 Call Overdue</span>
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
                                <!-- Overdue 1 -->
                                <tr class="fup-row" data-priority="Hot">
                                    <td>
                                        <div class="fw-bold text-danger">Vikram Chauhan</div>
                                        <small class="text-muted">
                                            <a href="tel:+919798123456" class="text-decoration-none text-dark">
                                                <i class="bi bi-telephone text-muted me-1"></i>+91 97981 23456
                                            </a> &bull; Maharajganj
                                        </small>
                                    </td>
                                    <td>
                                        <div class="fw-semibold text-dark">Thailand 4N/5D Pattaya-BKK</div>
                                        <small class="text-muted">Family (4 Pax)</small>
                                    </td>
                                    <td><span class="fw-bold text-danger"><i class="bi bi-exclamation-circle me-1"></i>Yesterday, 04:00 PM</span></td>
                                    <td>
                                        <span class="text-truncate d-inline-block" style="max-width: 220px;" title="Rang out on first dial. Follow-up queued for immediate re-dial.">
                                            Rang out on first dial. Follow-up queued for immediate re-dial.
                                        </span>
                                    </td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td><span class="badge badge-status-new">Overdue</span></td>
                                    <td class="text-end">
                                        <div class="d-inline-flex gap-1 justify-content-end">
                                            <a href="LeadDetails.aspx" class="btn btn-nj-outline btn-sm text-nowrap" title="View Lead Details">
                                                <i class="bi bi-eye me-1"></i>View Lead
                                            </a>
                                            <button type="button" class="btn btn-danger btn-sm text-nowrap" onclick="openUpdateCallModal('Vikram Chauhan', '+91 97981 23456', 'Thailand');" title="Update Call Details">
                                                <i class="bi bi-telephone-forward me-1"></i>Update Call
                                            </button>
                                        </div>
                                    </td>
                                </tr>

                                <!-- Empty State Row for Overdue Follow-ups -->
                                <tr class="fup-empty-row d-none">
                                    <td colspan="7" class="text-center py-4 text-muted">
                                        <i class="bi bi-check-circle fs-2 d-block mb-2 text-success"></i>
                                        <div class="fw-semibold text-dark">No overdue follow-ups</div>
                                        <small>Great job! You have no pending overdue customer calls.</small>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>--%>

        <!-- Modal for Updating Call Details -->
        <div class="modal fade" id="updateCallModal" tabindex="-1" aria-labelledby="updateCallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-sm">
                <div class="modal-content">

                    <div class="modal-header border-bottom py-2">
                        <h6 class="modal-title fw-bold" id="updateCallModalLabel">
                            <i class="bi bi-telephone-forward text-success me-1"></i>Update Call
                        </h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">

                        <asp:HiddenField ID="hfLeadCode" runat="server" />

                        <div class="mb-3 p-2 bg-light rounded d-flex justify-content-between align-items-center">
                            <div>
                                <asp:Label ID="lblModalClientName" runat="server"
                                    Text="Client" CssClass="fw-semibold small d-block" />

                                <asp:Label ID="lblModalClientPhone" runat="server"
                                    Text="+91" CssClass="text-muted small" />
                            </div>
                            <span class="badge bg-primary-subtle text-primary">Follow-up</span>
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-semibold">
                                Call Status <span class="text-danger">*</span>
                            </label>

                            <asp:DropDownList ID="ddlCallStatus" runat="server"
                                CssClass="form-select form-select-sm">
                                <asp:ListItem Text="-- Select Status --" Value="" />
                                <asp:ListItem Text="Answered" Value="Answered" />
                                <asp:ListItem Text="Not Answered" Value="Not Answered" />
                                <asp:ListItem Text="Busy" Value="Busy" />
                                <asp:ListItem Text="Switched Off" Value="Switched Off" />
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="rfvCallStatus" runat="server"
                                ControlToValidate="ddlCallStatus"
                                InitialValue=""
                                ErrorMessage="Please select call status."
                                CssClass="text-danger small"
                                Display="Dynamic"
                                ValidationGroup="CallUpdate" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-semibold">Trip / Lead Status</label>
                            <asp:DropDownList ID="ddlTripStatus" runat="server"
                                CssClass="form-select form-select-sm">
                                <asp:ListItem Text="In Process (Follow-up)" Value="" />
                                <asp:ListItem Text="Trip Confirmed" Value="Confirmed" />
                                <asp:ListItem Text="Cancelled" Value="Not Interested" />
                            </asp:DropDownList>
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-semibold">Next Follow-up Date & Time</label>

                            <asp:TextBox ID="txtNextFollowUp" runat="server"
                                TextMode="DateTimeLocal"
                                CssClass="form-control form-control-sm" />
                        </div>

                        <div class="mb-2">
                            <label class="form-label small fw-semibold">Call Remarks</label>

                            <asp:TextBox ID="txtCallRemarks" runat="server"
                                TextMode="MultiLine"
                                Rows="3"
                                CssClass="form-control form-control-sm"
                                placeholder="Enter conversation details, client response, notes..." />
                        </div>

                    </div>

                    <div class="modal-footer border-top py-2">
                        <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">
                            Cancel
                        </button>

                        <asp:Button ID="btnSaveCallUpdate" runat="server"
                            Text="Save"
                            CssClass="btn btn-nj-primary btn-sm"
                            ValidationGroup="CallUpdate" 
                            OnClick="btnSaveCallUpdate_Click" />
                    </div>

                </div>
            </div>
        </div>

        <!-- Client-side Search, Filter & Modal Scripts -->
        <script>
            function loadFollowups(type, btn) {

                document.getElementById('<%= hdnFollowupType.ClientID %>').value = type;

    document.querySelectorAll('#followupSectionTabs .nav-link').forEach(function (tab) {
        tab.classList.remove('active');
    });

    btn.classList.add('active');

    document.getElementById('<%= btnLoadFollowups.ClientID %>').click();
            }




            function filterFollowUps() {
                var search = (document.getElementById('followUpSearch').value || '').toLowerCase().trim();
                var priority = (document.getElementById('followUpPriorityFilter').value || '').trim();

                var tabs = ['section-today', 'section-upcoming', 'section-overdue'];

                tabs.forEach(function (tabId) {
                    var tabEl = document.getElementById(tabId);
                    if (!tabEl) return;

                    var rows = tabEl.querySelectorAll('.fup-row');
                    var visibleCount = 0;

                    rows.forEach(function (row) {
                        var text = row.innerText.toLowerCase();
                        var rPriority = (row.getAttribute('data-priority') || '').trim();

                        var mSearch = search === '' || text.indexOf(search) > -1;
                        var mPriority = priority === '' || rPriority.toLowerCase() === priority.toLowerCase();

                        if (mSearch && mPriority) {
                            row.style.display = '';
                            visibleCount++;
                        } else {
                            row.style.display = 'none';
                        }
                    });

                    var emptyRow = tabEl.querySelector('.fup-empty-row');
                    if (emptyRow) {
                        if (visibleCount === 0) {
                            emptyRow.classList.remove('d-none');
                        } else {
                            emptyRow.classList.add('d-none');
                        }
                    }
                });
            }

            function resetFollowUpFilters() {
                var s = document.getElementById('followUpSearch');
                var p = document.getElementById('followUpPriorityFilter');
                if (s) s.value = '';
                if (p) p.selectedIndex = 0;
                filterFollowUps();
            }
    </script>
</asp:Content>
