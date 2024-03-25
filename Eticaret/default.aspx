<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Eticaret._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 331px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="fotu"><img src="images/banner taslak kopya.png" class="auto-style3" /></div>
            <div id ="bilesen" style ="margin-top:auto ;">
<div id="yeniler">
	<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ayın Ürünleri</h1>
    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
            <div class="urun">
                <h1><%# Eval("urun_ad") %></h1>
                <a href="#"><figure>
                    <img src="images/<%# Eval("resim") %>" alt='Yazı Başlığı' width="166" height="166"/></figure>
                </a>
            <div class="fiyatKismi">
            <div class="fiyat">
            <span>fiyat:</span>
            <p><%# Eval("fiyat") %> TL</p>
            <h4><%# Eval("eski_fiyat") %> TL</h4>
            </div>

            <div class="detay">
         	    <span>detay:</span>
                <a href="urunndetay.aspx?urunID=<%# Eval("urun_id") %>" ><div id='uincele'>İncele</div></a>
            </div>
            </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
