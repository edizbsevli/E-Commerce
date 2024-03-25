<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Panel/admin.Master" AutoEventWireup="true" CodeBehind="adminurun.aspx.cs" Inherits="Eticaret.adminurun" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="baslik">Ürün İşlemleri</div>
    <asp:Button ID="Button1" runat="server" Text="Yeni Ekle" CssClass="buton-turuncu" OnClick="Button1_Click" />
    <asp:Panel ID="Panel1" runat="server" Visible="False">
    <table class="data">
        <tr>
            <td class="auto-style2">Ürün İd:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="formKontrol" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Ürün Kategorisi Seçin:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="formKontrol">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Ürün Adını Girin:</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="formKontrol"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Ürün Açıklamasını Girin:</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="formKontrol" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Ürün Özelliklerini Girin:</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="formKontrol" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Ürün Fiyatını Girin:</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="formKontrol"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Ürün Eski Fiyatını Girin:</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="formKontrol"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Ürün Resmini Seçin:</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="formKontrol" />
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Ürün Statüsünü Seçin:</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="formKontrol">
                    <asp:ListItem Value="0">Ürün Statüsü Seçin</asp:ListItem>
                    <asp:ListItem Value="Manset">Manşet</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Ürün Stoğunu Girin:</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox7" runat="server" CssClass="formKontrol"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" CssClass="buton-turuncu" Text="Ekle" OnClick="Button2_Click" />
&nbsp;<asp:Button ID="Button3" runat="server" CssClass="buton-turuncu" Text="Güncelle" OnClick="Button3_Click" />
&nbsp;<asp:Button ID="Button4" runat="server" CssClass="buton-turuncu" Text="İptal" OnClick="Button4_Click" />
            </td>
        </tr>
    </table>
</asp:Panel>
   
    <asp:GridView ID="GridView1" runat="server" CssClass="data" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" ControlStyle-CssClass="buton-turuncu"  >
<ControlStyle CssClass="buton-turuncu"></ControlStyle>
            </asp:CommandField>
            <asp:TemplateField>
                <ItemTemplate>
                    <img src="images/<%# Eval("resim") %>" style="width:50px;height:50px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
