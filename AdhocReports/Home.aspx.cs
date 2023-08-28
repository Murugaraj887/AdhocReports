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
    public partial class Home : System.Web.UI.Page
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

        public   DataTable GetLinks()
        {
            string connstring = System.Configuration.ConfigurationManager.AppSettings["DBConnectString"]; // Add your connection string key
            SqlDataAdapter sqlAdapter;
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(connstring);
            //SqlCommand cmd = new SqlCommand("select * from AdhocReportsLink where ReportType = 'Adhoc' ", con);
            //cmd.CommandType = CommandType.Text;
            SqlCommand cmd = new SqlCommand("sp_getAdhoclinks ", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 30;
            sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            return dt;

        }

        protected void gvAdhoc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                LinkButton lbl = (LinkButton)e.Row.FindControl("lkbtn");

                if (lbl.Text.Contains("Not required to generate"))
                {
                    lbl.ForeColor =System.Drawing.Color.Red;
                }

            }
        }
    }



}