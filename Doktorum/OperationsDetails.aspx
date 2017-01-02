<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="OperationsDetails.aspx.cs" Inherits="Doktorum.OperationsDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-md-12">

            <asp:Repeater ID="RptAcik" runat="server">
                <ItemTemplate>
                    <div class="row">

                        <div class="col-md-12">
                            <img class="img-responsive img-hover" src="<%#Eval("Resim") %>" alt="">
                        </div>
                    </div>
                    <br />
                    <div class="row">

                        <div class="col-md-12">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3>
                                        <b>
                                            <%#Eval("Baslik") %>
                                        </b>
                                    </h3>
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
    <div class="row">
        <div class="col-md-8">

            <div class="well">
                <h4>Yorum Yap</h4>

                <div class="form-group">
                    <asp:TextBox ID="Txtad" runat="server" CssClass="form-control" placeHolder="İsim-Soyisim" ValidationGroup="yorum"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Txtad" ErrorMessage="İsim Soyisim alanı boş geçilemez" ForeColor="Red" ValidationGroup="yorum"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeHolder="E-Mail" ValidationGroup="yorum"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email alanı boş geçilemez" ForeColor="Red" ValidationGroup="yorum"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Formatında Degildir" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="yorum"></asp:RegularExpressionValidator>
                    <br />

                    <asp:TextBox ID="txtYorum" CssClass="form-control" placeholder="Yorum-Yaz" runat="server" Height="71px" TextMode="MultiLine" ValidationGroup="yorum"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtYorum" ErrorMessage="İçerik  Boş Geçilemez" ForeColor="Red" ValidationGroup="yorum"></asp:RequiredFieldValidator>
                </div>
                <asp:Button ID="btnKAydet" CssClass="btn btn-primary" runat="server" Text="Kaydet"  OnClick="ButtonKaydet_Click" ValidationGroup="yorum" />

            </div>
        </div>
    </div>
    <hr />

    <!-- Posted Comments -->
    <div class="row">
        <div class="col-md-8">
            <asp:Repeater ID="rptYorum" runat="server">
                <ItemTemplate>
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img class="media-object" src="http://placehold.it/64x64" alt="">
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;<div class="media-body">
                            <h4 class="media-heading"><a href="#"><%# Eval("AdSoyad") %></a>
                                <small><%# Eval("YorumTarihi") %></small>
                            </h4>
                            <p>
                                <%# Eval("YorumIcerik") %>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>

                <SeparatorTemplate>
                </SeparatorTemplate>
            </asp:Repeater>
        </div>

    </div>
</asp:Content>
