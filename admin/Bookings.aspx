<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Bookings.aspx.cs" Inherits="Admin_Bookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>All Bookings Overview | Admin Panel</title>
    <!-- Flatpickr Calendar CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />
    <style>
        .flatpickr-calendar {
            box-shadow: 0 10px 25px rgba(0,0,0,0.15) !important;
            border-radius: 8px !important;
            border: 1px solid #e2e8f0 !important;
            font-family: inherit !important;
        }
        .flatpickr-day.selected, .flatpickr-day.startRange, .flatpickr-day.endRange {
            background: #0284c7 !important;
            border-color: #0284c7 !important;
            color: #fff !important;
        }
        .flatpickr-day.inRange {
            background: #e0f2fe !important;
            border-color: #e0f2fe !important;
            color: #0369a1 !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Company Bookings &amp; Tour Operations</h2>
            <p class="nj-page-subtitle">Central company overview of all confirmed client tours, assigned staff, and completed returns.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <a href="AllLeads.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-person-lines-fill me-1"></i>All Leads
            </a>
            <a href="Employees.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-people me-1"></i>Staff Directory
            </a>
        </div>
    </div>

    <!-- 1. Simple & Compact Summary Cards (ASP Controls) -->
    <div class="row g-2 mb-3">
        <!-- Card 1: Confirmed Bookings -->
        <div class="col-6 col-md-3">
            <div class="card p-2 px-3 border-0 shadow-sm">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <div class="text-muted small" style="font-size: 0.72rem;">Confirmed Bookings</div>
                        <h5 class="fw-bold mb-0 text-success">
                            <asp:Label ID="lblTotalConfirmed" runat="server" Text="0"></asp:Label>
                        </h5>
                    </div>
                    <span class="badge bg-success-subtle text-success p-2 fs-6 rounded">
                        <i class="bi bi-bookmark-check-fill"></i>
                    </span>
                </div>
            </div>
        </div>

        <!-- Card 2: Returned Clients -->
        <div class="col-6 col-md-3">
            <div class="card p-2 px-3 border-0 shadow-sm">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <div class="text-muted small" style="font-size: 0.72rem;">Returned</div>
                        <h5 class="fw-bold mb-0 text-danger">
                            <asp:Label ID="lblTotalReturned" runat="server" Text="0"></asp:Label>
                        </h5>
                    </div>
                    <span class="badge bg-warning-subtle text-warning p-2 fs-6 rounded">
                        <i class="bi bi-bell-fill"></i>
                    </span>
                </div>
            </div>
        </div>
    </div>

    <!-- 2. Search & Filter Bar (Status + Calendar Range Filter) -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <!-- Search Box -->
                <div class="col-12 col-md-4">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" id="txtAdminBookingSearch" class="form-control border-start-0" placeholder="Search customer, mobile, city, destination, agent..." onkeyup="filterAdminBookings();" />
                    </div>
                </div>

                <!-- Status Filter Dropdown -->
                <div class="col-6 col-md-3">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white"><i class="bi bi-funnel text-muted"></i></span>
                        <select id="ddlAdminStatusFilter" class="form-select form-select-sm" onchange="filterAdminBookings();">
                            <option value="Confirmed" selected="selected">Confirmed</option>
                            <option value="Closed">Closed</option>
                            <option value="">All Statuses</option>
                        </select>
                    </div>
                </div>

                <!-- Calendar Date Range Input (Opens Interactive Calendar Popup) -->
                <div class="col-6 col-md-4">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white text-primary"><i class="bi bi-calendar-event"></i></span>
                        <input type="text" id="txtDateRangePicker" class="form-control bg-white" placeholder="Choose Date or Date Range (Calendar)..." style="cursor: pointer;" readonly="readonly" />
                        <button type="button" class="btn btn-outline-secondary" onclick="clearDatePicker();" title="Clear Date Filter">
                            <i class="bi bi-x"></i>
                        </button>
                    </div>
                </div>

                <!-- Reset Button -->
                <div class="col-12 col-md-1 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="resetAdminBookingFilters();" title="Reset All Filters">
                        <i class="bi bi-arrow-counterclockwise"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- 3. Confirmed Bookings Table Card (Read-Only / Monitoring) -->
    <div class="card">
        <div class="card-header bg-white d-flex justify-content-between align-items-center">
            <div>
                <h6 class="mb-0"><i class="bi bi-bookmark-check-fill text-success me-1"></i>All Bookings Directory</h6>
                <small class="text-muted">Master log of all confirmed &amp; closed bookings handled across all staff</small>
            </div>
            
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0" id="tblAdminBookings">
                    <thead class="table-light">
                        <tr>
                            <th>Booking / Lead ID</th>
                            <th>Customer &amp; City</th>
                            <th>Mobile</th>
                            <th>Destination</th>
                            <th>Travel Date</th>
                            <th>Assigned Agent</th>
                            <th class="text-center">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptAdminBookings" runat="server">
                            <ItemTemplate>
                                <tr class="admin-booking-row" 
                                    data-status='<%# Eval("lead_status") %>' 
                                    data-traveldate='<%# Eval("travel_date", "{0:yyyy-MM-dd}") %>'>
                                    <td>
                                        <span class="badge bg-light text-primary border fw-semibold"><%# Eval("lead_code") %></span>
                                    </td>
                                    <td>
                                        <div class="fw-bold text-dark"><%# Eval("client_name") %></div>
                                        <small class="text-muted"><i class="bi bi-geo-alt me-1"></i><%# Eval("city") %></small>
                                    </td>
                                    <td>
                                        <a href='tel:<%# Eval("mobile") %>' class="text-decoration-none text-dark fw-semibold">
                                            <i class="bi bi-telephone text-muted me-1"></i><%# Eval("mobile") %>
                                        </a>
                                        <%# !string.IsNullOrEmpty(Eval("alternate_mobile") as string) ? "<small class='text-muted d-block'>Alt: " + Eval("alternate_mobile") + "</small>" : "" %>
                                    </td>
                                    <td>
                                        <div class="fw-semibold text-dark"><%# Eval("destination") %></div>
                                        <small class="text-muted"><%# Eval("remarks") %></small>
                                    </td>
                                    <td>
                                        <div class="text-dark fw-semibold"><%# Eval("travel_date", "{0:dd-MMM-yyyy}") %></div>
                                        <%# (Eval("travel_date") != DBNull.Value && Convert.ToDateTime(Eval("travel_date")).Date < DateTime.Today && Convert.ToString(Eval("lead_status")) == "Confirmed") ? 
                                            "<small class='text-danger fw-semibold d-block mt-1'><i class='bi bi-bell-fill me-1'></i>Trip Ended &bull; Close Needed</small>" : "" 
                                        %>
                                    </td>
                                    <td>
                                        <span class="badge bg-info-subtle text-dark border">
                                            <i class="bi bi-person-badge me-1"></i><%# !string.IsNullOrEmpty(Eval("assigned_employee_id") as string) ? "Emp #" + Eval("assigned_employee_id") : Eval("created_by") %>
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <span class='badge <%# Convert.ToString(Eval("lead_status")) == "Closed" ? "bg-secondary text-white" : "bg-success text-white" %>'>
                                            <%# Eval("lead_status") %>
                                        </span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                        <!-- Empty State -->
                        <tr id="emptyAdminBookingsRow" class="d-none">
                            <td colspan="7" class="text-center py-4 text-muted">
                                <i class="bi bi-inbox fs-2 d-block mb-1"></i>
                                No bookings found matching current filters.
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Flatpickr Calendar JS -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

    <!-- Client-side Search, Status & Calendar Filter Script -->
    <script>
        var fpInstance = null;

        function formatDateYYYYMMDD(d) {
            var y = d.getFullYear();
            var m = String(d.getMonth() + 1).padStart(2, '0');
            var day = String(d.getDate()).padStart(2, '0');
            return y + '-' + m + '-' + day;
        }

        function clearDatePicker() {
            if (fpInstance) {
                fpInstance.clear();
            }
            filterAdminBookings();
        }

        function filterAdminBookings() {
            var search = (document.getElementById('txtAdminBookingSearch').value || '').toLowerCase().trim();
            var statusFilter = (document.getElementById('ddlAdminStatusFilter').value || '').trim().toLowerCase();

            // Calendar dates
            var fromDate = null;
            var toDate = null;
            if (fpInstance && fpInstance.selectedDates && fpInstance.selectedDates.length > 0) {
                fromDate = formatDateYYYYMMDD(fpInstance.selectedDates[0]);
                toDate = fpInstance.selectedDates.length > 1 
                    ? formatDateYYYYMMDD(fpInstance.selectedDates[1]) 
                    : fromDate;
            }

            var rows = document.querySelectorAll('.admin-booking-row');
            var visibleCount = 0;

            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                var rStatus = (row.getAttribute('data-status') || '').trim().toLowerCase();
                var rDateStr = (row.getAttribute('data-traveldate') || '').trim();

                var mSearch = search === '' || text.indexOf(search) > -1;
                var mStatus = statusFilter === '' || rStatus === statusFilter;
                var mPeriod = true;

                if (fromDate && toDate) {
                    // Filter using Calendar selection
                    if (!rDateStr || rDateStr < fromDate || rDateStr > toDate) {
                        mPeriod = false;
                    }
                }

                if (mSearch && mStatus && mPeriod) {
                    row.style.display = '';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            });

            var empty = document.getElementById('emptyAdminBookingsRow');
            if (empty) {
                if (visibleCount === 0) {
                    empty.classList.remove('d-none');
                } else {
                    empty.classList.add('d-none');
                }
            }
        }

        function resetAdminBookingFilters() {
            document.getElementById('txtAdminBookingSearch').value = '';
            document.getElementById('ddlAdminStatusFilter').value = 'Confirmed';
            if (fpInstance) {
                fpInstance.clear();
            }
            filterAdminBookings();
        }

        document.addEventListener('DOMContentLoaded', function () {
            // Initialize Flatpickr Range Calendar
            if (typeof flatpickr !== 'undefined') {
                fpInstance = flatpickr("#txtDateRangePicker", {
                    mode: "range",
                    dateFormat: "Y-m-d",
                    altInput: true,
                    altFormat: "d-M-Y",
                    altInputClass: "form-control form-control-sm bg-white",
                    allowInput: false,
                    placeholder: "Click to pick Date / Range (Calendar)...",
                    onChange: function (selectedDates) {
                        filterAdminBookings();
                    }
                });
            }

            filterAdminBookings();
        });
    </script>
</asp:Content>
