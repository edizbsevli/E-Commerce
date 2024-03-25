using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eticaret
{
    public partial class adminurun : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["eticaret_web"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                 
                baglanti.Open();
                SqlCommand oku = new SqlCommand("select * from Kategori", baglanti);
                SqlDataReader gelen_veri = oku.ExecuteReader();
                DropDownList1.Items.Add("Kategori Seçin");
                while (gelen_veri.Read() == true)
                {
                    ListItem yeni = new ListItem();
                    yeni.Text = gelen_veri[1].ToString();
                    yeni.Value = gelen_veri[0].ToString();
                    DropDownList1.Items.Add(yeni);
                }
                baglanti.Close();

            }

            DataTable dt = UrunDoldur();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }
    

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex > 0 && DropDownList2.SelectedIndex > 0)
            {
                if (FileUpload1.HasFile == true)
                {
                    string secilen_dosya = FileUpload1.FileName;
                    string uzanti = System.IO.Path.GetExtension(secilen_dosya);
                    if (uzanti == ".jpg" || uzanti == ".jpeg" || uzanti == ".png" || uzanti == ".jfif")
                    {

                        FileUpload1.SaveAs(Server.MapPath("images/") + secilen_dosya);
                        baglanti.Open();
                        SqlCommand ekle = new SqlCommand("insert urun values(@kategori,@urun,@aciklama,@ozellik,@fiyat,@eski,@resim,@statu,@stok)", baglanti);
                        ekle.Parameters.AddWithValue("@kategori", DropDownList1.SelectedValue);
                        ekle.Parameters.AddWithValue("@urun", TextBox2.Text);
                        ekle.Parameters.AddWithValue("@aciklama", TextBox3.Text);
                        ekle.Parameters.AddWithValue("@ozellik", TextBox4.Text);
                        ekle.Parameters.AddWithValue("@fiyat", TextBox5.Text);
                        ekle.Parameters.AddWithValue("@eski", TextBox6.Text);
                        ekle.Parameters.AddWithValue("@resim", secilen_dosya);
                        ekle.Parameters.AddWithValue("@statu", DropDownList2.SelectedValue);
                        ekle.Parameters.AddWithValue("@stok", TextBox7.Text);
                        ekle.ExecuteNonQuery();
                        baglanti.Close();
                        Response.Redirect("adminurun.aspx");
                    }
                    else
                        Response.Write("<script>alert('Geçersiz dosya uzantisi')</script>");

                }
                else
                    Response.Write("<script>alert('Lütfen önce ürün resmini seçin')</script>");



            }
            else
                Response.Write("<script>alert('Lütfen ürün kategorisini ve ürün statüsünü seçin')</script>");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Panel1.Visible = true;
            DataTable dt = UrunDoldur();
            int secilen_satir_indeksi = Convert.ToInt32(e.CommandArgument);
            TextBox1.Text = dt.Rows[secilen_satir_indeksi][0].ToString();
            DropDownList1.SelectedValue = dt.Rows[secilen_satir_indeksi][1].ToString();
            TextBox2.Text = dt.Rows[secilen_satir_indeksi][2].ToString();
            TextBox3.Text = dt.Rows[secilen_satir_indeksi][3].ToString();
            TextBox4.Text = dt.Rows[secilen_satir_indeksi][4].ToString();
            TextBox5.Text = dt.Rows[secilen_satir_indeksi][5].ToString();
            TextBox6.Text = dt.Rows[secilen_satir_indeksi][6].ToString();
            Label3.Text = dt.Rows[secilen_satir_indeksi][7].ToString();
            DropDownList2.SelectedValue = dt.Rows[secilen_satir_indeksi][8].ToString();
            TextBox7.Text = dt.Rows[secilen_satir_indeksi][9].ToString();
        }

        DataTable UrunDoldur()
        {
            SqlCommand okuUrun = new SqlCommand("select * from urun", baglanti);
            SqlDataAdapter da = new SqlDataAdapter(okuUrun);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string hedefKlasor = Server.MapPath("images/");
            if (!System.IO.Directory.Exists(hedefKlasor))
            {
                System.IO.Directory.CreateDirectory(hedefKlasor);
            }

            string urun_resim;
            if (FileUpload1.HasFile == false)
            {
                urun_resim = Label3.Text;
            }
            else
            {
                urun_resim = FileUpload1.FileName;

            }
            string uzanti = System.IO.Path.GetExtension(urun_resim);
            if (uzanti == ".jpg" || uzanti == ".jpeg" || uzanti == ".png" || uzanti == ".jfif")
            {
                baglanti.Open();
                SqlCommand guncelle = new SqlCommand("update urun set urun_kat_id=@kategori,urun_ad=@urun,aciklama=@aciklama,ozellik=@ozellik,fiyat=@fiyat,eski_fiyat=@eski,resim=@resim,statu=@statu,stok=@stok where urun_id=@id", baglanti);
                guncelle.Parameters.AddWithValue("@kategori", DropDownList1.SelectedValue);
                guncelle.Parameters.AddWithValue("@urun", TextBox2.Text);
                guncelle.Parameters.AddWithValue("@aciklama", TextBox3.Text);
                guncelle.Parameters.AddWithValue("@ozellik", TextBox4.Text);
                guncelle.Parameters.AddWithValue("@fiyat", TextBox5.Text);
                guncelle.Parameters.AddWithValue("@eski", TextBox6.Text);
                guncelle.Parameters.AddWithValue("@resim", urun_resim);
                guncelle.Parameters.AddWithValue("@statu", DropDownList2.SelectedValue);
                guncelle.Parameters.AddWithValue("@stok", TextBox7.Text);
                guncelle.Parameters.AddWithValue("@id", TextBox1.Text);
                guncelle.ExecuteNonQuery();
                baglanti.Close();
                Response.Redirect("adminurun.aspx");


            }
            else
                Response.Write("<script>alert('Geçersiz Dosya Uzantısı')</script>");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }
    }
}
