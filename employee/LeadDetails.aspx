<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="LeadDetails.aspx.cs" Inherits="LeadDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Lead Details & History | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-2">
        <ol class="breadcrumb small mb-0">
            <li class="breadcrumb-item"><a href="Dashboard.aspx" class="text-decoration-none text-success">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="MyLeads.aspx" class="text-decoration-none text-success">My Leads</a></li>
            <li class="breadcrumb-item active" aria-current="page">
                <asp:Literal ID="litLeadBreadcrumb" runat="server" Mode="Encode" />
            </li>
        </ol>
    </nav>




    
    <div class="row g-4">
        <!-- Main Column -->
        <div class="col-12 ">

            <!-- 1. Customer Information -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-person text-success"></i>Customer Information</h6>
                </div>

                <div class="card-body">
                    <div class="row g-3">

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Customer Name</span>
                            <span class="fw-bold text-dark">
                                <asp:Literal ID="litDName" runat="server" Mode="Encode" />
                            </span>
                        </div>

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Primary Mobile</span>
                            <asp:HyperLink ID="lnkDPhone" runat="server"
                                CssClass="fw-bold text-dark text-decoration-none" />
                        </div>

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Alternate Mobile</span>
                            <span class="text-muted">
                                <asp:Literal ID="litDAltPhone" runat="server" Mode="Encode" />
                            </span>
                        </div>

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Customer City</span>
                            <span class="fw-semibold text-dark">
                                <asp:Literal ID="litDCity" runat="server" Mode="Encode" />
                            </span>
                        </div>

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Lead Code</span>
                            <span class="fw-semibold text-success">
                                <asp:Literal ID="litLeadCode" runat="server" Mode="Encode" />
                            </span>
                        </div>

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Created By</span>
                            <span class="text-dark">
                                <asp:Literal ID="litDCreatedBy" runat="server" Mode="Encode" />
                            </span>
                        </div>

                    </div>
                </div>
            </div>

            <!-- 2. Travel Requirements -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-geo-alt text-success"></i>Travel Requirements & Preferences</h6>
                </div>

                <div class="card-body">
                    <div class="row g-3">

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Destination</span>
                            <span class="fw-bold text-primary">
                                <asp:Literal ID="litDDest" runat="server" Mode="Encode" />
                            </span>
                        </div>

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Tentative Travel Date</span>
                            <span class="fw-semibold text-dark">
                                <asp:Literal ID="litDDate" runat="server" Mode="Encode" />
                            </span>
                        </div>

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Lead Status</span>
                            <span class="badge bg-light text-dark border">
                                <asp:Literal ID="litDStatus" runat="server" Mode="Encode" />
                            </span>
                        </div>

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Lead Priority</span>
                            <span class="badge bg-light text-dark border">
                                <asp:Literal ID="litDPriority" runat="server" Mode="Encode" />
                            </span>
                        </div>

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Next Follow-up</span>
                            <span class="fw-semibold text-dark">
                                <asp:Literal ID="litDFollowup" runat="server" Mode="Encode" />
                            </span>
                        </div>

                        <div class="col-6 col-md-4">
                            <span class="text-muted small d-block">Assigned Employee ID</span>
                            <span class="fw-semibold text-dark">
                                <asp:Literal ID="litDAssignedEmployee" runat="server" Mode="Encode" />
                            </span>
                        </div>

                    </div>

                    <hr class="my-3 text-muted" />

                    <div>
                        <span class="text-muted small d-block mb-1">Customer Remarks & Specific Requests</span>
                        <div class="p-3 bg-light rounded text-dark small">
                            <asp:Literal ID="litDNotes" runat="server" Mode="Encode" />
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
    


    <!-- Script to dynamically load customer details from Query String ?id=... -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var params = new URLSearchParams(window.location.search);
            var leadId = params.get('id');

            var leadsDatabase = {
                'NJ-10302': {
                    name: 'Ananya Mishra',
                    phone: '+91 94521 88321',
                    altPhone: '+91 94150 11000',
                    city: 'Deoria',
                    email: 'ananya.mishra@example.com',
                    dest: 'Dubai Luxury Tour (5N/6D)',
                    date: '20 Dec 2026',
                    pax: '2 Pax (Couple)',
                    budget: '₹1,85,000',
                    source: 'Walk-in',
                    owner: 'Priya Sharma (Sales)',
                    addedBy: 'Priya Sharma',
                    assigned: 'Priya Sharma',
                    status: 'Confirmed',
                    statusClass: 'badge-status-confirmed',
                    priority: 'Hot',
                    notes: 'Advance booking deposit received ₹50,000. 5-Star Dubai Marina hotel confirmed. Desert Safari and Burj Khalifa tickets booked.',
                    calls: [
                        { employee: 'Priya Sharma (Sales)', outcome: 'Connected', badge: 'bg-success-subtle text-success', time: 'Today, 11:30 AM', remarks: 'Advance payment received. Shared payment receipt and passport verification forms.', next: 'Completed' },
                        { employee: 'Priya Sharma (Sales)', outcome: 'Interested', badge: 'bg-primary-subtle text-primary', time: 'Yesterday, 04:00 PM', remarks: 'Discussed luxury hotel options and flight timings from Lucknow. Client agreed on final package price.', next: 'Today, 11:30 AM' }
                    ]
                },
                'NJ-10306': {
                    name: 'Dr. Arvind Kumar',
                    phone: '+91 98390 12345',
                    altPhone: '+91 94500 22334',
                    city: 'Gorakhpur (Medical College)',
                    email: 'dr.arvind@example.com',
                    dest: 'Char Dham Yatra by Helicopter',
                    date: '05 May 2027',
                    pax: '4 Pax (Senior Citizens)',
                    budget: '₹4,50,000',
                    source: 'Field Visit',
                    owner: 'Priya Sharma (Sales)',
                    addedBy: 'Priya Sharma',
                    assigned: 'Priya Sharma',
                    status: 'New',
                    statusClass: 'badge-status-new',
                    priority: 'Hot',
                    notes: 'High-budget pilgrimage VIP helicopter booking inquiry from Dehradun. Senior citizens require wheelchair assistance.',
                    calls: [
                        { employee: 'Priya Sharma (Sales)', outcome: 'Interested', badge: 'bg-primary-subtle text-primary', time: 'Today, 10:15 AM', remarks: 'Client verified pilgrimage intent. Requested helicopter VIP pricing for 4 senior family members.', next: 'Today, 02:30 PM' }
                    ]
                },
                'NJ-10314': {
                    name: 'Preeti Agrawal',
                    phone: '+91 99180 88990',
                    altPhone: '+91 98390 44556',
                    city: 'Basti',
                    email: 'preeti.agrawal@example.com',
                    dest: 'Dubai 5N Luxury Package',
                    date: '25 Nov 2026',
                    pax: '5 Pax (Family)',
                    budget: '₹2,60,000',
                    source: 'Google',
                    owner: 'Priya Sharma (Sales)',
                    addedBy: 'Priya Sharma',
                    assigned: 'Priya Sharma',
                    status: 'Pending',
                    statusClass: 'badge-status-pending',
                    priority: 'Warm',
                    notes: 'Family trip. Requested family connecting rooms in Bur Dubai or Downtown.',
                    calls: [
                        { employee: 'Priya Sharma (Sales)', outcome: 'Call Back Later', badge: 'bg-warning-subtle text-dark', time: 'Today, 09:30 AM', remarks: 'Customer was at clinic; asked to call back after 06:00 PM for Dubai hotel comparison.', next: 'Today, 06:00 PM' }
                    ]
                }
            };

            if (leadId && leadsDatabase[leadId]) {
                var d = leadsDatabase[leadId];
                document.getElementById('lblLeadId').textContent = '#' + leadId;
                document.getElementById('leadBreadcrumbId').textContent = '#' + leadId + ' Details';
                document.getElementById('lblCustomerName').textContent = d.name;
                document.getElementById('lblSubtitle').textContent = d.dest + ' • ' + d.pax + ' • ' + d.city;
                document.getElementById('txtDName').textContent = d.name;
                document.getElementById('txtDPhone').textContent = d.phone;
                document.getElementById('txtDPhone').href = 'tel:' + d.phone;
                document.getElementById('txtDAltPhone').textContent = d.altPhone;
                document.getElementById('txtDCity').textContent = d.city;
                document.getElementById('txtDEmail').textContent = d.email;
                document.getElementById('txtDDest').textContent = d.dest;
                document.getElementById('txtDDate').textContent = d.date;
                document.getElementById('txtDPax').textContent = d.pax;
                document.getElementById('txtDBudget').textContent = d.budget;
                document.getElementById('txtDSource').textContent = d.source;
                document.getElementById('txtDNotes').textContent = d.notes;

                document.getElementById('alertOwnerName').textContent = d.owner;
                document.getElementById('alertAddedBy').textContent = d.addedBy;
                document.getElementById('alertAssignedName').textContent = d.assigned;

                document.getElementById('sideLeadOwner').textContent = d.owner;
                document.getElementById('sideAddedBy').textContent = d.addedBy;
                document.getElementById('sideAssignedEmp').textContent = d.assigned;
                document.getElementById('sideLeadSource').textContent = d.source;

                var statusEl = document.getElementById('lblLeadStatus');
                statusEl.textContent = d.status;
                statusEl.className = 'badge ' + d.statusClass;

                var pEl = document.getElementById('lblLeadPriority');
                pEl.className = 'badge badge-priority-' + d.priority.toLowerCase();
                pEl.innerHTML = (d.priority === 'Hot' ? '<i class="bi bi-fire me-1"></i>' : '') + d.priority + ' Priority';

                // Edit inputs
                document.getElementById('editCustName').value = d.name;
                document.getElementById('editCustPhone').value = d.phone;
                document.getElementById('editCustCity').value = d.city;
                document.getElementById('editCustDest').value = d.dest;
                document.getElementById('editCustBudget').value = d.budget;
                document.getElementById('modalCallCustName').textContent = d.name + ' (#' + leadId + ')';
                document.getElementById('modalCallCustPhone').textContent = d.phone + ' • ' + d.dest;

                // Quick dial
                var callBtn = document.getElementById('btnCallCustomer');
                if (callBtn) {
                    callBtn.href = 'tel:' + d.phone;
                    callBtn.innerHTML = '<i class="bi bi-telephone-outbound me-2"></i> Call: ' + d.phone;
                }
            }
        });
    </script>
</asp:Content>
