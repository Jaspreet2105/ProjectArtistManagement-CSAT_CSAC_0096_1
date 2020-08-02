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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_FirstName" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
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
                           <input type="date" class="form-control" ID="txt_DOB" runat="server" placeholder="Date of Birth" />
                        </div>
                     
                  </div>
                      </div>
                      
                  <div class="row">
                     <div class="col-md-6">
                        <label>Access Type</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="dropdown_AccessType" runat="server">
                              <asp:ListItem Text="Select" Value="select" />
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
                              <asp:ListItem Text="Select" Value="select" />

                              <asp:ListItem />
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
                           <asp:TextBox CssClass="form-control" ID="txt_PhnNo" runat="server" placeholder="Phone Number" TextMode="Number"></asp:TextBox>
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
                           <asp:TextBox CssClass="form-control" ID="txt_Email" runat="server" placeholder="Email ID" TextMode="Email" ></asp:TextBox>
                        </div>
                     </div>
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
                        </div>
                     </div>
                       </div>
                  
                  <div class="row">
                     <div class="col-6">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="btn_Update" runat="server" Text="Save"  />
                           </div>
                        </center>
                     </div>
                      <div class="col-6">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="btn_RequestElevatedAccess" runat="server" Text="Cancel" />
                           </div>
                        </center>
                     </div>
                  </div>
               
            </div>
            <a href="HomePage.aspx"><< Back to Home</a><br><br>
         </div>
         
      </div>
   </div>
             </div>
     
</asp:Content>
