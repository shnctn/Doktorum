<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/Admin.Master" AutoEventWireup="true" CodeBehind="hakkimdaEkle.aspx.cs" Inherits="Doktorum.AdminPages.hakkimdaEkle" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel panel-heading">
                    <h4>Kişisel Bilgilerim</h4>
                </div>
                <div class="panel panel-body">
                   
                       <div class="input-group">
                        <span class="input-group-addon" id="basic-addon0"><b>Başlık</b></span>
                        <asp:TextBox ID="txtBaslik" runat="server" CssClass="form-control" placeholder="Başlık" aria-describedby="basic-addon0" ValidationGroup="ekle"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Boş Bırakılmaz" ControlToValidate="txtBaslik" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>
                    <br />


                     <div class="input-group">
                        <span class="input-group-addon" id="basic-addon3"><b>Resim Sec</b></span>
                        <asp:FileUpload ID="DosyaSec" CssClass="form-control" aria-describedy="basic-addon3" runat="server" ValidationGroup="ekle"/>
                     </div>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Resim Seç" ControlToValidate="DosyaSec" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>
                    <br />

                       <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1"><b>İsim </b></span>
                        <asp:TextBox ID="txtAd" runat="server" CssClass="form-control" placeholder="İsim" aria-describedby="basic-addon1" ValidationGroup="ekle"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Boş Bırakılamaz" ControlToValidate="txtAd" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>
                    <br />
                     <div class="input-group">
                        <span class="input-group-addon" id="basic-addons"><b>Soyisim </b></span>
                        <asp:TextBox ID="txtSoyad" runat="server" CssClass="form-control" placeholder="Soyisim" aria-describedby="basic-addons" ValidationGroup="ekle"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Boş  Bırakılamaz" ControlToValidate="txtSoyad" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon2"><b>Kişisel <br />Bilgileriniz <br />  yazın</b></span>
                        <ckeditor:ckeditorcontrol ID="ckeditor1" placeholder="İçerik" CssClass="form-control" aria-describedby="basic-addon2" runat="server" ValidationGroup="ekle"></ckeditor:ckeditorcontrol>
                         </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="İçerik Giriniz" ControlToValidate="ckeditor1" ForeColor="Red" ValidationGroup="ekle"></asp:RequiredFieldValidator>
                    <br />
                   
                    <br />
                    <div class="input-group pull-right">
                        <asp:Button ID="btnKaydet" runat="server" Text=" Kişisel Bilgilerini Kaydet" CssClass="btn btn-primary" OnClick="btnKaydet_Click" ValidationGroup="ekle" />      
                    </div>                   
                </div>
            </div>

        </div>
    </div>
     <asp:SqlDataSource ID="SqlHakkimda" runat="server" ConnectionString="<%$ ConnectionStrings:DataContext %>" DeleteCommand="DELETE FROM [Hakkimda] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Hakkimda] ([Baslik], [Ad], [Soyad], [Aciklama], [Resim], [Yayinla]) VALUES (@Baslik, @Ad, @Soyad, @Aciklama, @Resim, @Yayinla)" SelectCommand="SELECT * FROM [Hakkimda]" UpdateCommand="UPDATE [Hakkimda] SET [Baslik] = @Baslik, [Ad] = @Ad, [Soyad] = @Soyad, [Aciklama] = @Aciklama, [Resim] = @Resim, [Yayinla] = @Yayinla WHERE [ID] = @ID">
         <DeleteParameters>
             <asp:Parameter Name="ID" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Baslik" Type="String" />
             <asp:Parameter Name="Ad" Type="String" />
             <asp:Parameter Name="Soyad" Type="String" />
             <asp:Parameter Name="Aciklama" Type="String" />
             <asp:Parameter Name="Resim" Type="String" />
             <asp:Parameter Name="Yayinla" Type="Boolean" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Baslik" Type="String" />
             <asp:Parameter Name="Ad" Type="String" />
             <asp:Parameter Name="Soyad" Type="String" />
             <asp:Parameter Name="Aciklama" Type="String" />
             <asp:Parameter Name="Resim" Type="String" />
             <asp:Parameter Name="Yayinla" Type="Boolean" />
             <asp:Parameter Name="ID" Type="Int32" />
         </UpdateParameters>
                         
                        </asp:SqlDataSource>
</asp:Content>
