using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eticaret
{
    public partial class kullanicislem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MembershipUser kullanici = Membership.GetUser(TextBox1.Text);
            
            if (kullanici != null && kullanici.IsLockedOut == true)
            {
               

                kullanici.UnlockUser();
                
                Response.Redirect("kullanicislem.aspx");
            }
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string kullanici_adi = TextBox1.Text;
            MembershipUser kullanici = Membership.GetUser(kullanici_adi);

            
            if (kullanici != null)
            {
                Panel1.Visible = true;
                Label1.Text = kullanici.UserName;
                Label2.Text = kullanici.Email;
                if (kullanici.IsApproved == true)
                    Label3.Text = "Onaylı";
                else
                    Label3.Text = "Onaylanmamış";
                if (kullanici.IsLockedOut == true)
                {
                    Label4.Text = "Kullanıcı hesabı kilitli";
                    Button1.Visible = true;
                }
                else
                {
                    Label4.Text = "Hesap Kilitli Değil";
                    Button1.Visible = false;

                }
                if (kullanici.IsOnline == true)
                    Label5.Text = "Kullanıcı çevrimiçi";
                else
                    Label5.Text = "Kullanıcı çevrimdışı";
                Label6.Text = kullanici.CreationDate.ToString();
                Label7.Text = kullanici.LastLoginDate.ToString();
                Label8.Text = kullanici.LastPasswordChangedDate.ToString();
                Label9.Text = kullanici.LastActivityDate.ToString();
            }
            else
            {
                Label10.Text = "Bu kullanıcı kayıtlı değil";

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string kullanici_adi = TextBox1.Text;
            Membership.DeleteUser(kullanici_adi);
            Response.Redirect("kullanicislem.aspx");
        }
    }
}