<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/Admin.Master" AutoEventWireup="true" CodeBehind="AmeliyatEkle.aspx.cs" Inherits="Doktorum.AdminPages.AmeliyatEkle" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="panel panel-info">
        <div class="panel panel-heading">
            <h3>Ameliyat Ekle</h3>
        </div>
        <div class="panel panel-body">
            <div class="row">
                <div class="col-md-12">
                     <div class="input-group">
                        <span class="input-group-addon" id="basic-addon3"><b>Dosya Sec</b></span>
                        <asp:FileUpload ID="DosyaSec" CssClass="form-control" aria-describedy="basic-addon3" runat="server" />
                     </div>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DosyaSec" ErrorMessage="Resim Ekleyiniz." ForeColor="Red" ValidationGroup="aekle"></asp:RequiredFieldValidator>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon"><b>Başlik</b></span>
                        <asp:TextBox ID="txtBaslik" runat="server" CssClass="form-control" placeholder="Başlik" aria-describedby="basic-addon" ValidationGroup="aekle"></asp:TextBox>
                          </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBaslik" ErrorMessage="Başlik Ekleyiniz" ForeColor="Red" ValidationGroup="aekle"></asp:RequiredFieldValidator>
                  
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon2"><b>İçerik</b></span>
                        <CKEditor:CKEditorControl ID="ckeditor" runat="server" placeholder="İçerik" CssClass="form-control" aria-describedby="basic-addon2" ValidationGroup="aekle"></CKEditor:CKEditorControl>
                    </div>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ckeditor" ErrorMessage="İçerik Ekleyiniz" ForeColor="Red" ValidationGroup="aekle"></asp:RequiredFieldValidator>
                    <br />
                   
                    <div class="input-group pull-right">
                        <asp:Button ID="btnKayit" runat="server" Text="Bilgileri Kaydet" CssClass="btn btn-primary" OnClick="btnKayit_Click"  ValidationGroup="aekle" />
                    </div>
                </div>
            </div>

        <asp:SqlDataSource ID="SqlAmeliyatlar" runat="server" ConnectionString="<%$ ConnectionStrings:DataContext %>" DeleteCommand="DELETE FROM [Ameliyatlarim] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Ameliyatlarim] ([Baslik], [Aciklama], [Resim]) VALUES (@Baslik, @Aciklama, @Resim)" SelectCommand="SELECT * FROM [Ameliyatlarim]" UpdateCommand="UPDATE [Ameliyatlarim] SET [Baslik] = @Baslik, [Aciklama] = @Aciklama, [Resim] = @Resim WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Baslik" Type="String" />
                <asp:Parameter Name="Aciklama" Type="String" />
                <asp:Parameter Name="Resim" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Baslik" Type="String" />
                <asp:Parameter Name="Aciklama" Type="String" />
                <asp:Parameter Name="Resim" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            </asp:SqlDataSource>


        </div>


    </div>
</asp:Content>
