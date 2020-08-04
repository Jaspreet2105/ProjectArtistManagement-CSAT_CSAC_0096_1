<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9" style="text-align: center">
                <asp:Label ID="lbl_Welcome" CssClass="Welcome" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar').find('.active').eq(0).removeClass('active');
            $('#linkHome').addClass("active");
        });

    </script>

</asp:Content>
