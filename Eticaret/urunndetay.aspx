<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" CodeBehind="urunndetay.aspx.cs" Inherits="Eticaret.urunndetay" EnableEventValidation="false" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .resim img {
        max-width: 100%; 
        height: auto; 
        display: block; 
        margin: 0 auto; 
    }
        </style>
 <div class="ana">
        <asp:ListView ID="ListView1" runat="server" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
            <ItemTemplate>
                
             <div class="urun">
                    <h1><%# Eval("urun_ad") %></h1>
                    <div class="resim">
                        <img src="images/<%# Eval("resim") %>" />
                    </div>
                
                    <div class="aciklama">
                        <%# Eval("aciklama") %>
                    </div>
                    <div class="fiyat">
                        <h3><%# Eval("eski_fiyat") %> TL</h3>
                    </div>
             
                    <asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem Value="">Adet Seçin</asp:ListItem>
    <asp:ListItem Value="1">1</asp:ListItem>
    <asp:ListItem Value="2">2</asp:ListItem>
    <asp:ListItem Value="3">3</asp:ListItem>
    <asp:ListItem Value="4">4</asp:ListItem>
    <asp:ListItem Value="5">5</asp:ListItem>
</asp:DropDownList>
                
                <asp:Button ID="Button1" runat="server" Text="Sepete Ekle" CssClass="btnsepet" OnClick="Button1_Click"  />
</ItemTemplate>
</asp:ListView>
     </div>


</asp:Content>
