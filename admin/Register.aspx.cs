using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Admin_Register : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning }

    Master ob = new Master();

     

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
    }
}