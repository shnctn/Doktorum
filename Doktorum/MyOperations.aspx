<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="MyOperations.aspx.cs" Inherits="Doktorum.MyOperations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="col-md-12">
        <!-- Team Members -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">AMELİYATLARIM</h2>
            </div>
         </div>
        <div class="row"> 
            

            <asp:ListView ID="ListAmeliyat" runat="server">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img class="img-responsive" src="<%#Eval("Resim") %>" alt="" />
                            <div class="caption">
                                <h4><a href="Ameliyat_<%#LinkDuzenle(Eval("Baslik").ToString().ToLower()) %>_<%#Eval("ID") %>"><%#Eval("Baslik") %></a>
                                
                                </h4>
                                <p>
                                    <%# Eval("Aciklama").ToString().Length>70? Eval("Aciklama").ToString().Substring(0,70) : Eval("Aciklama").ToString() %>
                                </p>
                                <p>
                                   <a href="Ameliyat_<%#LinkDuzenle(Eval("Baslik").ToString().ToLower()) %>_<%#Eval("ID") %>">...Daha fazlası için yıklayınız</a>
                                     </p>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:ListView>
        </div>
        <!-- /.row -->


    </div>

</asp:Content>
