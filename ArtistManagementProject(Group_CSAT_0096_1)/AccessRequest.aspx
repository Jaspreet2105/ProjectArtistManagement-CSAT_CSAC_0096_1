<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AccessRequest.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
       <br/>
    <br/>
    <h1 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">ACCESS REQUESTS </h1>  
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar').find('.active').eq(0).removeClass('active');
            $('#linkAccessRequest').addClass("active");
        });

    </script>
</asp:Content>
