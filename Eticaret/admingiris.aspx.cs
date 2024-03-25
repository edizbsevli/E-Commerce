using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eticaret
{
    public partial class admingiris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies[".ASPXAUTH"] == null)//kimlik doğrulama anahtarı yok yani giriş yapılmamış
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
            else
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
                Label2.Text = User.Identity.Name;//oturum açmış kullanıcının adını gösterir
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //kullanıcı kayıtlı ise
            if (Membership.ValidateUser(TextBox1.Text, TextBox2.Text) == true)
            //beni hatırla işaretlenmiş ise form kimlijk doğrulama anahtarının tutulacağı .ASPXAUTH isimli cookinin kalıcı olarak tarayıcıda saklanmasını sağlayalım
            {
                if (CheckBox1.Checked == true)
                {
                    FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, true);
                }
                else
                {
                    FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, false);
                }
            }
            else
            {
                Label1.Text = "kullanıcı adı ya da parola hatası";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //çıkış butonu 
            FormsAuthentication.SignOut();
            //form kimlik doğrulamada kullanılan cookietarayıcıdan temizleyerek çıkış işlemini gerçeklestirir.
            Response.Redirect("default.aspx");

        }
    }
}