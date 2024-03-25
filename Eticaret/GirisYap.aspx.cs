using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eticaret
{
    public partial class GirisYap : System.Web.UI.Page
    {
        public static class KullaniciAdiHelper
        {
            public static string KucukHarfeCevir(string kullaniciAdi)
            {
                return kullaniciAdi.ToLower();
            }

            public static string KucukHarfeCevirMembership(string kullaniciAdi)
            {
                MembershipUser kullanici = Membership.GetUser(kullaniciAdi);
                if (kullanici != null)
                {
                    return kullanici.UserName.ToLower();
                }
                return kullaniciAdi.ToLower();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Login1_LoginError(object sender, EventArgs e)
        {
            //oturum açmış kullancının bilgilerini alıp, hesabın kilitli olup olmaıdğı bilgisini tutan IsLockedOut özelliğinin değeri true olduğunda (yani hesap kilitlendi ise) label kontrolünde bilgilendirme yapacaığız
            //kullanıcı bilgilerine erişmek için GetUser metodu kullanılır. GetUser metodu kullanıcı adını parametre olarak alır ve geriye MemberShipUser türünden değer döndürür.
            String kadi = KullaniciAdiHelper.KucukHarfeCevirMembership(((TextBox)Login1.FindControl("UserName")).Text);
            MembershipUser kullanici = Membership.GetUser(kadi);

            if (kullanici != null && kullanici.IsLockedOut == true)//kullanıcı kilitli ise
            {
                Login1.FailureText = "Hesabınız Kilitlendi.";
            }
        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            TextBox userNameTextBox = (TextBox)Login1.FindControl("UserName");
            TextBox passwordTextBox = (TextBox)Login1.FindControl("Password");
            Literal failureTextLiteral = (Literal)Login1.FindControl("FailureText");

            
            if (userNameTextBox != null && passwordTextBox != null && failureTextLiteral != null)
            {
                string kullaniciAdi = userNameTextBox.Text;
                string sifre = passwordTextBox.Text;

                
                if (kullaniciAdi == "1" && sifre == "erkek123.")
                {
                    
                    Response.Redirect("Admin Panel/admindefault.aspx");
                }
                else
                {
                    
                    failureTextLiteral.Text = "Kullanıcı adı veya şifre hatalı.";
                }
            }
    }
    }
}