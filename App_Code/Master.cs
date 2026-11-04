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

    public string getlead_code()
    {
        string leadcode = "";

        string query = "SELECT ISNULL(MAX(lead_id), 0) + 1 FROM dbo.tbl_leads";

        SqlCommand cmd = new SqlCommand(query, con);
        int num = Convert.ToInt32(cmd.ExecuteScalar());

        leadcode = "LEAD-" + num.ToString("D4");

        return leadcode;
    }

    public void insert_lead(string client_name, string mobile, string alternate_mobile,
    string city, string destination, object travel_date, string lead_status,
    string lead_priority, object followup_date, string remarks,
    string created_by, string assigned_employee_id)
    {
        string leadcode = getlead_code();

        string query = @"INSERT INTO dbo.tbl_leads
    (lead_code, client_name, mobile, alternate_mobile, city, destination,
    travel_date, lead_status, lead_priority, followup_date, remarks,
    created_by, assigned_employee_id)
    VALUES
    (@lead_code, @client_name, @mobile, @alternate_mobile, @city, @destination,
    @travel_date, @lead_status, @lead_priority, @followup_date, @remarks,
    @created_by, @assigned_employee_id)";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@lead_code", leadcode);
        cmd.Parameters.AddWithValue("@client_name", client_name);
        cmd.Parameters.AddWithValue("@mobile", mobile);
        cmd.Parameters.AddWithValue("@alternate_mobile", alternate_mobile);
        cmd.Parameters.AddWithValue("@city", city);
        cmd.Parameters.AddWithValue("@destination", destination);
        cmd.Parameters.AddWithValue("@travel_date", travel_date);
        cmd.Parameters.AddWithValue("@lead_status", lead_status);
        cmd.Parameters.AddWithValue("@lead_priority", lead_priority);
        cmd.Parameters.AddWithValue("@followup_date", followup_date);
        cmd.Parameters.AddWithValue("@remarks", remarks);
        cmd.Parameters.AddWithValue("@created_by", created_by);
        cmd.Parameters.AddWithValue("@assigned_employee_id", (object)assigned_employee_id ?? DBNull.Value);

        cmd.ExecuteNonQuery();
    }

}