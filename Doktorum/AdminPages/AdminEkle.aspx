<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminEkle.aspx.cs" Inherits="Doktorum.AdminPages.AdminEkle" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
       
        <div class="panel panel-green">
            <div class="panel panel-heading">
                <h3>Üye Ekle</h3>
            </div>
            <div class="panel panel-body"> 
                <div class="col-md-4"> </div>
                <div class="col-md-4">
                    <div class="control-group form-group">
                        <div class="controls">
                    
                            <label>İsim: </label>
                            <%--required data-validation-required-message="Lütfen İsim Soyisim Giriniz"--%>
                            <asp:TextBox ID="txtAd" runat="server" CssClass="form-control" ValidationGroup="ekle"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAd" ErrorMessage="Lütfen adınızı giriniz" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                    
                            <label>Soyisim:</label>
                            <%--required data-validation-required-message="Lütfen İsim Soyisim Giriniz"--%>
                            <asp:TextBox ID="txtsoyad" runat="server" CssClass="form-control" ValidationGroup="ekle"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsoyad" ErrorMessage="Soyadınızı giriniz" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                    
                            <label>E-mail:</label>
                            <%--required data-validation-required-message="Lütfen İsim Soyisim Giriniz"--%>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ValidationGroup="ekle"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Adresinizi giriniz" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email adresinizi doğru biçimde giriniz." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="ekle"></asp:RegularExpressionValidator>

                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                    
                            <label>Kullanıcı Adı:</label>
                            <%--required data-validation-required-message="Lütfen İsim Soyisim Giriniz"--%>
                            <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" ValidationGroup="ekle"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUser" ErrorMessage="Kullanıcı adınızı giriniz" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                    
                            <label>Şifre:</label>
                            <%--required data-validation-required-message="Lütfen İsim Soyisim Giriniz"--%>
                            <asp:TextBox ID="txtSifre" runat="server" CssClass="form-control" ValidationGroup="ekle"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSifre" ErrorMessage="Şifrenizi giriniz" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div id="success">
                        <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" CssClass="btn btn-primary pull-right" OnClick="btnKaydet_Click" ValidationGroup="ekle"/>
                    </div>
                </div>
                <div class="col-md-4"> </div>

            </div>
            
           
        </div>

       
    </div>
    <br />
      
    <div class="row">
            
            <div class="panel panel-primary">
                <div class="panel-heading text-center">
                    <h3>Uye bilgileri Düzenle ve Sil</h3>
                </div>

                <div class="panel panel-body "> 
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlUyeler">
                        <AlternatingItemTemplate>
                            <li style="background-color: #FFF8DC;">
                                Adi:
                                <asp:Label ID="AdiLabel" runat="server" Text='<%# Eval("Adi") %>' />
                                <br />
                                Soyadi:
                                <asp:Label ID="SoyadiLabel" runat="server" Text='<%# Eval("Soyadi") %>' />
                                <br />
                                Email:
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                <br />
                               
                                UserName:
                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                                <br />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Düzenle" CssClass="btn btn-success" />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" CssClass="btn btn-danger"  OnClientClick="return confirm(&quot;Silmek istiyor musunuz?&quot;)"/>
                            </li>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <li style="background-color: #008A8C;color: #FFFFFF;">ID:
                                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                <br />
                                Adi:
                                <asp:TextBox ID="AdiTextBox" runat="server" Text='<%# Bind("Adi") %>' />
                                <br />
                                Soyadi:
                                <asp:TextBox ID="SoyadiTextBox" runat="server" Text='<%# Bind("Soyadi") %>' />
                                <br />
                                Email:
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                <br />
                                Password:
                                <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                                <br />
                                UserName:
                                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Güncelle" CssClass="btn btn-info" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="İptal" CssClass="btn btn-warning"  />
                            </li>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            No data was returned.
                        </EmptyDataTemplate>
                      
                        <ItemSeparatorTemplate>
                            <br />
                        </ItemSeparatorTemplate>
                        <ItemTemplate>
                            <li style="background-color: #DCDCDC;color: #000000;">
                                Adi:
                                <asp:Label ID="AdiLabel" runat="server" Text='<%# Eval("Adi") %>' />
                                <br />
                                Soyadi:
                                <asp:Label ID="SoyadiLabel" runat="server" Text='<%# Eval("Soyadi") %>' />
                                <br />
                                Email:
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                <br />
                                
                                UserName:
                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                                <br />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Düzenle"  CssClass="btn btn-success" />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" CssClass="btn btn-danger" OnClientClick="return confirm(&quot;Silmek istiyor musunuz?&quot;)" />
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
     <asp:SqlDataSource ID="SqlUyeler" runat="server" ConnectionString="<%$ ConnectionStrings:DataContext %>" DeleteCommand="DELETE FROM [Users] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Users] ([Adi], [Soyadi], [Email], [Password], [UserName]) VALUES (@Adi, @Soyadi, @Email, @Password, @UserName)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [Adi] = @Adi, [Soyadi] = @Soyadi, [Email] = @Email, [Password] = @Password, [UserName] = @UserName WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Adi" Type="String" />
                    <asp:Parameter Name="Soyadi" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="UserName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Adi" Type="String" />
                    <asp:Parameter Name="Soyadi" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
</asp:Content>
