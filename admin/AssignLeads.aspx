<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AssignLeads.aspx.cs" Inherits="AssignLeads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Assign Leads | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Assign Travel Leads</h2>
            <p class="nj-page-subtitle">Distribute inquiries to sales and telecalling executives for fast client outreach.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <span class="badge bg-light text-dark border p-2">
                <i class="bi bi-person-lines-fill text-success me-1"></i> Unassigned Queue: <strong>48 Leads</strong>
            </span>
        </div>
    </div>

    <!-- Attribution Rule Notice -->
    <div class="alert alert-light border py-2 px-3 mb-3 small d-flex align-items-center gap-2">
        <i class="bi bi-exclamation-triangle-fill text-success fs-5"></i>
        <div>
            <strong>Important Rule:</strong> Assigning a lead transfers the active follow-up responsibility to the selected employee. The original <em>Lead Owner</em> who brought or recorded the lead always retains commission credit.
        </div>
    </div>

    <!-- Bulk Assignment Action Bar Card -->
    <div class="card mb-3 border-success border-opacity-25 bg-white">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <!-- Selection counter -->
                <div class="col-12 col-md-3">
                    <div class="d-flex align-items-center gap-2">
                        <span class="badge bg-success fs-6" id="selectedCountBadge">0</span>
                        <div>
                            <div class="fw-bold small text-dark">Leads Selected</div>
                            <div class="text-muted" style="font-size: 0.75rem;">Check rows below to assign</div>
                        </div>
                    </div>
                </div>

                <!-- Target Employee Dropdown -->
                <div class="col-12 col-md-4">
                    <label class="visually-hidden" for="ddlTargetEmployee">Target Employee</label>
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-light text-dark"><i class="bi bi-person-check"></i> Assign To</span>
                        <select class="form-select form-select-sm" id="ddlTargetEmployee">
                            <option value="">-- Choose Staff Member --</option>
                            <option value="Pooja Srivastava (Calling Desk)">Pooja Srivastava &bull; Calling Desk (Active)</option>
                            <option value="Ankita Verma (Calling Desk)">Ankita Verma &bull; Calling Desk (Active)</option>
                            <option value="Priya Sharma (Sales Team)">Priya Sharma &bull; Sales Team (Active)</option>
                            <option value="Manoj Tiwari (Sales Team)">Manoj Tiwari &bull; Sales Team (Active)</option>
                            <option value="Rakesh Yadav (Field Team)">Rakesh Yadav &bull; Field Team (Active)</option>
                        </select>
                    </div>
                </div>

                <!-- Instruction note -->
                <div class="col-12 col-md-3">
                    <input type="text" class="form-control form-control-sm" id="txtAssignRemarks" placeholder="Optional note: e.g. Urgent call required" />
                </div>

                <!-- Assign Button -->
                <div class="col-12 col-md-2 text-md-end">
                    <button type="button" class="btn btn-nj-primary btn-sm w-100" onclick="openAssignmentModal();">
                        <i class="bi bi-check-all"></i> Assign Leads
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Filters and Search Bar -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-4">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" id="assignSearch" class="form-control border-start-0" placeholder="Filter by client name, mobile or tour..." />
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <select class="form-select form-select-sm" id="assignFilterStatus">
                        <option value="">All Assignment States</option>
                        <option value="unassigned" selected="selected">Unassigned Leads Only</option>
                        <option value="assigned">Already Assigned</option>
                    </select>
                </div>
                <div class="col-6 col-md-3">
                    <select class="form-select form-select-sm" id="assignFilterPriority">
                        <option value="">All Priorities</option>
                        <option value="Hot">Hot Priority Only</option>
                        <option value="Warm">Warm Priority</option>
                        <option value="Cold">Cold Priority</option>
                    </select>
                </div>
                <div class="col-12 col-md-2 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="selectAllVisible(true);">
                        <i class="bi bi-check-square"></i> Select All
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Success Alert Banner (UI Only) -->
    <div class="alert alert-success alert-dismissible fade show d-none" id="assignSuccessAlert" role="alert">
        <i class="bi bi-check-circle-fill me-2"></i>
        <span id="assignSuccessText">Leads successfully assigned!</span>
        <button type="button" class="btn-close" onclick="document.getElementById('assignSuccessAlert').classList.add('d-none');"></button>
    </div>

    <!-- Assignable Leads Table Card -->
    <div class="card">
        <div class="card-header bg-white">
            <div>
                <h6 class="mb-0"><i class="bi bi-list-check"></i> Assignable Leads List</h6>
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
                                <input type="checkbox" class="form-check-input" id="chkSelectAllHeader" onchange="toggleAllCheckboxes(this);" title="Select / Deselect All" />
                            </th>
                            <th>Lead ID</th>
                            <th>Client Name</th>
                            <th>Mobile & City</th>
                            <th>Travel Destination</th>
                            <th>Lead Owner (Credit)</th>
                            <th>Current Assignee</th>
                            <th>Status</th>
                            <th>Priority</th>
                            <th>Added Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Row 1 -->
                        <tr class="lead-row">
                            <td class="text-center">
                                <input type="checkbox" class="form-check-input lead-chk" value="NJ-10311" data-client="Deepak Singhania" onchange="updateSelectedCount();" />
                            </td>
                            <td><span class="fw-bold text-success">#NJ-10311</span></td>
                            <td>
                                <div class="fw-bold">Deepak Singhania</div>
                                <small class="text-muted">Family (4 Pax)</small>
                            </td>
                            <td>
                                <div>+91 94500 11223</div>
                                <small class="text-muted">Gorakhpur (Golghar)</small>
                            </td>
                            <td>Kashmir 6N Deluxe Tour</td>
                            <td><span class="fw-semibold text-primary">Rakesh Yadav (Field)</span></td>
                            <td><span class="badge bg-secondary-subtle text-secondary">Unassigned</span></td>
                            <td><span class="badge badge-status-new">New</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-muted small">Today, 09:15 AM</td>
                        </tr>

                        <!-- Row 2 -->
                        <tr class="lead-row">
                            <td class="text-center">
                                <input type="checkbox" class="form-check-input lead-chk" value="NJ-10312" data-client="Vandana Chaurasia" onchange="updateSelectedCount();" />
                            </td>
                            <td><span class="fw-bold text-success">#NJ-10312</span></td>
                            <td>
                                <div class="fw-bold">Vandana Chaurasia</div>
                                <small class="text-muted">Couple (Honeymoon)</small>
                            </td>
                            <td>
                                <div>+91 98380 44556</div>
                                <small class="text-muted">Deoria</small>
                            </td>
                            <td>Maldives 4N Water Villa</td>
                            <td><span class="fw-semibold text-primary">Admin Entry</span></td>
                            <td><span class="badge bg-secondary-subtle text-secondary">Unassigned</span></td>
                            <td><span class="badge badge-status-new">New</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-muted small">Today, 10:00 AM</td>
                        </tr>

                        <!-- Row 3 -->
                        <tr class="lead-row">
                            <td class="text-center">
                                <input type="checkbox" class="form-check-input lead-chk" value="NJ-10313" data-client="Suresh Chandra" onchange="updateSelectedCount();" />
                            </td>
                            <td><span class="fw-bold text-success">#NJ-10313</span></td>
                            <td>
                                <div class="fw-bold">Suresh Chandra</div>
                                <small class="text-muted">Group (8 Pax)</small>
                            </td>
                            <td>
                                <div>+91 97920 66778</div>
                                <small class="text-muted">Kushinagar</small>
                            </td>
                            <td>Char Dham Yatra by Coach</td>
                            <td><span class="fw-semibold text-primary">Rakesh Yadav (Field)</span></td>
                            <td><span class="badge bg-secondary-subtle text-secondary">Unassigned</span></td>
                            <td><span class="badge badge-status-interested">Interested</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td class="text-muted small">Today, 10:45 AM</td>
                        </tr>

                        <!-- Row 4 -->
                        <tr class="lead-row">
                            <td class="text-center">
                                <input type="checkbox" class="form-check-input lead-chk" value="NJ-10314" data-client="Preeti Agrawal" onchange="updateSelectedCount();" />
                            </td>
                            <td><span class="fw-bold text-success">#NJ-10314</span></td>
                            <td>
                                <div class="fw-bold">Preeti Agrawal</div>
                                <small class="text-muted">Family (5 Pax)</small>
                            </td>
                            <td>
                                <div>+91 99180 88990</div>
                                <small class="text-muted">Basti</small>
                            </td>
                            <td>Dubai 5N Luxury Package</td>
                            <td><span class="fw-semibold text-primary">Priya Sharma (Sales)</span></td>
                            <td><span class="badge bg-secondary-subtle text-secondary">Unassigned</span></td>
                            <td><span class="badge badge-status-new">New</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-muted small">Yesterday</td>
                        </tr>

                        <!-- Row 5 -->
                        <tr class="lead-row">
                            <td class="text-center">
                                <input type="checkbox" class="form-check-input lead-chk" value="NJ-10315" data-client="Mohd. Aslam" onchange="updateSelectedCount();" />
                            </td>
                            <td><span class="fw-bold text-success">#NJ-10315</span></td>
                            <td>
                                <div class="fw-bold">Mohd. Aslam</div>
                                <small class="text-muted">Friends (3 Pax)</small>
                            </td>
                            <td>
                                <div>+91 94155 33221</div>
                                <small class="text-muted">Gorakhpur (Basharatpur)</small>
                            </td>
                            <td>Goa 4N Party & Beach Tour</td>
                            <td><span class="fw-semibold text-primary">Admin Entry</span></td>
                            <td><span class="badge bg-primary-subtle text-primary">Manoj Tiwari</span></td>
                            <td><span class="badge badge-status-pending">Pending</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td class="text-muted small">Yesterday</td>
                        </tr>

                        <!-- Row 6 -->
                        <tr class="lead-row">
                            <td class="text-center">
                                <input type="checkbox" class="form-check-input lead-chk" value="NJ-10316" data-client="Pankaj Jaiswal" onchange="updateSelectedCount();" />
                            </td>
                            <td><span class="fw-bold text-success">#NJ-10316</span></td>
                            <td>
                                <div class="fw-bold">Pankaj Jaiswal</div>
                                <small class="text-muted">Couple</small>
                            </td>
                            <td>
                                <div>+91 98391 77889</div>
                                <small class="text-muted">Maharajganj</small>
                            </td>
                            <td>Thailand Bangkok-Pattaya 5N</td>
                            <td><span class="fw-semibold text-primary">Rakesh Yadav (Field)</span></td>
                            <td><span class="badge bg-secondary-subtle text-secondary">Unassigned</span></td>
                            <td><span class="badge badge-status-new">New</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td class="text-muted small">2 days ago</td>
                        </tr>

                        <!-- Row 7 -->
                        <tr class="lead-row">
                            <td class="text-center">
                                <input type="checkbox" class="form-check-input lead-chk" value="NJ-10317" data-client="Shruti Srivastava" onchange="updateSelectedCount();" />
                            </td>
                            <td><span class="fw-bold text-success">#NJ-10317</span></td>
                            <td>
                                <div class="fw-bold">Shruti Srivastava</div>
                                <small class="text-muted">Family (4 Pax)</small>
                            </td>
                            <td>
                                <div>+91 91610 99887</div>
                                <small class="text-muted">Gorakhpur (Medical Road)</small>
                            </td>
                            <td>Kerala Munnar & Thekkady</td>
                            <td><span class="fw-semibold text-primary">Admin Entry</span></td>
                            <td><span class="badge bg-secondary-subtle text-secondary">Unassigned</span></td>
                            <td><span class="badge badge-status-interested">Interested</span></td>
                            <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                            <td class="text-muted small">2 days ago</td>
                        </tr>

                        <!-- Row 8 -->
                        <tr class="lead-row">
                            <td class="text-center">
                                <input type="checkbox" class="form-check-input lead-chk" value="NJ-10318" data-client="Harsh Vardhan" onchange="updateSelectedCount();" />
                            </td>
                            <td><span class="fw-bold text-success">#NJ-10318</span></td>
                            <td>
                                <div class="fw-bold">Harsh Vardhan</div>
                                <small class="text-muted">Group (10 Pax)</small>
                            </td>
                            <td>
                                <div>+91 97930 22334</div>
                                <small class="text-muted">Siddharthnagar</small>
                            </td>
                            <td>Himachal Manali-Kasol Tour</td>
                            <td><span class="fw-semibold text-primary">Priya Sharma (Sales)</span></td>
                            <td><span class="badge bg-secondary-subtle text-secondary">Unassigned</span></td>
                            <td><span class="badge badge-status-new">New</span></td>
                            <td><span class="badge badge-priority-warm">Warm</span></td>
                            <td class="text-muted small">3 days ago</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="card-footer bg-white p-3 d-flex justify-content-between align-items-center">
            <span class="small text-muted">Showing 8 leads pending assignment</span>
            <div class="d-flex gap-2">
                <button type="button" class="btn btn-outline-secondary btn-sm" onclick="selectAllVisible(false);">Deselect All</button>
                <button type="button" class="btn btn-nj-primary btn-sm" onclick="openAssignmentModal();">Proceed to Assign</button>
            </div>
        </div>
    </div>

    <!-- Assignment Confirmation Modal -->
    <div class="modal fade" id="assignConfirmModal" tabindex="-1" aria-labelledby="assignConfirmModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h6 class="modal-title fw-bold" id="assignConfirmModalLabel">
                        <i class="bi bi-person-check text-success me-1"></i> Confirm Lead Assignment
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
                        <strong>Attribution Guarantee:</strong> Each lead's original <em>Lead Owner</em> remains unchanged in the system for tracking commission and conversion credit.
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-nj-primary" onclick="executeAssignment();">
                        <i class="bi bi-check2"></i> Confirm Assignment
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript for Checkboxes & Assignment UI -->
    <script>
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
    </script>
</asp:Content>
