<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>CRM Settings | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">CRM System Settings</h2>
            <p class="nj-page-subtitle">Configure agency profile, master lookup data, lead priorities and business preferences.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('All settings saved successfully (UI sample).');">
                <i class="bi bi-save"></i> Save All Changes
            </button>
        </div>
    </div>

    <!-- Navigation Tabs for Settings Sections -->
    <ul class="nav nav-tabs mb-4" id="settingsTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active fw-semibold" id="company-tab" data-bs-toggle="tab" data-bs-target="#tab-company" type="button" role="tab">
                <i class="bi bi-building me-1 text-success"></i> Company Information
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-semibold" id="sources-tab" data-bs-toggle="tab" data-bs-target="#tab-sources" type="button" role="tab">
                <i class="bi bi-signpost-split me-1 text-success"></i> Lead Sources
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-semibold" id="statuses-tab" data-bs-toggle="tab" data-bs-target="#tab-statuses" type="button" role="tab">
                <i class="bi bi-check-circle me-1 text-success"></i> Lead Statuses
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-semibold" id="priorities-tab" data-bs-toggle="tab" data-bs-target="#tab-priorities" type="button" role="tab">
                <i class="bi bi-flag me-1 text-success"></i> Lead Priorities
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-semibold" id="preferences-tab" data-bs-toggle="tab" data-bs-target="#tab-preferences" type="button" role="tab">
                <i class="bi bi-sliders me-1 text-success"></i> CRM Preferences
            </button>
        </li>
    </ul>

    <!-- Tabs Content -->
    <div class="tab-content" id="settingsTabContent">
        <!-- 1. Company Information -->
        <div class="tab-pane fade show active" id="tab-company" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white">
                    <h6 class="mb-0"><i class="bi bi-building"></i> Travel Agency Profile</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">Agency Name</label>
                            <input type="text" class="form-control" value="New Journey Holidays" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Tagline / Slogan</label>
                            <input type="text" class="form-control" value="Your Trusted Travel Partner in Eastern UP" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Head Office Address</label>
                            <input type="text" class="form-control" value="2nd Floor, City Center, Golghar, Gorakhpur, Uttar Pradesh" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Postal PIN Code</label>
                            <input type="text" class="form-control" value="273001" />
                        </div>
                        <div class="col-12 col-md-4">
                            <label class="form-label">Official Phone / Hotline</label>
                            <input type="tel" class="form-control" value="+91 94150 12345" />
                        </div>
                        <div class="col-12 col-md-4">
                            <label class="form-label">Official WhatsApp Helpline</label>
                            <input type="tel" class="form-control" value="+91 98390 54321" />
                        </div>
                        <div class="col-12 col-md-4">
                            <label class="form-label">Official Email</label>
                            <input type="email" class="form-control" value="info@newjourneyholidays.com" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">GSTIN Registration Number</label>
                            <input type="text" class="form-control" value="09AAECN1234F1Z8" />
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Travel Agent Registration / License</label>
                            <input type="text" class="form-control" value="UP-TRV-GKP-2024-8891" />
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-white border-top text-end">
                    <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Company details updated (UI sample)!');">
                        Save Company Info
                    </button>
                </div>
            </div>
        </div>

        <!-- 2. Lead Sources -->
        <div class="tab-pane fade" id="tab-sources" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-signpost-split"></i> Configured Lead Sources</h6>
                        <small class="text-muted">Marketing channels where inquiries originate</small>
                    </div>
                    <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Add custom lead source (UI sample).');">
                        <i class="bi bi-plus-lg"></i> Add Source
                    </button>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Source Name</th>
                                    <th>Channel Description</th>
                                    <th>Classification</th>
                                    <th>Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="fw-bold">Google / Internet</span></td>
                                    <td>Website inquiry forms, Google Search ads & local business profile.</td>
                                    <td><span class="badge bg-light text-primary border">Online Channel</span></td>
                                    <td><span class="badge bg-success-subtle text-success">Active</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit source (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold">Field Visit</span></td>
                                    <td>On-ground marketing and in-person consultations by field agents in Eastern UP.</td>
                                    <td><span class="badge bg-light text-warning border">Field Channel</span></td>
                                    <td><span class="badge bg-success-subtle text-success">Active</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit source (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold">Sales</span></td>
                                    <td>Direct walk-in inquiries at New Journey Holidays counter in Golghar.</td>
                                    <td><span class="badge bg-light text-success border">Counter Walk-in</span></td>
                                    <td><span class="badge bg-success-subtle text-success">Active</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit source (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold">Admin Entry</span></td>
                                    <td>Leads entered directly by agency management or directors.</td>
                                    <td><span class="badge bg-light text-dark border">Direct Management</span></td>
                                    <td><span class="badge bg-success-subtle text-success">Active</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit source (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold">Referral</span></td>
                                    <td>Existing travelers recommending friends and family members.</td>
                                    <td><span class="badge bg-light text-info border">Word of Mouth</span></td>
                                    <td><span class="badge bg-success-subtle text-success">Active</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit source (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold">Other</span></td>
                                    <td>Miscellaneous channels, newspapers, banners or partner agency referrals.</td>
                                    <td><span class="badge bg-light text-secondary border">Secondary Channel</span></td>
                                    <td><span class="badge bg-success-subtle text-success">Active</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit source (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3. Lead Statuses -->
        <div class="tab-pane fade" id="tab-statuses" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-check-circle"></i> Lead Status Workflow</h6>
                        <small class="text-muted">Standard stages an inquiry progresses through</small>
                    </div>
                    <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Add custom lead status (UI sample).');">
                        <i class="bi bi-plus-lg"></i> Add Status
                    </button>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Status Name</th>
                                    <th>Badge Preview</th>
                                    <th>Stage Description</th>
                                    <th>Default System State</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="fw-bold">New</span></td>
                                    <td><span class="badge badge-status-new">New</span></td>
                                    <td>Newly recorded inquiry pending first contact or qualification.</td>
                                    <td><span class="badge bg-light text-dark border">Initial State</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit status (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold">Interested</span></td>
                                    <td><span class="badge badge-status-interested">Interested</span></td>
                                    <td>Client verified travel intent, package options or custom itineraries sent.</td>
                                    <td><span class="badge bg-light text-dark border">Active Pipeline</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit status (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold">Pending</span></td>
                                    <td><span class="badge badge-status-pending">Pending</span></td>
                                    <td>Awaiting client decision, date finalization or flight price revisions.</td>
                                    <td><span class="badge bg-light text-dark border">Follow-up Queue</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit status (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold">Confirmed</span></td>
                                    <td><span class="badge badge-status-confirmed"><i class="bi bi-check2-circle me-1"></i>Confirmed</span></td>
                                    <td>Booking advance received. Tour package confirmed with suppliers.</td>
                                    <td><span class="badge bg-success-subtle text-success">Converted / Won</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit status (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold">Not Interested</span></td>
                                    <td><span class="badge badge-status-notinterested">Not Interested</span></td>
                                    <td>Client cancelled plans, budget too high, or booked through another channel.</td>
                                    <td><span class="badge bg-light text-muted border">Lost</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit status (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold">Closed</span></td>
                                    <td><span class="badge badge-status-closed">Closed</span></td>
                                    <td>Tour successfully completed or lead archived.</td>
                                    <td><span class="badge bg-light text-muted border">Archived</span></td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Edit status (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 4. Lead Priorities -->
        <div class="tab-pane fade" id="tab-priorities" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white">
                    <h6 class="mb-0"><i class="bi bi-flag"></i> Lead Priority & SLA Matrix</h6>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Priority Level</th>
                                    <th>Badge Preview</th>
                                    <th>Response SLA Target</th>
                                    <th>Description / Criteria</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="fw-bold text-danger">Hot</span></td>
                                    <td><span class="badge badge-priority-hot"><i class="bi bi-fire me-1"></i>Hot</span></td>
                                    <td><span class="badge bg-danger-subtle text-danger fw-bold">Within 2 Hours</span></td>
                                    <td>Travel within 30 days, confirmed budget, luxury package, or urgent holiday inquiry.</td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Configure SLA (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold text-warning">Warm</span></td>
                                    <td><span class="badge badge-priority-warm">Warm</span></td>
                                    <td><span class="badge bg-warning-subtle text-dark fw-bold">Within 24 Hours</span></td>
                                    <td>Standard inquiry exploring seasonal options or planning travel within 1 to 3 months.</td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Configure SLA (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="fw-bold text-info">Cold</span></td>
                                    <td><span class="badge badge-priority-cold">Cold</span></td>
                                    <td><span class="badge bg-info-subtle text-dark fw-bold">Within 72 Hours</span></td>
                                    <td>General inquiry, tentative travel after 6 months, or price-checking inquiries.</td>
                                    <td class="text-end">
                                        <button class="btn btn-nj-outline btn-sm" onclick="alert('Configure SLA (UI sample).');"><i class="bi bi-pencil"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 5. Basic CRM Preferences -->
        <div class="tab-pane fade" id="tab-preferences" role="tabpanel">
            <div class="card">
                <div class="card-header bg-white">
                    <h6 class="mb-0"><i class="bi bi-sliders"></i> Operational Preferences</h6>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">System Currency</label>
                            <input type="text" class="form-control" value="₹ INR (Indian Rupee)" readonly="readonly" />
                            <div class="form-text">All package quotes and booking values are handled in Indian Rupees.</div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label">Default Follow-up Reminder Window</label>
                            <select class="form-select">
                                <option>12 Hours</option>
                                <option selected="selected">24 Hours (Next Day Follow-up)</option>
                                <option>48 Hours</option>
                            </select>
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label">Agency Operating Hours</label>
                            <div class="row g-2">
                                <div class="col-6">
                                    <input type="text" class="form-control" value="09:30 AM" />
                                </div>
                                <div class="col-6">
                                    <input type="text" class="form-control" value="07:30 PM" />
                                </div>
                            </div>
                            <div class="form-text">Operating window for automated follow-up alerts.</div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label class="form-label">Lead Assignment Method</label>
                            <select class="form-select">
                                <option selected="selected">Manual Admin Allocation (Controlled)</option>
                                <option>Round Robin (Automatic distribution among Calling staff)</option>
                            </select>
                        </div>

                        <div class="col-12">
                            <div class="p-3 bg-light rounded border">
                                <div class="form-check form-switch mb-2">
                                    <input class="form-check-input" type="checkbox" id="chkOwnerCredit" checked="checked" />
                                    <label class="form-check-label fw-bold small text-dark" for="chkOwnerCredit">
                                        Enforce Lead Owner Attribution Lock
                                    </label>
                                </div>
                                <p class="small text-muted mb-0">
                                    When enabled, assigning or reassigning a lead for follow-ups will never alter the original Lead Owner who generated the inquiry. This protects staff sales performance records.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-white border-top text-end">
                    <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('CRM preferences saved (UI sample)!');">
                        Save Preferences
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
