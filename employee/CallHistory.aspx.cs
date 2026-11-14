using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CallHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCallHistory();
        }
    }

    public void BindCallHistory()
    {
        if (Session["employee_name"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        string employeeName = Session["employee_name"].ToString();

        Master ob = new Master();

        DataTable dt = ob.get_call_history(employeeName);

        rptCallHistory.DataSource = dt;
        rptCallHistory.DataBind();
    }

}

    


