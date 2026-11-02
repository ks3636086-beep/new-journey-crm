<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AddLead.aspx.cs" Inherits="AddLead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add Lead | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Add Travel Lead</h2>
            <p class="nj-page-subtitle">Register a holiday inquiry. Sales employees capture field visits; Calling employees log self-found or inbound leads.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <a href="MyLeads.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-arrow-left"></i> Back to My Leads
            </a>
        </div>
    </div>

    <!-- Attribution Principle Notice -->
    <div class="alert alert-light border py-2 px-3 mb-4 small d-flex align-items-center gap-2">
        <i class="bi bi-shield-check text-success fs-5"></i>
        <div>
            <strong>Business Workflow Rule:</strong> <em>Lead Owner</em> receives credit for sourcing the inquiry. <em>Added By</em> tracks who entered the record. If you found this customer (via field visit, phone or internet), you are accredited as the Lead Owner.
        </div>
    </div>

    <div class="row g-4">
        <!-- Main Form Column -->
        <div class="col-12 col-lg-8">
            <!-- 1. Customer Information Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-person text-success"></i> 1. Customer Information</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">Customer Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="txtCustomerName" placeholder="e.g. Ankit Singhania" required="required" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Mobile Number <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light">+91</span>
                                <input type="tel" class="form-control" id="txtMobileNumber" placeholder="98765 00000" required="required" />
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Alternate Mobile (Optional)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light">+91</span>
                                <input type="tel" class="form-control" id="txtAltMobile" placeholder="94521 00000" />
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Customer Location / City <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="txtLocation" placeholder="e.g. Gorakhpur (Golghar / Medical Road / Civil Lines)" required="required" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- 2. Tour Requirements Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-geo-alt text-success"></i> 2. Travel Requirements & Budget</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">Destination <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="txtDestination" placeholder="e.g. Kashmir, Dubai, Goa, Thailand, Kerala, Char Dham..." required="required" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Tentative Travel Date</label>
                            <input type="date" class="form-control" id="txtTravelDate" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Number of Travellers (Pax) <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-people"></i></span>
                                <input type="number" class="form-control" id="txtPax" placeholder="e.g. 4 (2 Adults, 2 Kids)" min="1" required="required" />
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Estimated Budget (₹)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light">₹</span>
                                <input type="text" class="form-control" id="txtBudget" placeholder="e.g. 95,000" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 3. Lead Source, Ownership & Classification Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-award text-success"></i> 3. Lead Source, Ownership & Classification</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <!-- Lead Source (Exactly as specified: Field Visit, Google, Internet, Referral, Walk-in, Admin/Office, Other) -->
                        <div class="col-12 col-md-6">
                            <label class="form-label">Lead Source <span class="text-danger">*</span></label>
                            <select class="form-select" id="ddlLeadSource" required="required">
                                <option value="Field Visit" selected="selected">Field Visit (On-ground Sales / Client Meeting)</option>
                                <option value="Google">Google (Search Engine Inquiry)</option>
                                <option value="Internet">Internet (Social Media / Website Inquiry)</option>
                                <option value="Referral">Referral (Past Customer Recommendation)</option>
                                <option value="Walk-in">Walk-in (Counter Inquiry at Gorakhpur Office)</option>
                                <option value="Admin/Office">Admin/Office (Directly Assigned Lead)</option>
                                <option value="Other">Other</option>
                            </select>
                            <div class="form-text">Where the customer inquiry originated.</div>
                        </div>

                        <!-- Lead Owner (The person who found/acquired the customer) -->
                        <div class="col-12 col-md-6">
                            <label class="form-label">Lead Owner (Acquired Credit) <span class="text-danger">*</span></label>
                            <input type="text" class="form-control border-success" id="txtLeadOwner" value="Priya Sharma (Current Employee)" />
                            <div class="form-text text-success"><i class="bi bi-shield-check"></i> Receives permanent sales credit for this lead.</div>
                        </div>

                        <!-- Added By (Track who is creating the entry) -->
                        <div class="col-12 col-md-6">
                            <label class="form-label">Added By</label>
                            <input type="text" class="form-control bg-light" value="Priya Sharma (Logged-in Staff)" readonly="readonly" />
                            <div class="form-text">System record of who entered this lead.</div>
                        </div>

                        <!-- Priority: Hot / Warm / Cold -->
                        <div class="col-12 col-md-3">
                            <label class="form-label">Priority (Urgency) <span class="text-danger">*</span></label>
                            <select class="form-select" id="ddlPriority">
                                <option value="Hot" selected="selected" class="text-danger fw-bold">Hot (&lt; 30 Days / Urgent)</option>
                                <option value="Warm" class="text-warning fw-bold">Warm (1-2 Months)</option>
                                <option value="Cold" class="text-info fw-bold">Cold (Long-term)</option>
                            </select>
                        </div>

                        <!-- Lead Status: New, Interested, Pending, Confirmed, Not Interested, Closed -->
                        <div class="col-12 col-md-3">
                            <label class="form-label">Lead Status <span class="text-danger">*</span></label>
                            <select class="form-select" id="ddlStatus">
                                <option value="New" selected="selected">New</option>
                                <option value="Interested">Interested</option>
                                <option value="Pending">Pending</option>
                                <option value="Confirmed">Confirmed</option>
                                <option value="Not Interested">Not Interested</option>
                                <option value="Closed">Closed</option>
                            </select>
                        </div>

                        <!-- Remarks -->
                        <div class="col-12">
                            <label class="form-label">Remarks / Initial Notes</label>
                            <textarea class="form-control" id="txtRemarks" rows="3" placeholder="Hotel rating preference, flight requirements from Gorakhpur, meal preference, sightseeing specifics..."></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="d-flex align-items-center gap-2 mb-4">
                <button type="button" class="btn btn-nj-primary px-4" onclick="handleSaveLead();">
                    <i class="bi bi-check2-circle"></i> Save Lead
                </button>
                <a href="MyLeads.aspx" class="btn btn-outline-secondary">
                    Cancel
                </a>
            </div>
        </div>

        <!-- Right Helper Column -->
        <div class="col-12 col-lg-4">
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-lightbulb text-warning"></i> Guidelines for Roles</h6>
                </div>
                <div class="card-body small text-muted">
                    <div class="mb-3">
                        <span class="badge badge-cat-sales d-inline-block mb-1">For Sales Employees (Field)</span>
                        <p class="mb-0">When meeting clients on field visits in Gorakhpur, Basti, or Deoria, enter their inquiries immediately. You are the permanent <strong>Lead Owner</strong>.</p>
                    </div>
                    <div class="mb-0">
                        <span class="badge badge-cat-calling d-inline-block mb-1">For Calling Employees</span>
                        <p class="mb-0">When you source your own leads via Google, Social Media or referrals, you will be credited as the <strong>Lead Owner</strong>, just like Sales staff.</p>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-clock-history text-success"></i> Recently Added by You</h6>
                </div>
                <div class="card-body p-0 small">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item p-3">
                            <div class="d-flex justify-content-between">
                                <span class="fw-bold">Rohit Verma</span>
                                <span class="badge badge-priority-hot">Hot</span>
                            </div>
                            <div class="text-muted">Kashmir 5N/6D &bull; Gorakhpur</div>
                            <div class="text-success small"><i class="bi bi-award"></i> Lead Owner: Rakesh (Sales)</div>
                        </li>
                        <li class="list-group-item p-3">
                            <div class="d-flex justify-content-between">
                                <span class="fw-bold">Ananya Mishra</span>
                                <span class="badge badge-status-confirmed">Confirmed</span>
                            </div>
                            <div class="text-muted">Dubai Luxury Tour &bull; Deoria</div>
                            <div class="text-success small"><i class="bi bi-award"></i> Lead Owner: Priya (Sales)</div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Success Modal -->
    <div class="modal fade" id="leadSavedModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content text-center p-3">
                <div class="my-2">
                    <i class="bi bi-check-circle-fill text-success" style="font-size: 3rem;"></i>
                </div>
                <h6 class="fw-bold mb-1">Lead Saved Successfully!</h6>
                <p class="text-muted small mb-3">The customer lead has been registered in the CRM with full sales credit attribution.</p>
                <div class="d-grid gap-2">
                    <a href="MyLeads.aspx" class="btn btn-nj-primary btn-sm">View in My Leads</a>
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Add Another Lead</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function handleSaveLead() {
            var name = document.getElementById('txtCustomerName').value.trim();
            var phone = document.getElementById('txtMobileNumber').value.trim();
            if (!name || !phone) {
                alert('Please enter Customer Name and Mobile Number.');
                return;
            }
            var modal = new bootstrap.Modal(document.getElementById('leadSavedModal'));
            modal.show();
        }
    </script>
</asp:Content>