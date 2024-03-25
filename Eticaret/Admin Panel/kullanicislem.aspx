<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Panel/admin.Master" AutoEventWireup="true" CodeBehind="kullanicislem.aspx.cs" Inherits="Eticaret.kullanicislem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                    <div>
            Kullanıcı Adını Girin:
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
&nbsp;
            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" Visible="False">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">Kullanıcı Adı:</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">E-mail:</td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Hesap Onaylı Mı:</td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Hesap Kilitli Mi:</td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Giriş Yapılmış Mı:</td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Hesabın Oluşturulma Zamanı:</td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">En son Giirş Zamanı:</td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Parola Değiştirme Zamanı:</td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">En son aktivasyon zamanı:</td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Hesap Kilidini Aç" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Kullanıcıyı Sil" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
</asp:Content>
