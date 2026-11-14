<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Add-Lead.aspx.cs" Inherits="Add_Lead" %>
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
                <i class="bi bi-arrow-left"></i>Back to My Leads
            </a>
        </div>
    </div>

     

    <!-- Main Full Width Form Container -->
    <div class="row">
        <div class="col-12">
            <div class="card mb-4 shadow-sm border">
                <div class="card-header bg-white py-3">
                    <h6 class="mb-0 fw-bold text-dark">
                        <i class="bi bi-person text-success me-1"></i>1. Client Contact Details
                 </h6>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <!-- Client Contact Details -->
                        <div class="col-12 col-md-6">
                            <label class="form-label">Client Full Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtClientName" runat="server" CssClass="form-control" placeholder="e.g. Ramesh Chandra Verma"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvClientName" runat="server" ControlToValidate="txtClientName" ErrorMessage="Client name is required." CssClass="text-danger small" Display="Dynamic" />
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label">Mobile Number <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light">+91</span>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Phone" MaxLength="10" placeholder="98765 43210"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile number is required." CssClass="text-danger small" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile" ValidationExpression="^[6-9][0-9]{9}$" ErrorMessage="Enter a valid 10-digit mobile number." CssClass="text-danger small" Display="Dynamic" />
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label">Alternate Mobile (Optional)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light">+91</span>
                                <asp:TextBox ID="txtAltMobile" runat="server" CssClass="form-control" TextMode="Phone" MaxLength="10" placeholder="94521 00000"></asp:TextBox>
                            </div>
                            <asp:RegularExpressionValidator ID="revAltMobile" runat="server" ControlToValidate="txtAltMobile" ValidationExpression="^$|^[6-9][0-9]{9}$" ErrorMessage="Enter a valid 10-digit mobile number." CssClass="text-danger small" Display="Dynamic" />
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label">Client Location / City <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="e.g. Gorakhpur (Golghar / Civil Lines)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="Client city is required." CssClass="text-danger small" Display="Dynamic" />
                        </div>

                        <!-- Travel Details -->
                        <div class="col-12 col-md-6">
                            <label class="form-label">Travel Destination <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtDestination" runat="server" CssClass="form-control" placeholder="e.g. Kashmir, Dubai, Goa, Thailand..."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDestination" runat="server" ControlToValidate="txtDestination" ErrorMessage="Travel destination is required." CssClass="text-danger small" Display="Dynamic" />
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label">Tentative Travel Date (Optional)</label>
                            <asp:TextBox ID="txtTravelDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>

                        <!-- Status, Priority & Follow-up -->
                        <div class="col-12 col-md-4">
                            <label class="form-label">Lead Status <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="ddlLeadStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">-- Select Status --</asp:ListItem>
                                <asp:ListItem Value="New">New</asp:ListItem>
                                <asp:ListItem Value="Interested">Interested</asp:ListItem>
                                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                            <%--    <asp:ListItem Value="Confirmed">Confirmed</asp:ListItem>--%>
                                <asp:ListItem Value="Not Interested">Not Interested</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvLeadStatus" runat="server" ControlToValidate="ddlLeadStatus" InitialValue="" ErrorMessage="Please select lead status." CssClass="text-danger small" Display="Dynamic" />
                        </div>

                        <div class="col-12 col-md-4">
                            <label class="form-label">Lead Priority <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="ddlLeadPriority" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">-- Select Priority --</asp:ListItem>
                                <asp:ListItem Value="Hot">Hot (High conversion potential)</asp:ListItem>
                                <asp:ListItem Value="Warm">Warm (Standard inquiry)</asp:ListItem>
                                <asp:ListItem Value="Cold">Cold (Low urgency / Long term)</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvLeadPriority" runat="server" ControlToValidate="ddlLeadPriority" InitialValue="" ErrorMessage="Please select lead priority." CssClass="text-danger small" Display="Dynamic" />
                        </div>
                        <div class="col-12 col-md-4">
                            <label class="form-label">Next Follow-up Date & Time</label>
                            <asp:TextBox ID="txtFollowUpDate" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                        </div>

                        <!-- Remarks / Client Notes -->
                        <div class="col-12">
                            <label class="form-label">Remarks / Client Notes</label>
                            <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter special requests, flight requirements, hotel star rating, meal preferences..."></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="d-flex align-items-center gap-2 mb-4">
                <asp:Button ID="btnSaveLead" runat="server" Text="Save Lead" CssClass="btn btn-nj-primary px-4" OnClick="btnSaveLead_Click"/>
                <a href="AllLeads.aspx" class="btn btn-outline-secondary">Cancel</a>
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
