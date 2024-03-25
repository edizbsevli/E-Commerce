using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eticaret
{
    public partial class sepett : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection(WebConfigurationManager.ConnectionStrings["eticaret_web"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            int toplamfiyat = 0;
            string kullanici_id = Membership.GetUser().UserName;
            baglan.Open();
            SqlCommand oku = new SqlCommand("select count(*) from sepet where uye_id=@id", baglan);
            oku.Parameters.AddWithValue("@id", kullanici_id);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(oku);
            da.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                Label1.Text = dt.Rows[0][0].ToString();
            }
            SqlCommand oku2 = new SqlCommand("SELECT sepet.urun_id, urun.urun_ad, urun.fiyat, urun.resim, sepet.adet FROM sepet INNER JOIN urun ON sepet.urun_id = urun.urun_id WHERE uye_id=@kullanici", baglan);

            oku2.Parameters.AddWithValue("@kullanici", kullanici_id);
            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(oku2);
            da2.Fill(dt2);
            if (dt2.Rows.Count != 0)
            {
                Response.Write(dt2.Rows.Count);
                ListView1.DataSource = dt2;
                ListView1.DataBind();
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    toplamfiyat = toplamfiyat + (int.Parse(dt2.Rows[i]["adet"].ToString()) * int.Parse(dt2.Rows[i]["fiyat"].ToString()));
                }
                Label2.Text = toplamfiyat.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MembershipUser kullanici = Membership.GetUser();
            string kullanici_id = kullanici.ProviderUserKey.ToString(); 


            Response.Redirect("kartbilgi.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string kullanici_id = Membership.GetUser().UserName;

                
                string selectSepetQuery = "SELECT * FROM sepet WHERE uye_id = @id";
                SqlCommand oku = new SqlCommand(selectSepetQuery, baglan);
                oku.Parameters.AddWithValue("@id", (kullanici_id));
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(oku);
                da.Fill(dt);

                using (SqlTransaction transaction = baglan.BeginTransaction())
                {
                    try
                    {
                        
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            int urun_id = int.Parse(dt.Rows[i]["urun_id"].ToString());
                            int adet = int.Parse(dt.Rows[i]["adet"].ToString());

                            
                            string updateUrunQuery = "UPDATE urun SET stok = stok + @stok WHERE urun_id = @id";
                            SqlCommand guncelle = new SqlCommand(updateUrunQuery, baglan);
                            guncelle.Parameters.AddWithValue("@stok", adet);
                            guncelle.Parameters.AddWithValue("@id", urun_id);
                            guncelle.Transaction = transaction;
                            guncelle.ExecuteNonQuery();
                        }

                        
                        string deleteSepetQuery = "DELETE FROM sepet WHERE uye_id = @kullanici";
                        SqlCommand sil = new SqlCommand(deleteSepetQuery, baglan);
                        sil.Parameters.AddWithValue("@kullanici", kullanici_id);
                        sil.Transaction = transaction;
                        sil.ExecuteNonQuery();

                        
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        
                        transaction.Rollback();
                       
                        Response.Write("Hata Oluştu: " + ex.Message);
                    }
                }

               
                Response.Redirect("sepett.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("Hata Oluştu: " + ex.Message);
            }
        }
    }
}