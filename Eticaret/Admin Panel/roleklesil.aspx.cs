using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eticaret
{
    public partial class roleklesil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Rolleri_listele();
        }
        void Rolleri_listele()
        {
            string[] roller = Roles.GetAllRoles();
            GridView1.DataSource = roller;
            GridView1.DataBind();
            GridView1.HeaderRow.Cells[1].Text = "Tanımlı Roller";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Label1.Text = "Lütfen bir rol adı girin";
                return;

            }
            string rol_adi = TextBox1.Text;
            if (Roles.RoleExists(rol_adi) == true)
            {
                Label1.Text = "Bu rol zaten kayıtlı. Lütfen farklı bir rol adı girin";
                return;
            }

            
            Roles.CreateRole(rol_adi);
            Label1.Text = "Rol kaydı tamamlandı";
            Rolleri_listele();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string silinecek_rol = e.Values[0].ToString();
            Roles.DeleteRole(silinecek_rol);
            Rolleri_listele();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}