<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Doktorum.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        
<div class="col-md-12">
        <!-- Content Row -->
        <div class="row">
            <!-- Map Column -->
            <div class="col-md-12">
                <!-- Embedded Google Map -->
                <iframe class="iframe" src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d3007.3834056341975!2d28.22251441574057!3d41.0824688228044!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m0!4m5!1s0x14b515f38b50fdbf%3A0xd25b1263292a4aab!2sMimarsinan+Silivri%2C+Medicalpark+hastanesi%2C+Sanayi+55.+Sk.+No%3A1%2C+34570+Silivri%2F%C4%B0stanbul%2C+Turkey!3m2!1d41.0824648!2d28.2247031!5e0!3m2!1sen!2sus!4v1480763025770"></iframe>
            </div>
            <!-- Contact Details Column -->
          
        <!-- /.row -->
            <br />
            <br />

        </div>
    <hr />
       <div class="row">
            <div class="col-md-7">
                <h3>Mesaj Gönder</h3>
                <br />
                    <div class="control-group form-group">
                        <div class="controls">
                            <i class="glyphicon glyphicon-user"></i> <label>İsim Soyisim:</label>
                            <%--required data-validation-required-message="Lütfen İsim Soyisim Giriniz"--%>
                           <asp:TextBox ID="TextAd" runat="server" CssClass="form-control" ValidationGroup="mail"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextAd" ErrorMessage=" İsim Soyisim alanı boş geçilemez" ForeColor="Red" ValidationGroup="mail"></asp:RequiredFieldValidator>
                            
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <i class="glyphicon glyphicon-earphone"></i> <label>Telefon No:</label>

                       <asp:TextBox ID="TextTelefon" runat="server" CssClass="form-control" ValidationGroup="mail"></asp:TextBox>
                                                                                
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextTelefon" ErrorMessage="Telefon numarası boş geçilemez" ForeColor="Red" ValidationGroup="mail"></asp:RequiredFieldValidator>
                      </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <i class="glyphicon glyphicon-rub"></i> <label>E-Posta:</label>
                          
                      <asp:TextBox ID="TextEPosta" runat="server" CssClass="form-control " ValidationGroup="mail" ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextEPosta" ErrorMessage="E-posta boş geçilemez" ForeColor="Red" ValidationGroup="mail"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextEPosta" ErrorMessage="E-posta formatında değildir." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="mail"></asp:RegularExpressionValidator>
                              </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                           <i class="glyphicon glyphicon-envelope"></i>  <label>Mesaj:</label>
                          
                       <asp:TextBox ID="TextIcerik" runat="server" CssClass="form-control" TextMode="MultiLine" Height="100px" ValidationGroup="mail" ></asp:TextBox>
                      
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextIcerik" ErrorMessage="İcerik boş geçilemez" ForeColor="Red" ValidationGroup="mail"></asp:RequiredFieldValidator>
                      
                       </div>
                    
                    </div>
                    <div id="success">
                        <asp:Button ID="btnMail" runat="server" Text="E-Posta Gönder" CssClass="btn btn-primary pull-right" OnClick="btnMail_Click"  ValidationGroup="mail" />
                        
                    </div>
                    <!-- For success/fail messages -->
                   
</div>
            
            <div class="col-md-1"> 
                
            </div>

             <div class="col-md-4">
                <h3>İletişim Bilgileri</h3>
                 <br />
                <p>
                    
                    Özel Silivri Medicalpark Hastanesi<br/>Mimar Sinan Mah, 34570<br/>Silivri/İstanbul, Türkiye

                </p>
                <p><i class="fa fa-phone"></i> 
                    <abbr title="Phone">Telefon</abbr>: +90-544-440-11-65</p>
                <p><i class="fa fa-envelope-o"></i> 
                    <abbr title="Email">E-Posta</abbr>: <a href="mailto:anadolubeyincerrahi@gmail.com">anadolubeyincerrahi@gmail.com</a>
                    <br />
                    <abbr title="Email">E-Posta</abbr>: <a href="mailto:karacorsek@gmail.com">karacorsek@gmail.com</a>
              
                </p>
                <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Hours">Çalışma Saatleri</abbr>: Pazartesi - Cuma: 8:00 AM to 5:00 PM</p>
            </div>
        
    </div>
      
        <!-- /.row -->
  <br />
    </div>
</asp:Content>
