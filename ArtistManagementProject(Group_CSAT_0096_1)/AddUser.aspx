<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm7" %>

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
                           <h4>Add User</h4>
                           
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_FirstName" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_LastName" runat="server" placeholder="Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_LastName" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <input type="date" class="form-control" id="txt_DOB" runat="server" placeholder="Date of Birth" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_DOB" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Access Type</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="dropdown_AccessType"  runat="server">
                                        <asp:ListItem Selected="True" Text="Select" Value="-1" />
                                        <asp:ListItem Text="Artist" Value="3" />
                                        <asp:ListItem Text="Manager" Value="2" />
                                        <asp:ListItem Text="Admin" Value="1" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1"  ID="RequiredFieldValidator8" runat="server" ControlToValidate="dropdown_AccessType" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Department</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="dropdown_Department" ValidationGroup="g1" runat="server">
                                        <asp:ListItem Text="Select" Value="-1" />
                                        <asp:ListItem />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ValidationGroup="g1" InitialValue="-1" Display="Dynamic" ID="RequiredFieldValidator7" runat="server" ControlToValidate="dropdown_Department" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_FullAddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_FullAddress" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>PostalCode</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_PostalCode" runat="server" placeholder="PostalCode"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_PostalCode" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Phone Number</label>
                                <div class="form-group">
                                    <asp:TextBox min="0" oninput="validity.valid||(value='');" onkeypress="if(this.value.length==10 || isNaN(this.value) || this.value < 0) return false;"  MaxLength="10" CssClass="form-control" ID="txt_PhnNo" runat="server" placeholder="Phone Number" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_PhnNo" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txt_PhnNo"></asp:CustomValidator>--%>
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
                            <div class="col-md-12">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_Email" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_Email" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:Label ID="lbl_EmailID" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_NewPassword" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_NewPassword" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Confirm Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_NewConfirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password" CausesValidation="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_NewConfirmPassword" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_NewPassword" ControlToValidate="txt_NewConfirmPassword" ErrorMessage="Password must match" ForeColor="Red"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <center>
                           <div class="form-group">
                              <asp:Button OnClick="btn_SaveClick" class="btn btn-primary btn-block btn-lg" ID="btn_Update" runat="server" Text="Save"  />
                           </div>
                        </center>
                            </div>
                            <%--<div class="col-6">
                                <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="btn_RequestElevatedAccess" runat="server" Text="Cancel" />
                           </div>
                        </center>
                            </div>--%>
                        </div>

                    </div>
                    <br>
                    <br>
                    <%-- <a href="HomePage.aspx"><< Back to Home</a><br><br>--%>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
