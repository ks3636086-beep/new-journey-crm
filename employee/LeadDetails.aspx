<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="LeadDetails.aspx.cs" Inherits="LeadDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Lead Details & History | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb & Top Action Bar -->
    <div class="d-flex flex-wrap justify-content-between align-items-center mb-3 gap-2">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb small mb-0">
                <li class="breadcrumb-item"><a href="Dashboard.aspx" class="text-decoration-none text-success">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="MyLeads.aspx" class="text-decoration-none text-success">My Leads</a></li>
                <li class="breadcrumb-item active" aria-current="page">
                    <asp:Literal ID="litLeadBreadcrumb" runat="server" Mode="Encode" Text="Lead Details" />
                </li>
            </ol>
        </nav>
        <div class="d-flex align-items-center gap-2">
            <a href="MyLeads.aspx" class="btn btn-outline-secondary btn-sm">
                <i class="bi bi-arrow-left me-1"></i>Back to Leads
            </a>
            <button type="button" class="btn btn-nj-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateCallModal">
                <i class="bi bi-telephone-forward me-1"></i>Update Call
            </button>
        </div>
    </div>

    <!-- Lead Header Banner -->
    <div class="card mb-3 border-0 shadow-sm" style="background: linear-gradient(135deg, #0b2545 0%, #134074 100%); color: #fff;">
        <div class="card-body p-3">
            <div class="d-flex flex-wrap justify-content-between align-items-center gap-2">
                <div>
                    <span class="badge bg-white text-dark mb-1">
                        #<asp:Literal ID="litLeadCode" runat="server" Mode="Encode" />
                    </span>
                    <h4 class="mb-0 fw-bold">
                        <asp:Literal ID="litDName" runat="server" Mode="Encode" />
                    </h4>
                    <div class="small opacity-75 mt-1">
                        <i class="bi bi-geo-alt me-1"></i>Destination: <span class="fw-semibold text-white"><asp:Literal ID="litDDest" runat="server" Mode="Encode" /></span>
                    </div>
                </div>
                <div class="text-md-end">
                    <div class="mb-1">
                        <span class="badge bg-warning text-dark px-2 py-1">
                            <i class="bi bi-flag-fill me-1"></i><asp:Literal ID="litDPriority" runat="server" Mode="Encode" /> Priority
                        </span>
                    </div>
                    <div>
                        <span class="badge bg-light text-primary px-2 py-1">
                            <i class="bi bi-info-circle me-1"></i>Status: <asp:Literal ID="litDStatus" runat="server" Mode="Encode" />
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-3">
        <!-- 1. Left Column: Customer & Trip Profile -->
        <div class="col-12 col-lg-7">
            
            <div class="card mb-3 shadow-sm border">
                <div class="card-header bg-white py-2 border-bottom">
                    <h6 class="mb-0 fw-bold text-dark">
                        <i class="bi bi-person-circle text-primary me-2"></i>Customer & Trip Information
                    </h6>
                </div>
                <div class="card-body p-3">
                    <div class="row g-3">
                        <div class="col-6 col-md-6">
                            <span class="text-muted small d-block">Primary Mobile</span>
                            <asp:HyperLink ID="lnkDPhone" runat="server" CssClass="fw-bold text-success text-decoration-none">
                                <i class="bi bi-telephone-outbound me-1"></i>-
                            </asp:HyperLink>
                        </div>

                        <div class="col-6 col-md-6">
                            <span class="text-muted small d-block">Alternate Mobile</span>
                            <span class="fw-semibold text-dark">
                                <asp:Literal ID="litDAltPhone" runat="server" Mode="Encode" Text="-" />
                            </span>
                        </div>

                        <div class="col-6 col-md-6">
                            <span class="text-muted small d-block">Customer City</span>
                            <span class="fw-semibold text-dark">
                                <i class="bi bi-building text-muted me-1"></i>
                                <asp:Literal ID="litDCity" runat="server" Mode="Encode" Text="-" />
                            </span>
                        </div>

                        <div class="col-6 col-md-6">
                            <span class="text-muted small d-block">Tentative Travel Date</span>
                            <span class="fw-semibold text-dark">
                                <i class="bi bi-calendar3 text-muted me-1"></i>
                                <asp:Literal ID="litDDate" runat="server" Mode="Encode" Text="-" />
                            </span>
                        </div>

                        <div class="col-6 col-md-6">
                            <span class="text-muted small d-block">Next Follow-up</span>
                            <span class="fw-bold text-danger">
                                <i class="bi bi-clock me-1"></i>
                                <asp:Literal ID="litDFollowup" runat="server" Mode="Encode" Text="-" />
                            </span>
                        </div>

                        <div class="col-6 col-md-6">
                            <span class="text-muted small d-block">Created By (Lead Owner)</span>
                            <span class="fw-semibold text-dark">
                                <i class="bi bi-person-check me-1"></i>
                                <asp:Literal ID="litDCreatedBy" runat="server" Mode="Encode" Text="-" />
                            </span>
                        </div>

                        <div class="col-12">
                            <span class="text-muted small d-block">Assigned Staff</span>
                            <span class="badge bg-primary-subtle text-primary">
                                <asp:Literal ID="litDAssignedEmployee" runat="server" Mode="Encode" Text="-" />
                            </span>
                        </div>
                    </div>

                    <hr class="my-3 text-muted" />

                    <div>
                        <span class="text-muted small d-block mb-1 fw-semibold">
                            <i class="bi bi-card-text me-1"></i>Client Requirements & Notes:
                        </span>
                        <div class="p-3 bg-light rounded text-dark small border">
                            <asp:Literal ID="litDNotes" runat="server" Mode="Encode" Text="No specific notes provided." />
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- 2. Right Column: Call & Follow-up History -->
        <div class="col-12 col-lg-5">
            <div class="card shadow-sm border h-100">
                <div class="card-header bg-white py-2 border-bottom d-flex justify-content-between align-items-center">
                    <h6 class="mb-0 fw-bold text-dark">
                        <i class="bi bi-clock-history text-primary me-2"></i>Call & Follow-up History
                    </h6>
                    <button type="button" class="btn btn-nj-outline btn-sm py-0 px-2" data-bs-toggle="modal" data-bs-target="#updateCallModal">
                        <i class="bi bi-plus-lg me-1"></i>Log Call
                    </button>
                </div>
                <div class="card-body p-3">
                    <div class="call-history-list">
                        <!-- Repeater for Call Logs -->
                        <asp:Repeater ID="rptCallHistory" runat="server">
                            <ItemTemplate>
                                <div class="p-2 mb-2 bg-light border rounded position-relative">
                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                        <span class='badge <%# Eval("call_status").ToString().ToLower() == "answered" ? "bg-success-subtle text-success" : (Eval("call_status").ToString().ToLower() == "busy" ? "bg-warning-subtle text-warning" : "bg-secondary-subtle text-secondary") %>'>
                                            <i class="bi bi-telephone-outbound me-1"></i><%# Eval("call_status") %>
                                        </span>
                                        <small class="text-muted">
                                            <i class="bi bi-calendar-event me-1"></i><%# Eval("call_date", "{0:dd MMM yyyy, hh:mm tt}") %>
                                        </small>
                                    </div>
                                    <div class="small text-dark mb-1">
                                        <%# Eval("remarks") == DBNull.Value || string.IsNullOrWhiteSpace(Eval("remarks").ToString()) ? "<em class='text-muted'>No remarks recorded.</em>" : Eval("remarks") %>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center small text-muted border-top pt-1 mt-1">
                                        <span><i class="bi bi-person me-1"></i>By: <strong><%# Eval("called_by") %></strong></span>
                                        <span>Next: <strong><%# Eval("next_followup_date") == DBNull.Value ? "-" : Eval("next_followup_date", "{0:dd MMM, hh:mm tt}") %></strong></span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <!-- Empty State if no calls yet -->
                        <asp:PlaceHolder ID="phEmptyCallHistory" runat="server" Visible="false">
                            <div class="text-center py-4 text-muted">
                                <i class="bi bi-chat-left-dots fs-1 d-block mb-2 text-secondary"></i>
                                <div class="fw-semibold text-dark">No Call History Yet</div>
                                <small>Click "Update Call" or "Log Call" to record the first conversation.</small>
                            </div>
                        </asp:PlaceHolder>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 3. Modal for Updating Call Details -->
    <div class="modal fade" id="updateCallModal" tabindex="-1" aria-labelledby="updateCallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">

                <div class="modal-header border-bottom py-2">
                    <h6 class="modal-title fw-bold" id="updateCallModalLabel">
                        <i class="bi bi-telephone-forward text-success me-1"></i>Update Call
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <asp:HiddenField ID="hfLeadCode" runat="server" />

                    <!-- Quick Customer Banner -->
                    <div class="mb-3 p-2 bg-light rounded d-flex justify-content-between align-items-center border">
                        <div>
                            <asp:Label ID="lblModalClientName" runat="server"
                                Text="Client" CssClass="fw-semibold small d-block text-dark" />
                            <asp:Label ID="lblModalClientPhone" runat="server"
                                Text="+91" CssClass="text-muted small" />
                        </div>
                        <span class="badge bg-primary-subtle text-primary">Follow-up</span>
                    </div>

                    <!-- Call Status -->
                    <div class="mb-3">
                        <label class="form-label small fw-semibold">
                            Call Status <span class="text-danger">*</span>
                        </label>
                        <asp:DropDownList ID="ddlCallStatus" runat="server" CssClass="form-select form-select-sm">
                            <asp:ListItem Text="-- Select Status --" Value="" />
                            <asp:ListItem Text="Answered" Value="Answered" />
                            <asp:ListItem Text="Not Answered" Value="Not Answered" />
                            <asp:ListItem Text="Busy" Value="Busy" />
                            <asp:ListItem Text="Switched Off" Value="Switched Off" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCallStatus" runat="server"
                            ControlToValidate="ddlCallStatus"
                            InitialValue=""
                            ErrorMessage="Please select call status."
                            CssClass="text-danger small"
                            Display="Dynamic"
                            ValidationGroup="CallUpdate" />
                    </div>

                    <!-- Trip Status (3 Clean Options) -->
                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Trip / Lead Status</label>
                        <asp:DropDownList ID="ddlTripStatus" runat="server" CssClass="form-select form-select-sm">
                            <asp:ListItem Text="In Process (Follow-up)" Value="" />
                            <asp:ListItem Text="Trip Confirmed" Value="Confirmed" />
                            <asp:ListItem Text="Cancelled" Value="Not Interested" />
                        </asp:DropDownList>
                    </div>

                    <!-- Next Follow-up Date & Time -->
                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Next Follow-up Date & Time</label>
                        <asp:TextBox ID="txtNextFollowUp" runat="server" TextMode="DateTimeLocal" CssClass="form-control form-control-sm" />
                    </div>

                    <!-- Call Remarks -->
                    <div class="mb-2">
                        <label class="form-label small fw-semibold">Call Remarks</label>
                        <asp:TextBox ID="txtCallRemarks" runat="server" TextMode="MultiLine" Rows="3"
                            CssClass="form-control form-control-sm"
                            placeholder="Enter conversation details, client response, notes..." />
                    </div>
                </div>

                <div class="modal-footer border-top py-2">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">
                        Cancel
                    </button>
                    <asp:Button ID="btnSaveCallUpdate" runat="server"
                        Text="Save"
                        CssClass="btn btn-nj-primary btn-sm"
                        ValidationGroup="CallUpdate" 
                        OnClick="btnSaveCallUpdate_Click" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
