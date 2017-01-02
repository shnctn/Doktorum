<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/Admin.Master" AutoEventWireup="true" CodeBehind="hakkimda.aspx.cs" Inherits="Doktorum.AdminPages.Hakkimda" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-md-12">
            <div class="btn-group btn-group-justified" role="group" aria-label="...">
                <div class="col-md-4">
                    <a href="hakkimdaEkle.aspx" class="btn btn-primary">Kişisel Bİlgilerimi Ekle</a>
                </div>
                <div class="col-md-4">
                    <a href="hakkimdaDuzenle.aspx" class="btn btn-success">Kişisel Bilgilerimi Düzenle</a>

                </div>
                <div class="col-md-4">
                    <a href="hakkimdaSil.aspx" class="btn btn-danger">Kişisel Bİlgilerimi Sil</a>
                </div>
            </div>

        </div>
    </div>
    <br />
    <br />

    <div class="row">
        <div class="col-md-12">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon"><b>Başlik</b></span>
                <asp:DropDownList ID="drBaslik" runat="server" AutoPostBack="True" CssClass="form-control" aria-describedby="basic-addon" OnSelectedIndexChanged="drBaslik_SelectedIndexChanged1" >
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col-md-12">

            <asp:Repeater ID="RptAcik" runat="server">
                <ItemTemplate>
                    <div class="row">

                        <div class="col-md-12 text-center">
                            <img class="img-responsive img-hover" src="<%#Eval("Resim") %>"  alt=""/>
                          
                        </div>
                    </div>
                    <br />
                    <div class="row">

                        <div class="col-md-12">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3>
                                        <b>
                                            <%#Eval("Baslik") %><br />
                                            <%#Eval("Ad") %>_<%#Eval("Soyad") %></b></h3>
                                </div>
                                <div class="panel-body">
                                    <p>
                                        <%#Eval("Aciklama") %>
                                    </p>

                                </div>

                            </div>
                        </div>
                    </div>
                </ItemTemplate>

            </asp:Repeater>

        </div>
    </div>

</asp:Content>
