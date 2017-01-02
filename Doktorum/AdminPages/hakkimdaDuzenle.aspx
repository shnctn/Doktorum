<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/Admin.Master" AutoEventWireup="true" CodeBehind="hakkimdaDuzenle.aspx.cs" Inherits="Doktorum.AdminPages.hakkimdaDuzenle" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            left: 0px;
            top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div class="row">
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    <h4>Kişisel Bilgilerimi Düzenle</h4>
                </div>
                <div class="panel panel-body">
                     <div class="input-group">
                        <span class="input-group-addon" id="basic-addon"><b>Başlik</b></span>
                        <asp:DropDownList ID="drBaslik" runat="server" AutoPostBack="True" CssClass="form-control" aria-describedby="basic-addon" OnSelectedIndexChanged="drBaslik_SelectedIndexChanged"></asp:DropDownList>
                      </div>
                    <br />
                     <div class="input-group">
                        <span class="input-group-addon" id="basic-addon3"><b>Resim Sec</b></span>
                        <asp:FileUpload ID="DosyaSec" CssClass="auto-style1" aria-describedy="basic-addon3" runat="server" />
                     </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="DosyaSec" ForeColor="Red" ValidationGroup="düzenle"></asp:RequiredFieldValidator>
                    <br />

                       <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1"><b>İsim </b></span>
                        <asp:TextBox ID="txtAd" runat="server" CssClass="form-control" placeholder="İsim " aria-describedby="basic-addon1"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txtAd" ForeColor="Red" ValidationGroup="düzenle"></asp:RequiredFieldValidator>
                    <br />
                     <div class="input-group">
                        <span class="input-group-addon" id="basic-addon4"><b>Soyisim </b></span>
                        <asp:TextBox ID="txtSoyad" runat="server" CssClass="form-control" placeholder="Soyisim" aria-describedby="basic-addon4"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txtSoyad" ForeColor="Red" ValidationGroup="düzenle"></asp:RequiredFieldValidator>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon2"><b>Kişisel <br />Bilgileriniz <br />  Düzenle</b></span>
                        <CKEditor:CKEditorControl ID="ckeditor1" placeholder="İçerik" CssClass="form-control" aria-describedby="basic-addon2"  runat="server"></CKEditor:CKEditorControl>
                         </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="ckeditor1" ForeColor="Red" ValidationGroup="düzenle"></asp:RequiredFieldValidator>
                    <br />
                   
                    <br />
                    <div class="input-group pull-right">
                        <asp:Button ID="btnKaydet" runat="server" Text=" Kişisel Bilgilerini Kaydet" CssClass="btn btn-success"   OnClick="btnKaydet_Click" ValidationGroup="düzenle" />
                    </div>
                      



                </div>
            </div>

        </div>
    </div>
</asp:Content>
