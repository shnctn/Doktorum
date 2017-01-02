<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Doktorum.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Giris</title>
     <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
   <div class="container-fluid">
        
        <div class="row">
            <div class="col-md-12 text-center">
              <h2>  <label> Admin Paneli</label> </h2>
            <br />
        </div>
            </div>
        <div class="row">
            <div class="col-md-4"></div>

            
            <div class="col-md-4">
                <div class="well" >
                <div class="control-group form-group">
                    <div class="controls">
                        <i class="glyphicon glyphicon-user"></i>
                        <label><b>Kullanıcı Adı</b></label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ValidationGroup="giris"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Lütfen Kullanıcı adı giriniz." ForeColor="Red" ValidationGroup="giris"></asp:RequiredFieldValidator>
                         </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <i class="glyphicon glyphicon-question-sign"></i>
                        <label><b>Şifre</b></label>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control" ValidationGroup="giris"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Şifre giriniz" ForeColor="Red" ValidationGroup="giris"></asp:RequiredFieldValidator>
                    </div>
                </div>
                    <br />
                <div class="control-group form-group">
                    <div class="controls">
                     <asp:Label ID="labelSonuc" class ="pull-left" runat="server" Text=""></asp:Label>
                        
                      <asp:Button ID="GirisYap" runat="server" Text="Giriş Yapınız" CssClass="btn btn-primary pull-right" OnClick="GirisYap_Click" ValidationGroup="giris" />
                    </div>
                    
                    
                </div>
                    <br />
                </div>
            </div>
            

            <div class="col-md-4"></div>
        </div>

        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                

                <label> Sitenizin güvenligi açısından Kullanıcı Adı ve Şifrenizi kimseyle paylaşmayınız.<br /> Size özel olarak verilen adresi kimseye göstermeyiniz.</label>

            </div>
            <div class="col-md-4"></div>

        </div>
    </div>
    </form>
</body>
</html>
