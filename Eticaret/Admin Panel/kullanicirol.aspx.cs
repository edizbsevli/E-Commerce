using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eticaret
{
    public partial class kullanicirol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                kullanicilari_listele();
                rolleri_listele();
            }
        }
       
        void kullanicilari_listele()
        {
            MembershipUserCollection kullanicilar = Membership.GetAllUsers();

            DropDownList1.DataSource = kullanicilar;
            DropDownList1.DataBind();


            

        }
        
        void rolleri_listele()
        {
            string[] roller = Roles.GetAllRoles();
            DropDownList2.DataSource = roller;
            DropDownList2.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (TextBox1.Text == "")
            {
                Label1.Text = "Lütfen kullanıcı adını girin";
                return;
            }
            string kullanici_adi = TextBox1.Text;

            MembershipUser kullanici = Membership.GetUser(kullanici_adi);
            if (kullanici == null)
            {
                Label1.Text = "Bu kullanıcı kayıtlı değil. Lütfen sistemde kayıtlı kullanıcı adı girin";
                return;
            }
            string secilen_rol = DropDownList2.SelectedValue;
            if (Roles.IsUserInRole(kullanici_adi, secilen_rol) == true)
            {
                Label1.Text = "Bu kullanıcı seçilen role zaten eklenmiş. Lütfen farklı bir kullanıcı ya da rol seçin";
                return;
            }
            Roles.AddUserToRole(kullanici_adi, secilen_rol);
            Response.Redirect("kullanicirol.aspx");
        }

        void kullanici_rolllerini_listele()
        {
            string secilen_kullanici = DropDownList1.SelectedValue;
            string[] roller = Roles.GetRolesForUser(secilen_kullanici);
            GridView1.DataSource = roller;
            GridView1.DataBind();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            kullanici_rolllerini_listele();
        }
    }

    }
