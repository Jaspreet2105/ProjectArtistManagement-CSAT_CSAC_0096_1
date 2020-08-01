<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
    <script>
        $(document).ready(function () {
            var table = $('#myTable').DataTable({
                select: {
                    style: 'multi'
                }
            });
           
        });
        
    </script>


</asp:Content>
