<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                            <img width="100px" src="images/userimg.png" />
                          
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>User Sign Up</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <label>Email Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txt_Email" runat="server" placeholder="Email"></asp:TextBox>
                        </div>
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txt_Password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>

                        <label> Confirm Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txt_ConfirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        </div>
                         <label>First Name </label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txt_FirstName" runat="server" placeholder="First Name"></asp:TextBox>
                        </div>
                         <label>Last Name </label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txt_LastName" runat="server" placeholder="Last Name"></asp:TextBox>
                        </div>
                         <label>Date of Birth </label>
                        <div class="form-group">
                        <input type="date" class="form-control" ID="txt_Dob" runat="server" placeholder="Date of Birth" />
                        </div> 
                        <div class="form-group">
                            <asp:Button class="btn btn-info btn-block btn-lg" ID="btn_SignUp" runat="server" Text="SignUp" OnClick="btn_SignUp_Click"  />
                           <%--<a href="SignUp.aspx"><input class="btn btn-info btn-block btn-lg" id="btn_SignUp" type="button" value="Sign Up" /></a>--%>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a href="Login.aspx"><< Back to LogIn </a><br><br>
         </div>
      </div>
   </div>
    
</asp:Content>

