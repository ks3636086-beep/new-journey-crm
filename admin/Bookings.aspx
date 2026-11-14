<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Bookings.aspx.cs" Inherits="Admin_Bookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>All Bookings Overview | Admin Panel</title>
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
                        <div class="text-muted small" style="font-size: 0.72rem;">Returned (Close Needed)</div>
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

    <!-- 2. Search & Filter Bar (Status + Weekly/Monthly Filter) -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <!-- Search Box -->
                <div class="col-12 col-md-5">
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
                            <option value="">All (Confirmed &amp; Closed)</option>
                        </select>
                    </div>
                </div>

                <!-- Period Filter (Weekly / Monthly / All Time) -->
                <div class="col-6 col-md-2">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-white"><i class="bi bi-calendar3 text-muted"></i></span>
                        <select id="ddlPeriodFilter" class="form-select form-select-sm" onchange="filterAdminBookings();">
                            <option value="all" selected="selected">All Time</option>
                            <option value="weekly">This Week</option>
                            <option value="monthly">This Month</option>
                            <option value="last_month">Last Month</option>
                        </select>
                    </div>
                </div>

                <!-- Reset Button -->
                <div class="col-12 col-md-2 text-md-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="resetAdminBookingFilters();">
                        <i class="bi bi-arrow-counterclockwise me-1"></i>Reset
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
            <span class="badge bg-primary-subtle text-primary border border-primary-subtle">
                <i class="bi bi-eye-fill me-1"></i>Admin Monitoring View
            </span>
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

    <!-- Client-side Search, Status & Period Script -->
    <script>
        function filterAdminBookings() {
            var search = (document.getElementById('txtAdminBookingSearch').value || '').toLowerCase().trim();
            var statusFilter = (document.getElementById('ddlAdminStatusFilter').value || '').trim().toLowerCase();
            var periodFilter = (document.getElementById('ddlPeriodFilter').value || 'all').toLowerCase();

            var rows = document.querySelectorAll('.admin-booking-row');
            var visibleCount = 0;

            var today = new Date();

            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                var rStatus = (row.getAttribute('data-status') || '').trim().toLowerCase();
                var rDateStr = (row.getAttribute('data-traveldate') || '').trim();

                var mSearch = search === '' || text.indexOf(search) > -1;
                var mStatus = statusFilter === '' || rStatus === statusFilter;
                var mPeriod = true;

                if (periodFilter !== 'all' && rDateStr) {
                    var rDate = new Date(rDateStr);
                    if (!isNaN(rDate.getTime())) {
                        if (periodFilter === 'weekly') {
                            // Check if within 7 days
                            var diffDays = (today - rDate) / (1000 * 60 * 60 * 24);
                            mPeriod = diffDays >= -7 && diffDays <= 7;
                        } else if (periodFilter === 'monthly') {
                            // Same year & month
                            mPeriod = rDate.getFullYear() === today.getFullYear() && rDate.getMonth() === today.getMonth();
                        } else if (periodFilter === 'last_month') {
                            var lastMonth = new Date(today.getFullYear(), today.getMonth() - 1, 1);
                            mPeriod = rDate.getFullYear() === lastMonth.getFullYear() && rDate.getMonth() === lastMonth.getMonth();
                        }
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
            document.getElementById('ddlPeriodFilter').value = 'all';
            filterAdminBookings();
        }

        document.addEventListener('DOMContentLoaded', function () {
            filterAdminBookings();
        });
    </script>
</asp:Content>
