<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reports | New Journey Holidays CRM</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <div class="nj-page-header">
        <div>
            <h2 class="nj-page-title">Agency Reports & Business Metrics</h2>
            <p class="nj-page-subtitle">Summary metrics, employee conversion performance and source effectiveness for New Journey Holidays.</p>
        </div>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-nj-outline btn-sm" onclick="window.print();">
                <i class="bi bi-printer"></i> Print Report
            </button>
            <button type="button" class="btn btn-nj-primary btn-sm" onclick="alert('Exporting executive summary to PDF (sample)...');">
                <i class="bi bi-file-earmark-pdf"></i> Export PDF
            </button>
        </div>
    </div>

    <!-- Date Range & Branch Filter Card -->
    <div class="card mb-3">
        <div class="card-body p-3">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-3">
                    <label class="form-label small mb-1">Time Period</label>
                    <select class="form-select form-select-sm">
                        <option selected="selected">Current Month (October 2026)</option>
                        <option>Last Month (September 2026)</option>
                        <option>Current Quarter (Q4 2026)</option>
                        <option>Year to Date (2026)</option>
                    </select>
                </div>
                <div class="col-6 col-md-3">
                    <label class="form-label small mb-1">Branch Office</label>
                    <select class="form-select form-select-sm">
                        <option selected="selected">Gorakhpur HQ (Golghar)</option>
                        <option>Deoria Regional Branch</option>
                    </select>
                </div>
                <div class="col-6 col-md-3">
                    <label class="form-label small mb-1">Tour Segment</label>
                    <select class="form-select form-select-sm">
                        <option selected="selected">All Tours (Domestic & International)</option>
                        <option>Domestic Packages Only</option>
                        <option>International Tours Only</option>
                        <option>Pilgrimage / Char Dham</option>
                    </select>
                </div>
                <div class="col-12 col-md-3 text-md-end align-self-end">
                    <button type="button" class="btn btn-nj-primary btn-sm w-100" onclick="alert('Report updated (UI sample).');">
                        <i class="bi bi-arrow-repeat"></i> Refresh Report
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- 4 High-level Executive Metric Cards -->
    <div class="row g-3 mb-4">
        <!-- 1. Total Leads -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Total Leads Generated</div>
                    <div class="stat-value">300</div>
                    <div class="stat-meta text-success">
                        <i class="bi bi-graph-up-arrow"></i> +24% vs previous month
                    </div>
                </div>
                <div class="nj-stat-icon green">
                    <i class="bi bi-people-fill"></i>
                </div>
            </div>
        </div>

        <!-- 2. Confirmed Leads -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Confirmed Bookings</div>
                    <div class="stat-value text-success">65</div>
                    <div class="stat-meta text-muted">
                        <span class="badge bg-success-subtle text-success">21.7% Conversion</span>
                    </div>
                </div>
                <div class="nj-stat-icon teal">
                    <i class="bi bi-check2-circle"></i>
                </div>
            </div>
        </div>

        <!-- 3. Calling Performance -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Total Calls Conducted</div>
                    <div class="stat-value text-primary">542</div>
                    <div class="stat-meta text-primary">
                        <i class="bi bi-telephone-check"></i> 71.6% Connected Rate
                    </div>
                </div>
                <div class="nj-stat-icon blue">
                    <i class="bi bi-telephone-outbound-fill"></i>
                </div>
            </div>
        </div>

        <!-- 4. Follow-up SLA -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="nj-stat-card">
                <div>
                    <div class="stat-label">Follow-ups Handled</div>
                    <div class="stat-value text-warning">221</div>
                    <div class="stat-meta text-muted">
                        <span class="badge bg-danger-subtle text-danger">8 Pending</span>
                    </div>
                </div>
                <div class="nj-stat-icon amber">
                    <i class="bi bi-calendar2-check-fill"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 1 & 2: Employee Performance & Lead Sources -->
    <div class="row g-3 mb-4">
        <!-- Employee-wise Leads Table (col-lg-7) -->
        <div class="col-12 col-lg-7">
            <div class="card h-100">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-award text-success"></i> Employee-wise Performance & Conversion</h6>
                        <small class="text-muted">Staff conversion rankings based on assigned vs closed leads</small>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>Staff Member</th>
                                    <th>Category</th>
                                    <th class="text-center">Assigned</th>
                                    <th class="text-center">Confirmed</th>
                                    <th>Conversion Rate</th>
                                    <th class="text-end">Calls Made</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="fw-bold">Priya Sharma</div>
                                        <small class="text-muted">Senior Sales</small>
                                    </td>
                                    <td><span class="badge bg-primary-subtle text-primary">Sales</span></td>
                                    <td class="text-center fw-semibold">68</td>
                                    <td class="text-center fw-bold text-success">24</td>
                                    <td style="width: 140px;">
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="progress flex-grow-1" style="height: 6px;">
                                                <div class="progress-bar bg-success" style="width: 35.3%;"></div>
                                            </div>
                                            <span class="small fw-bold">35.3%</span>
                                        </div>
                                    </td>
                                    <td class="text-end fw-semibold">142</td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="fw-bold">Rakesh Yadav</div>
                                        <small class="text-muted">Field Sales</small>
                                    </td>
                                    <td><span class="badge bg-warning-subtle text-warning">Field</span></td>
                                    <td class="text-center fw-semibold">84</td>
                                    <td class="text-center fw-bold text-success">18</td>
                                    <td>
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="progress flex-grow-1" style="height: 6px;">
                                                <div class="progress-bar bg-success" style="width: 21.4%;"></div>
                                            </div>
                                            <span class="small fw-bold">21.4%</span>
                                        </div>
                                    </td>
                                    <td class="text-end fw-semibold">98</td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="fw-bold">Pooja Srivastava</div>
                                        <small class="text-muted">Calling Lead</small>
                                    </td>
                                    <td><span class="badge bg-info-subtle text-info">Calling</span></td>
                                    <td class="text-center fw-semibold">92</td>
                                    <td class="text-center fw-bold text-success">14</td>
                                    <td>
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="progress flex-grow-1" style="height: 6px;">
                                                <div class="progress-bar bg-info" style="width: 15.2%;"></div>
                                            </div>
                                            <span class="small fw-bold">15.2%</span>
                                        </div>
                                    </td>
                                    <td class="text-end fw-semibold">215</td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="fw-bold">Manoj Tiwari</div>
                                        <small class="text-muted">Direct Sales</small>
                                    </td>
                                    <td><span class="badge bg-primary-subtle text-primary">Sales</span></td>
                                    <td class="text-center fw-semibold">45</td>
                                    <td class="text-center fw-bold text-success">9</td>
                                    <td>
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="progress flex-grow-1" style="height: 6px;">
                                                <div class="progress-bar bg-warning" style="width: 20.0%;"></div>
                                            </div>
                                            <span class="small fw-bold">20.0%</span>
                                        </div>
                                    </td>
                                    <td class="text-end fw-semibold">87</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Lead Source Summary (col-lg-5) -->
        <div class="col-12 col-lg-5">
            <div class="card h-100">
                <div class="card-header bg-white">
                    <div>
                        <h6 class="mb-0"><i class="bi bi-pie-chart text-success"></i> Lead Source Summary</h6>
                        <small class="text-muted">Acquisition channels distribution (300 Total)</small>
                    </div>
                </div>
                <div class="card-body">
                    <!-- Source 1 -->
                    <div class="mb-3">
                        <div class="d-flex justify-content-between small fw-semibold mb-1">
                            <span><i class="bi bi-globe text-primary me-1"></i> Google / Internet</span>
                            <span>120 Leads (40.0%)</span>
                        </div>
                        <div class="progress" style="height: 8px;">
                            <div class="progress-bar bg-primary" role="progressbar" style="width: 40.0%;"></div>
                        </div>
                        <div class="text-muted" style="font-size: 0.725rem;">Website inquiry form, Google Ads & Gorakhpur SEO</div>
                    </div>

                    <!-- Source 2 -->
                    <div class="mb-3">
                        <div class="d-flex justify-content-between small fw-semibold mb-1">
                            <span><i class="bi bi-people text-success me-1"></i> Client Referrals</span>
                            <span>65 Leads (21.7%)</span>
                        </div>
                        <div class="progress" style="height: 8px;">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 21.7%;"></div>
                        </div>
                        <div class="text-muted" style="font-size: 0.725rem;">Word-of-mouth from satisfied holiday travelers</div>
                    </div>

                    <!-- Source 3 -->
                    <div class="mb-3">
                        <div class="d-flex justify-content-between small fw-semibold mb-1">
                            <span><i class="bi bi-shop text-info me-1"></i> Direct Sales / Counter</span>
                            <span>55 Leads (18.3%)</span>
                        </div>
                        <div class="progress" style="height: 8px;">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 18.3%;"></div>
                        </div>
                        <div class="text-muted" style="font-size: 0.725rem;">Walk-ins at Golghar HQ travel desk</div>
                    </div>

                    <!-- Source 4 -->
                    <div class="mb-3">
                        <div class="d-flex justify-content-between small fw-semibold mb-1">
                            <span><i class="bi bi-geo-alt text-warning me-1"></i> Field Visits & Promotions</span>
                            <span>45 Leads (15.0%)</span>
                        </div>
                        <div class="progress" style="height: 8px;">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: 15.0%;"></div>
                        </div>
                        <div class="text-muted" style="font-size: 0.725rem;">Institutional sales & regional agency network</div>
                    </div>

                    <!-- Source 5 -->
                    <div class="mb-0">
                        <div class="d-flex justify-content-between small fw-semibold mb-1">
                            <span><i class="bi bi-three-dots text-secondary me-1"></i> Admin & Other Sources</span>
                            <span>15 Leads (5.0%)</span>
                        </div>
                        <div class="progress" style="height: 8px;">
                            <div class="progress-bar bg-secondary" role="progressbar" style="width: 5.0%;"></div>
                        </div>
                        <div class="text-muted" style="font-size: 0.725rem;">Social media, WhatsApp campaigns & director contacts</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 3 & 4: Calling Performance & Follow-up Summary -->
    <div class="row g-3">
        <!-- Calling Performance Overview (col-md-6) -->
        <div class="col-12 col-md-6">
            <div class="card h-100">
                <div class="card-header bg-white">
                    <h6 class="mb-0"><i class="bi bi-telephone-inbound text-primary"></i> Calling Performance Summary</h6>
                </div>
                <div class="card-body">
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <div class="p-3 border rounded text-center">
                                <span class="text-muted small d-block">Connected Calls</span>
                                <span class="fs-4 fw-bold text-success">388</span>
                                <div class="text-success small">71.6% success</div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-3 border rounded text-center">
                                <span class="text-muted small d-block">Unanswered / Busy</span>
                                <span class="fs-4 fw-bold text-secondary">154</span>
                                <div class="text-muted small">28.4% no response</div>
                            </div>
                        </div>
                    </div>

                    <table class="table table-sm align-middle small mb-0">
                        <tbody>
                            <tr>
                                <td>Average Talk Time per Call</td>
                                <td class="text-end fw-bold">3 mins 45 secs</td>
                            </tr>
                            <tr>
                                <td>Average Dials per Day</td>
                                <td class="text-end fw-bold">28 calls / agent</td>
                            </tr>
                            <tr>
                                <td>Interested Lead Handoffs</td>
                                <td class="text-end fw-bold text-primary">52 inquiries</td>
                            </tr>
                            <tr>
                                <td>Re-dial Conversion Rate</td>
                                <td class="text-end fw-bold text-success">18.4%</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Follow-up Status Summary (col-md-6) -->
        <div class="col-12 col-md-6">
            <div class="card h-100">
                <div class="card-header bg-white">
                    <h6 class="mb-0"><i class="bi bi-calendar2-check text-success"></i> Follow-up Pipeline Summary</h6>
                </div>
                <div class="card-body">
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <div class="p-3 border rounded text-center">
                                <span class="text-muted small d-block">Completed Follow-ups</span>
                                <span class="fs-4 fw-bold text-success">142</span>
                                <div class="text-muted small">Processed successfully</div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-3 border rounded text-center">
                                <span class="text-muted small d-block">Active Pipeline</span>
                                <span class="fs-4 fw-bold text-primary">79</span>
                                <div class="text-muted small">Today + Upcoming</div>
                            </div>
                        </div>
                    </div>

                    <table class="table table-sm align-middle small mb-0">
                        <tbody>
                            <tr>
                                <td>Today's Scheduled Follow-ups</td>
                                <td class="text-end fw-bold text-dark">24 calls</td>
                            </tr>
                            <tr>
                                <td>Pending Action Today</td>
                                <td class="text-end fw-bold text-warning">8 calls</td>
                            </tr>
                            <tr>
                                <td>Overdue Follow-ups (Action Needed)</td>
                                <td class="text-end fw-bold text-danger">7 calls</td>
                            </tr>
                            <tr>
                                <td>On-time Completion SLA</td>
                                <td class="text-end fw-bold text-success">94.8%</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
