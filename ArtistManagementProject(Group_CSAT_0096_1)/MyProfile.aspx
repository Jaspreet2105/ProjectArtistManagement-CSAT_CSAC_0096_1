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
                           <span>Account Status - </span>
                           <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Your Status"></asp:Label>
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
                           <asp:TextBox CssClass="form-control" ID="txt_FirstName" runat="server" placeholder="First Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>Last Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txt_LastName" runat="server" placeholder="Last Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                       <div class="col-md-4">
                        <label>Date of Birth</label>
                        <div class="form-group">
                           <input type="date" class="form-control" ID="txt_DOB" runat="server" placeholder="Date of Birth" readonly="readonly" />
                        </div>
                     
                  </div>
                      </div>
                      
                  <div class="row">
                     <div class="col-md-6">
                        <label>Access Type</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="dropdown_AccessType" runat="server">
                              <asp:ListItem Text="Select" Value="select" />
                              <asp:ListItem Text="Artist" Value="Artist" />
                           </asp:DropDownList>
                        </div>
                     </div>

                      <div class="col-md-6">
                        <label>Department</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="dropdown_Department" runat="server">
                              <asp:ListItem Text="Select" Value="select" />
                              <asp:ListItem Text="Department" Value="Department" />
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
                        <label>Zipcode</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txt_ZipCode" runat="server" placeholder="Zipcode"></asp:TextBox>
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
                     <div class="col-md-4">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txt_Email" runat="server" placeholder="Email ID" TextMode="Email" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Old Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txt_OldPassword" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>New Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txt_NewPassword" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-6">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="btn_Update" runat="server" Text="Update" />
                           </div>
                        </center>
                     </div>
                      <div class="col-6">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="btn_RequestElevatedAccess" runat="server" Text="Request Elevated Access" />
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
