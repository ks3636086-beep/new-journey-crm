<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Bookings.aspx.cs"
    Inherits="Bookings" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Confirmed Bookings & Tour Operations | New Journey Holidays</title>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Page Header -->
        <div class="nj-page-header">
            <div>
                <h2 class="nj-page-title">Confirmed Bookings & Tour Operations</h2>
                <p class="nj-page-subtitle">Central hub for confirmed travelers. Track upcoming tours, ongoing journeys,
                    and close completed trips after client return.</p>
            </div>
            <div class="d-flex align-items-center gap-2">
                <a href="FollowUps.aspx" class="btn btn-nj-outline btn-sm">
                    <i class="bi bi-calendar-check me-1"></i>Follow-ups
                </a>
                <a href="MyLeads.aspx" class="btn btn-nj-outline btn-sm">
                    <i class="bi bi-person-lines-fill me-1"></i>My Leads
                </a>
            </div>
        </div>

      

        <!-- 2. Search & Filter Bar -->
        <div class="card mb-3">
            <div class="card-body p-3">
                <div class="row g-2 align-items-center">
                    <!-- Search Box -->
                    <div class="col-12 col-md-7">
                        <div class="input-group input-group-sm">
                            <span class="input-group-text bg-white border-end-0"><i
                                    class="bi bi-search text-muted"></i></span>
                            <input type="text" id="txtBookingSearch" class="form-control border-start-0"
                                placeholder="Search customer, mobile, city, destination..."
                                onkeyup="filterBookings();" />
                        </div>
                    </div>

                    <!-- Status Filter Dropdown (Confirmed by default & Closed) -->
                    <div class="col-6 col-md-3">
                        <div class="input-group input-group-sm">
                            <span class="input-group-text bg-white"><i class="bi bi-funnel text-muted"></i></span>
                            <select id="ddlStatusFilter" class="form-select form-select-sm"
                                onchange="filterBookings();">
                                <option value="Confirmed" selected="selected">Confirmed</option>
                                <option value="Closed">Closed</option>
                                <option value="">All (Confirmed & Closed)</option>
                            </select>
                        </div>
                    </div>

                    <!-- Reset Button -->
                    <div class="col-6 col-md-2 text-md-end">
                        <button type="button" class="btn btn-outline-secondary btn-sm w-100"
                            onclick="resetBookingFilters();">
                            <i class="bi bi-arrow-counterclockwise me-1"></i>Reset
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3. Confirmed Bookings Table Card (Repeater) -->
        <div class="card">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <div>
                    <h6 class="mb-0"><i class="bi bi-bookmark-check-fill text-success me-1"></i>Confirmed Bookings
                        Directory</h6>
                    <small class="text-muted">Confirmed client tours &amp; closed trip records</small>
                </div>
                 
            </div>
            <span class="badge bg-success-subtle text-success border border-success-subtle">
                <i class="bi bi-shield-check me-1"></i>Active Travel Portfolio
            </span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0" id="tblBookings">
                    <thead class="table-light">
                        <tr>
                            <th>Booking / Lead ID</th>
                            <th>Customer Name &amp; City</th>
                            <th>Mobile</th>
                            <th>Destination</th>
                            <th>Travel Date</th>
                            <th>Status</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptBookings" runat="server">
                            <ItemTemplate>
                                <tr class="booking-row" data-status='<%# Eval("lead_status") %>'>
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
                                        <span class='badge <%# Convert.ToString(Eval("lead_status")) == "Closed" ? "bg-secondary text-white" : "bg-success text-white" %>'>
                                            <%# Eval("lead_status") %>
                                        </span>
                                    </td>
                                    <td class="text-end">
                                        <button type="button" 
                                            class='btn btn-sm <%# Convert.ToString(Eval("lead_status")) == "Closed" ? "btn-outline-secondary" : "btn-outline-danger" %>'
                                            onclick="openCloseTripModal('<%# Eval("lead_code") %>', '<%# Eval("client_name") %>', '<%# Eval("mobile") %>', '<%# Eval("destination") %>', '<%# Eval("travel_date", "{0:dd-MMM-yyyy}") %>', '<%# Eval("lead_status") %>', '<%# Eval("travel_date", "{0:yyyy-MM-dd}") %>');">
                                            <i class='bi <%# Convert.ToString(Eval("lead_status")) == "Closed" ? "bi-lock-fill text-muted" : "bi-check2-circle" %> me-1'></i>
                                            <%# Convert.ToString(Eval("lead_status")) == "Closed" ? "Closed" : "Close Trip" %>
                                        </button>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                         
                      
                        <!-- Empty State -->
                        <tr id="emptyBookingsRow" class="d-none">
                            <td colspan="7" class="text-center py-4 text-muted">
                                <i class="bi bi-inbox fs-2 d-block mb-1"></i>
                                No bookings found matching the current filters.
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Complete & Close Trip Modal -->
        <div class="modal fade" id="modalCloseTrip" tabindex="-1" aria-labelledby="modalCloseTripLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content shadow-lg border-0">
                    <div class="modal-header bg-danger text-white py-2">
                        <h6 class="modal-title fw-bold" id="modalCloseTripLabel">
                            <i class="bi bi-check2-circle me-1"></i>Complete &amp; Close Trip
                        </h6>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body p-3">
                        <!-- Hidden Field for Lead Code -->
                        <asp:HiddenField ID="hfCloseLeadCode" runat="server" />

                        <!-- Client Details Mini Card -->
                        <div class="card bg-light border-0 mb-3 p-2">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <div>
                                    <span class="badge bg-primary" id="closeLeadId">#LEAD-0000</span>
                                    <strong class="ms-1" id="closeCustName">Customer Name</strong>
                                </div>
                                <span class="text-muted small" id="closeCustPhone">+91 XXXXXXXXXX</span>
                            </div>
                            <div class="d-flex justify-content-between text-muted small">
                                <span><i class="bi bi-geo-alt me-1"></i><span id="closeDest">Destination</span></span>
                                <span><i class="bi bi-calendar-event me-1"></i><span id="closeTravelDates">Travel Dates</span></span>
                            </div>
                        </div>

                        <!-- Google Review (GMB) Link Box -->
                        <div class="mb-3">
                            <label class="form-label small fw-semibold text-primary d-flex align-items-center justify-content-between">
                                <span><i class="bi bi-google me-1"></i>Google Review Link (Send to Client)</span>
                                <span class="badge bg-primary-subtle text-primary fw-normal">GMB Review</span>
                            </label>
                            <div class="input-group input-group-sm">
                                <input type="text" id="txtGmbLink" class="form-control" value="https://share.google/atLVRZlqszRt7Ata3" readonly />
                                <button type="button" class="btn btn-primary" id="btnCopyGmb" onclick="copyGmbLink();">
                                    <i class="bi bi-clipboard me-1"></i>Copy Link
                                </button>
                            </div>
                        </div>

                        <!-- WhatsApp Thank You & Review Request Card -->
                        <div class="mb-3 p-2 rounded border bg-white">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <label class="form-label small fw-semibold text-success mb-0 d-flex align-items-center gap-1">
                                    <i class="bi bi-whatsapp"></i>Send Thank You &amp; Review on WhatsApp
                                </label>
                                <span class="badge bg-success-subtle text-success">WhatsApp</span>
                            </div>
                            <p class="text-muted mb-2" style="font-size: 0.72rem; line-height: 1.35;">
                                Send an appreciation message in English thanking the client for traveling with us, asking about their trip, and sharing the Google review link.
                            </p>
                            <div class="d-flex gap-2">
                                <a id="btnSendWhatsAppReview" href="javascript:void(0);" onclick="sendWhatsAppReviewMsg();" class="btn btn-sm btn-success flex-grow-1 d-inline-flex align-items-center justify-content-center gap-1 text-white fw-semibold">
                                    <i class="bi bi-whatsapp"></i>Send WhatsApp Message
                                </a>
                                <button type="button" class="btn btn-sm btn-outline-success" onclick="copyWhatsAppReviewMsg();" id="btnCopyWaMsg" title="Copy Message Text">
                                    <i class="bi bi-files me-1"></i>Copy Text
                                </button>
                            </div>
                        </div>

                        <!-- Trip Status Transition Dropdown (ASP.NET Server Control) -->
                        <div class="mb-3">
                            <label class="form-label small fw-semibold">Trip / Lead Status <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="ddlCloseStatus" runat="server" CssClass="form-select form-select-sm" onchange="handleModalStatusChange(this);">
                                <asp:ListItem Text="Confirmed" Value="Confirmed"></asp:ListItem>
                                <asp:ListItem Text="Closed" Value="Closed"></asp:ListItem>
                            </asp:DropDownList>
                            <div id="statusLockedAlert" class="alert alert-warning py-1 px-2 small mt-2 d-none" style="font-size: 0.75rem;">
                                <i class="bi bi-lock-fill text-danger me-1"></i>Trip is <strong>Closed</strong>. This status is now locked and cannot be reverted to Confirmed.
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer border-top py-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnConfirmCloseTrip" runat="server" Text="Confirm & Close Trip" CssClass="btn btn-sm btn-danger px-3 text-white" OnClick="btnConfirmCloseTrip_Click" OnClientClick="return validateBeforeClose();" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Client-side Search & Status Filter Script -->
        <script>
            function filterBookings() {
                var search = (document.getElementById('txtBookingSearch').value || '').toLowerCase().trim();
                var statusFilter = (document.getElementById('ddlStatusFilter').value || '').trim().toLowerCase();

                var rows = document.querySelectorAll('.booking-row');
                var visibleCount = 0;

                rows.forEach(function (row) {
                    var text = row.innerText.toLowerCase();
                    var rStatus = (row.getAttribute('data-status') || '').trim().toLowerCase();

                    var mSearch = search === '' || text.indexOf(search) > -1;
                    var mStatus = statusFilter === '' || rStatus === statusFilter;

                    if (mSearch && mStatus) {
                        row.style.display = '';
                        visibleCount++;
                    } else {
                        row.style.display = 'none';
                    }
                });

                var empty = document.getElementById('emptyBookingsRow');
                if (empty) {
                    if (visibleCount === 0) {
                        empty.classList.remove('d-none');
                    } else {
                        empty.classList.add('d-none');
                    }
                }
            }

            function resetBookingFilters() {
                document.getElementById('txtBookingSearch').value = '';
                document.getElementById('ddlStatusFilter').value = 'Confirmed';
                filterBookings();
            }

            function copyGmbLink() {
                var input = document.getElementById('txtGmbLink');
                input.select();
                input.setSelectionRange(0, 99999);
                navigator.clipboard.writeText(input.value);

                var btn = document.getElementById('btnCopyGmb');
                var originalHtml = btn.innerHTML;
                btn.innerHTML = '<i class="bi bi-check2 me-1"></i>Copied!';
                btn.classList.remove('btn-primary');
                btn.classList.add('btn-success');

                setTimeout(function () {
                    btn.innerHTML = originalHtml;
                    btn.classList.remove('btn-success');
                    btn.classList.add('btn-primary');
                }, 2000);
            }

            function getWhatsAppReviewText(custName, dest) {
                var name = (custName && custName !== 'Customer Name') ? custName : 'Valued Customer';
                var destination = (dest && dest !== 'Destination') ? (' to ' + dest) : '';
                var gmbLink = (document.getElementById('txtGmbLink') ? document.getElementById('txtGmbLink').value : '') || 'https://share.google/atLVRZlqszRt7Ata3';

                return "Dear " + name + ",\n\n" +
                       "Thank you for choosing New Journey Holidays for your recent trip" + destination + "! We hope you had a wonderful, comfortable, and memorable experience.\n\n" +
                       "Your feedback means a lot to our team. Could you please take a moment to share your review and rate us on Google?\n" +
                       gmbLink + "\n\n" +
                       "Thank you once again for traveling with us, and we look forward to planning your next journey!\n\n" +
                       "Warm regards,\n" +
                       "New Journey Holidays";
            }

            function sendWhatsAppReviewMsg() {
                var rawPhone = (document.getElementById('closeCustPhone') ? document.getElementById('closeCustPhone').textContent : '') || '';
                var cleanPhone = rawPhone.replace(/\D/g, '');
                if (cleanPhone.length === 10) {
                    cleanPhone = '91' + cleanPhone;
                }

                var custName = document.getElementById('closeCustName') ? document.getElementById('closeCustName').textContent : '';
                var dest = document.getElementById('closeDest') ? document.getElementById('closeDest').textContent : '';
                var msg = getWhatsAppReviewText(custName, dest);

                var url = 'https://api.whatsapp.com/send?phone=' + encodeURIComponent(cleanPhone) + '&text=' + encodeURIComponent(msg);
                window.open(url, '_blank');
            }

            function copyWhatsAppReviewMsg() {
                var custName = document.getElementById('closeCustName') ? document.getElementById('closeCustName').textContent : '';
                var dest = document.getElementById('closeDest') ? document.getElementById('closeDest').textContent : '';
                var msg = getWhatsAppReviewText(custName, dest);

                navigator.clipboard.writeText(msg);

                var btn = document.getElementById('btnCopyWaMsg');
                if (btn) {
                    var original = btn.innerHTML;
                    btn.innerHTML = '<i class="bi bi-check2 me-1"></i>Copied!';
                    btn.classList.remove('btn-outline-success');
                    btn.classList.add('btn-success', 'text-white');
                    setTimeout(function () {
                        btn.innerHTML = original;
                        btn.classList.remove('btn-success', 'text-white');
                        btn.classList.add('btn-outline-success');
                    }, 2000);
                }
            }

            function ensureBothOptions(ddl) {
                var hasConfirmed = false;
                var hasClosed = false;
                for (var i = 0; i < ddl.options.length; i++) {
                    if (ddl.options[i].value === 'Confirmed') hasConfirmed = true;
                    if (ddl.options[i].value === 'Closed') hasClosed = true;
                }
                if (!hasConfirmed) {
                    var opt = document.createElement('option');
                    opt.value = 'Confirmed';
                    opt.text = 'Confirmed';
                    ddl.insertBefore(opt, ddl.options[0]);
                }
                if (!hasClosed) {
                    var opt2 = document.createElement('option');
                    opt2.value = 'Closed';
                    opt2.text = 'Closed';
                    ddl.appendChild(opt2);
                }
            }

            function removeConfirmedOption(ddl) {
                for (var i = 0; i < ddl.options.length; i++) {
                    if (ddl.options[i].value === 'Confirmed') {
                        ddl.remove(i);
                        break;
                    }
                }
                ddl.value = 'Closed';
            }

            var currentRawTravelDate = '';
            var currentTravelDatesText = '';

            function openCloseTripModal(leadCode, name, phone, dest, travelDates, currentStatus, rawTravelDate) {
                currentRawTravelDate = rawTravelDate || '';
                currentTravelDatesText = travelDates || '';

                var hfLead = document.getElementById('<%= hfCloseLeadCode.ClientID %>');
                if (hfLead) hfLead.value = leadCode;

                document.getElementById('closeLeadId').textContent = '#' + leadCode;
                document.getElementById('closeCustName').textContent = name;
                document.getElementById('closeCustPhone').textContent = phone;
                document.getElementById('closeDest').textContent = dest;
                document.getElementById('closeTravelDates').textContent = travelDates;

                var ddl = document.getElementById('<%= ddlCloseStatus.ClientID %>');
                var alertLocked = document.getElementById('statusLockedAlert');
                var btnConfirm = document.getElementById('<%= btnConfirmCloseTrip.ClientID %>');

                currentStatus = currentStatus || 'Confirmed';

                if (currentStatus === 'Closed') {
                    // Closed: remove Confirmed so it's locked
                    removeConfirmedOption(ddl);
                    ddl.disabled = true;
                    if (alertLocked) alertLocked.classList.remove('d-none');
                    if (btnConfirm) {
                        btnConfirm.disabled = true;
                        btnConfirm.className = 'btn btn-sm btn-secondary px-3 text-white';
                    }
                } else {
                    // Confirmed: default must show Confirmed!
                    ensureBothOptions(ddl);
                    ddl.disabled = false;
                    ddl.value = 'Confirmed';
                    if (alertLocked) alertLocked.classList.add('d-none');
                    if (btnConfirm) {
                        btnConfirm.disabled = false;
                        btnConfirm.className = 'btn btn-sm btn-danger px-3 text-white';
                    }
                }

                var modalEl = document.getElementById('modalCloseTrip');
                if (modalEl && typeof bootstrap !== 'undefined') {
                    var modal = bootstrap.Modal.getOrCreateInstance(modalEl);
                    modal.show();
                }
            }

            function handleModalStatusChange(ddl) {
                if (ddl.value === 'Closed') {
                    if (currentRawTravelDate) {
                        var today = new Date();
                        today.setHours(0, 0, 0, 0);
                        var parts = currentRawTravelDate.split('-');
                        if (parts.length === 3) {
                            var tDate = new Date(parseInt(parts[0]), parseInt(parts[1]) - 1, parseInt(parts[2]));
                            tDate.setHours(0, 0, 0, 0);
                            if (tDate > today) {
                                alert('Trip cannot be closed before the travel date (' + currentTravelDatesText + '). The tour has not completed yet.');
                                ddl.value = 'Confirmed';
                                return;
                            }
                        }
                    }
                    removeConfirmedOption(ddl);
                    var alertLocked = document.getElementById('statusLockedAlert');
                    if (alertLocked) alertLocked.classList.remove('d-none');
                }
            }

            function validateBeforeClose() {
                var ddl = document.getElementById('<%= ddlCloseStatus.ClientID %>');
                if (ddl && ddl.value === 'Closed' && currentRawTravelDate) {
                    var today = new Date();
                    today.setHours(0, 0, 0, 0);
                    var parts = currentRawTravelDate.split('-');
                    if (parts.length === 3) {
                        var tDate = new Date(parseInt(parts[0]), parseInt(parts[1]) - 1, parseInt(parts[2]));
                        tDate.setHours(0, 0, 0, 0);
                        if (tDate > today) {
                            alert('Trip cannot be closed before the travel date (' + currentTravelDatesText + '). The tour has not completed yet.');
                            return false;
                        }
                    }
                }
                return true;
            }

            // Run filter on initial load so only 'Confirmed' shows by default
            document.addEventListener('DOMContentLoaded', function () {
                filterBookings();
            });
        </script>
</asp:Content>
