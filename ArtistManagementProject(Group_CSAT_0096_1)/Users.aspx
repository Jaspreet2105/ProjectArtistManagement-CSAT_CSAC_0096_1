<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <h1 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">USERS </h1>
    <div id="contentDiv">

        <div class="row">
            <div class="col-md-6 offset-6">
                <%--<button value="Create" name="btnCreate" onclick="alert('Create')"></button>--%>
                <asp:LinkButton PostBackUrl="~/AddUser.aspx" ID="btn_Created" runat="server" CssClass="btn btn-small btn-primary"><i class="fas fa-plus-circle"></i>&nbsp;Create</asp:LinkButton>
                <button id="btnEdit" class="btn btn-small btn-primary" onclick="return EditPage()"><i class="fas fa-pencil-alt"></i>&nbsp;Edit</button>
                <button id="btnView" class="btn btn-small btn-primary" onclick="return EditPage(true)"><i class="fas fa-eye"></i>&nbsp;View</button>
                <button id="btnDelete" class="btn btn-small btn-primary" onclick="return DeleteUser()"><i class="fas fa-times-circle"></i>&nbsp;Delete</button>
                <%--<asp:LinkButton ID="btn_Edit" runat="server"  CssClass="btn btn-small btn-primary"><i class="fas fa-pencil-alt"></i>&nbsp;Edit</asp:LinkButton>--%>
                <%--<asp:LinkButton ID="btn_View"  runat="server"  CssClass="btn btn-small btn-primary"><i class="fas fa-eye"></i>&nbsp;View</asp:LinkButton>--%>
                <%--<asp:LinkButton ID="btn_Delete"  runat="server"  CssClass="btn btn-small btn-primary"><i class="fas fa-times-circle"></i>&nbsp;Delete</asp:LinkButton>--%>
                <%--<asp:Button ID="btn_View" runat="server" Text="View" class=
                "btn btn-primary" OnClientClick="alert('View')"/>
            <asp:Button ID="btn_Edit" runat="server" Text="Edit" class=
                "btn btn-primary" OnClientClick="alert('Edit')"/>
            <asp:Button ID="btn_Delete" runat="server" Text="Delete" class=
                "btn btn-primary" OnClientClick="alert('Delete')"/>--%>
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
            // To make current tab as active in the side bar
            $('.sidebar').find('.active').eq(0).removeClass('active');
            $('#linkUsers').addClass("active");
            //To convert HTML table to jQuery DataTable using external library for  - Search, Sorting, Selection
            var table = $('#myTable').DataTable({
                select: {
                    style: 'multi'
                }
            });
            debugger;
            if (<%= Session["role"] %> == 2) {
                HideButtonsForManager();
            }
        });
        // TO hide Create and Delete buttons for Manager Login
        function HideButtonsForManager() {
            //document.getElementById('ContentPlaceHolder1_btn_Created').style.display = "none";
            $('#ContentPlaceHolder1_btn_Created').hide();
            $('#btnDelete').hide();
        }
        // To get selected rows from the DataTable
        function GetTableSelectedItems(tableID = "myTable") {
            var table = $('#' + tableID).DataTable();
            return table.rows({ selected: true }).data();
        }
        // To redirect the user to Edit/View page
        // isView is true in VIEW case
        function EditPage(isView) {
            var obj = GetTableSelectedItems();
            if (obj.length == 0) {
                alert('Select a record to continue');
                return;
            }
            else if (obj.length > 1) {
                alert('Select only One record');
                return;
            }
            //var val = document.getElementById('txtBoxId').value;
            var url = 'EditUser.aspx?UserID=' + obj[0][0];
            //window.location = window.location.origin + url;
            //window.location.href = window.location.origin + url;
            if (isView)
                url += "&isView=" + isView;
            window.location = url
            return false;
            //window.open(url, '_blank');
        }
        function DeleteUser(isView) {
            var obj = GetTableSelectedItems();
            if (obj.length == 0) {
                alert('Select a record to continue');
                return;
            }
            //else if (obj.length > 1) {
            //    alert('Select only One record');
            //    return;
            //}
            else {
                var selected = [];
                $.each(obj, function (key, value) {
                    selected.push(value[0]);
                });
                //var val = document.getElementById('txtBoxId').value;
                var url = 'Users.aspx?UserID=' + selected.join(',');
                //window.location = window.location.origin + url;
                //window.location.href = window.location.origin + url;
                if (isView)
                    url += "&isView=" + isView;
                window.location = url
                return false;
            }
            //window.open(url, '_blank');
        }
        //function DeleteUser() {
        //    //var obj = GetTableSelectedItems();
        //    //if (obj.length == 0) {
        //    //    alert('Select a record to continue');
        //    //    return;
        //    //}
        //    //else if (obj.length > 1) {
        //    //    alert('Select only One record');
        //    //    return;
        //    //}
        //    ////var val = document.getElementById('txtBoxId').value;
        //    //var url = 'EditUser.aspx?UserID=' + obj[0][0];
        //    var data = {};
        //    data.UserIDs = "133,113";
        //    $.ajax({
        //        type: "POST",
        //        url: "Users.aspx/DeleteUser",
        //        data: '{UserIDs: "' + data.UserIDs + '" }',
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (response) {
        //            alert("Success");
        //            window.location.reload();
        //        },
        //        error: function (response) {
        //            console.log(response);
        //        }
        //    });
        //    //window.open(url, '_blank');
        //}

    </script>


</asp:Content>
