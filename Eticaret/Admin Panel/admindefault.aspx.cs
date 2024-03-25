using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eticaret
{
    public partial class admindefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            kullanicilari_listele();
        }
        void kullanicilari_listele()
        {
            MembershipUserCollection kullanicilar = Membership.GetAllUsers();

            GridView1.DataSource = kullanicilar;
            GridView1.DataBind();
        }
    }
}