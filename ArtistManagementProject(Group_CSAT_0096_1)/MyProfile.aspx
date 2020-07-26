<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form>
    <div class="container">     
    <h1 class="well">EDIT USER </h1>
	            <div class="col-lg-12 well">
	                <div class="row">
				    <div class="col-sm-12">
					<div class="row">
						<div class="col-sm-6 form-group">
							<label>Email Address </label>
							    <input type="text" placeholder="Enter your Email Address" class="form-control">
						</div>
					    <div class="col-sm-6 form-group">
							<label>Password</label>
							    <input type="password" placeholder="Enter your Password" class="form-control">
					    </div>
                        <div class="col-sm-6 form-group">
                            <label>First Name</label>
							    <input type="text" placeholder="Enter your First Name" class="form-control">
						</div>
                        <div class="col-sm-6 form-group">
                            <label>Last Name</label>
								<input type="text" placeholder="Enter your Last Name" class="form-control">
							</div>
						</div>
                    <label>Date of Birth </label>
                        <div class="form-group">
                        <input type="date" class="form-control" ID="txt_Dob" runat="server" placeholder="Enter your Date of Birth" />
                        </div> <br />
             

                    <div class="form-group">
                        <label> Access Type </label>
                        <select class="form-control accesstype" id="accesstype">
                            <option value="" selected> Choose your Access type  </option>
                            <option value="1"> Admin </option>
                            <option value="2"> Elevated Access User </option>
                            <option value="3"> Regular User </option>
                        </select>
                    </div>

                        <br/>
					<div class="form-group">
						<label>Phone Number</label>
						<input type="text" placeholder="Enter your Phone Number" class="form-control">
	
                    <br/>  
                    <div class="form-group">
                        <label> Department </label>
                        <select class="form-control department" id="department">
                            <option value="" selected> Choose your Department </option>
                            <option value="1"> Theatre Artist </option>
                            <option value="2"> Violinist</option>
                            <option value="3"> Pianist </option>
                            <option value="4">Playback singer </option>
                            <option value="5"> Technology</option>
                        </select>
                    </div> <br />


						<div class="form-group">
							<label>Address</label>
							<textarea placeholder="Enter your Address" rows="1" class="form-control"></textarea>
						</div>	
                    <br/>
						<div class="form-group">
								<label>Zipcode</label>
								<input type="text" placeholder="Enter your Zip Code" class="form-control">
							</div>		
						</div>
                     <br/>
					</div>
				</div>
        <div class="row">
            <div class="col-md-6" align="right" >
            
                <button type="submit" class="btn btn-info saveUsers" id="saveUsers"> Save </button>
            </div>
            <div class="col-md-6" align="left">
                &nbsp;
                <button type="reset" class="btn btn-danger resetUsers" id="resetUsers"> Cancel </button>
            </div>
            <br/>             
            <br/>
            <br/>
            <div class="col-sm-6 form-group" align ="center" style="right:50">
                <div class="requestbutton">
                 <button type="submit" class="btn btn-success" id="RequestUsers"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Request Elevated Access </button>
        </div>
            </div>
        </div>
        </div>
        </div>
             </form>--%>
</asp:Content>
