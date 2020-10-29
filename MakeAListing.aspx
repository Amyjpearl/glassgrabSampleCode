<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="MakeAListing.aspx.cs" MasterPageFile="MasterPage.Master" Inherits="GlassGrabAPI.MakeAListing" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <script>
        $('#FileUpload1').change(function () {
            $(this).removeClass("bar");
        })
        function setcategory(category) {
            document.getElementById("Glass").src = "images/glass.png";
            document.getElementById("Pipes").src = "images/pipes.png";
            document.getElementById("Accessories").src = "images/accessories.png";
            document.getElementById("Parts").src = "images/parts.png";

            document.getElementById(category).src = "images/" + category.toLowerCase() + "filled.png";
            document.getElementById("ContentPlaceHolder1_category").value = category;
        }
        function conditionClick(element) {
            document.getElementById("Broken").style.backgroundColor = "white";
            document.getElementById("Used").style.backgroundColor = "white";
            document.getElementById("New").style.backgroundColor = "white";
            document.getElementById("Broken").style.color = "#69e150";
            document.getElementById("Used").style.color = "#69e150";
            document.getElementById("New").style.color = "#69e150";

            document.getElementById(element).style.backgroundColor = "#69e150";
            document.getElementById(element).style.color = "white";
            document.getElementById("ContentPlaceHolder1_condition").value = element;
        }

        function ValidateFileLimit(sender, args) {
            var fileCount = document.getElementById('FileUpload1').files.length;
            if (fileCount > 6) // Selected images with in 3 count
            {
                alert("Please select up to 6 images.");
                return false;
            }
            else if (fileCount <= 0) // Selected atleast 1 image check
            {
                alert("Please select at least 1 image.");
                return false;
            }

            return true;  // Good to go
        }

    </script>
      <section class="main-tabs-sec padding-top-60 padding-bottom-0">
    <form runat="server">
     <div id="modalListingForm" style="margin-left:5px; margin-right:10px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" >
                    <div id="alert" runat="server" class="alert alert-warning" visible="false"></div>
                    <div class="modal-header text-center">
                        <h4 id="title" runat="server" >Add a Listing</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="window.location.reload(false); ">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="md-form mb-4">
                            <label>Photos</label>
                            <div class="row">
                                <div class="col-md-4">
                                <asp:FileUpload ID="FileUpload1" ClientIDMode="Static" onchange="this.form.submit()" runat="server" AllowMultiple="true" accept=".png,.jpg,.jpeg" CssClass="bar"/>
                               <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="CustomValidator" ControlToValidate="FileUpload1" ClientValidationFunction="ValidateFileLimit"></asp:CustomValidator>
               
                                    </div>
                            </div>
                                                 <div class="row" style="text-align:center">
                                        <p>Upload images with your glassgrab username and date to have them approved.</p>
                                    </div>
                            <div class="row" style="text-align:center">
                                
                                     <img runat="server" id="item1" onclick="" src="" class="listingImage " />
                               
                               
                                     <img runat="server" id="item2" onclick="" src="" class="listingImage " />
                                
                                     <img runat="server" id="item3" onclick="" src="" class="listingImage " />
                                
                            
                                     <img runat="server" id="item4" onclick="" src="" class="listingImage " />
                               
                                     <img runat="server" id="item5" onclick="" src="" class="listingImage " />
                                
                                     <img runat="server" id="item6" onclick="" src="" class="listingImage " />
                                
                            </div>
                        </div>
                        <div class="md-form mb-4">
                            
                            <label>Title</label>
                            <asp:TextBox runat="server" style="width:100%;" ID="titleBox" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="md-form mb-5">
                            <label>Category</label>
                            <div class="container" style=" text-align:center; display:inline-block;">
                                <div class="row" id="categories" style="margin-top:15px;">
                                    <div class="scol">
                                        <img id="Glass" src="images/glass.png" onclick="setcategory('Glass')" class="" style="width:80px; height:80px;" />
                                    </div>
                                    <div class="scol">
                                        <img id="Pipes" src="images/pipes.png" onclick="setcategory('Pipes')" class="" style="width:80px;height:80px;" />
                                    </div>
                                    <div class="scol">
                                        <img id="Parts" src="images/parts.png" onclick="setcategory('Parts')" class="" style="width:80px;height:80px;" />
                                    </div>
                                    <div class="scol">
                                        <img id="Accessories" src="images/accessories.png" onclick="setcategory('Accessories')" class="" style="width:80px;height:80px;" />
                                    </div>
                                    <asp:HiddenField runat="server" ID="category" />
                                </div>
                            </div>
                        </div>
                        <div class="md-form mb-4">
                            
                            <label>Brand (optional)</label>
                             <asp:TextBox runat="server" style="width:100%;" ID="brandBox" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="md-form mb-4">
                            

                            <label>Description</label>
                             <asp:TextBox runat="server" style="width:100%; resize:none;" TextMode="MultiLine" Rows="2" ID="descriptionBox" CssClass="form-control"></asp:TextBox>
                        </div>
                         <div class="md-form mb-4">
                            

                            <label>Condition</label>
                             <div class="row">
                             <div class="col-md-4">
                                 <div id="Broken" onclick="conditionClick('Broken')" style="color: #69e150; border-color: #69e150; background-color: white" class="btn btn-success btn-block btn-lg">Broken</div>
                             </div> 
                             <div class="col-md-4">
                                   <div id="Used" onclick="conditionClick('Used')" style="color: #69e150; border-color: #69e150; background-color: white" class="btn btn-success btn-block btn-lg">Used</div>
                            </div>
                             <div class="col-md-4">
                                 <div id="New" onclick="conditionClick('New')" style="color: #69e150; border-color: #69e150; background-color: white" class="btn btn-success btn-block btn-lg">New</div>
                                 </div>
                            </div>
                             <asp:HiddenField runat="server" ID="condition" />
                         </div>
                        <div class="md-form mb-4">
                            <div class="col">
                                
                                <label>Price</label>
                                <asp:TextBox runat="server" Placeholder="$" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" style="width:100%;" ID="TextBox1" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                
                                <label>Shipping Price</label>
                                <asp:TextBox runat="server" Placeholder="$" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" style="width:100%;" ID="TextBox2" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                         <div class="md-form mb-4" style="margin-top:20px;">
                              <asp:LinkButton runat="server" class="btn btn-default btn-block btn-success" style="background-color:rgb(105,225,80); height:50px; font-size:22px; color:white;" OnClick="publish_listing"><strong>Publish</strong> </asp:LinkButton>
                         </div>
                    </div>
                </div>
                    <div class="modal-footer d-flex justify-content-center">
                    
                    </div>
                </div>
            </div>
        </form>
          </section>
    <style>
        .scol {
            float: left;
            width: 25%;
        }
        .listingImage {
            border:2px solid rgb(105,225,80);
            border-style:dashed;
            border-radius: 5%;
            margin-top:2%;
            height:140px;
            width:105px;
        }
        .bar:after {
            content:" Please upload images.";
            background-color:white;

        }
    </style>
</asp:Content>