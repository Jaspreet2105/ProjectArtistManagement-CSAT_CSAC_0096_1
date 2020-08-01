<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6 offset-6">
            <%--<button value="Create" name="btnCreate" onclick="alert('Create')"></button>--%>
            <asp:LinkButton ID="btn_Created" runat="server"  CssClass="btn btn-small btn-primary"><i class="fas fa-plus-circle"></i>&nbsp;Create</asp:LinkButton>
            <asp:LinkButton ID="btn_Edit" runat="server"  CssClass="btn btn-small btn-primary"><i class="fas fa-pencil-alt"></i>&nbsp;Edit</asp:LinkButton>
       <asp:LinkButton ID="btn_View"  runat="server"  CssClass="btn btn-small btn-primary"><i class="fas fa-eye"></i>&nbsp;View</asp:LinkButton>
           <asp:LinkButton ID="btn_Delete"  runat="server"  CssClass="btn btn-small btn-primary"><i class="fas fa-times-circle"></i>&nbsp;Delete</asp:LinkButton>
            <%--<asp:Button ID="btn_View" runat="server" Text="View" class=
                "btn btn-primary" OnClientClick="alert('View')"/>
            <asp:Button ID="btn_Edit" runat="server" Text="Edit" class=
                "btn btn-primary" OnClientClick="alert('Edit')"/>
            <asp:Button ID="btn_Delete" runat="server" Text="Delete" class=
                "btn btn-primary" OnClientClick="alert('Delete')"/>--%>

        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
        </div>
    </div>

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
