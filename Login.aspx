<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="MasterPage.Master" Inherits="GlassGrabAPI.Login1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
         <section class="main-tabs-sec padding-top-60 padding-bottom-0">
             <div class="tab-content">

             
     <div role="tabpanel" class="tab-pane active fade in" id="tv-au"> 
              
              <!-- Items -->
              <section class="login-sec ">
                  <div class="container">
                    <div class="row">
                      <div class="col-md-12 border"> 
                        <!-- Login Your Account -->
                        <h5 class="new-classs">Log In</h5>
                        
                        <!-- FORM -->
                        <form runat="server">
                          <ul class="row">
                            <li class="col-sm-12">
                                    <div id="alert" runat="server" class="alert alert-warning" visible="false"></div>
                        
                              <label>Username
                                  <asp:TextBox ID="Username" placeholder="Username" runat="server" CssClass="form-control"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                CssClass="text-danger" ErrorMessage="The username field is required." />
                              </label>
                            </li>
                            <li class="col-sm-12">
                              <label>Password
                              <asp:TextBox ID="Password" runat="server" placeholder="Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                               
                              </label>
                            </li>
                            <li class="col-sm-12">
                              <div class="checkbox checkbox-primary">
                                <input id="cate1" class="styled" type="checkbox">
                                <label for="cate1"> Keep me logged in </label>
                              </div>
                            </li>
                              
                          <li class="col-sm-12 text-left">
                              <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn-round" OnClick="LoginButton_Click"/>
                     
                            </li>
                              
                            <li class="col-sm-12"style="padding-top:7%; "> <a href="Register.aspx" class="" runat="server" id="registerBtn">Register</a> </li>
                                <li class="col-sm-12"style="padding-top:1%; "> <a href="Terms-and-Conditions.html" class="">Terms and Conditions</a> </li>
                            <li class="col-sm-12"style="padding-top:1%; "> <a href="Privacy-Policy.html" class="">Privacy Policy</a> </li>
                           <%-- <li class="col-sm-12"style="padding-top:1%; "> <a href="" class="">Forgot your password?</a> </li>--%>
                            
                          </ul>
                        </form>
                      </div>
                      
                      <!-- Don’t have an Account? Register now -->
                     
                    </div>
                  </div>
                </section>
            </div>
                 </div>
             </section>

    </asp:Content>