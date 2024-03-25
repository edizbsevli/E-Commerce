using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eticaret
{
    public partial class adminkategori : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["eticaret_web"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = Kategori_oku();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.HeaderRow != null)
            {
                GridView1.HeaderRow.Cells[2].Text = "kat_id";
                GridView1.HeaderRow.Cells[3].Text = "kat_ad";
            }
        }
        DataTable Kategori_oku()
        {
            baglanti.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from Kategori", baglanti);
            DataTable dt = new DataTable();
            da.Fill(dt);
            baglanti.Close();
            return dt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand ekle = new SqlCommand("insert into Kategori values(@kategori)", baglanti);
            ekle.Parameters.AddWithValue("@kategori", TextBox2.Text);
            ekle.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect("adminkategori.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = Kategori_oku();
            int secilen_satir = Convert.ToInt32(e.CommandArgument);

            TextBox1.Text = dt.Rows[secilen_satir][0].ToString();
            TextBox2.Text = dt.Rows[secilen_satir][1].ToString();
            Panel1.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand guncelle = new SqlCommand("update Kategori set kat_ad=@kategori where kat_id=@id", baglanti);
            guncelle.Parameters.AddWithValue("@kategori", TextBox2.Text);
            guncelle.Parameters.AddWithValue("@id", TextBox1.Text);
            guncelle.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect("adminkategori.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string secilen_kategori = e.Values[0].ToString();
            baglanti.Open();
            SqlCommand sil = new SqlCommand("delete from Kategori where kat_id=@id", baglanti);
            sil.Parameters.AddWithValue("@id", secilen_kategori);
            sil.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect("adminkategori.aspx");
        }
    }
}