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
            <a href="AllLeads.aspx" class="btn btn-nj-primary btn-sm">
                <i class="bi bi-person-lines-fill"></i> All Leads
            </a>
            <a href="CallHistory.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-clock-history"></i> Call Log
            </a>
        </div>
    </div>

    <!-- 1. Follow-up Section Tabs -->
    <ul class="nav nav-pills mb-3 gap-2" id="followupSectionTabs" role="tablist">
        <!-- Today's Follow-ups -->
        <li class="nav-item" role="presentation">
            <button class='nav-link d-flex align-items-center gap-2 border <%= IsTodayTab ? "active" : "" %>'
                id="tab-btn-today" type="button"
                onclick="loadFollowups('today', this)">
                <i class="bi bi-calendar-check-fill text-success"></i>
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

    <!-- 2. Search & Filter Bar -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" class="form-control border-start-0" id="followUpSearch" placeholder="Search client name, mobile, destination, staff..." onkeyup="filterFollowUps();" />
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
                        <i class="bi bi-arrow-counterclockwise"></i> Reset
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- 3. Follow-ups Table Card -->
    <div class="card" id="section-followups">
        <div class="card-header bg-white d-flex justify-content-between align-items-center">
            <div>
                <h6 class="mb-0"><asp:Literal ID="litFollowupHeading" runat="server" Text="Today's Follow-ups" /></h6>
                <small class="text-muted"><asp:Literal ID="litFollowupSubHeading" runat="server" Text="High priority client calls scheduled for today" /></small>
            </div>
            <span class="badge bg-danger-subtle text-danger"><asp:Literal ID="litFollowupBadge" runat="server" Text="Pending Calls" /></span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>Client Name & Mobile</th>
                            <th>Destination</th>
                            <th>Assigned Staff</th>
                            <th>Follow-up Date & Time</th>
                            <th>Last Remarks</th>
                            <th>Priority</th>
                            <th>Status</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptFollowups" runat="server">
                            <ItemTemplate>
                                <tr class="fup-row" data-priority='<%# Eval("lead_priority") %>'>
                                    <!-- 1. Client Name & Mobile -->
                                    <td>
                                        <div class="fw-bold text-dark"><%# Eval("client_name") %></div>
                                        <small class="text-muted">
                                            <a href='tel:+91<%# Eval("mobile") %>' class="text-decoration-none text-dark">
                                                <i class="bi bi-telephone text-muted me-1"></i><%# Eval("mobile") %>
                                            </a>
                                            <%# Eval("alternate_mobile") != DBNull.Value && !string.IsNullOrWhiteSpace(Eval("alternate_mobile").ToString()) ? " | " + Eval("alternate_mobile") : "" %>
                                        </small>
                                    </td>

                                    <!-- 2. Destination -->
                                    <td>
                                        <div class="fw-semibold text-dark"><%# Eval("destination") %></div>
                                    </td>

                                    <!-- 3. Assigned Staff -->
                                    <td>
                                        <span class="badge bg-primary-subtle text-primary border border-primary-subtle">
                                            <i class="bi bi-person me-1"></i><%# Eval("assigned_employee_name") %>
                                        </span>
                                    </td>

                                    <!-- 4. Follow-up Date & Time -->
                                    <td>
                                        <span class="fw-bold text-danger">
                                            <i class="bi bi-clock me-1"></i><%# Eval("followup_date") == DBNull.Value || Eval("followup_date") == null ? "-" : Eval("followup_date", "{0:dd-MMM-yyyy hh:mm tt}") %>
                                        </span>
                                    </td>

                                    <!-- 5. Remarks -->
                                    <td>
                                        <span class="text-muted small d-inline-block text-truncate" style="max-width: 200px;">
                                            <%# Eval("remarks") == DBNull.Value || string.IsNullOrWhiteSpace(Eval("remarks").ToString()) ? "<em class='text-muted'>No remarks recorded.</em>" : Eval("remarks") %>
                                        </span>
                                    </td>

                                    <!-- 6. Priority -->
                                    <td>
                                        <span class='badge <%# Eval("lead_priority").ToString() == "Hot" ? "bg-danger" : (Eval("lead_priority").ToString() == "Warm" ? "bg-warning text-dark" : "bg-info") %>'>
                                            <%# Eval("lead_priority") %>
                                        </span>
                                    </td>

                                    <!-- 7. Status -->
                                    <td>
                                        <span class='badge <%# Eval("lead_status").ToString() == "Confirmed" ? "bg-success" : (Eval("lead_status").ToString() == "Not Interested" ? "bg-secondary" : "bg-primary") %>'>
                                            <%# Eval("lead_status").ToString() == "Not Interested" ? "Cancelled" : (Eval("lead_status").ToString() == "Pending" || Eval("lead_status").ToString() == "Interested" || Eval("lead_status").ToString() == "New" ? "In Process" : Eval("lead_status")) %>
                                        </span>
                                    </td>

                                    <!-- 8. Actions -->
                                    <td class="text-end">
                                        <% if (IsTodayTab) { %>
                                            <asp:LinkButton ID="btnUpdateCall" runat="server"
                                                CssClass="btn btn-nj-primary btn-sm"
                                                CommandArgument='<%# Eval("lead_code") %>'
                                                OnClick="btnUpdateCall_Click">
                                                <i class="bi bi-telephone"></i> Call
                                            </asp:LinkButton>
                                        <% } %>
                                        <a href='AllLeads.aspx?search=<%# Eval("lead_code") %>' class="btn btn-nj-outline btn-sm" title="View Lead">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                        <!-- Empty State Row -->
                        <tr class="fup-empty-row <%= rptFollowups.Items.Count == 0 ? "" : "d-none" %>">
                            <td colspan="8" class="text-center py-4 text-muted">
                                <i class="bi bi-calendar-check fs-2 d-block mb-2 text-secondary"></i>
                                No follow-ups found in this list.
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 4. Update Call Modal -->
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
                            <asp:Label ID="lblModalClientName" runat="server" Text="Client" CssClass="fw-semibold small d-block" />
                            <asp:Label ID="lblModalClientPhone" runat="server" Text="+91" CssClass="text-muted small" />
                        </div>
                        <span class="badge bg-success-subtle text-success">Follow-up</span>
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">
                            Call Status <span class="text-danger">*</span>
                        </label>
                        <asp:DropDownList ID="ddlCallStatus" runat="server" CssClass="form-select form-select-sm">
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
                        <asp:DropDownList ID="ddlTripStatus" runat="server" CssClass="form-select form-select-sm">
                            <asp:ListItem Text="In Process (Follow-up)" Value="" />
                            <asp:ListItem Text="Trip Confirmed" Value="Confirmed" />
                            <asp:ListItem Text="Cancelled" Value="Not Interested" />
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Next Follow-up Date & Time</label>
                        <asp:TextBox ID="txtNextFollowUp" runat="server" TextMode="DateTimeLocal" CssClass="form-control form-control-sm" />
                    </div>

                    <div class="mb-2">
                        <label class="form-label small fw-semibold">Call Remarks</label>
                        <asp:TextBox ID="txtCallRemarks" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control form-control-sm" placeholder="Enter conversation details, client response, notes..." />
                    </div>
                </div>

                <div class="modal-footer border-top py-2">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnSaveCallUpdate" runat="server" Text="Save" CssClass="btn btn-nj-primary btn-sm" ValidationGroup="CallUpdate" OnClick="btnSaveCallUpdate_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Client-side Search, Filter & Tabs Scripts -->
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

            var container = document.getElementById('section-followups');
            if (!container) return;

            var rows = container.querySelectorAll('.fup-row');
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

            var emptyRow = container.querySelector('.fup-empty-row');
            if (emptyRow) {
                if (visibleCount === 0) {
                    emptyRow.classList.remove('d-none');
                } else {
                    emptyRow.classList.add('d-none');
                }
            }
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
