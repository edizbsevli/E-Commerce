<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Panel/admin.Master" AutoEventWireup="true" CodeBehind="roleklesil.aspx.cs" Inherits="Eticaret.roleklesil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div>
            Rol adını girin:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Rol Ekle" />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
            <br />
            <br />
            Tanımlı roller aşağıda listelenmektedir:<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
</asp:Content>
