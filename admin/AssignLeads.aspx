<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AssignLeads.aspx.cs"
    Inherits="AssignLeads" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Assign Leads | New Journey Holidays CRM</title>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Page Header -->
        <div class="nj-page-header">
            <div>
                <h2 class="nj-page-title">Assign Travel Leads</h2>
                <p class="nj-page-subtitle">Distribute inquiries to sales and telecalling executives for fast client
                    outreach.</p>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="badge bg-light text-dark border p-2">
                    <i class="bi bi-person-lines-fill text-success me-1"></i>Unassigned Queue: <strong>48 Leads</strong>
                </span>
            </div>
        </div>

        <!-- Bulk Assignment Action Bar Card -->
        <div class="card mb-3 border-success border-opacity-25 bg-white shadow-sm">
            <div class="card-body p-3">
                <asp:HiddenField ID="hfSelectedLeadCodes" runat="server" />
                <div class="row g-2 align-items-center">
                    <!-- Selection counter -->
                    <div class="col-12 col-md-4 col-lg-3">
                        <div class="d-flex align-items-center gap-2">
                            <span class="badge bg-success fs-6" id="selectedCountBadge">0</span>
                            <div>
                                <div class="fw-bold small text-dark text-nowrap">Leads Selected</div>
                                <div class="text-muted text-nowrap" style="font-size: 0.75rem;">Check rows below to assign</div>
                            </div>
                        </div>
                    </div>

                    <!-- Target Employee Dropdown -->
                    <div class="col-12 col-md-5 col-lg-7">
                        <label class="visually-hidden" for="ddlTargetEmployee">Target Employee</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-text bg-light text-dark text-nowrap"><i class="bi bi-person-check me-1"></i>Assign To</span>
                            <asp:DropDownList ID="ddlTargetEmployee" runat="server"
                                CssClass="form-select form-select-sm">
                                <asp:ListItem Value="">-- Choose Staff Member --</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <!-- Assign Button -->
                    <div class="col-12 col-md-3 col-lg-2 text-md-end">
                        <asp:Button ID="btnAssignLeads" runat="server" Text="Assign Leads"
                            CssClass="btn btn-nj-primary btn-sm w-100"
                            OnClientClick="collectSelectedLeads(); return validateAssignment();"
                            OnClick="btnAssignLeads_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Filters and Search Bar -->
        <div class="card mb-3">
            <div class="card-body p-3">
                <div class="row g-2 align-items-center">

                    <!-- Search -->
                    <div class="col-12 col-md-4">
                        <asp:TextBox ID="txtAssignSearch" runat="server" CssClass="form-control form-control-sm"
                            placeholder="Search client, mobile or tour..." AutoPostBack="true"
                            OnTextChanged="txtAssignSearch_TextChanged">
                        </asp:TextBox>
                    </div>

                    <!-- Assignment Status -->
                    <div class="col-6 col-md-4">
                        <asp:DropDownList ID="ddlAssignStatus" runat="server" CssClass="form-select form-select-sm"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlAssignStatus_SelectedIndexChanged">
                            <asp:ListItem Value="">All Assignment States</asp:ListItem>
                            <asp:ListItem Value="unassigned" Selected="True">Unassigned Leads Only</asp:ListItem>
                            <asp:ListItem Value="assigned">Already Assigned</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Priority -->
                    <div class="col-6 col-md-4">
                        <asp:DropDownList ID="ddlAssignPriority" runat="server" CssClass="form-select form-select-sm"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlAssignPriority_SelectedIndexChanged">
                            <asp:ListItem Value="">All Priorities</asp:ListItem>
                            <asp:ListItem Value="Hot">Hot Priority</asp:ListItem>
                            <asp:ListItem Value="Warm">Warm Priority</asp:ListItem>
                            <asp:ListItem Value="Cold">Cold Priority</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>
            </div>
        </div>

        <!-- Success Alert Banner (UI Only) -->
        <div class="alert alert-success alert-dismissible fade show d-none" id="assignSuccessAlert" role="alert">
            <i class="bi bi-check-circle-fill me-2"></i>
            <span id="assignSuccessText">Leads successfully assigned!</span>
            <button type="button" class="btn-close"
                onclick="document.getElementById('assignSuccessAlert').classList.add('d-none');"></button>
        </div>

        <!-- Assignable Leads Table Card -->
        <div class="card">
            <div class="card-header bg-white">
                <div>
                    <h6 class="mb-0"><i class="bi bi-list-check"></i>Assignable Leads List</h6>
                    <small class="text-muted">Select leads using checkboxes on the left</small>
                </div>
                <div class="small text-muted">
                    Showing 8 leads

                </div>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0" id="assignTable">
                        <thead>
                            <tr>
                                <th style="width: 40px;" class="text-center">
                                    <input type="checkbox" class="form-check-input" id="chkSelectAllHeader"
                                        onchange="toggleAllCheckboxes(this);" title="Select / Deselect All" />
                                </th>
                                <th>Lead ID</th>
                                <th>Client Name</th>
                                <th>Mobile</th>
                                <th>City / Destination</th>
                                <th>Created By</th>
                                <th>Assigned Employee</th>
                                <th>Status</th>
                                <th>Priority</th>
                                <th>Next Follow-up</th>
                                <th class="text-end">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptAssignableLeads" runat="server">
                                <itemtemplate>
                                    <tr class="lead-row">
                                        <td class="text-center">
                                            <input type="checkbox" class="form-check-input lead-chk"
                                                value='<%# Eval("lead_code") %>'
                                                data-client='<%# Eval("client_name") %>'
                                                onchange="updateSelectedCount();" />
                                        </td>
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
                                        <td>
                                            <%# Eval("created_by") %>
                                        </td>
                                        <td>
                                            <span class="badge bg-primary-subtle text-primary">
                                                <%# Eval("assigned_employee_name") %>
                                            </span>
                                        </td>
                                        <td>
                                            <span
                                                class='badge <%# Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "confirmed" ? "bg-success-subtle text-success" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "interested" ? "bg-info-subtle text-info" : (Eval("lead_status") != null && Eval("lead_status").ToString().ToLower() == "new" ? "badge-status-new" : "bg-warning-subtle text-warning")) %>'>
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
                                                <%# Eval("followup_date")==DBNull.Value || Eval("followup_date")==null
                                                    ? "-" : Eval("followup_date") %>
                                            </small>
                                        </td>
                                        <td class="text-end text-nowrap">
                                            <%# Eval("assigned_employee_name") !=null &&
                                                Eval("assigned_employee_name").ToString() !="Unassigned" &&
                                                !string.IsNullOrEmpty(Eval("assigned_employee_name").ToString())
                                                ? "<button type='button' class='btn btn-outline-danger btn-sm py-1 px-2' title='Unassign Lead' data-lead-code='"
                                                + Eval("lead_code") + "' data-client='" + Eval("client_name")
                                                + "' data-assigned='" + Eval("assigned_employee_name")
                                                + "' onclick='openUnassignModal(this);'><i class='bi bi-person-x me-1'></i>Unassign</button>"
                                                : "<span class='text-muted small'>--</span>" %>
                                        </td>
                                    </tr>
                                </itemtemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>



            <div class="card-footer bg-white p-3 d-flex justify-content-between align-items-center">
                <span class="small text-muted">Showing 8 leads pending assignment</span>
                <div class="d-flex gap-2">
                    <button type="button" class="btn btn-outline-secondary btn-sm"
                        onclick="selectAllVisible(false);">Deselect All</button>
                    <%--<button type="button" class="btn btn-nj-primary btn-sm" onclick="openAssignmentModal();">Proceed to
                        Assign</button>--%>
                </div>
            </div>
        </div>

        <!-- Assignment Confirmation Modal -->
        <div class="modal fade" id="assignConfirmModal" tabindex="-1" aria-labelledby="assignConfirmModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom">
                        <h6 class="modal-title fw-bold" id="assignConfirmModalLabel">
                            <i class="bi bi-person-check text-success me-1"></i>Confirm Lead Assignment
                        </h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="p-3 bg-light rounded mb-3">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-muted small">Selected Leads:</span>
                                <span class="badge bg-success" id="modalLeadCount">0 Leads</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-muted small">Assigning To:</span>
                                <span class="fw-bold text-dark" id="modalTargetEmployee">--</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="text-muted small">Action:</span>
                                <span class="text-primary small fw-semibold">Follow-up & Calling Handover</span>
                            </div>
                        </div>

                        <div class="alert alert-info border small mb-0">
                            <i class="bi bi-info-circle me-1"></i>
                            <strong>Attribution Guarantee:</strong> Each lead's original <em>Lead Owner</em> remains
                            unchanged in the system for tracking commission and conversion credit.

                        </div>
                    </div>
                    <div class="modal-footer border-top">
                        <button type="button" class="btn btn-sm btn-outline-secondary"
                            data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-sm btn-nj-primary" onclick="executeAssignment();">
                            <i class="bi bi-check2"></i>Confirm Assignment

                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Unassign Confirmation Modal (UI Only) -->
        <div class="modal fade" id="unassignConfirmModal" tabindex="-1" aria-labelledby="unassignConfirmModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom">
                        <h6 class="modal-title fw-bold text-danger" id="unassignConfirmModalLabel">
                            <i class="bi bi-person-x me-1"></i>Unassign Lead
                        </h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p class="mb-3 text-muted">Are you sure you want to unassign this lead from the assigned
                            employee?</p>
                        <div class="p-3 bg-light rounded mb-3 border">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-muted small">Lead Code:</span>
                                <span class="fw-bold text-success" id="unassignLeadCode">#--</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-muted small">Client Name:</span>
                                <span class="fw-bold text-dark" id="unassignClientName">--</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="text-muted small">Currently Assigned:</span>
                                <span class="badge bg-danger-subtle text-danger" id="unassignEmployeeName">--</span>
                            </div>
                        </div>
                        <div class="alert alert-warning border small mb-0">
                            <i class="bi bi-exclamation-triangle me-1"></i>
                            The lead will return to the unassigned queue and can be reassigned to another staff member.
                        </div>
                    </div>
                    <div class="modal-footer border-top">
                        <button type="button" class="btn btn-outline-secondary btn-sm"
                            data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger btn-sm" id="btnConfirmUnassign"
                            onclick="confirmUnassignLead();">
                            <i class="bi bi-person-x me-1"></i>Confirm Unassign
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript for Checkboxes & Assignment UI -->
        <script>

            function collectSelectedLeads() {
                let selected = [];

                document.querySelectorAll('.lead-chk:checked').forEach(function (checkbox) {
                    selected.push(checkbox.value);
                });

                document.getElementById('<%= hfSelectedLeadCodes.ClientID %>').value = selected.join(',');
            }

            function validateAssignment() {
                let selected = document.querySelectorAll('.lead-chk:checked').length;
                let employee = document.getElementById('<%= ddlTargetEmployee.ClientID %>').value;

                if (selected === 0) {
                    alert('Please select at least one lead.');
                    return false;
                }

                if (employee === '') {
                    alert('Please select an employee.');
                    return false;
                }

                return true;
            }

            function updateSelectedCount() {
                var checked = document.querySelectorAll('.lead-chk:checked');
                var count = checked.length;
                document.getElementById('selectedCountBadge').textContent = count;
            }

            function toggleAllCheckboxes(master) {
                var checkboxes = document.querySelectorAll('.lead-chk');
                checkboxes.forEach(function (chk) {
                    chk.checked = master.checked;
                });
                updateSelectedCount();
            }

            function selectAllVisible(status) {
                var checkboxes = document.querySelectorAll('.lead-chk');
                checkboxes.forEach(function (chk) {
                    chk.checked = status;
                });
                var header = document.getElementById('chkSelectAllHeader');
                if (header) header.checked = status;
                updateSelectedCount();
            }

            function openAssignmentModal() {
                var checked = document.querySelectorAll('.lead-chk:checked');
                if (checked.length === 0) {
                    alert('Please select at least one lead from the table to assign.');
                    return;
                }

                var employeeSelect = document.getElementById('ddlTargetEmployee');
                var employeeName = employeeSelect.value;
                if (!employeeName) {
                    alert('Please select an employee to whom you want to assign the selected leads.');
                    employeeSelect.focus();
                    return;
                }

                document.getElementById('modalLeadCount').textContent = checked.length + ' Leads';
                document.getElementById('modalTargetEmployee').textContent = employeeName;

                var modal = new bootstrap.Modal(document.getElementById('assignConfirmModal'));
                modal.show();
            }

            function executeAssignment() {
                var modalEl = document.getElementById('assignConfirmModal');
                var modal = bootstrap.Modal.getInstance(modalEl);
                if (modal) modal.hide();

                var checked = document.querySelectorAll('.lead-chk:checked');
                var empName = document.getElementById('ddlTargetEmployee').value;
                var count = checked.length;

                // Visual update: Change assignee badges in the table
                checked.forEach(function (chk) {
                    var row = chk.closest('tr');
                    if (row) {
                        var assigneeCell = row.cells[6];
                        if (assigneeCell) {
                            assigneeCell.innerHTML = '<span class="badge bg-primary-subtle text-primary">' + empName.split('&bull;')[0].trim() + '</span>';
                        }
                        chk.checked = false;
                    }
                });

                var header = document.getElementById('chkSelectAllHeader');
                if (header) header.checked = false;
                updateSelectedCount();

                // Show success banner
                var alertBox = document.getElementById('assignSuccessAlert');
                document.getElementById('assignSuccessText').textContent = 'Successfully assigned ' + count + ' lead(s) to ' + empName.split('&bull;')[0].trim() + '. Original lead owners have been preserved.';
                alertBox.classList.remove('d-none');
                alertBox.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }

            var currentUnassignLeadCode = '';
            var currentUnassignButton = null;

            function openUnassignModal(btn) {
                currentUnassignButton = btn;
                currentUnassignLeadCode = btn.getAttribute('data-lead-code') || '';
                var client = btn.getAttribute('data-client') || '';
                var assigned = btn.getAttribute('data-assigned') || '';

                var elCode = document.getElementById('unassignLeadCode');
                var elClient = document.getElementById('unassignClientName');
                var elEmp = document.getElementById('unassignEmployeeName');

                if (elCode) elCode.textContent = '#' + currentUnassignLeadCode;
                if (elClient) elClient.textContent = client;
                if (elEmp) elEmp.textContent = assigned;

                var modalEl = document.getElementById('unassignConfirmModal');
                if (modalEl && typeof bootstrap !== 'undefined') {
                    var modal = bootstrap.Modal.getOrCreateInstance(modalEl);
                    modal.show();
                }
            }

            function confirmUnassignLead() {
                var modalEl = document.getElementById('unassignConfirmModal');
                if (modalEl && typeof bootstrap !== 'undefined') {
                    var modal = bootstrap.Modal.getInstance(modalEl);
                    if (modal) modal.hide();
                }

                if (currentUnassignButton) {
                    var row = currentUnassignButton.closest('tr');
                    if (row) {
                        var assigneeCell = row.cells[6];
                        if (assigneeCell) {
                            assigneeCell.innerHTML = '<span class="badge bg-secondary-subtle text-muted">Unassigned</span>';
                        }
                        var actionCell = row.cells[10];
                        if (actionCell) {
                            actionCell.innerHTML = '<span class="text-muted small">--</span>';
                        }
                    }
                }

                var alertBox = document.getElementById('assignSuccessAlert');
                if (alertBox) {
                    var textEl = document.getElementById('assignSuccessText');
                    if (textEl) {
                        textEl.textContent = 'Lead #' + currentUnassignLeadCode + ' has been unassigned successfully (UI Demo). Ready for backend integration.';
                    }
                    alertBox.classList.remove('d-none');
                    alertBox.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }
        </script>
    </asp:Content>