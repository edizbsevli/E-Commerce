<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="sepett.aspx.cs" Inherits="Eticaret.sepett" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h2>Sepet</h2>
<div class="row">
  <div class="col-75">
    <div class="sepett">
      <form action="/action_page.php">
        <asp:Button ID="Button1" runat="server" Text="Ödemeye Devam Et" CssClass="btn" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Sepeti Boşalt" CssClass="btn" OnClick="Button2_Click"/>
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="sepett">
      <h4>Sepet <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>
        <asp:Label ID="Label1" runat="server" Text="0"></asp:Label></b></span></h4>
<asp:ListView ID="ListView1" runat="server">
    <ItemTemplate>
        <p><a href="sepet.aspx?urun_id=<%# Eval("urun_id") %>"><%# Eval("urun_ad") %></a> <%# Eval("adet") %> Adet <span class="fiyat"><%# Eval("fiyat") %>TL</span></p>
    </ItemTemplate>
</asp:ListView>
      <hr>
      <p>Toplam <span class="price" style="color:black"><b>
            <asp:Label ID="Label2" runat="server" Text="0"></asp:Label>TL</b></span></p>
    </div>
  </div>
</div>
</asp:Content>
