//using Razorpay.Api;
using System;
using System.Activities.Statements;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
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

    public DataTable get_all_leads()
    {
        string query = @"SELECT * FROM dbo.tbl_leads ORDER BY lead_id DESC";

        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }

    public DataTable get_recent_leads()
    {
        string query = @"SELECT TOP 5 * FROM dbo.tbl_leads
                     ORDER BY lead_id DESC";

        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }

    public DataTable get_upcoming_followups()
    {
        string query = @"
        SELECT *
        FROM dbo.tbl_leads
        WHERE followup_date >= CAST(GETDATE() AS DATE)
        AND followup_date < DATEADD(DAY, 2, CAST(GETDATE() AS DATE))
        ORDER BY followup_date ASC";

        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }

    public int get_dashboard_count(string query)
    {
        int count = 0;

        if (con.State == ConnectionState.Closed)
            con.Open();

        SqlCommand cmd = new SqlCommand(query, con);
        count = Convert.ToInt32(cmd.ExecuteScalar());

        con.Close();

        return count;
    }
    // 1. Total Leads
    public int get_total_leads()
    {
        return get_dashboard_count(
            "SELECT COUNT(*) FROM dbo.tbl_leads");
    }

    // 2. Confirmed Leads
    public int get_confirmed_leads()
    {
        return get_dashboard_count(
            "SELECT COUNT(*) FROM dbo.tbl_leads WHERE lead_status='Confirmed'");
    }

    // 3. Pending Leads
    public int get_pending_leads()
    {
        return get_dashboard_count(
            "SELECT COUNT(*) FROM dbo.tbl_leads WHERE lead_status='Pending'");
    }

    // 4. Hot Leads
    public int get_hot_leads()
    {
        return get_dashboard_count(
            "SELECT COUNT(*) FROM dbo.tbl_leads WHERE lead_priority='Hot'");
    }

    // 5. Total Employees
    public int get_total_employees()
    {
        return get_dashboard_count(
            "SELECT COUNT(*) FROM dbo.tbl_employees");
    }

    // 6. Today's Follow-ups
    public int get_today_followups()
    {
        return get_dashboard_count(
            @"SELECT COUNT(*) FROM dbo.tbl_leads
          WHERE CAST(followup_date AS DATE) = CAST(GETDATE() AS DATE)");
    }

    // 7. Pending Today's Follow-ups
    public int get_pending_followups()
    {
        return get_dashboard_count(
            @"SELECT COUNT(*) FROM dbo.tbl_leads
          WHERE CAST(followup_date AS DATE) = CAST(GETDATE() AS DATE)
          AND lead_status = 'Pending'");
    }

    public DataTable get_lead_by_code(string leadCode)
    {
        string query = @"
        SELECT *
        FROM dbo.tbl_leads
        WHERE lead_code = @lead_code";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@lead_code", leadCode);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public void insert_call_history(
    string leadCode,
    string calledBy,
    string callerRole,
    string callStatus,
    object nextFollowupDate,
    string remarks)
    {
        bool openedHere = false;

        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                openedHere = true;
            }

            SqlTransaction trans = con.BeginTransaction();

            try
            {
                string callId = "CALL-" + DateTime.Now.ToString("yyMMddHHmmssfff");

                // Previous latest call ko inactive karo
                string updateHistory = @"
                UPDATE dbo.tbl_lead_call_history
                SET is_latest = 0
                WHERE lead_code = @lead_code";

                SqlCommand cmd1 = new SqlCommand(updateHistory, con, trans);
                cmd1.Parameters.AddWithValue("@lead_code", leadCode);
                cmd1.ExecuteNonQuery();

                // New call history insert karo
                string insertQuery = @"
                INSERT INTO dbo.tbl_lead_call_history
                (call_id, lead_code, called_by, caller_role,
                 call_status, remarks, next_followup_date, is_latest)
                VALUES
                (@call_id, @lead_code, @called_by, @caller_role,
                 @call_status, @remarks, @next_followup_date, 1)";

                SqlCommand cmd2 = new SqlCommand(insertQuery, con, trans);

                cmd2.Parameters.AddWithValue("@call_id", callId);
                cmd2.Parameters.AddWithValue("@lead_code", leadCode);
                cmd2.Parameters.AddWithValue("@called_by", calledBy);
                cmd2.Parameters.AddWithValue("@caller_role", callerRole);
                cmd2.Parameters.AddWithValue("@call_status", callStatus);
                cmd2.Parameters.AddWithValue("@remarks",
                    (object)remarks ?? DBNull.Value);
                cmd2.Parameters.AddWithValue("@next_followup_date",
                    nextFollowupDate ?? DBNull.Value);

                cmd2.ExecuteNonQuery();

                // Lead ka next follow-up update karo
                string updateLead = @"
                UPDATE dbo.tbl_leads
                SET followup_date = @followup_date
                WHERE lead_code = @lead_code";

                SqlCommand cmd3 = new SqlCommand(updateLead, con, trans);

                cmd3.Parameters.AddWithValue("@followup_date",
                    nextFollowupDate ?? DBNull.Value);
                cmd3.Parameters.AddWithValue("@lead_code", leadCode);

                cmd3.ExecuteNonQuery();

                trans.Commit();
            }
            catch
            {
                trans.Rollback();
                throw;
            }
        }
        finally
        {
            if (openedHere && con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }

    public void update_lead(string leadCode, string clientName, string mobile, string alternateMobile, string city, string destination, object travelDate, string leadStatus, string leadPriority, object followupDate, string remarks)
    {
        string query = @"UPDATE dbo.tbl_leads
                     SET client_name = @client_name,
                         mobile = @mobile,
                         alternate_mobile = @alternate_mobile,
                         city = @city,
                         destination = @destination,
                         travel_date = @travel_date,
                         lead_status = @lead_status,
                         lead_priority = @lead_priority,
                         followup_date = @followup_date,
                         remarks = @remarks
                     WHERE lead_code = @lead_code";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@lead_code", leadCode);
        cmd.Parameters.AddWithValue("@client_name", clientName);
        cmd.Parameters.AddWithValue("@mobile", mobile);
        cmd.Parameters.AddWithValue("@alternate_mobile", (object)alternateMobile ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@city", city);
        cmd.Parameters.AddWithValue("@destination", destination);
        cmd.Parameters.AddWithValue("@travel_date", travelDate ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@lead_status", leadStatus);
        cmd.Parameters.AddWithValue("@lead_priority", leadPriority);
        cmd.Parameters.AddWithValue("@followup_date", followupDate ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@remarks", (object)remarks ?? DBNull.Value);

        cmd.ExecuteNonQuery();
    }


    public void delete_lead(string leadCode)
    {
        if (con.State == ConnectionState.Closed)
            con.Open();

        SqlTransaction trans = con.BeginTransaction();

        try
        {
            string deleteHistory = @"DELETE FROM dbo.tbl_lead_call_history
                                 WHERE lead_code = @lead_code";

            SqlCommand cmd1 = new SqlCommand(deleteHistory, con, trans);
            cmd1.Parameters.AddWithValue("@lead_code", leadCode);
            cmd1.ExecuteNonQuery();

            string deleteLead = @"DELETE FROM dbo.tbl_leads
                              WHERE lead_code = @lead_code";

            SqlCommand cmd2 = new SqlCommand(deleteLead, con, trans);
            cmd2.Parameters.AddWithValue("@lead_code", leadCode);
            cmd2.ExecuteNonQuery();

            trans.Commit();
        }
        catch
        {
            trans.Rollback();
            throw;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
    }

    public void update_employee(
    int employee_id,
    string employee_name,
    string employee_mobile,
    string employee_email,
    string employee_username,
    string employee_password,
    string employee_category,
    string employee_status)
    {
        string query = @"
        UPDATE dbo.tbl_employees
        SET employee_name = @name,
            employee_mobile = @mobile,
            employee_email = @email,
            employee_username = @username,
            employee_category = @category,
            employee_status = @status
        WHERE employee_id = @id";

        if (!string.IsNullOrWhiteSpace(employee_password))
        {
            query = @"
            UPDATE dbo.tbl_employees
            SET employee_name = @name,
                employee_mobile = @mobile,
                employee_email = @email,
                employee_username = @username,
                employee_password = @password,
                employee_category = @category,
                employee_status = @status
            WHERE employee_id = @id";
        }

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@id", employee_id);
        cmd.Parameters.AddWithValue("@name", employee_name);
        cmd.Parameters.AddWithValue("@mobile", employee_mobile);
        cmd.Parameters.AddWithValue("@email", employee_email);
        cmd.Parameters.AddWithValue("@username", employee_username);
        cmd.Parameters.AddWithValue("@category", employee_category);
        cmd.Parameters.AddWithValue("@status", employee_status);

        if (!string.IsNullOrWhiteSpace(employee_password))
            cmd.Parameters.AddWithValue("@password", employee_password);

        cmd.ExecuteNonQuery();
    }

    public void delete_employee(int employee_id)
    {
        string query = @"DELETE FROM dbo.tbl_employees
                     WHERE employee_id = @employee_id";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@employee_id", employee_id);
        cmd.ExecuteNonQuery();
    }




    public DataTable get_active_employees_for_assign()
    {
        string query = @"
        SELECT employee_id,
               employee_name + ' (' + employee_category + ')' AS display_name
        FROM dbo.tbl_employees
        WHERE employee_status = 'Active'
        ORDER BY employee_name";

        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public void assign_leads(string leadCodes, int employeeId)
    {
        string[] codes = leadCodes.Split(',');

        foreach (string code in codes)
        {
            string query = @"UPDATE dbo.tbl_leads
                         SET assigned_employee_id = @employeeId
                         WHERE lead_code = @leadCode";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@employeeId", employeeId);
            cmd.Parameters.AddWithValue("@leadCode", code.Trim());

            cmd.ExecuteNonQuery();
        }
    }

    public string get_employee_name(string employeeId)
    {
        string query = @"SELECT employee_name FROM tbl_employees
                     WHERE employee_id = @id";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@id", employeeId);

        return Convert.ToString(cmd.ExecuteScalar());
    }

    public DataTable get_employee_dashboard_metrics(int employeeId)
    {
        string query = @"
    DECLARE @employeeName NVARCHAR(100);

    SELECT @employeeName = employee_name
    FROM dbo.tbl_employees
    WHERE employee_id = @employeeId;

    SELECT
        -- My Field Leads
        (SELECT COUNT(*)
         FROM dbo.tbl_leads
         WHERE created_by = @employeeName) AS MyFieldLeads,

        -- Active Leads
        (SELECT COUNT(*)
         FROM dbo.tbl_leads
         WHERE created_by = @employeeName
         AND lead_status IN ('Pending', 'Interested')) AS ActiveLeads,

        -- Monthly Calls
        (SELECT COUNT(*)
         FROM dbo.tbl_lead_call_history
         WHERE called_by = @employeeName
         AND call_date >= DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)
         AND call_date < DATEADD(MONTH, 1,
             DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))
        ) AS MonthlyCalls,

        -- Today's Calls
        (SELECT COUNT(*)
         FROM dbo.tbl_lead_call_history
         WHERE called_by = @employeeName
         AND call_date >= CAST(GETDATE() AS DATE)
         AND call_date < DATEADD(DAY, 1, CAST(GETDATE() AS DATE))
        ) AS TodayCalls,

        -- Assigned Leads
        (SELECT COUNT(*)
         FROM dbo.tbl_leads
         WHERE TRY_CONVERT(INT, assigned_employee_id) = @employeeId
        ) AS AssignedLeads,

        -- Monthly Target
        30 AS MonthlyTarget";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@employeeId", employeeId);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }


    public DataTable get_today_followups(int employeeId)
    {

        string query = @"
SELECT lead_code, client_name, mobile, city, destination,
       travel_date, followup_date, lead_priority, lead_status
FROM tbl_leads
WHERE (assigned_employee_id = @employeeId OR created_by = 
       (SELECT employee_name FROM tbl_employees WHERE employee_id = @employeeId))
AND CAST(followup_date AS DATE) = CAST(GETDATE() AS DATE)
ORDER BY followup_date ASC";

        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@employeeId", employeeId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
    }

    public DataTable get_recent_employee_leads(int employeeId)
    {
        string query = @"SELECT TOP 5 l.lead_code, l.client_name, l.mobile, l.destination, l.created_by, ISNULL(e.employee_name,'Unassigned') AS assigned_employee_name, l.lead_priority, l.lead_status
FROM dbo.tbl_leads l LEFT JOIN dbo.tbl_employees e ON TRY_CONVERT(INT,l.assigned_employee_id)=e.employee_id WHERE l.created_by=(SELECT employee_name FROM dbo.tbl_employees WHERE employee_id=@employeeId) OR TRY_CONVERT(INT,l.assigned_employee_id)=@employeeId ORDER BY l.created_at DESC";

        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@employeeId", employeeId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }

    public void unassign_lead(string leadCode)
    {
        string query = "UPDATE dbo.tbl_leads SET assigned_employee_id = NULL WHERE lead_code = @leadCode";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@leadCode", leadCode);

        if (con.State == ConnectionState.Closed)
            con.Open();

        cmd.ExecuteNonQuery();
        con.Close();
    }


    public DataTable get_today_followups_data(int employeeId)
    {
        DataTable dt = new DataTable();

        string query = @"
        SELECT lead_code, client_name, mobile, destination,
               followup_date, remarks, lead_priority, lead_status
        FROM dbo.tbl_leads
        WHERE (assigned_employee_id = @employeeId
               OR created_by = @employeeId)
          AND CAST(followup_date AS DATE) > CAST(GETDATE() AS DATE)
        ORDER BY followup_date ASC";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@employeeId", employeeId);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        return dt;
    }

    public DataTable get_overdue_followups_data(int employeeId)
    {
        DataTable dt = new DataTable();

        string query = @"
        SELECT lead_code, client_name, mobile, destination,
               followup_date, remarks, lead_priority, lead_status
        FROM dbo.tbl_leads
        WHERE (assigned_employee_id = @employeeId
               OR created_by = @employeeId)
          AND CAST(followup_date AS DATE) < CAST(GETDATE() AS DATE)
        ORDER BY followup_date ASC";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@employeeId", employeeId);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        return dt;
    }

    public DataTable get_upcoming_followups_data(int employeeId)
    {
        DataTable dt = new DataTable();

        string query = @"
        SELECT lead_code, client_name, mobile, destination,
               followup_date, remarks, lead_priority, lead_status
        FROM dbo.tbl_leads
        WHERE (assigned_employee_id = @employeeId
               OR created_by = @employeeId)
          AND CAST(followup_date AS DATE) > CAST(GETDATE() AS DATE)
        ORDER BY followup_date ASC";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@employeeId", employeeId);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        return dt;
    }
}