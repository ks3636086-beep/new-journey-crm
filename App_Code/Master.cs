//using Razorpay.Api;
using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml.Linq;

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

        bool wasClosed = (con.State == ConnectionState.Closed);
        if (wasClosed) con.Open();

        SqlCommand cmd = new SqlCommand(query, con);
        int num = Convert.ToInt32(cmd.ExecuteScalar());

        if (wasClosed && con.State == ConnectionState.Open) con.Close();

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

        cmd.Parameters.AddWithValue("@lead_code", leadcode ?? (object)DBNull.Value);
        cmd.Parameters.AddWithValue("@client_name", client_name ?? (object)DBNull.Value);
        cmd.Parameters.AddWithValue("@mobile", mobile ?? (object)DBNull.Value);
        cmd.Parameters.AddWithValue("@alternate_mobile", string.IsNullOrWhiteSpace(alternate_mobile) ? (object)DBNull.Value : alternate_mobile);
        cmd.Parameters.AddWithValue("@city", string.IsNullOrWhiteSpace(city) ? (object)DBNull.Value : city);
        cmd.Parameters.AddWithValue("@destination", string.IsNullOrWhiteSpace(destination) ? (object)DBNull.Value : destination);
        cmd.Parameters.AddWithValue("@travel_date", travel_date ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@lead_status", lead_status ?? (object)DBNull.Value);
        cmd.Parameters.AddWithValue("@lead_priority", lead_priority ?? (object)DBNull.Value);
        cmd.Parameters.AddWithValue("@followup_date", followup_date ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@remarks", string.IsNullOrWhiteSpace(remarks) ? (object)DBNull.Value : remarks);
        cmd.Parameters.AddWithValue("@created_by", (object)created_by ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@assigned_employee_id", (object)assigned_employee_id ?? DBNull.Value);

        bool wasClosed = (con.State == ConnectionState.Closed);
        if (wasClosed) con.Open();

        cmd.ExecuteNonQuery();

        if (wasClosed && con.State == ConnectionState.Open) con.Close();
    }

    public DataTable get_all_leads()
    {
        string query = @"
        SELECT l.*,
               CASE 
                   WHEN l.assigned_employee_id IS NULL OR LTRIM(RTRIM(l.assigned_employee_id)) = '' THEN 'Not Assigned'
                   WHEN e.employee_name IS NOT NULL THEN e.employee_name
                   ELSE l.assigned_employee_id
               END AS assigned_employee_name
        FROM dbo.tbl_leads l
        LEFT JOIN dbo.tbl_employees e ON (TRY_CONVERT(INT, l.assigned_employee_id) = e.employee_id OR l.assigned_employee_id = e.employee_name)
        ORDER BY l.lead_id DESC";

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

        bool wasClosed = (con.State == ConnectionState.Closed);
        if (wasClosed) con.Open();

        cmd.ExecuteNonQuery();

        if (wasClosed && con.State == ConnectionState.Open) con.Close();
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
        string name = "";
        string query = @"SELECT employee_name FROM tbl_employees
                     WHERE employee_id = @id";

        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@id", employeeId);

            bool wasClosed = (con.State == ConnectionState.Closed);
            if (wasClosed) con.Open();

            object result = cmd.ExecuteScalar();
            if (result != null && result != DBNull.Value)
            {
                name = result.ToString();
            }

            if (wasClosed && con.State == ConnectionState.Open) con.Close();
        }

        return name;
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

        -- Total Scheduled Followups
        (SELECT COUNT(*)
         FROM dbo.tbl_leads
         WHERE (created_by = @employeeName OR TRY_CONVERT(INT, assigned_employee_id) = @employeeId)
         AND followup_date IS NOT NULL) AS TotalFollowups,

        -- Today Followups
        (SELECT COUNT(*)
         FROM dbo.tbl_leads
         WHERE (created_by = @employeeName OR TRY_CONVERT(INT, assigned_employee_id) = @employeeId)
         AND CAST(followup_date AS DATE) = CAST(GETDATE() AS DATE)) AS TodayFollowups,

        -- Won / Confirmed Leads
        (SELECT COUNT(*)
         FROM dbo.tbl_leads
         WHERE (created_by = @employeeName OR TRY_CONVERT(INT, assigned_employee_id) = @employeeId)
         AND lead_status = 'Confirmed') AS WonLeads,

        -- Cancelled Leads
        (SELECT COUNT(*)
         FROM dbo.tbl_leads
         WHERE (created_by = @employeeName OR TRY_CONVERT(INT, assigned_employee_id) = @employeeId)
         AND lead_status = 'Not Interested') AS CancelledLeads,

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
        string query = @"SELECT TOP 5 
            l.lead_code, 
            l.client_name, 
            l.mobile, 
            l.destination, 
            l.created_by, 
            CASE 
                WHEN l.created_by = (SELECT employee_name FROM dbo.tbl_employees WHERE employee_id = @employeeId) 
                     AND (l.assigned_employee_id IS NULL OR TRY_CONVERT(INT, l.assigned_employee_id) = @employeeId) 
                     THEN 'Self'
                ELSE 'Assigned'
            END AS assigned_employee_name, 
            l.lead_priority, 
            l.lead_status
        FROM dbo.tbl_leads l 
        WHERE l.created_by = (SELECT employee_name FROM dbo.tbl_employees WHERE employee_id = @employeeId) 
           OR TRY_CONVERT(INT, l.assigned_employee_id) = @employeeId 
        ORDER BY l.lead_id DESC";

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


    public DataTable get_today_followups_data(int employeeId, string employeeName)
    {
        DataTable dt = new DataTable();

        string query = @"
        SELECT lead_code, client_name, mobile, destination,
               followup_date, remarks, lead_priority, lead_status
        FROM dbo.tbl_leads
        WHERE (assigned_employee_id = @employeeId
               OR created_by = @employeeName)
          AND CAST(followup_date AS DATE) = CAST(GETDATE() AS DATE)
        ORDER BY followup_date ASC";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@employeeId", employeeId);
        cmd.Parameters.AddWithValue("@employeeName", employeeName);


        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        return dt;
    }

    public DataTable get_overdue_followups_data(int employeeId, string employeeName)
    {
        DataTable dt = new DataTable();

        string query = @"
    SELECT lead_code, client_name, mobile, destination,
           followup_date, remarks, lead_priority, lead_status
    FROM dbo.tbl_leads
    WHERE (assigned_employee_id = @employeeId
           OR created_by = @employeeName)
      AND CAST(followup_date AS DATE) < CAST(GETDATE() AS DATE)
    ORDER BY followup_date ASC";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@employeeId", employeeId);
        cmd.Parameters.AddWithValue("@employeeName", employeeName);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        return dt;
    }

    public DataTable get_upcoming_followups_data(int employeeId, string employeeName)
    {
        DataTable dt = new DataTable();

        string query = @"
        SELECT lead_code, client_name, mobile, destination,
               followup_date, remarks, lead_priority, lead_status
        FROM dbo.tbl_leads
        WHERE (assigned_employee_id = @employeeId
               OR created_by = @employeeName)
          AND CAST(followup_date AS DATE) > CAST(GETDATE() AS DATE)
        ORDER BY followup_date ASC";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@employeeId", employeeId);
        cmd.Parameters.AddWithValue("@employeeName", employeeName);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        return dt;
    }

    public DataTable get_admin_today_followups_data()
    {
        DataTable dt = new DataTable();
        string query = @"
        SELECT l.lead_code, l.client_name, l.mobile, l.alternate_mobile, l.destination,
               l.followup_date, l.remarks, l.lead_priority, l.lead_status,
               CASE 
                   WHEN l.assigned_employee_id IS NULL OR LTRIM(RTRIM(l.assigned_employee_id)) = '' THEN 'Not Assigned'
                   WHEN e.employee_name IS NOT NULL THEN e.employee_name
                   ELSE l.assigned_employee_id
               END AS assigned_employee_name
        FROM dbo.tbl_leads l
        LEFT JOIN dbo.tbl_employees e ON (TRY_CONVERT(INT, l.assigned_employee_id) = e.employee_id OR l.assigned_employee_id = e.employee_name)
        WHERE CAST(l.followup_date AS DATE) = CAST(GETDATE() AS DATE)
        ORDER BY l.followup_date ASC";

        using (SqlDataAdapter da = new SqlDataAdapter(query, con))
        {
            da.Fill(dt);
        }
        return dt;
    }

    public DataTable get_admin_overdue_followups_data()
    {
        DataTable dt = new DataTable();
        string query = @"
        SELECT l.lead_code, l.client_name, l.mobile, l.alternate_mobile, l.destination,
               l.followup_date, l.remarks, l.lead_priority, l.lead_status,
               CASE 
                   WHEN l.assigned_employee_id IS NULL OR LTRIM(RTRIM(l.assigned_employee_id)) = '' THEN 'Not Assigned'
                   WHEN e.employee_name IS NOT NULL THEN e.employee_name
                   ELSE l.assigned_employee_id
               END AS assigned_employee_name
        FROM dbo.tbl_leads l
        LEFT JOIN dbo.tbl_employees e ON (TRY_CONVERT(INT, l.assigned_employee_id) = e.employee_id OR l.assigned_employee_id = e.employee_name)
        WHERE CAST(l.followup_date AS DATE) < CAST(GETDATE() AS DATE)
          AND l.lead_status NOT IN ('Confirmed', 'Closed', 'Not Interested')
        ORDER BY l.followup_date ASC";

        using (SqlDataAdapter da = new SqlDataAdapter(query, con))
        {
            da.Fill(dt);
        }
        return dt;
    }

    public DataTable get_admin_upcoming_followups_data()
    {
        DataTable dt = new DataTable();
        string query = @"
        SELECT l.lead_code, l.client_name, l.mobile, l.alternate_mobile, l.destination,
               l.followup_date, l.remarks, l.lead_priority, l.lead_status,
               CASE 
                   WHEN l.assigned_employee_id IS NULL OR LTRIM(RTRIM(l.assigned_employee_id)) = '' THEN 'Not Assigned'
                   WHEN e.employee_name IS NOT NULL THEN e.employee_name
                   ELSE l.assigned_employee_id
               END AS assigned_employee_name
        FROM dbo.tbl_leads l
        LEFT JOIN dbo.tbl_employees e ON (TRY_CONVERT(INT, l.assigned_employee_id) = e.employee_id OR l.assigned_employee_id = e.employee_name)
        WHERE CAST(l.followup_date AS DATE) > CAST(GETDATE() AS DATE)
        ORDER BY l.followup_date ASC";

        using (SqlDataAdapter da = new SqlDataAdapter(query, con))
        {
            da.Fill(dt);
        }
        return dt;
    }

    // Sakshi
    public DataTable get_employee_profile(int employeeId)
    {
        DataTable dt = new DataTable();

        using (SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
        {
            string query = @"SELECT 
                            employee_id,
                            employee_code,
                            employee_name,
                            employee_mobile,
                            employee_email,
                            employee_username,
                            employee_password,
                            employee_category,
                            employee_status,
                            created_at
                         FROM tbl_employees
                         WHERE employee_id = @employee_id";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@employee_id", employeeId);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
        }

        return dt;
    }


    // Sakshi

    // Sakshi

    public DataTable get_call_history(string employeeName)
    {
        string query = @"
    SELECT
        ch.srno,
        ch.call_id,
        ch.lead_code,
        ch.called_by,
        ch.caller_role,
        ch.call_date,
        ch.call_status,
        ch.remarks,
        ch.next_followup_date,
        ch.is_latest,

        l.client_name,
        l.mobile,
        l.alternate_mobile,
        l.city,
        l.destination,
        l.travel_date,
        l.lead_status,
        l.lead_priority,
        l.followup_date

    FROM dbo.tbl_lead_call_history ch

    INNER JOIN dbo.tbl_leads l
        ON ch.lead_code = l.lead_code

    WHERE ch.called_by = @employee_name

    ORDER BY
        ch.call_date DESC,
        ch.srno DESC";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@employee_name", employeeName);

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }
    // Sakshi

    // Confirmed aur Closed Bookings lane ke liye method
    public DataTable get_employee_bookings_data(int employeeId, string employeeName)
    {
        DataTable dt = new DataTable();

        string query = @"
    SELECT lead_code, client_name, mobile, alternate_mobile, city, destination,
           travel_date, remarks, lead_status, lead_priority
    FROM dbo.tbl_leads
    WHERE (assigned_employee_id = @employeeId OR created_by = @employeeName)
      AND lead_status IN ('Confirmed', 'Closed')
    ORDER BY travel_date DESC, lead_id DESC";

        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@employeeId", employeeId);
            cmd.Parameters.AddWithValue("@employeeName", employeeName);

            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                da.Fill(dt);
            }
        }

        return dt;
    }

    public bool close_employee_trip(string leadCode)
    {
        string query = @"
        UPDATE dbo.tbl_leads
        SET lead_status = 'Closed'
        WHERE lead_code = @leadCode
        AND lead_status = 'Confirmed'";

        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@leadCode", leadCode);

            bool wasClosed = con.State == ConnectionState.Closed;

            try
            {
                if (wasClosed)
                    con.Open();

                int result = cmd.ExecuteNonQuery();

                return result > 0;
            }
            finally
            {
                if (wasClosed && con.State == ConnectionState.Open)
                    con.Close();
            }
        }
    }




    //saksahi


    public DataTable get_admin_call_history()
    {
        string query = @"
SELECT
    ch.srno,
    ch.call_id,
    ch.lead_code,
    ch.called_by,
    ch.caller_role,
    ch.call_date,
    ch.call_status,
    ch.remarks,
    ch.next_followup_date,
    ch.is_latest,

    ISNULL(l.client_name, 'No Client') AS client_name,
    ISNULL(l.mobile, '-') AS mobile,
    l.alternate_mobile,
    l.city,
    l.destination,
    l.travel_date,
    ISNULL(l.lead_status, 'New') AS lead_status,
    ISNULL(l.lead_priority, 'Normal') AS lead_priority,
    l.followup_date,
    l.assigned_employee_id

FROM dbo.tbl_lead_call_history ch

LEFT JOIN dbo.tbl_leads l
    ON LTRIM(RTRIM(ch.lead_code)) = LTRIM(RTRIM(l.lead_code))

ORDER BY
    ch.call_date DESC,
    ch.srno DESC";

        SqlDataAdapter da = new SqlDataAdapter(query, con);

        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }



    //saksahi




    // sakshi - Get all employees & callers
    public DataTable get_call_staff()
    {
        string query = @"
    SELECT DISTINCT employee_name AS called_by
    FROM dbo.tbl_employees
    WHERE employee_name IS NOT NULL AND LTRIM(RTRIM(employee_name)) <> ''
    UNION
    SELECT DISTINCT called_by
    FROM dbo.tbl_lead_call_history
    WHERE called_by IS NOT NULL AND LTRIM(RTRIM(called_by)) <> ''
    ORDER BY called_by";

        SqlDataAdapter da = new SqlDataAdapter(query, con);

        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    //Sakshi


    
    public DataTable get_all_bookings_data()
    {
        DataTable dt = new DataTable();

        string query = @"
    SELECT lead_code, client_name, mobile, alternate_mobile, city, destination,
           travel_date, remarks, lead_status, lead_priority, assigned_employee_id, created_by
    FROM dbo.tbl_leads
    WHERE lead_status IN ('Confirmed', 'Closed')
    ORDER BY travel_date DESC, lead_id DESC";

        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                da.Fill(dt);
            }
        }

        return dt;
    }
    // Returned (Close Needed) Bookings ka count   method
    public int get_returned_bookings_count()
    {
        return get_dashboard_count(
            "SELECT COUNT(*) FROM dbo.tbl_leads WHERE lead_status = 'Confirmed' AND travel_date < CAST(GETDATE() AS DATE)");
    }

    // Admin Profile Methods
    public DataTable get_admin_profile(int adminId)
    {
        DataTable dt = new DataTable();
        string query = "SELECT * FROM dbo.ecommerce_backend WHERE id = @id";
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@id", adminId);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                da.Fill(dt);
            }
        }
        return dt;
    }

    public bool update_admin_profile(int adminId, string name, string email, string mobile)
    {
        string query = @"UPDATE dbo.ecommerce_backend 
                         SET backend_name = @name, 
                             backend_email = @email, 
                             backend_mobileno = @mobile 
                         WHERE id = @id";
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@id", adminId);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@mobile", (object)mobile ?? DBNull.Value);

            bool wasClosed = (con.State == ConnectionState.Closed);
            if (wasClosed) con.Open();

            int rows = cmd.ExecuteNonQuery();

            if (wasClosed && con.State == ConnectionState.Open) con.Close();

            return rows > 0;
        }
    }

    public bool update_admin_password(int adminId, string currentPassword, string newPassword)
    {
        string checkQuery = "SELECT COUNT(*) FROM dbo.ecommerce_backend WHERE id = @id AND backend_password = @currentPassword";
        using (SqlCommand cmd = new SqlCommand(checkQuery, con))
        {
            cmd.Parameters.AddWithValue("@id", adminId);
            cmd.Parameters.AddWithValue("@currentPassword", currentPassword);

            bool wasClosed = (con.State == ConnectionState.Closed);
            if (wasClosed) con.Open();

            int exists = Convert.ToInt32(cmd.ExecuteScalar());
            if (exists == 0)
            {
                if (wasClosed && con.State == ConnectionState.Open) con.Close();
                return false;
            }

            string updateQuery = "UPDATE dbo.ecommerce_backend SET backend_password = @newPassword WHERE id = @id";
            using (SqlCommand updateCmd = new SqlCommand(updateQuery, con))
            {
                updateCmd.Parameters.AddWithValue("@id", adminId);
                updateCmd.Parameters.AddWithValue("@newPassword", newPassword);
                int rows = updateCmd.ExecuteNonQuery();

                if (wasClosed && con.State == ConnectionState.Open) con.Close();
                return rows > 0;
            }
        }
    }

    #region Bulk Lead Import Helper Methods

    public BulkImportResult ImportBulkLeads(System.IO.Stream fileStream, string fileName, string createdBy, string assignedEmployeeId)
    {
        BulkImportResult result = new BulkImportResult();
        string ext = System.IO.Path.GetExtension(fileName).ToLowerInvariant();

        List<List<string>> rawRows;

        try
        {
            if (ext == ".csv")
            {
                rawRows = ParseCsvStream(fileStream);
            }
            else if (ext == ".xlsx")
            {
                rawRows = ParseXlsxStream(fileStream);
            }
            else
            {
                result.ErrorMessages.Add("Unsupported file format (" + ext + "). Please upload a valid .csv or .xlsx file.");
                return result;
            }
        }
        catch (Exception ex)
        {
            result.ErrorMessages.Add("Error reading file: " + ex.Message);
            return result;
        }

        if (rawRows == null || rawRows.Count == 0)
        {
            result.ErrorMessages.Add("Uploaded file contains no data or could not be read.");
            return result;
        }

        // Default column indexes if no header is found
        int nameIdx = 0;
        int mobileIdx = 1;
        int altMobileIdx = 2;
        int cityIdx = 3;
        int destIdx = 4;
        int dateIdx = 5;
        int priorityIdx = 6;
        int remarksIdx = 7;

        int startIndex = 0;
        List<string> firstRow = rawRows[0];
        bool hasHeader = false;

        // Detect column positions by scanning header row keywords
        for (int i = 0; i < firstRow.Count; i++)
        {
            string val = (firstRow[i] ?? "").Trim().ToLowerInvariant();
            if (val.Contains("name") || val.Contains("client") || val.Contains("customer"))
            {
                nameIdx = i;
                hasHeader = true;
            }
            else if (val.Contains("alt") && (val.Contains("mobile") || val.Contains("phone") || val.Contains("contact")))
            {
                altMobileIdx = i;
                hasHeader = true;
            }
            else if (val.Contains("mobile") || val.Contains("phone") || val.Contains("contact"))
            {
                mobileIdx = i;
                hasHeader = true;
            }
            else if (val.Contains("city") || val.Contains("location"))
            {
                cityIdx = i;
                hasHeader = true;
            }
            else if (val.Contains("destination") || val.Contains("place") || val.Contains("tour"))
            {
                destIdx = i;
                hasHeader = true;
            }
            else if (val.Contains("date") || val.Contains("travel"))
            {
                dateIdx = i;
                hasHeader = true;
            }
            else if (val.Contains("priority"))
            {
                priorityIdx = i;
                hasHeader = true;
            }
            else if (val.Contains("remark") || val.Contains("note") || val.Contains("comment"))
            {
                remarksIdx = i;
                hasHeader = true;
            }
        }

        if (hasHeader)
        {
            startIndex = 1; // Skip header row
        }

        HashSet<string> seenMobilesInFile = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        bool wasClosed = (con.State == ConnectionState.Closed);
        if (wasClosed) con.Open();

        try
        {
            for (int r = startIndex; r < rawRows.Count; r++)
            {
                List<string> row = rawRows[r];
                if (row == null || row.All(string.IsNullOrWhiteSpace))
                {
                    continue; // Skip blank rows
                }

                result.TotalRows++;
                int displayRowNumber = r + 1;

                string clientName = GetCellSafe(row, nameIdx);
                string rawMobile = GetCellSafe(row, mobileIdx);
                string rawAltMobile = GetCellSafe(row, altMobileIdx);
                string rawCity = GetCellSafe(row, cityIdx);
                string rawDest = GetCellSafe(row, destIdx);
                string rawDate = GetCellSafe(row, dateIdx);
                string rawPriority = GetCellSafe(row, priorityIdx);
                string rawRemarks = GetCellSafe(row, remarksIdx);

                // Validation 1: Mandatory Client Name
                if (string.IsNullOrWhiteSpace(clientName))
                {
                    result.InvalidCount++;
                    result.ErrorMessages.Add("Row " + displayRowNumber + ": Missing Client Name.");
                    continue;
                }

                // Validation 2: Mandatory 10-digit Mobile Number
                string cleanMobile = CleanMobileNumber(rawMobile);
                if (string.IsNullOrEmpty(cleanMobile) || cleanMobile.Length != 10 || cleanMobile[0] < '6' || cleanMobile[0] > '9')
                {
                    result.InvalidCount++;
                    result.ErrorMessages.Add("Row " + displayRowNumber + " (" + clientName + "): Invalid 10-digit mobile number '" + rawMobile + "'.");
                    continue;
                }

                // Validation 3: Duplicate Mobile within the same file
                if (seenMobilesInFile.Contains(cleanMobile))
                {
                    result.DuplicateCount++;
                    result.ErrorMessages.Add("Row " + displayRowNumber + " (" + clientName + "): Duplicate mobile '" + cleanMobile + "' already present in uploaded file.");
                    continue;
                }
                seenMobilesInFile.Add(cleanMobile);

                // Validation 4: Duplicate Mobile in Database (dbo.tbl_leads)
                string checkQuery = "SELECT COUNT(1) FROM dbo.tbl_leads WHERE mobile = @mobile";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@mobile", cleanMobile);
                    int dbCount = Convert.ToInt32(checkCmd.ExecuteScalar());
                    if (dbCount > 0)
                    {
                        result.DuplicateCount++;
                        result.ErrorMessages.Add("Row " + displayRowNumber + " (" + clientName + "): Mobile '" + cleanMobile + "' already exists in CRM database.");
                        continue;
                    }
                }

                // Clean alternate mobile
                string cleanAltMobile = CleanMobileNumber(rawAltMobile);
                if (cleanAltMobile.Length != 10)
                {
                    cleanAltMobile = null;
                }

                // Default fallbacks for optional text fields
                string city = string.IsNullOrWhiteSpace(rawCity) ? "Gorakhpur" : (rawCity.Length > 100 ? rawCity.Substring(0, 100) : rawCity);
                string destination = string.IsNullOrWhiteSpace(rawDest) ? "Not Specified" : (rawDest.Length > 150 ? rawDest.Substring(0, 150) : rawDest);

                // Parse travel date safely
                object parsedTravelDate = DBNull.Value;
                if (!string.IsNullOrWhiteSpace(rawDate))
                {
                    DateTime dt;
                    double oaDate;
                    if (DateTime.TryParse(rawDate, out dt))
                    {
                        parsedTravelDate = dt.Date;
                    }
                    else if (double.TryParse(rawDate, out oaDate) && oaDate > 30000 && oaDate < 65000)
                    {
                        try { parsedTravelDate = DateTime.FromOADate(oaDate).Date; } catch { }
                    }
                }

                // Priority parsing
                string priority = "Warm";
                if (!string.IsNullOrWhiteSpace(rawPriority))
                {
                    string pLower = rawPriority.Trim().ToLowerInvariant();
                    if (pLower == "hot") priority = "Hot";
                    else if (pLower == "cold") priority = "Cold";
                    else if (pLower == "warm") priority = "Warm";
                }

                // Remarks
                string remarks = string.IsNullOrWhiteSpace(rawRemarks) ? null : (rawRemarks.Length > 500 ? rawRemarks.Substring(0, 500) : rawRemarks);

                // Insert into Database
                try
                {
                    insert_lead(
                        clientName.Length > 100 ? clientName.Substring(0, 100) : clientName,
                        cleanMobile,
                        cleanAltMobile,
                        city,
                        destination,
                        parsedTravelDate,
                        "Pending",
                        priority,
                        DBNull.Value,
                        remarks,
                        createdBy,
                        assignedEmployeeId
                    );

                    result.SuccessCount++;
                }
                catch (Exception rowEx)
                {
                    result.InvalidCount++;
                    result.ErrorMessages.Add("Row " + displayRowNumber + " (" + clientName + "): " + rowEx.Message);
                }
            }
        }
        finally
        {
            if (wasClosed && con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return result;
    }

    private static string GetCellSafe(List<string> row, int index)
    {
        if (row != null && index >= 0 && index < row.Count)
        {
            return (row[index] ?? "").Trim();
        }
        return "";
    }

    private static string CleanMobileNumber(string mobile)
    {
        if (string.IsNullOrWhiteSpace(mobile)) return "";
        string s = mobile.Trim();
        if (s.EndsWith(".0"))
        {
            s = s.Substring(0, s.Length - 2);
        }
        string digits = System.Text.RegularExpressions.Regex.Replace(s, @"[^\d]", "");
        if (digits.StartsWith("91") && digits.Length == 12)
        {
            digits = digits.Substring(2);
        }
        else if (digits.StartsWith("0") && digits.Length == 11)
        {
            digits = digits.Substring(1);
        }
        return digits;
    }

    private static List<List<string>> ParseCsvStream(System.IO.Stream stream)
    {
        var rows = new List<List<string>>();
        using (var reader = new System.IO.StreamReader(stream, System.Text.Encoding.UTF8, true))
        {
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                if (string.IsNullOrWhiteSpace(line)) continue;
                rows.Add(ParseCsvLine(line));
            }
        }
        return rows;
    }

    private static List<string> ParseCsvLine(string line)
    {
        var fields = new List<string>();
        bool inQuotes = false;
        System.Text.StringBuilder sb = new System.Text.StringBuilder();

        for (int i = 0; i < line.Length; i++)
        {
            char c = line[i];
            if (c == '\"')
            {
                if (inQuotes && i + 1 < line.Length && line[i + 1] == '\"')
                {
                    sb.Append('\"');
                    i++;
                }
                else
                {
                    inQuotes = !inQuotes;
                }
            }
            else if (c == ',' && !inQuotes)
            {
                fields.Add(sb.ToString().Trim());
                sb.Clear();
            }
            else
            {
                sb.Append(c);
            }
        }
        fields.Add(sb.ToString().Trim());
        return fields;
    }

    private static List<List<string>> ParseXlsxStream(System.IO.Stream stream)
    {
        var allRows = new List<List<string>>();
        using (var archive = new System.IO.Compression.ZipArchive(stream, System.IO.Compression.ZipArchiveMode.Read))
        {
            var sharedStrings = new List<string>();
            var sharedStringEntry = archive.GetEntry("xl/sharedStrings.xml");
            if (sharedStringEntry != null)
            {
                using (var reader = new System.IO.StreamReader(sharedStringEntry.Open(), System.Text.Encoding.UTF8))
                {
                    var xdoc = System.Xml.Linq.XDocument.Load(reader);
                    foreach (var si in xdoc.Descendants())
                    {
                        if (si.Name.LocalName == "si")
                        {
                            string text = string.Concat(si.Descendants().Where(d => d.Name.LocalName == "t").Select(t => t.Value));
                            sharedStrings.Add(text);
                        }
                    }
                }
            }

            var sheetEntry = archive.GetEntry("xl/worksheets/sheet1.xml");
            if (sheetEntry == null)
            {
                foreach (var entry in archive.Entries)
                {
                    if (entry.FullName.StartsWith("xl/worksheets/sheet", StringComparison.OrdinalIgnoreCase) && entry.FullName.EndsWith(".xml", StringComparison.OrdinalIgnoreCase))
                    {
                        sheetEntry = entry;
                        break;
                    }
                }
            }

            if (sheetEntry != null)
            {
                using (var reader = new System.IO.StreamReader(sheetEntry.Open(), System.Text.Encoding.UTF8))
                {
                    var xdoc = System.Xml.Linq.XDocument.Load(reader);
                    var rows = xdoc.Descendants().Where(d => d.Name.LocalName == "row");
                    foreach (var row in rows)
                    {
                        var cells = row.Elements().Where(e => e.Name.LocalName == "c");
                        var rowData = new Dictionary<int, string>();

                        foreach (var cell in cells)
                        {
                            string cellRef = (string)cell.Attribute("r") ?? "";
                            int colIndex = GetColumnIndexFromCellReference(cellRef);
                            string cellType = (string)cell.Attribute("t") ?? "";
                            string val = "";

                            var valElem = cell.Elements().FirstOrDefault(e => e.Name.LocalName == "v");
                            if (valElem != null)
                            {
                                val = valElem.Value;
                                if (cellType == "s")
                                {
                                    int sIndex;
                                    if (int.TryParse(val, out sIndex) && sIndex >= 0 && sIndex < sharedStrings.Count)
                                    {
                                        val = sharedStrings[sIndex];
                                    }
                                }
                            }
                            else
                            {
                                var isElem = cell.Elements().FirstOrDefault(e => e.Name.LocalName == "is");
                                if (isElem != null)
                                {
                                    val = string.Concat(isElem.Descendants().Where(d => d.Name.LocalName == "t").Select(t => t.Value));
                                }
                            }
                            rowData[colIndex] = val;
                        }

                        int maxCol = rowData.Keys.Count > 0 ? rowData.Keys.Max() : -1;
                        var rowList = new List<string>();
                        for (int c = 0; c <= maxCol; c++)
                        {
                            rowList.Add(rowData.ContainsKey(c) ? rowData[c] : "");
                        }
                        if (rowList.Any(s => !string.IsNullOrWhiteSpace(s)))
                        {
                            allRows.Add(rowList);
                        }
                    }
                }
            }
        }
        return allRows;
    }

    private static int GetColumnIndexFromCellReference(string cellRef)
    {
        string colLetters = "";
        foreach (char ch in cellRef)
        {
            if (char.IsLetter(ch)) colLetters += char.ToUpperInvariant(ch);
            else break;
        }
        if (string.IsNullOrEmpty(colLetters)) return 0;
        int col = 0;
        foreach (char ch in colLetters)
        {
            col = (col * 26) + (ch - 'A' + 1);
        }
        return col - 1;
    }

    #endregion
}

public class BulkImportResult
{
    public int TotalRows { get; set; }
    public int SuccessCount { get; set; }
    public int DuplicateCount { get; set; }
    public int InvalidCount { get; set; }
    public List<string> ErrorMessages { get; set; }

    public BulkImportResult()
    {
        ErrorMessages = new List<string>();
    }
}