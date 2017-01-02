<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Doktorum.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="col-md-12">

        <div class="col-md-12">
            <h2 class="page-header">HAKKIMDA</h2>
        </div>
        <asp:Repeater ID="rptHakkimda" runat="server">
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-12">
                        <img class="img-responsive img-thumbnail" src="<%#Eval("Resim") %>" alt="Dr.Sabri.Emin.Karacor" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel panel-heading">
                                <h3><%# Eval("Ad")%> <%#Eval("Soyad") %></h3>
                            </div>
                            <div class="panel panel-body">
                                <div><%#Eval("Aciklama") %></div>
                            </div>
                        </div>
                    </div>
                </div>


            </ItemTemplate>
        </asp:Repeater>
        <!-- /.row -->


    </div>
</asp:Content>
