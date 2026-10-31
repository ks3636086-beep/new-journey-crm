<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AddLead.aspx.cs" Inherits="AddLead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add Lead | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Add New Travel Lead</h2>
            <p class="nj-page-subtitle">Record a new travel inquiry with proper sales attribution and assignment.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <a href="AllLeads.aspx" class="btn btn-nj-outline btn-sm">
                <i class="bi bi-arrow-left"></i> Back to Leads
            </a>
        </div>
    </div>

    <!-- UI Alert on Attribution -->
    <div class="alert alert-light border py-2 px-3 mb-4 small d-flex align-items-center gap-2">
        <i class="bi bi-info-circle-fill text-success fs-5"></i>
        <div>
            <strong>Attribution Guideline:</strong> <em>Lead Owner</em> receives credit for sourcing the inquiry. <em>Assigned Employee</em> can be any team member assigned for calling and day-to-day conversion.
        </div>
    </div>

    <div class="row g-4">
        <!-- Main Form Column -->
        <div class="col-12 col-lg-8">
            <!-- Section 1: Client Information -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-person text-success"></i> 1. Client Contact Details</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">Client Full Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="txtClientName" placeholder="e.g. Ramesh Chandra Verma" required="required" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Mobile Number <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light">+91</span>
                                <input type="tel" class="form-control" id="txtMobile" placeholder="98765 43210" required="required" />
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
                            <label class="form-label">Client Location / City <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="txtCity" placeholder="e.g. Gorakhpur (Golghar / Civil Lines)" required="required" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Section 2: Travel Requirements -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-geo-alt text-success"></i> 2. Travel & Package Requirements</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">Travel Destination <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="txtDestination" placeholder="e.g. Kashmir, Dubai, Goa, Thailand..." required="required" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Tentative Travel Date (Optional)</label>
                            <input type="date" class="form-control" id="txtTravelDate" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Package Interest <span class="text-danger">*</span></label>
                            <select class="form-select" id="ddlPackageInterest">
                                <option value="Domestic Holiday Package">Domestic Holiday Package (Kashmir, Himachal, Kerala, Goa)</option>
                                <option value="International Tour">International Tour (Dubai, Thailand, Singapore, Bali, Maldives)</option>
                                <option value="Honeymoon Special">Honeymoon Special Package</option>
                                <option value="Family Holiday Package">Family Holiday Package</option>
                                <option value="Pilgrimage / Spiritual">Pilgrimage (Char Dham, Ayodhya-Varanasi, Vaishno Devi)</option>
                                <option value="Corporate / Group Tour">Corporate / Group Tour</option>
                                <option value="Custom Itinerary / Flight + Hotel">Custom Itinerary / Flight + Hotel</option>
                            </select>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Number of Travelers / Budget Range</label>
                            <div class="row g-2">
                                <div class="col-6">
                                    <input type="number" class="form-control" placeholder="Pax (e.g. 4)" min="1" />
                                </div>
                                <div class="col-6">
                                    <input type="text" class="form-control" placeholder="Budget (₹)" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Section 3: Lead Attribution & Ownership -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-award text-success"></i> 3. Lead Attribution & Ownership</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">Lead Source <span class="text-danger">*</span></label>
                            <select class="form-select" id="ddlLeadSource" required="required">
                                <option value="Google / Internet">Google / Internet (Website, SEO, Ads)</option>
                                <option value="Field Visit">Field Visit (Direct meeting / Local promotion)</option>
                                <option value="Sales">Sales (Inbound counter inquiry)</option>
                                <option value="Admin Entry">Admin Entry (Direct director referral)</option>
                                <option value="Referral">Referral (Existing client recommendation)</option>
                                <option value="Other">Other (Social Media, WhatsApp, B2B agent)</option>
                            </select>
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label">Lead Owner (Receives Credit) <span class="text-danger">*</span></label>
                            <select class="form-select border-success" id="ddlLeadOwner" required="required">
                                <option value="Admin">Admin (Direct Agency Lead)</option>
                                <option value="Priya Sharma">Priya Sharma (Sales)</option>
                                <option value="Rakesh Yadav">Rakesh Yadav (Field)</option>
                                <option value="Pooja Srivastava">Pooja Srivastava (Calling)</option>
                                <option value="Manoj Tiwari">Manoj Tiwari (Sales)</option>
                                <option value="Vikas Dubey">Vikas Dubey (Field)</option>
                            </select>
                            <div class="form-text text-success"><i class="bi bi-check-circle"></i> This person permanently retains sales credit.</div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label">Added By</label>
                            <input type="text" class="form-control bg-light" value="Admin Portal (Administrator)" readonly="readonly" />
                            <div class="form-text">System tracks who entered the record.</div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label">Assigned Employee (Optional)</label>
                            <select class="form-select" id="ddlAssignedEmployee">
                                <option value="">-- Unassigned (Assign Later) --</option>
                                <option value="Priya Sharma">Priya Sharma (Sales Team)</option>
                                <option value="Rakesh Yadav">Rakesh Yadav (Field Team)</option>
                                <option value="Pooja Srivastava">Pooja Srivastava (Calling Desk)</option>
                                <option value="Manoj Tiwari">Manoj Tiwari (Sales Team)</option>
                                <option value="Ankita Verma">Ankita Verma (Calling Desk)</option>
                            </select>
                            <div class="form-text">Person responsible for making first contact & follow-ups.</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Section 4: Status, Priority & Follow-up -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-flag text-success"></i> 4. Status, Priority & Next Step</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-4">
                            <label class="form-label">Lead Status <span class="text-danger">*</span></label>
                            <select class="form-select" id="ddlLeadStatus">
                                <option value="New" selected="selected">New</option>
                                <option value="Interested">Interested</option>
                                <option value="Pending">Pending</option>
                                <option value="Confirmed">Confirmed</option>
                                <option value="Not Interested">Not Interested</option>
                                <option value="Closed">Closed</option>
                            </select>
                        </div>

                        <div class="col-12 col-md-4">
                            <label class="form-label">Lead Priority <span class="text-danger">*</span></label>
                            <select class="form-select" id="ddlLeadPriority">
                                <option value="Hot" class="text-danger fw-bold">Hot (High conversion potential)</option>
                                <option value="Warm" selected="selected" class="text-warning fw-bold">Warm (Standard inquiry)</option>
                                <option value="Cold" class="text-info fw-bold">Cold (Low urgency / Long term)</option>
                            </select>
                        </div>

                        <div class="col-12 col-md-4">
                            <label class="form-label">Next Follow-up Date & Time</label>
                            <input type="datetime-local" class="form-control" id="txtFollowUpDate" />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Remarks / Client Notes</label>
                            <textarea class="form-control" id="txtRemarks" rows="3" placeholder="Enter special requests, flight requirements, hotel star rating, meal preferences..."></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="d-flex align-items-center gap-2 mb-4">
                <button type="button" class="btn btn-nj-primary px-4" onclick="handleSaveLead();">
                    <i class="bi bi-check2-circle"></i> Save Lead
                </button>
                <a href="AllLeads.aspx" class="btn btn-outline-secondary">
                    Cancel
                </a>
            </div>
        </div>

        <!-- Right Helper Column -->
        <div class="col-12 col-lg-4">
            <!-- Guidelines Card -->
            <div class="card mb-3">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-lightbulb text-warning"></i> Travel Lead Qualification</h6>
                </div>
                <div class="card-body small">
                    <p class="text-muted mb-2">Follow these quick qualification checks when recording client inquiries for New Journey Holidays:</p>
                    <ul class="ps-3 mb-0 text-muted">
                        <li class="mb-2"><strong>Destinations:</strong> Capture whether travel is domestic or international to assign the right specialist.</li>
                        <li class="mb-2"><strong>Hot Priority:</strong> Tag as <em>Hot</em> if travel date is within 30 days or budget is confirmed.</li>
                        <li class="mb-2"><strong>Lead Ownership:</strong> Always select the team member who generated the inquiry to ensure fair sales commission.</li>
                        <li class="mb-0"><strong>Follow-up Time:</strong> Set immediate next-day follow-up for maximum conversion.</li>
                    </ul>
                </div>
            </div>

            <!-- Summary Preview Box -->
            <div class="card">
                <div class="card-header bg-white">
                    <h6><i class="bi bi-clock-history text-success"></i> Recently Added (Gorakhpur)</h6>
                </div>
                <div class="card-body p-0 small">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item p-3">
                            <div class="d-flex justify-content-between">
                                <span class="fw-bold">Rohit Verma</span>
                                <span class="badge badge-priority-hot">Hot</span>
                            </div>
                            <div class="text-muted">Kashmir 5N/6D &bull; Gorakhpur</div>
                            <div class="text-success small">Owner: Rakesh Yadav</div>
                        </li>
                        <li class="list-group-item p-3">
                            <div class="d-flex justify-content-between">
                                <span class="fw-bold">Ananya Mishra</span>
                                <span class="badge badge-status-confirmed">Confirmed</span>
                            </div>
                            <div class="text-muted">Dubai Tour &bull; Deoria</div>
                            <div class="text-success small">Owner: Priya Sharma</div>
                        </li>
                        <li class="list-group-item p-3">
                            <div class="d-flex justify-content-between">
                                <span class="fw-bold">Dr. Arvind Kumar</span>
                                <span class="badge badge-status-new">New</span>
                            </div>
                            <div class="text-muted">Char Dham Yatra &bull; Gorakhpur</div>
                            <div class="text-success small">Owner: Priya Sharma</div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Success Feedback Modal (UI Only) -->
    <div class="modal fade" id="leadSavedModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content text-center p-3">
                <div class="my-2">
                    <i class="bi bi-check-circle-fill text-success" style="font-size: 3rem;"></i>
                </div>
                <h6 class="fw-bold mb-1">Lead Saved Successfully!</h6>
                <p class="text-muted small mb-3">Sample lead record has been staged in the CRM UI. You can view it in the All Leads directory.</p>
                <div class="d-grid gap-2">
                    <a href="AllLeads.aspx" class="btn btn-nj-primary btn-sm">Go to All Leads</a>
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Add Another Lead</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function handleSaveLead() {
            var name = document.getElementById('txtClientName').value.trim();
            var phone = document.getElementById('txtMobile').value.trim();
            if (!name || !phone) {
                alert('Please enter Client Name and Mobile Number.');
                return;
            }
            var myModal = new bootstrap.Modal(document.getElementById('leadSavedModal'));
            myModal.show();
        }
    </script>
</asp:Content>
