<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="kartbilgi.aspx.cs" Inherits="Eticaret.kartbilgi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
        }
        .auto-style3 {
            width: 500px;
        }
        .auto-style4 {
            width: 209px;
        }
        .auto-style5 {
            width: 500px;
            height: 22px;
        }
        .auto-style6 {
            width: 209px;
            height: 22px;
        }
        .auto-style7 {
            height: 22px;
        }
        .auto-style8 {
            width: 500px;
            height: 16px;
        }
        .auto-style9 {
            width: 209px;
            height: 16px;
        }
        .auto-style10 {
            height: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label1" runat="server" BorderWidth="1px" Font-Bold="True" Text="Kart Bilgileri"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label2" runat="server" Text="Kart Sahibi :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" ToolTip="Kart Sahibi Ad Soyad"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label3" runat="server" Text="Kart No :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" ToolTip="Kartınızın Numarası"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label4" runat="server" Text="Son Kullanma Tarihi :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" ToolTip="Kartınızın Son Kullanma Tarihi"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label5" runat="server" Text="CVV :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" ToolTip="Kartın Arkasında Yazan 3 Haneli Sayı"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label8" runat="server" BorderWidth="1px" Font-Bold="True" Text="Adres Bilgileri"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label6" runat="server" Text="Alıcı Ad Soyad :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" ToolTip="Adınız Soyadınız"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5"></td>
            <td class="auto-style6">
                <asp:Label ID="Label7" runat="server" Text="Adres :"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox6" runat="server" ToolTip="Adresiniz"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8"></td>
            <td class="auto-style9">
                <asp:Label ID="Label9" runat="server" Text="Alıcı Tel No :"></asp:Label>
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="TextBox7" runat="server" TextMode="Phone" ToolTip="Telefon Numaranız"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Font-Bold="True" OnClick="Button1_Click" Text="Ödeme Yap" />
            </td>
        </tr>
    </table>
</asp:Content>
