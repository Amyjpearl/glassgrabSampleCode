<%@ Page Async="true" Language="C#" AutoEventWireup="true"  CodeBehind="Index.aspx.cs" Inherits="GlassGrabAPI.Website.Index" %>
<%--MasterPageFile="MasterPage.Master"--%>

<title>glassgrab</title>
<html>
<style>
body, html {
  height: 100%;
  margin: 0;
}

.bgimg {
  background-image: url('/w3images/forestbridge.jpg');
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Avenir";
  font-size: 25px;
}

.topleft {
  position: absolute;
  top: 0;
  left: 16px;
}

.bottomleft {
  position: absolute;
  bottom: 0;
  left: 16px;
}

.middle {
  position: absolute;
  color: black;
  top: 55%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}
.top{
     position:absolute;
     color:#69E150;
     top: 35%;
     font-family: "Avenir";
     font-style: italic;
     left: 50%;
     font-size: 48px;
     transform: translate(-50%, -50%);
     text-align: center;
}
.bottom{
    top:70%;
    left:50%;
    text-align:center;
      }
    .veryBottom{
    top:95%;
    text-align:center;
    width: 100%;
    position: fixed;
    }
hr {
  margin: auto;
  width: 40%;
}
</style>
<body>

<div class="bgimg">
   
  <div class="topleft">
    <img src="images/meesterIcon.png" style="padding-top:15px; width:60px">
  </div>
    <div class="top">
    <h1>glassgrab</h1>
    </div>
  <div class="middle">
    <h1>COMING SOON</h1>
  </div>
    
    <div class="veryBottom">
        <img style="width:100%;"src="images/green.png">
    </div>
</div>

</body>
</html>
   
<%--
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" Style="margin-bottom:50px;">
    <script type="text/javascript">
        function favoriteListing() {
            var button = document.getElementById("ContentPlaceHolder1_fav");

            button.click();
        }
        //$(window).scroll(function () {
        //    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
        //        var button = document.getElementById("ContentPlaceHolder1_scroll");

        //        button.click();
        //    }
        //});
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="content">
    <form runat="server">
    <asp:Button ID="scroll" runat="server" Text="Register" Style="visibility:hidden;" OnClick="scroll_click"/>
               </form>
    <!-- HOT DEAL -->
    <section class="main-tabs-sec padding-top-60 padding-bottom-0">
        <div class="container">

            <div class="row">
                <div class="col-md-8 col-md-offset-3">
                    <ul class="nav margin-bottom-40" role="tablist">
                        <li role="presentation" class="active" style="display: none;"><a href="#tab-1" aria-controls="featur" role="tab" data-toggle="tab"> <i class="fa fa-car"></i> Cars </a></li>
                        <li aria-autocomplete="both">
                            <a runat="server" href="" id="waterPipesLink" style="border-style:none; text-transform: uppercase;font-size: 18px; padding-top:15%;">
                                <img style="border-style:none" runat="server" src="images/cat_bong.png" id="waterPipes"><p class="tab-text"></p>
                            </a>
                        </li>
                        <li>
                            <a href="" runat="server" id="dryPipesLink"  style="border-style:none; text-transform: uppercase;font-size: 18px; padding-top:15%;">
                                <img  runat="server" src="images/cat_pipe.png" id="dryPipes"> <p class="tab-text"></p>
                            </a>
                        </li>
                        <li>
                            <a runat="server" href="" id="pendantsLink" style="border-style:none; text-transform: uppercase;font-size: 18px;">
                                <img runat="server" src="images/cat_pendant.png" id="pendants"><p class="tab-text"></p>
                            </a>
                        </li>
                        <li>
                            <a href="" runat="server" id="capsLink" style="border-style:none; text-transform: uppercase;font-size: 18px;">
                                <img runat="server" src="images/cat_cap.png" id="caps"><p class="tab-text"></p>
                            </a>
                        </li>
                        <li>
                            <a href="" runat="server" id="slidesLink" style="border-style:none; text-transform: uppercase;font-size: 18px;">
                                <img runat="server" src="images/cat_nail.png" id="slides"><p class="tab-text"></p>
                            </a>
                        </li>
                        <li>
                            <a href="" runat="server" id="dabbersLink" style="border-style:none; text-transform: uppercase;font-size: 18px;">
                                <img runat="server" src="images/cat_dabber.png" id="dabbers"><p class="tab-text"></p>
                            </a>
                        </li>
                        <li>
                            <a href="" runat="server" id="vesselsLink" style="border-style:none; text-transform: uppercase;font-size: 18px;">
                                <img runat="server" src="images/cat_shot.png" id="vessels"><p class="tab-text"></p>
                            </a>
                        </li>
                        <li>
                            <a href="" runat="server" id="miscellaneousLink" style="border-style:none; text-transform: uppercase;font-size: 18px;">
                                <img runat="server" src="images/cat_part.png" id="miscellaneous"><p class="tab-text"></p>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>


            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active fade in" id="tab-1">

                    <section class=" padding-top-60 padding-bottom-30">
                        <div class="container">
                            <!-- Items -->
                            <div class="item-col-5" id="productHolder" runat="server">
                                <!-- Product -->
                                
                                
                            </div>
                        </div>
                        <div runat="server" id="scroller">


                        </div>
                    </section>
                </div>

            </div>
        </div>
    </section>
    </asp:Content>
--%>


