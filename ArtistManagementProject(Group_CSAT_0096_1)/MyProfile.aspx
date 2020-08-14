<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img width="100px" src="images/userimg.png"/>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4>My Profile</h4>
                           
                                    <asp:Label ID="lbl_AccessRequestText" runat="server" Text="Access Request Status :"></asp:Label>
                           <asp:Label style="font-size:1.3em" class="badge badge-pill" ID="lbl_RequestStatus" runat="server" Text="No Elevated Access"></asp:Label>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_FirstName" runat="server" placeholder="First Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_LastName" runat="server" placeholder="Last Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <input type="date" class="form-control" id="txt_DOB" runat="server" placeholder="Date of Birth" />
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Access Type</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="dropdown_AccessType" runat="server">
                                        <asp:ListItem Text="Artist" Value="3" />
                                        <asp:ListItem Text="Manager" Value="2" />
                                        <asp:ListItem Text="Admin" Value="1" />
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Department</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="dropdown_Department" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_FullAddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>PostalCode</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_PostalCode" runat="server" placeholder="PostalCode"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Phone Number</label>
                                <div class="form-group">
                                    <asp:TextBox onkeypress="if(this.value.length==10) return false;" CssClass="form-control" ID="txt_PhnNo" runat="server" placeholder="Phone Number" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <span class="badge badge-pill badge-info">Login Credentials</span>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_Email" runat="server" placeholder="Email ID" TextMode="Email" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <%--<div class="col-md-6">
                                <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_OldPassword" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>--%>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_NewPassword" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Confirm Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_NewConfirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password" CausesValidation="True"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_NewPassword" ControlToValidate="txt_NewConfirmPassword" ErrorMessage="Password must match" ForeColor="Red"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="btn_Update" runat="server" Text="Update" OnClick="btn_Update_Click" />
                           </div>
                        </center>
                            </div>
                            <div class="col-6">
                                <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="btn_RequestElevatedAccess" runat="server" Text="Request Elevated Access" OnClick="btn_RequestElevatedAccess_Click" />
                               <%--<asp:Label ID="lbl_RequestStatus" CssClass="Welcome" runat="server" Text="Label"></asp:Label>--%>
                           </div>
                        </center>
                            </div>
                        </div>

                    </div>
                    <a href="HomePage.aspx"><< Back to Home</a><br>
                    <br>
                </div>

            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar').find('.active').eq(0).removeClass('active');
            $('#linkMyProfile').addClass("active");
            $('#ContentPlaceHolder1_btn_Update').attr("disabled","disabled");
            $("#form1 :input").change(function () {
                $('#ContentPlaceHolder1_btn_Update').removeAttr("disabled");
            });

        });
    </script>

</asp:Content>
