<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AllLeads.aspx.cs"
    Inherits="AllLeads" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>All Leads | New Journey Holidays CRM</title>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Page Header -->
        <div class="nj-page-header">
            <div>
                <h2 class="nj-page-title">All Travel Leads</h2>
                <p class="nj-page-subtitle">Central lead repository with attribution, ownership tracking and
                    assignments.</p>
            </div>
            <div class="d-flex align-items-center gap-2">
                <a href="AddLead.aspx" class="btn btn-nj-primary btn-sm">
                    <i class="bi bi-plus-circle"></i>Add New Lead
                </a>
                <a href="AssignLeads.aspx" class="btn btn-nj-outline btn-sm">
                    <i class="bi bi-arrow-left-right"></i>Bulk Assign
                </a>
                <button type="button" class="btn btn-nj-outline btn-sm"
                    onclick="alert('Exporting filtered leads to CSV (sample)...');">
                    <i class="bi bi-file-earmark-spreadsheet"></i>Export

                </button>
            </div>
        </div>


        <!-- Filters & Search Bar Card -->
        <div class="card mb-3">
            <div class="card-body p-3">
                <div class="row g-2 align-items-center">
                    <!-- Search input -->
                    <div class="col-12 col-md-3">
                        <div class="input-group input-group-sm">
                            <span class="input-group-text bg-white border-end-0"><i
                                    class="bi bi-search text-muted"></i></span>
                            <input type="text" id="leadSearch" class="form-control border-start-0"
                                placeholder="Search client, mobile, city..." />
                        </div>
                    </div>

                    <!-- Status Filter -->
                    <div class="col-6 col-md-2">
                        <select id="filterStatus" class="form-select form-select-sm">
                            <option value="">All Statuses</option>
                            <option value="New">New</option>
                            <option value="Interested">Interested</option>
                            <option value="Pending">Pending</option>
                            <option value="Confirmed">Confirmed</option>
                            <option value="Not Interested">Not Interested</option>
                            <option value="Closed">Closed</option>
                        </select>
                    </div>

                    <!-- Priority Filter -->
                    <div class="col-6 col-md-2">
                        <select id="filterPriority" class="form-select form-select-sm">
                            <option value="">All Priorities</option>
                            <option value="Hot">Hot (High)</option>
                            <option value="Warm">Warm (Medium)</option>
                            <option value="Cold">Cold (Low)</option>
                        </select>
                    </div>

                    <!-- Lead Source Filter -->
                    <div class="col-6 col-md-2">
                        <select id="filterSource" class="form-select form-select-sm">
                            <option value="">All Lead Sources</option>
                            <option value="Google / Internet">Google / Internet</option>
                            <option value="Field Visit">Field Visit</option>
                            <option value="Sales">Sales</option>
                            <option value="Admin Entry">Admin Entry</option>
                            <option value="Referral">Referral</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <!-- Employee Filter -->
                    <div class="col-6 col-md-2">
                        <select id="filterEmployee" class="form-select form-select-sm">
                            <option value="">All Staff</option>
                            <option value="Priya Sharma">Priya Sharma (Sales)</option>
                            <option value="Rakesh Yadav">Rakesh Yadav (Field)</option>
                            <option value="Pooja Srivastava">Pooja Srivastava (Calling)</option>
                            <option value="Manoj Tiwari">Manoj Tiwari (Sales)</option>
                        </select>
                    </div>

                    <!-- Reset Filter Button -->
                    <div class="col-12 col-md-1 text-md-end">
                        <button type="button" class="btn btn-outline-secondary btn-sm w-100"
                            onclick="document.getElementById('leadSearch').value=''; document.querySelectorAll('select').forEach(s => s.selectedIndex = 0);"
                            title="Reset Filters">
                            <i class="bi bi-arrow-counterclockwise"></i>Reset

                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Leads Table Card -->
        <div class="card">
            <div class="card-header">
                <div>
                    <h6 class="mb-0"><i class="bi bi-table"></i>Leads Directory</h6>
                    <small class="text-muted">Showing 10 of 300 active travel inquiries</small>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <span class="badge bg-success-subtle text-success">Page 1 of 30</span>
                </div>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead>
                            <tr>
                                <th>Lead ID</th>
                                <th>Client Name</th>
                                <th>Mobile</th>
                                <th>City / Destination</th>
                                <%--<th>Lead Source</th>--%>
                                    <th>Created By</th>
                                    <th>Assigned Employee</th>
                                    <th>Status</th>
                                    <th>Priority</th>
                                    <th>Next Follow-up</th>
                                    <th class="text-end">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptAllLeads" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <span class="fw-bold text-success">#<%# Eval("lead_code") %></span>
                                        </td>

                                        <td>
                                            <div class="fw-semibold text-dark">
                                                <%# Eval("client_name") %>
                                            </div>
                                        </td>

                                        <td>
                                            <a href='tel:+91<%# Eval("mobile") %>'
                                                class="text-decoration-none text-dark">
                                                <i class="bi bi-telephone text-muted me-1 small"></i>
                                                <%# Eval("mobile") %>
                                            </a>
                                        </td>

                                        <td>
                                            <div>
                                                <%# Eval("city") %>
                                            </div>
                                            <small class="text-muted">
                                                <%# Eval("destination") %>
                                            </small>
                                        </td>

                                        <%--<td>
                                            <span class="badge bg-light text-dark border">
                                                <%# ((System.Data.DataRowView)Container.DataItem).Row.Table.Columns.Contains("lead_source")
                                                    ? Eval("lead_source") : "Direct" %>
                                            </span>
                                            </td>--%>

                                            <td>
                                                <%# Eval("created_by") %>
                                            </td>

                                            <td>
                                                <span class="badge bg-primary-subtle text-primary">
                                                    <%# Eval("assigned_employee_id")==DBNull.Value ||
                                                        string.IsNullOrEmpty(Eval("assigned_employee_id").ToString())
                                                        ? "Not Assigned" : Eval("assigned_employee_id") %>
                                                </span>
                                            </td>

                                            <td>
                                                <span
                                                    class='badge <%# Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "confirmed" ? "bg-success-subtle text-success" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "interested" ? "bg-info-subtle text-info" : "bg-warning-subtle text-warning") %>'>
                                                    <%# Eval("lead_status") %>
                                                </span>
                                            </td>

                                            <td>
                                                <span
                                                    class='badge <%# Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "hot" ? "badge-priority-hot" : (Eval("lead_priority") != null && Eval("lead_priority").ToString().ToLower() == "warm" ? "badge-priority-warm" : "badge-priority-cold") %>'>
                                                    <%# Eval("lead_priority") %>
                                                </span>
                                            </td>

                                            <td>
                                                <small class="text-muted">
                                                    <%# Eval("followup_date")==DBNull.Value ||
                                                        Eval("followup_date")==null ? "-" : Eval("followup_date") %>
                                                </small>
                                            </td>

                                            <td class="text-end">
                                                <button type="button" class="btn btn-nj-outline btn-sm"
                                                    data-bs-toggle="modal" data-bs-target="#leadViewModal"
                                                    title="View Details" onclick="showLeadDetails(
                        '<%# Eval(" lead_id") %>',
                                                    '<%# Eval("client_name") %>',
                                                        '<%# Eval("mobile") %>',
                                                            '<%# Eval("city") %>',
                                                                '<%# Eval("destination") %>',
                                                                    '<%# Eval("created_by") %>',
                                                                        '<%# Eval("assigned_employee_id") %>',
                                                                            '<%# Eval("lead_status") %>',
                                                                                '<%# Eval("lead_priority") %>',
                                                                                    '<%# Eval("remarks") %>'
                                                                                        );">
                                                                                        <i class="bi bi-eye"></i>
                                                </button>

                                                <asp:LinkButton ID="btnEditLead" runat="server"
                                                    CssClass="btn btn-nj-outline btn-sm"
                                                    CommandArgument='<%# Eval("lead_code") %>'
                                                    OnClick="btnEditLead_Click" CausesValidation="false"
                                                    title="Edit Lead">
                                                    <i class="bi bi-pencil"></i>
                                                </asp:LinkButton>
                                            </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Pagination UI -->
            <div
                class="card-footer bg-white border-top p-3 d-flex flex-wrap align-items-center justify-content-between gap-2">
                <div class="small text-muted">
                    Showing <span class="fw-semibold text-dark">1</span> to <span
                        class="fw-semibold text-dark">10</span> of <span class="fw-semibold text-dark">300</span>
                    entries

                </div>
                <nav aria-label="Page navigation">
                    <ul class="pagination pagination-sm mb-0">
                        <li class="page-item disabled"><a class="page-link" href="#"><i
                                    class="bi bi-chevron-left"></i>Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                        <li class="page-item"><a class="page-link" href="#">30</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next <i class="bi bi-chevron-right"></i></a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <!-- Lead View Modal -->
        <div class="modal fade" id="leadViewModal" tabindex="-1" aria-labelledby="leadViewModalTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom">
                        <h6 class="modal-title fw-bold" id="leadViewModalTitle">
                            <i class="bi bi-info-circle text-success me-1"></i>Lead Information Details
                        </h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="d-flex justify-content-between align-items-center mb-3 p-3 bg-light rounded">
                            <div>
                                <span class="badge bg-secondary mb-1" id="v-id">#NJ-10301</span>
                                <h5 class="mb-0 fw-bold" id="v-name">Rohit Verma</h5>
                                <small class="text-muted" id="v-phone">+91 98765 43210</small>
                            </div>
                            <div class="text-end">
                                <div id="v-priority-badge" class="mb-1"><span
                                        class="badge badge-priority-hot">Hot</span></div>
                                <div id="v-status-badge"><span class="badge badge-status-interested">Interested</span>
                                </div>
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <div class="p-2 border rounded">
                                    <span class="text-muted small d-block">Location</span>
                                    <span class="fw-semibold small" id="v-location">Gorakhpur</span>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="p-2 border rounded">
                                    <span class="text-muted small d-block">Tour Destination</span>
                                    <span class="fw-semibold small" id="v-destination">Kashmir 5N/6D</span>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="p-2 border rounded">
                                    <span class="text-muted small d-block">Lead Source</span>
                                    <span class="fw-semibold small" id="v-source">Google / Internet</span>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="p-2 border rounded">
                                    <span class="text-muted small d-block">Added By</span>
                                    <span class="fw-semibold small" id="v-addedby">Admin Entry</span>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="p-2 border rounded bg-success-subtle border-success-subtle">
                                    <span class="text-success small d-block fw-semibold">Lead Owner (Credit)</span>
                                    <span class="fw-bold small text-success" id="v-owner">Rakesh Yadav</span>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="p-2 border rounded">
                                    <span class="text-muted small d-block">Assigned For Follow-up</span>
                                    <span class="fw-semibold small text-primary" id="v-assigned">Priya Sharma</span>
                                </div>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label text-muted small mb-1">Remarks & Requirements</label>
                            <div class="p-2 bg-light border rounded small" id="v-remarks">
                                Client asked for 4-star houseboats in Srinagar and Sonmarg day tour.

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer border-top">
                        <button type="button" class="btn btn-sm btn-outline-secondary"
                            data-bs-dismiss="modal">Close</button>
                        <a href="FollowUps.aspx" class="btn btn-sm btn-nj-primary"><i
                                class="bi bi-calendar-event me-1"></i>View Follow-up</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Lead Quick Edit Modal -->
        <div class="modal fade" id="leadEditModal" tabindex="-1" aria-labelledby="leadEditModalTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header border-bottom py-2">
                        <h6 class="modal-title fw-bold" id="leadEditModalTitle">
                            <i class="bi bi-pencil-square text-success me-1"></i>Edit Lead Quick Info
                        </h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <asp:HiddenField ID="hfEditLeadCode" runat="server" />

                        <div class="row g-2 mb-3">
                            <div class="col-12 col-md-6">
                                <label class="form-label small fw-semibold">Client Name <span
                                        class="text-danger">*</span></label>
                                <asp:TextBox ID="txtEditClientName" runat="server"
                                    CssClass="form-control form-control-sm" placeholder="Client Full Name" />
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label small fw-semibold">Mobile <span
                                        class="text-danger">*</span></label>
                                <asp:TextBox ID="txtEditMobile" runat="server" CssClass="form-control form-control-sm"
                                    placeholder="10-digit Mobile Number" />
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-12 col-md-6">
                                <label class="form-label small fw-semibold">Alternate Mobile</label>
                                <asp:TextBox ID="txtEditAltMobile" runat="server"
                                    CssClass="form-control form-control-sm" placeholder="Alternate Mobile (Optional)" />
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label small fw-semibold">City / Location</label>
                                <asp:TextBox ID="txtEditCity" runat="server" CssClass="form-control form-control-sm"
                                    placeholder="e.g. Gorakhpur" />
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-12 col-md-6">
                                <label class="form-label small fw-semibold">Destination</label>
                                <asp:TextBox ID="txtEditDestination" runat="server"
                                    CssClass="form-control form-control-sm" placeholder="e.g. Kashmir, Dubai, Goa..." />
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label small fw-semibold">Travel Date</label>
                                <asp:TextBox ID="txtEditTravelDate" runat="server" TextMode="Date"
                                    CssClass="form-control form-control-sm" />
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-12 col-md-6">
                                <label class="form-label small fw-semibold">Lead Status <span
                                        class="text-danger">*</span></label>
                                <asp:DropDownList ID="ddlEditLeadStatus" runat="server"
                                    CssClass="form-select form-select-sm">
                                    <asp:ListItem Text="-- Select Status --" Value="" />
                                    <asp:ListItem Text="New" Value="New" />
                                    <asp:ListItem Text="Interested" Value="Interested" />
                                    <asp:ListItem Text="Pending" Value="Pending" />
                                    <asp:ListItem Text="Confirmed" Value="Confirmed" />
                                    <asp:ListItem Text="Not Interested" Value="Not Interested" />
                                    <asp:ListItem Text="Closed" Value="Closed" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label small fw-semibold">Priority <span
                                        class="text-danger">*</span></label>
                                <asp:DropDownList ID="ddlEditLeadPriority" runat="server"
                                    CssClass="form-select form-select-sm">
                                    <asp:ListItem Text="-- Select Priority --" Value="" />
                                    <asp:ListItem Text="Hot" Value="Hot" />
                                    <asp:ListItem Text="Warm" Value="Warm" />
                                    <asp:ListItem Text="Cold" Value="Cold" />
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-12 col-md-6">
                                <label class="form-label small fw-semibold">Next Follow-up Date & Time</label>
                                <asp:TextBox ID="txtEditFollowUp" runat="server" TextMode="DateTimeLocal"
                                    CssClass="form-control form-control-sm" />
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label small fw-semibold">Assigned Employee</label>
                                <asp:DropDownList ID="ddlEditAssignedEmployee" runat="server"
                                    CssClass="form-select form-select-sm">
                                    <asp:ListItem Text="-- Unassigned --" Value="" />
                                    <asp:ListItem Text="Priya Sharma (Sales)" Value="Priya Sharma" />
                                    <asp:ListItem Text="Rakesh Yadav (Field)" Value="Rakesh Yadav" />
                                    <asp:ListItem Text="Pooja Srivastava (Calling)" Value="Pooja Srivastava" />
                                    <asp:ListItem Text="Manoj Tiwari (Sales)" Value="Manoj Tiwari" />
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label small fw-semibold">Remarks</label>
                            <asp:TextBox ID="txtEditRemarks" runat="server" TextMode="MultiLine" Rows="3"
                                CssClass="form-control form-control-sm"
                                placeholder="Enter conversation details, client requirements, notes..." />
                        </div>
                    </div>
                    <div class="modal-footer border-top py-2">
                        <button type="button" class="btn btn-outline-secondary btn-sm"
                            data-bs-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnSaveLeadEdit" runat="server" Text="Save Changes"
                            CssClass="btn btn-nj-primary btn-sm" OnClick="btnSaveLeadEdit_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Script to populate lead details modal -->
        <script>
            function showLeadDetails(id, name, phone, loc, dest, source, addedby, owner, assigned, status, priority, remarks) {
                document.getElementById('v-id').textContent = '#' + id;
                document.getElementById('v-name').textContent = name;
                document.getElementById('v-phone').textContent = phone;
                document.getElementById('v-location').textContent = loc;
                document.getElementById('v-destination').textContent = dest;
                document.getElementById('v-source').textContent = source;
                document.getElementById('v-addedby').textContent = addedby;
                document.getElementById('v-owner').textContent = owner;
                document.getElementById('v-assigned').textContent = assigned;
                document.getElementById('v-remarks').textContent = remarks;

                // Badges
                var pBadge = document.getElementById('v-priority-badge');
                pBadge.innerHTML = '<span class="badge badge-priority-' + priority.toLowerCase() + '">' + priority + '</span>';

                var sClass = 'badge-status-' + status.toLowerCase().replace(/\s+/g, '');
                var sBadge = document.getElementById('v-status-badge');
                sBadge.innerHTML = '<span class="badge ' + sClass + '">' + status + '</span>';
            }
        </script>
    </asp:Content>