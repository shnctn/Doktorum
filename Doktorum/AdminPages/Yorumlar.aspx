<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/Admin.Master" AutoEventWireup="true" CodeBehind="Yorumlar.aspx.cs" Inherits="Doktorum.AdminPages.Yorumlar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="panel panel-success">
        <div class="panel-heading">
            <h4>Yorumlar  görüntüleme ve silme işlemleri</h4>
        </div>

        <div class="panel-body">

            <asp:ListView ID="ListView1" runat="server" DataKeyNames="YorumID" DataSourceID="SqlYorumgetir">
                <AlternatingItemTemplate>
                   
                        <div class="panel panel-yellow">
                            <div class="panel panel-heading">
                                      
                                <asp:Label ID="AdSoyadLabel" runat="server" Text='<%# Eval("AdSoyad") %>' />|
                                       
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                      
                                <asp:Label ID="YorumTarihiLabel" runat="server" Text='<%# Eval("YorumTarihi") %>' />
                                <br />
                            </div>
                        
                        <div class="panel panel-body">
                            YorumIcerik:
                            <asp:Label ID="YorumIcerikLabel" runat="server" Text='<%# Eval("YorumIcerik") %>' />
                            <br />
                            <br />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Silmek İçin Tıkla" OnClientClick="return confirm(&quot;Silmek istiyor musunuz?&quot;)" CssClass="btn btn-danger btn-xs pull-right" />
                            <br />
                        </div>
                            </div>
                    
                </AlternatingItemTemplate>
                
                <EmptyDataTemplate>
                    No data was returned.
                </EmptyDataTemplate>
                
                <ItemSeparatorTemplate>
                    <br />
                </ItemSeparatorTemplate>


                <ItemTemplate>
                   
                        <div class="panel panel-yellow">
                            <div class="panel panel-heading">
                               
                        <asp:Label ID="AdSoyadLabel" runat="server" Text='<%# Eval("AdSoyad") %>' />
                               
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                              
                        <asp:Label ID="YorumTarihiLabel" runat="server" Text='<%# Eval("YorumTarihi") %>' />
                                <br />
                            </div>
                       
                        <div class="panel panel-body">
                           
                            <asp:Label ID="YorumIcerikLabel" runat="server" Text='<%# Eval("YorumIcerik") %>' />
                            <br />
                            <br />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Silmek İçin Tıkla" OnClientClick="return confirm(&quot;Silmek istiyor musunuz?&quot;)" CssClass="btn btn-danger btn-xs  pull-right" />
                            <br />
                        </div>
                         </div>
                   
                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="text-align: center; font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-info" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                   
                        <div class="panel panel-yellow">
                            <div class="panel panel-heading">
                              
                        <asp:Label ID="AdSoyadLabel" runat="server" Text='<%# Eval("AdSoyad") %>' />
                      
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                     
                        <asp:Label ID="YorumTarihiLabel" runat="server" Text='<%# Eval("YorumTarihi") %>' />
                        <br />
                            </div>
                        
                       <div class="panel panel-body">
                           
                            <asp:Label ID="YorumIcerikLabel" runat="server" Text='<%# Eval("YorumIcerik") %>' />
                            <br />
                           <br />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Silmek İçin Tıkla" OnClientClick="return confirm(&quot;Silmek istiyor musunuz?&quot;)" CssClass="btn btn-danger btn-xs  pull-right" />
                           <br />
                       </div>
                            </div>
                   
                </SelectedItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="SqlYorumgetir" runat="server" ConnectionString="<%$ ConnectionStrings:DataContext %>" DeleteCommand="DELETE FROM [Yorumlar] WHERE [YorumID] = @YorumID" InsertCommand="INSERT INTO [Yorumlar] ([AdSoyad], [YorumIcerik], [Email], [AmeliyatID], [YorumTarihi], [Onaylandimi]) VALUES (@AdSoyad, @YorumIcerik, @Email, @AmeliyatID, @YorumTarihi, @Onaylandimi)" SelectCommand="SELECT * FROM [Yorumlar]" UpdateCommand="UPDATE [Yorumlar] SET [AdSoyad] = @AdSoyad, [YorumIcerik] = @YorumIcerik, [Email] = @Email, [AmeliyatID] = @AmeliyatID, [YorumTarihi] = @YorumTarihi, [Onaylandimi] = @Onaylandimi WHERE [YorumID] = @YorumID">
                <DeleteParameters>
                    <asp:Parameter Name="YorumID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AdSoyad" Type="String" />
                    <asp:Parameter Name="YorumIcerik" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="AmeliyatID" Type="Int32" />
                    <asp:Parameter Name="YorumTarihi" Type="DateTime" />
                    <asp:Parameter Name="Onaylandimi" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AdSoyad" Type="String" />
                    <asp:Parameter Name="YorumIcerik" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="AmeliyatID" Type="Int32" />
                    <asp:Parameter Name="YorumTarihi" Type="DateTime" />
                    <asp:Parameter Name="Onaylandimi" Type="Boolean" />
                    <asp:Parameter Name="YorumID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </div>

</asp:Content>
