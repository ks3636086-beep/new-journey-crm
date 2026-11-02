//using Razorpay.Api;
using System;
using System.Activities.Statements;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Master
/// </summary>
public class Master
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

    public Master()
    {
        //
        // TODO: Add constructor logic here
        //
    }

 
    
}