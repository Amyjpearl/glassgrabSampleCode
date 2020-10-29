<%@ Page Async="true" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="Listings.aspx.cs" Inherits="GlassGrabAPI.Listings" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
        <script src="js/vendors/jquery/jquery.min.js"></script> 
      <script src="js/vendors/wow.min.js"></script> 
      <script src="js/vendors/bootstrap.min.js"></script> 
      <script src="js/vendors/own-menu.js"></script> 
      <script src="js/vendors/jquery.sticky.js"></script> 
      <script src="js/vendors/owl.carousel.min.js"></script> 
        <script>

                function setstars(stars) {
                    var ele = document.getElementById("ContentPlaceHolder1_starNumber").value = stars;
                    for (var i = 1; i <= stars; i++) {
                        var e = document.getElementById("fstar" + i.toString());
                        e.src = "images/fullstarfilled.png";
                    }
                    for (var i = stars+1; i <= 5; i++) {
                        var e = document.getElementById("fstar" + i.toString());
                        e.src = "images/staroutline.png";
                    }
            }

            function favoriteListing() {
                var button = document.getElementById("ContentPlaceHolder1_fav");

                button.click();
            }

        </script>
    <style>
        .star {
                width: 50px;
            }
        .column {
                float: left;
                width: 10%;
                padding: 5px;
                padding-left: 12px;
            }
    </style>
    <form runat="server">
    <asp:Button runat="server" ID="fav" OnClick="FavoriteListing" style="visibility:hidden;"  />

        <div id="content">
    <!-- Products -->
    <section class="padding-top-40 padding-bottom-60">
        <div class="container">
            <div class="row">

                <div class="col-md-12">
                    <div class="product-detail">
                        <div class="product">
                            <div class="row">
                                <!-- Slider Thumb -->
                                <div class="col-sm-12 col-lg-5 col-md-5">
                                    <article class="slider-item on-nav">
                                        <!-- <div id="slider" class="thumb-slider">
                                           <ul class="slides">
                                              <li data-thumb="images/item-img-1-1.jpg"> <img src="images/item-img-1-1.jpg" alt="" > </li>
                                              <li data-thumb="images/item-img-1-2.jpg"> <img src="images/item-img-1-2.jpg" alt="" > </li>
                                              <li data-thumb="images/item-img-1-3.jpg"> <img src="images/item-img-1-3.jpg" alt="" > </li>
                                              <li data-thumb="images/item-img-1-3.jpg"> <img src="images/item-img-1-3.jpg" alt="" > </li>
                                              <li data-thumb="images/item-img-1-3.jpg"> <img src="images/item-img-1-3.jpg" alt="" > </li>
                                           </ul>
                                        </div>
                                                                              <div id="carousel" class="thumb-slider">
                                         <ul class="slides">
                                           <li>
                                             <img src="slide1.jpg" />
                                           </li>
                                           <li>
                                             <img src="slide2.jpg" />
                                           </li>
                                           <li>
                                             <img src="slide3.jpg" />
                                           </li>
                                           <li>
                                             <img src="slide4.jpg" />
                                           </li>
                                         </ul>
                                                                              </div> -->
                                        <div id="slider" class="flexslider" runat="server">
                                            
                                        </div>
                                        <div id="carousel" class="flexslider" runat="server">
                                         
                                        </div>
                                    </article>
                                </div>
                                <!-- Item Content -->
                                <div class="col-sm-12 col-lg-7 col-md-7">
                                    <h4 runat="server" id="title"></h4>
                                   
                                    <h6><span style="color:gray">Category: </span> <span runat="server" id="category">New </span></h6>
                                     <h6><span style="color:gray">Condition: </span> <span runat="server" id="condition">New </span></h6>
                                  <h6><span style="color:gray">Price: </span> <strong><span style="font-size:20px; " runat="server" id="price">New </span></strong></h6>
                                     <h6><span style="color:gray">Date Posted: </span> <span runat="server" id="date">New </span></h6>
                                    <h6><span style="color:gray">Description: </span></h6>
                                    <div class="col-sm-7">
                                        
                                       <p style="font-size:16px; padding-right=2%;" runat="server" id="description"></p>
                                      </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                        <a class=""><img src="images/seal.png" runat="server" id="seal"></a>


                                        </div>

                                        <div class="col-sm-6">
                                            <div onclick="favoriteListing()"><a href="#" class="heart"><i class="fa fa-heart more" runat="server" id="heart"></i></a></div>
                                            
                                        </div>
                                    </div>
                                    <!-- List Details -->
                                   
                                        

                                    <!-- <ul class="cmp-list">
                                       <li><a href="#."><i class="fa fa-heart"></i> Add to Wishlist</a></li>
                                       <li><a href="#."><i class="fa fa-navicon"></i> Add to Compare</a></li>
                                       <li><a href="#."><i class="fa fa-envelope"></i> Email to a friend</a></li>
                                    </ul> -->
                                    <!-- Quinty -->
                           
                                    <div class="row">

                                        <div class=" col-lg-3 col-sm-6 col-xs-6 col-md-6">
                                                  <button type="button" style="width: 150px;" class="btn-round" data-toggle="modal" data-target="#offerModal" runat="server" id="offerBtn">Offer</button>
                                        <asp:Button Text="Remove Listing" Visible="false" runat="server" id="removeListing" OnClick="Remove_Click" style="width: 150px;" CssClass="btn-round"></asp:Button>
                                
                                        </div>
                                        <div class=" col-lg-4 col-sm-6 col-xs-6 col-md-6">
                                            <asp:Button Text="Purchase" runat="server" style="width: 150px;" id="purchaseBtn" OnClick="Purchase_Click" CssClass="btn-round"></asp:Button>

                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 1%;">
                                       <div class=" col-lg-3 col-sm-6 col-xs-6 col-md-6">
                                            <button type="button" class="btn-round" data-toggle="modal" data-target="#myModal-2" style="width: 150px;" runat="server" id="messageSeller">Message</button>
                                        </div>
                                        <div class=" col-lg-4 col-sm-6 col-xs-6 col-md-6">
                                         <button id="reportListing" runat="server" data-toggle="modal" data-target="#myModal-3" type="button" style="width: 150px;" class="btn-round">Report</button>
                                         
                                        </div>
                                        
                                    </div>
                                             <%-- <h5>Buyer Protection <a href="#"><span style="font-size:16px;">(Learn More)</span></a></h5>--%>
                                  
                          
                                      <div class="row" style="margin-top:15px; margin-left:15px;">
                                         <a href="" runat="server" id="profile">
                                        <img class="img-responsive img-circle"  width="80" height="80" runat="server" id="aboutme" alt="">
                                          <h3 runat="server" class="fixedFont" id="displayName"></h3>
                                             </a>
                                            <div id="starArea" class="row" runat="server">
                                            </div>
                                            <h5 runat="server" class="fixedFont" id="reviewCount"></h5>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Details Tab Section-->

                    </div>
                    <!-- Related Products -->

                </div>
            </div>
        </div>
    </section>
            <div class="row" runat="server" id="transactionInfo" style="; margin-left:20px;">
            <strong style="font-size:24px; color:black;" runat="server" id="Strong1">Shipping Information:</strong>

            <div class="row" style="text-align:center;visibility:hidden">
                <p style="font-size:18px; " id="address" runat="server"></p>
            </div>
            <div class="row" style="text-align:center;">
                <a href="" runat="server" id="shipLink">
                    <p style="font-size:18px; " id="tracking" runat="server"></p>
                </a>
            </div>
        </div>
            <div class="container">
       
        <!-- Trigger the modal with a button -->
      
        <!-- Modal -->
                 <div class="modal fade" id="modalShipping" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" style="width:80%;" role="document">
                        <div class="modal-content">
                            <div class="modal-header text-center">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h3 class="modal-title w-100 font-weight-bold">Shipping Information</h3>
                            </div>
                            <div class="modal-body mx-3">
                                <div class="md-form mb-4">
                                    <label style="font-size:16px;">Shipping Service:</label>
                                    <div style="width:100%;  margin-top:2px;">
                                        <asp:ListBox ID="shipMethod"
                                                     runat="server"
                                                     Rows="4">
                                            <asp:ListItem>USPS</asp:ListItem>
                                            <asp:ListItem>UPS</asp:ListItem>
                                            <asp:ListItem>FedEx</asp:ListItem>
                                            <asp:ListItem>Other</asp:ListItem>
                                        </asp:ListBox>
                                    </div>
                                </div>
                                <div class="md-form mb-5" style="margin-top:1px;">
                                    <label style="font-size:16px;">Tracking Number:</label>
                                    <div style="width:100%; margin-bottom:10px; height:20px; margin-top:2px;">
                                        <asp:TextBox runat="server" style="resize:none;" ID="trackingNumber" CssClass="form-control"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer d-flex justify-content-center">

                                <asp:Button runat="server" class="btn-round" style="font-weight: bold;" OnClick="send_shipping" Text="Save Shipping"> </asp:Button>

                            </div>
                        </div>
                    </div>
                </div>

                 <div class="modal fade" id="modalFeedback" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" style="width:80%;" role="document">
                        <div class="modal-content">
                            <div class="modal-header text-center">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h3 class="modal-title w-100 font-weight-bold" id="H1" runat="server"></h3>
                            </div>
                            <div class="modal-body">
                                <div class="row" style="width:100%;text-align:center;display:inline-block">
                                    <img id="fstar1" src="images/staroutline.png" onclick="setstars(1)" />
                                    <img id="fstar2" src="images/staroutline.png" onclick="setstars(2)" />
                                    <img id="fstar3" src="images/staroutline.png" onclick="setstars(3)" />
                                    <img id="fstar4" src="images/staroutline.png" onclick="setstars(4)" />
                                    <img id="fstar5" src="images/staroutline.png" onclick="setstars(5)" />
                                </div>
                            </div>
                            <div class="modal-body mx-3">
                                <div class="md-form mb-5" style="margin-top:20px;">
                                    <label style="font-size:16px;">Feedback Message:</label>
                                    <div style="width:100%; margin-bottom:10px; height:140px; margin-top:5px;">
                                        <asp:TextBox runat="server" ID="feedbackBox" style="resize:none;" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <asp:HiddenField ID="starNumber" runat="server" />
                            <div class="modal-footer d-flex justify-content-center">
                                <asp:linkbutton runat="server" OnClick="send_feedback" CssClass="btn btn-default btn-block messageButton">
                                    Submit Feedback
                                </asp:linkbutton>
                            </div>
                        </div>
                    </div>
                </div>

                    <div class="modal fade" id="offerModal" role="dialog">
          <div class="modal-dialog new-model">
          
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Offer</h4>
              </div>
              <div class="modal-body">
                <section class="contact-sec  padding-bottom-80">
                  <div class="container"> 
                    
                    <!-- MAP -->
                    
                    
                    <!-- Conatct -->
                    <div class="contact">
                      <div class="contact-form"> 
                        <!-- FORM  -->
                        
                          <div class="row">
                            <div class="col-md-12"> 
                              
                              <!-- Payment information -->
                             
                              <div class="row">
                                  <h5>Offer:</h5>
                                    <asp:TextBox runat="server" style="resize:none;" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" placeholder="$" ID="offerPrice" CssClass="form-control"></asp:TextBox>
                               </div>    
                                 
                                <div class="row">
                                      <h5>Shipping price:</h5>
                                        <asp:TextBox runat="server" style="resize:none;" placeholder="$" ReadOnly="true" ID="shippingPrice" CssClass="form-control"></asp:TextBox>
                             
                                 </div>
                                
                               <div class="row" style="margin-top:20px;">
                                     <asp:LinkButton runat="server" class="btn-round" style="background-color:#69e150; border-color:#69e150; height:50px;font-size:22px; color:white;" OnClick="send_offer"><strong>Send Offer</strong> </asp:LinkButton>
                                </div>
                            
                            </div>
                            
                            <!-- Conatct Infomation -->
                            
                          </div>
                       
                      </div>
                    </div>
                  </div>
                </section>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn-round" style="background-color:black" data-dismiss="modal">Close</button>
              </div>
            </div>
            
          </div>
        </div>
      
      </div>

      <div class="container">
       
        <!-- Trigger the modal with a button -->
      
        <!-- Modal -->
        <div class="modal fade" id="myModal-2" role="dialog">
          <div class="modal-dialog new-model">
          
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Message Seller</h4>
              </div>
              <div class="modal-body">
                <section class="contact-sec  padding-bottom-80">
                  <div class="container"> 
                    
                    <!-- MAP -->
                    
                    
                    <!-- Conatct -->
                    <div class="contact">
                      <div class="contact-form"> 
                        <!-- FORM  -->
                          <div class="row">
                            <div class="col-md-12"> 
                              
                              <!-- Payment information -->
                             
                              <div class="row">
                                
                                <div class="col-sm-10">
                                <h5>Message:</h5>
                                    <asp:TextBox runat="server" ID="MessageInput" style="resize:none;" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                                 
                                    
                                </div>
                                <div class="col-sm-12 no-margin">
                                   <asp:linkbutton runat="server" OnClick="send_message" CssClass="btn-round">
                                    Send Message
                                </asp:linkbutton> </div>
                              </div>
                            </div>
                            
                            <!-- Conatct Infomation -->
                            
                          </div>
                      
                      </div>
                    </div>
                  </div>
                </section>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn-round" style="background-color:black" data-dismiss="modal">Close</button>
              </div>
            </div>
            
          </div>
        </div>
        
      </div>

      <div class="container">
       
        <!-- Trigger the modal with a button -->
      
        <!-- Modal -->
        <div class="modal fade" id="myModal-3" role="dialog">
          <div class="modal-dialog new-model">
          
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="btn-round" style="background-color:black"  data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Report</h4>
              </div>
              <div class="modal-body">
  
                <section class="contact-sec padding-bottom-80">
                  <div class="container"> 
                    
                    <!-- MAP -->
                    
                    
                    <!-- Conatct -->
                    <div class="contact">
                      <div class="contact-form"> 
                        <!-- FORM  -->
                       
                          <div class="row">
                            <div class="col-md-12"> 
                              
                              <!-- Payment information -->
                              
                              <div class="row">
                                <div class="col-sm-10">
                                  <h5>Please add more details about why you are reporting this listing: </h5>
                                    <div style="width:100%; margin-bottom:10px; height:160px; margin-top:10px">
                                        <asp:TextBox runat="server" style="resize:none;" ID="reportBox" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                                    </div>

                                 
                                </div>
                                <div class="col-sm-12 no-margin">
                                    <asp:LinkButton runat="server" class="btn-round" style="resize:none;" OnClick="send_report"><strong>Report Listing</strong> </asp:LinkButton>
                                </div>
                              </div>
                            </div>
                            
                            <!-- Conatct Infomation -->
                            
                          </div>
                   
                      </div>
                    </div>
                  </div>
                </section>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn-round" style="background-color:black"  data-dismiss="modal">Close</button>
              </div>
            </div>
            
          </div>
        </div>
        
      </div>
</div>
    </form>
        </asp:Content>