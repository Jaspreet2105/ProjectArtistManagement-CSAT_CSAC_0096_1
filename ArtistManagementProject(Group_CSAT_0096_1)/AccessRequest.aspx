<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AccessRequest.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <br/>
    <br/>
    <h1 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">ACCESS REQUESTS </h1>  
    <div id="contentDiv">

        <div class="row">
            <div class="col-md-6 offset-6">
                <%--<button value="Create" name="btnCreate" onclick="alert('Create')"></button>--%>
                <asp:LinkButton PostBackUrl="~/AddUser.aspx" ID="btn_Created" runat="server" CssClass="btn btn-small btn-primary"><i class="fas fa-plus-circle"></i>&nbsp;Create</asp:LinkButton>
                <button id="btnEdit" class="btn btn-small btn-primary" onclick="return EditPage()"><i class="fas fa-pencil-alt"></i>&nbsp;Edit</button>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-md-12">
                <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                <asp:PlaceHolder ID="UserAdded" runat="server" />
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar').find('.active').eq(0).removeClass('active');
            $('#linkAccessRequest').addClass("active");
            var table = $('#myTable').DataTable({
                select: {
                    style: 'multi'
                }
            });
        });

    </script>
</asp:Content>
