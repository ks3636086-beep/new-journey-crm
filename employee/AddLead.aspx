<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AddLead.aspx.cs" Inherits="AddLead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add Lead | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Record New Travel Inquiry</h2>
            <p class="nj-page-subtitle">Add a customer inquiry. Leads added by you are accredited to your personal sales performance.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <a href="MyLeads.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-arrow-left"></i> Back to My Leads
            </a>
        </div>
    </div>

    <!-- Attribution Info Alert -->
    <div class="alert alert-light border py-2 px-3 mb-4 small d-flex align-items-center gap-2">
        <i class="bi bi-check-circle-fill text-success fs-5"></i>
        <div>
            <strong>Sales Credit Guarantee:</strong> As the creator, you (<strong>Priya Sharma</strong>) will be assigned as the permanent <em>Lead Owner</em> for this inquiry.
        </div>
    </div>

    <div class="row g-4">
        <!-- Main Form Column -->
        <div class="col-12 col-lg-8">
            <!-- 1. Customer Details Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-person text-success"></i> 1. Customer Contact Information</h6>
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
                            <label class="form-label">Customer Location / City <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="txtLocation" placeholder="e.g. Gorakhpur (Medical Road / Golghar)" required="required" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Email Address (Optional)</label>
                            <input type="email" class="form-control" id="txtEmail" placeholder="client@example.com" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- 2. Tour Requirements Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-geo-alt text-success"></i> 2. Tour Requirements & Preferences</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">Travel Destination <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="txtDestination" placeholder="e.g. Kashmir, Dubai, Goa, Thailand, Kerala..." required="required" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Travel Date (Tentative)</label>
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
                            <label class="form-label">Estimated Budget</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light">₹</span>
                                <input type="text" class="form-control" id="txtBudget" placeholder="e.g. 80,000" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 3. Lead Source & Ownership Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-award text-success"></i> 3. Lead Source & Status Details</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">Lead Source <span class="text-danger">*</span></label>
                            <select class="form-select" id="ddlLeadSource" required="required">
                                <option value="Google">Google / Internet Inquiry</option>
                                <option value="Field Visit">Field Visit / Counter Meeting</option>
                                <option value="Walk-in">Walk-in Client (Gorakhpur Office)</option>
                                <option value="Referral">Referral / Past Client</option>
                                <option value="Other">Other (Social Media / WhatsApp)</option>
                            </select>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Lead Owner (Sales Credit)</label>
                            <input type="text" class="form-control bg-light" value="Priya Sharma (You)" readonly="readonly" />
                            <div class="form-text text-success"><i class="bi bi-shield-check"></i> Permanent owner credit for this lead.</div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Lead Priority <span class="text-danger">*</span></label>
                            <select class="form-select" id="ddlPriority">
                                <option value="Hot" selected="selected">Hot (Immediate / High Urgency)</option>
                                <option value="Warm">Warm (Planning within 1-2 months)</option>
                                <option value="Cold">Cold (Tentative / Exploring rates)</option>
                            </select>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Initial Status <span class="text-danger">*</span></label>
                            <select class="form-select" id="ddlStatus">
                                <option value="New" selected="selected">New</option>
                                <option value="Interested">Interested</option>
                                <option value="Pending">Pending</option>
                                <option value="Confirmed">Confirmed</option>
                            </select>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Special Requirements / Notes</label>
                            <textarea class="form-control" id="txtRemarks" rows="3" placeholder="Hotel preferences, flight from Gorakhpur, sightseeing requests, meal preference (Veg/Jain)..."></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="d-flex align-items-center gap-2 mb-4">
                <button type="button" class="btn btn-nj-primary px-4" onclick="saveLeadSample();">
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
                    <h6><i class="bi bi-lightbulb text-warning"></i> Quick Travel Tips</h6>
                </div>
                <div class="card-body small text-muted">
                    <ul class="ps-3 mb-0">
                        <li class="mb-2"><strong>Confirm Pax Early:</strong> Knowing exact adult/child count helps calculate flight and extra-bed charges accurately.</li>
                        <li class="mb-2"><strong>Domestic vs International:</strong> Check passport validity (6+ months) for Dubai, Thailand and Maldives inquiries.</li>
                        <li class="mb-2"><strong>First Follow-up:</strong> Setting a next-day follow-up increases package closure probability by over 40%.</li>
                    </ul>
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
                                <span class="fw-bold">Dr. Arvind Kumar</span>
                                <span class="badge badge-priority-hot">Hot</span>
                            </div>
                            <div class="text-muted">Char Dham Yatra &bull; 4 Pax</div>
                        </li>
                        <li class="list-group-item p-3">
                            <div class="d-flex justify-content-between">
                                <span class="fw-bold">Ananya Mishra</span>
                                <span class="badge badge-status-confirmed">Confirmed</span>
                            </div>
                            <div class="text-muted">Dubai Tour &bull; 2 Pax</div>
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
                <p class="text-muted small mb-3">Customer inquiry has been registered under your account. You can track it in My Leads.</p>
                <div class="d-grid gap-2">
                    <a href="MyLeads.aspx" class="btn btn-nj-primary btn-sm">Go to My Leads</a>
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Add Another Lead</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function saveLeadSample() {
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
