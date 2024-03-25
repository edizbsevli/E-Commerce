using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eticaret
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection(WebConfigurationManager.ConnectionStrings["eticaret_web"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            baglan.Open();
            SqlCommand oku = new SqlCommand("SELECT * FROM urun WHERE statu = 'manset'", baglan);
            SqlDataReader dr = oku.ExecuteReader();
            ListView1.DataSource = dr;
            ListView1.DataBind();
            baglan.Close();
        }
    }
}