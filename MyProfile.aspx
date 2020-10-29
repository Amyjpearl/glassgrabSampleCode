<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" MasterPageFile="MasterPage.Master" Inherits="GlassGrabAPI.Website.MyProfile" EnableSessionState="True"%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
        
<script src="js/site.js" type="text/javascript"></script>

<div class="container" style="margin-top:25px">

    <div style="text-align:center; padding-bottom:20px;">
        <img src="images/propic.png" runat="server" id="aboutme" width="120" height="120" class="img-circle"/>
           <br />
        <br />
        <a href="" runat="server" id="instagramlink">

            <div type="submit" class="btn-round" style="font-size:20px;text-transform: uppercase;border-radius: 30px;" runat="server" id="instahandle"> <i class="fa fa-instagram" style="padding-right:20px;"></i> Other Person Profile Name Here</div>
        </a>
        <br />
        <a href="EditProfile.aspx">Edit Profile</a>
        <h3 runat="server" id="displayName">displayName</h3>
        <h5 runat="server" id="bio" class="bio"></h5>
        <h5 runat="server" id="itemsSold"></h5>
       <div class="container">
            <div class="col-xs-4">
                </div>
            <div class="col-xs-4">
                <div id="starArea" runat="server" >

                </div>
            </div>
             <div class="col-xs-4">
                </div>
        </div>

        <!-- <h5>@Model.feedbackCount Reviews</h5> -->
       <%-- <div class="container" style="padding-top:10px;">
            <div class="col-xs-6">
                <button type="button" style="color: #69e150; border-color:#69e150; background-color:white"class="btn btn-success btn-block btn-lg">Message</button>
            </div>

            <div class="col-xs-6">
                <button type="button"style="color: #69e150; border-color:#69e150; background-color:white"class="btn btn-success btn-lg btn-block">Review</button>
            </div>
        </div>--%>
    </div>
</div>
<div class="container">

    <div class="tab" style="text-align:center;  margin-top:10px;">

        <div class="col-xs-4">
            <a class="tablinks active" onclick="opencollapsable(event, 'ContentPlaceHolder1_Listings')" id="listingLabel" runat="server"></a>
        </div>
        <div class="col-xs-4">
            <a class="tablinks" onclick="opencollapsable(event, 'ContentPlaceHolder1_Favorites')"  id="favoritesLabel" runat="server">Favorites (@Model.favoriteCount)</a>
        </div>
        <div class="col-xs-4">
            <a class="tablinks" onclick="opencollapsable(event, 'ContentPlaceHolder1_Reviews')" id="reviewsLabel" runat="server">Reviews (@Model.feedbackCount)</a>
        </div>
    </div>

    <hr/>

         <div class="item-col-5" id="productHolder" runat="server">
    <div id="Listings" runat="server" class="tabcontent active" style="display:block">
        
    </div>
             </div>
     <div class="item-col-5" id="Div1" runat="server">
    <div id="Favorites" runat="server" class="tabcontent">

    </div>
         </div>

    <div id="Reviews" style="text-align:center;" class="tabcontent" runat="server">
       
        
        
    </div>

    </div>

<style>
    .bio {
        margin-left:50px;
        margin-right:50px;
    }
    .tab {
        overflow: hidden;
    }

        .tab a {
            color: #808080;
            text-align: center;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 18px;
        }

            .tab a:hover {
                color: #000000;
            }

            .tab a.active {
                color: #000000;
            }

    .tabcontent {
        display: none;
        padding: 12px 12px;
    }
    .star {
        width:100px;
    }
</style>
</asp:Content>