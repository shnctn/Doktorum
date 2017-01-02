<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Doktorum.AdminPages.AdminPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="panel panel-warning">
        <div class="panel panel-heading">
            <h3>Slider Resim İşlemleri</h3>

        </div>
        <div class="panel panel-body">

            <div class="row">
                <div class=" col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading">
                            <h5>Resim Ekle
                            </h5>

                        </div>
                        <div class="panel panel-body">
                            <div class="control-group form-group">
                                <div class="controls">

                                    <label>Resim Adı: </label>
                                    <%--required data-validation-required-message="Lütfen İsim Soyisim Giriniz"--%>
                                    <asp:TextBox ID="txtAd" runat="server" CssClass="form-control" ValidationGroup="ekle"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAd" ErrorMessage="Lütfen adınızı giriniz" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="control-group form-group">
                                <div class="controls">

                                    <label>Dosya Seciniz: </label>
                                    <%--required data-validation-required-message="Lütfen İsim Soyisim Giriniz"--%>
                                    <asp:FileUpload ID="ResimSec" runat="server"  CssClass="form-control" ValidationGroup="ekle"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ResimSec" ErrorMessage="Lütfen Resim Seçiniz" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div id="success">
                                <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" CssClass="btn btn-primary pull-right" OnClick="btnKaydet_Click" ValidationGroup="ekle" />
                            </div>
                        </div>
                    </div>

                </div>
                </div>
            <div class="row">
                <div class=" col-md-4">
                    <div class="panel panel-green">
                        <div class="panel panel-heading">
                            <h5>Resim Duzenle ve Sil</h5>
                        </div>
                        <div class="panel panel-body">
                            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlSlider">
                                <AlternatingItemTemplate>
                                    <li style="background-color: #FFF8DC;">Resim No:
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                        <br />
                                         Resim Adı:
                                        <asp:Label ID="AltLabel" runat="server" Text='<%# Eval("Alt") %>' />
                                        <br />
                                        Resim Adresi:
                                       <img class="img-responsive" src="<%# Eval("Slider") %>" width="200" height="150"  /> <br />
                                       
                                        <br />
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Resmi Sil" CssClass="btn btn-danger btn-xs" OnClientClick="return confirm(&quot;Silmek istiyor musunuz?&quot;)" />
                                  
                                    </li>
                                </AlternatingItemTemplate>
                               <EmptyDataTemplate>
                                    No data was returned.
                                </EmptyDataTemplate>
                              
                                <ItemSeparatorTemplate>
                                    <br />
                                </ItemSeparatorTemplate>
                                <ItemTemplate>
                                    <li style="background-color: #DCDCDC;color: #000000;">Resim No:
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                        <br />
                                         Resim Adı:
                                        <asp:Label ID="AltLabel" runat="server" Text='<%# Eval("Alt") %>' />
                                        <br />
                                        Resim Adresi:
                                       <img class="img-responsive" src="<%# Eval("Slider") %>" width="200" height="150"  />
                                        <br />
                                     <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Resmi Sil" CssClass="btn btn-danger btn-xs" OnClientClick="return confirm(&quot;Silmek istiyor musunuz?&quot;)"/>
                                  
                                         </li>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <li runat="server" id="itemPlaceholder" />
                                    </ul>
                                    <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                    </div>
                                </LayoutTemplate>
                               </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
    <asp:SqlDataSource ID="SqlSlider" runat="server" ConnectionString="<%$ ConnectionStrings:DataContext %>" DeleteCommand="DELETE FROM [Slider] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Slider] ([Slider], [Alt]) VALUES (@Slider, @Alt)" SelectCommand="SELECT * FROM [Slider]" UpdateCommand="UPDATE [Slider] SET [Slider] = @Slider, [Alt] = @Alt WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Slider" Type="String" />
            <asp:Parameter Name="Alt" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Slider" Type="String" />
            <asp:Parameter Name="Alt" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
