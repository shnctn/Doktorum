<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Doktorum.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="col-md-12">

        <div class="row carousel-holder">

            <div class="col-md-12">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="slide-image" src="images/800.400/ameliyat_1.jpg" alt="Doktor Sabri Emin Karakoc" />
                        </div>
                        <asp:Repeater ID="rptSlider" runat="server">
                            <ItemTemplate>
                                <div class="item">
                                    <img class="slide-image" src="<%#DataBinder.Eval(Container.DataItem,"Slider") %>" alt="" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <asp:ListView ID="ListAmeliyat" runat="server">
                <ItemTemplate>
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="<%#Eval("Resim") %>" width="300" height="150" alt="" />
                            <div class="caption">

                                <h4><%--<a href='OperationsDetails.aspx?mid=<%# Eval("ID") %>'><%# Eval("Baslik").ToString().Length>37? Eval("Baslik").ToString().Substring(0,37) : Eval("Baslik").ToString() %></a>
                                --%>
                                 <a href="Ameliyat_<%#LinkDuzenle(Eval("Baslik").ToString().ToLower()) %>_<%#Eval("ID") %>"><%#Eval("Baslik") %></a>
                                    
                                </h4>

                                <p>
                                    <%# Eval("Aciklama").ToString().Length>70? Eval("Aciklama").ToString().Substring(0,70) : Eval("Aciklama").ToString() %>
                                </p>

                                <p>
                                 <%--  <a href='OperationsDetails.aspx?mid=<%# Eval("ID") %>'>...Daha fazlası için tıklayın...</a>
                               --%>    
                                    
                                     <a href="Ameliyat_<%#LinkDuzenle(Eval("Baslik").ToString().ToLower()) %>_<%#Eval("ID") %>">...Daha fazlası için yıklayınız</a>
                                       </p>
                            </div>

                            <div class="ratings">
                                <p class="pull-right">15 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>

</asp:Content>
