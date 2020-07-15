<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm1" %>
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
                           <img width="150px" src="images/userimg.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>LogIn</h3>
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
                        <label>User Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txt_UserId" runat="server" placeholder="User Name"></asp:TextBox>
                        </div>
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txt_Password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="btn_LogIn" runat="server" Text="LogIn" OnClick="btn_LogIn_Click" />
                        </div>
                        <div class="form-group">
                            <asp:Button class="btn btn-info btn-block btn-lg" ID="btn_SignUp" runat="server" Text="SignUp" OnClick="btn_SignUp_Click" PostBackUrl="~/SignUp.aspx"  />

                           <%--<a href="SignUp.aspx"><input class="btn btn-info btn-block btn-lg" id="btn_SignUp" type="button" value="Sign Up" /></a>--%>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a href="HomePage.aspx"><< Back to Home</a><br><br>
         </div>
      </div>
   </div>
</asp:Content>

