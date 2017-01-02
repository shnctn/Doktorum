<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/Admin.Master" AutoEventWireup="true" CodeBehind="hakkimdaSil.aspx.cs" Inherits="Doktorum.AdminPages.hakkimdaSil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-yellow">
                <div class="panel panel-heading">
                    <h4>Kişisel Bilgilerimi Sil</h4>

                </div>
                <div class="panel panel-body">
                    <div class="input-group">
                        <span class="input-group-addon" id="sil">Sil</span>
                        <asp:DropDownList ID="ddlSil" CssClass="form-control" AutoPostBack="True" aria-describedby="sil" runat="server"></asp:DropDownList>
                    </div>
                    <br />
                    <div class="pull-right">
                        <asp:Button ID="BtnSil" runat="server" Text="Kişisel Bilgi Sil" CssClass="btn btn-danger btn-xs" OnClick="BtnSil_Click" OnClientClick="return confirm(&quot;Silmek istiyor musunuz?&quot;)" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
