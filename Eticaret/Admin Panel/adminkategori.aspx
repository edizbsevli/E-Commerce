<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Panel/admin.Master" AutoEventWireup="true" CodeBehind="adminkategori.aspx.cs" Inherits="Eticaret.adminkategori" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="baslik">Kategori İşlemleri</div>
    <asp:Button ID="Button1" runat="server" Text="Yeni Ekle " CssClass="buton-turuncu" OnClick="Button1_Click" />
    <asp:Panel ID="Panel1" runat="server" Visible="False">
        <div id="icerik-sol" class="data">
            <p>Kategori Id:</p>
            <p>Kategori Adı:</p>
        </div>
        <div id="icerik-sag">
            <p>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="formKontrol" Enabled="False"></asp:TextBox>
            </p>
            <p>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="formKontrol"></asp:TextBox>
            </p>
            <p>
                <asp:Button ID="Button2" runat="server" Text="Ekle" CssClass="buton-turuncu" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" Text="Güncelle" CssClass="buton-turuncu" OnClick="Button3_Click" />
                <asp:Button ID="Button4" runat="server" Text="İptal" CssClass="buton-turuncu" OnClick="Button4_Click" />
            </p>
        </div>
        <div class="temizle"></div>
    </asp:Panel>
    <asp:GridView ID="GridView1" runat="server" CssClass="data" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" ControlStyle-CssClass="buton-turuncu" >
<ControlStyle CssClass="buton-turuncu"></ControlStyle>
            </asp:CommandField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="buton-turuncu" >
<ControlStyle CssClass="buton-turuncu"></ControlStyle>
            </asp:CommandField>
        </Columns>
        <HeaderStyle Height="60px" />
    </asp:GridView>
</asp:Content>
