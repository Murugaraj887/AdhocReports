using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdhocReports
{
    public partial class FinpulseActivities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Name");
            dt.Columns.Add("Url");
            dt = GetLinks();
            gvAdhoc.DataSource = dt;
            gvAdhoc.DataBind();

        }

        public DataTable GetLinks()
        {
            string connstring = System.Configuration.ConfigurationManager.AppSettings["DBConnectString"]; // Add your connection string key
            SqlDataAdapter sqlAdapter;
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(connstring);
            SqlCommand cmd = new SqlCommand("select * from AdhocReportsLink where ReportType='FinpulseActivities' ", con);
            cmd.CommandType = CommandType.Text;
            cmd.CommandTimeout = 30;
            sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            return dt;

        }

    }
}