<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/Admin.Master" AutoEventWireup="true" CodeBehind="AmeliyatDuzenle.aspx.cs" Inherits="Doktorum.AdminPages.AmeliyatDuzenle" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

       <div class="panel panel-info">
        <div class="panel panel-heading">
            <h3>Ameliyat Düzenle</h3>
        </div>
        <div class="panel panel-body">
            <div class="row">
                <div class="col-md-12">
                     <div class="input-group">
                        <span class="input-group-addon" id="basic-addon"><b>Başlik</b></span>
                        <asp:DropDownList ID="drBaslik" runat="server" AutoPostBack="True" CssClass="form-control" aria-describedby="basic-addon" OnSelectedIndexChanged="drBaslik_SelectedIndexChanged" ValidationGroup="duzenle">
                           
                         </asp:DropDownList>
                      </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1"><b>Başlik</b></span>
                        <asp:TextBox ID="txtBaslik" runat="server" CssClass="form-control" placeholder="Başlik" aria-describedby="basic-addon1" ValidationGroup="duzenle"></asp:TextBox>
                        </div>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBaslik" ErrorMessage="Başlik Ekle" ForeColor="Red" ValidationGroup="duzenle"></asp:RequiredFieldValidator>
                   
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon2"><b>İçerik</b></span>
                        <CKEditor:CKEditorControl ID="ckeditor1" runat="server" placeholder="İçerik" CssClass="form-control" aria-describedby="basic-addon2" ValidationGroup="duzenle"></CKEditor:CKEditorControl>
                        
                    </div>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ckeditor1" ErrorMessage="İçerik Ekle" ForeColor="Red" ValidationGroup="duzenle"></asp:RequiredFieldValidator>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon3"><b>Dosya Sec</b></span>
                        <asp:FileUpload ID="DosyaSec" CssClass="form-control" aria-describedy="basic-addon3" runat="server" />
                     </div>
                    <br />
                    <div class="input-group pull-right">
                        <asp:Button ID="guncelle" runat="server" Text="Bilgileri Güncelle" CssClass="btn btn-primary"   ValidationGroup="duzenle" OnClick="guncelle_Click"  />
                    </div>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DosyaSec" ErrorMessage="Dosya Seçiniz" ForeColor="Red" ValidationGroup="duzenle"></asp:RequiredFieldValidator>
                </div>
            </div>
    </div>

       </div>

      <br />
    <div class="panel panel-yellow">
        <div class="panel panel-heading">
            <h4>Ameliyat Bilgisi Sil</h4>

        </div>
        <div class="panel panel-body">
            <div class="input-group">
                <span class="input-group-addon" id="sil">Sil</span>
                <asp:DropDownList ID="ddlSil" CssClass="form-control" AutoPostBack="True" aria-describedby="sil"  runat="server" ></asp:DropDownList>
            </div><br />
            <div class="pull-right">
                <asp:Button ID="BtnSil" runat="server"  Text="Ameliyat Sil" CssClass="btn btn-danger btn-xs" OnClick="BtnSil_Click"  OnClientClick="return confirm(&quot;Silmek istiyor musunuz?&quot;)"  />
            </div>
        </div>
    </div>




<asp:SqlDataSource ID="SqlAmeliyatDuzenle" runat="server" ConnectionString="<%$ ConnectionStrings:DataContext %>" DeleteCommand="DELETE FROM [Ameliyatlarim] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [Ameliyatlarim] ([Baslik], [Aciklama], [Resim]) VALUES (@Baslik, @Aciklama, @Resim)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Ameliyatlarim]" UpdateCommand="UPDATE [Ameliyatlarim] SET [Baslik] = @Baslik, [Aciklama] = @Aciklama, [Resim] = @Resim WHERE [ID] = @original_ID">
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int32" />
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
        <asp:Parameter Name="original_ID" Type="Int32" />
    </UpdateParameters>
       </asp:SqlDataSource>

</asp:Content>
