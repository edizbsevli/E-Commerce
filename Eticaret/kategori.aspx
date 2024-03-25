<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="kategori.aspx.cs" Inherits="Eticaret.kategori" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id ="bilesen" style ="margin-top:auto ;">

<div id="yeniler">
	
    <hgroup>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> 
    </hgroup>
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
           

	<asp:SqlDataSource ID="eticaret_web" runat="server" ConnectionString="Data Source=EDIZ\SQLEXPRESS;Initial Catalog=eticaret_web;Integrated Security=True;Pooling=False" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Kategori]"></asp:SqlDataSource>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server">
    </asp:EntityDataSource>
           

	</div>
</div>
</asp:Content>
