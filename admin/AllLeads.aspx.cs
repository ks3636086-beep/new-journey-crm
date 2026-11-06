using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AllLeads : System.Web.UI.Page
{
    Master ob = new Master();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           bind_all_leads();
        }
    }

    private void bind_all_leads()
    {
        DataTable dt = ob.get_all_leads();

        rptAllLeads.DataSource = dt;
        rptAllLeads.DataBind();
    }

    protected void btnEditLead_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        string leadCode = btn.CommandArgument;

        hfEditLeadCode.Value = leadCode;

        ClientScript.RegisterStartupScript(
            this.GetType(),
            "OpenEditModal",
            "new bootstrap.Modal(document.getElementById('leadEditModal')).show();",
            true
        );
    }

    protected void btnSaveLeadEdit_Click(object sender, EventArgs e)
    {
        // Backend logic can be implemented by user
    }
}
