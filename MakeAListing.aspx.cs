using GlassGrabShared;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassGrabAPI
{
    public partial class MakeAListing : System.Web.UI.Page
    {
        Listing thisListing;
        List<string> filteredWords_ = new List<string>();
        Listing editingListing = null;
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (Session["userSession"] == null)
            {
                Response.Redirect("/Login.aspx?redirect=MakeAListing.aspx", false);
                return;
            }
            filteredWords_ = (await DatabaseCommunicator.GetFilteredWords(Guid.NewGuid().ToString())).Split('|').ToList();
            thisListing = new Listing();
            if (IsPostBack && FileUpload1.PostedFiles.SafeCount() > 0)
            {
                try
                {
                    thisListing.imagesBytes = new List<byte[]>();
                    int imageCount = 0;
                    for(int i = 0; i < Math.Min(FileUpload1.PostedFiles.Count, 6); i++)
                    {
                        string b64 = "";
                        var file = FileUpload1.PostedFiles[i];
                        if (file.ContentLength / 1024 / 1024 > 20)
                            continue;
                        if (file.FileName.Contains("png"))
                            b64 = "data:image/png;charset=utf-8;base64, ";
                        else if (file.FileName.ToLower().Contains("jpg") || file.FileName.ToLower().Contains("jpeg"))
                            b64 = "data:image/jpeg;charset=utf-8;base64, ";
                        else
                            continue;
                        byte[] fileData = null;
                        using (var binaryReader = new BinaryReader(Request.Files[i].InputStream))
                        {
                            fileData = binaryReader.ReadBytes(Request.Files[i].ContentLength);
                        }
                        b64 += System.Convert.ToBase64String(fileData);
                        thisListing.imagesBytes.Add(fileData);
                        if(imageCount == 0)
                            item1.Src = b64;
                        if (imageCount == 1)
                            item2.Src = b64;
                        if (imageCount == 2)
                            item3.Src = b64;
                        if (imageCount == 3)
                            item4.Src = b64;
                        if (imageCount == 4)
                            item5.Src = b64;
                        if (imageCount == 5)
                            item6.Src = b64;
                        imageCount++;
                    }

                    if (imageCount < 6)
                        item6.Src = "";
                    if (imageCount < 5)
                        item5.Src = "";
                    if (imageCount < 4)
                        item4.Src = "";
                    if (imageCount < 3)
                        item3.Src = "";
                    if (imageCount < 2)
                        item2.Src = "";

                    if(thisListing.imagesBytes.SafeCount() > 0)
                        Session["images"] = thisListing.imagesBytes;
                }
                catch { }
            }
            
            var session = (SessionObject)Session["userSession"];
            bool isEditing = false;
            try
            {
                    var editId = Request.QueryString["editingId"].ToString();
                    var listing = (await DatabaseCommunicator.RetrieveListing(session.auth, new List<string>(new string[] { editId }), ListingStatus.Active)).First();
                if (listing.sellerUsername == session.user.Id)
                {
                    title.InnerText = "Edit Listing";
                    isEditing = true;
                    editingListing = listing;
                    if (!IsPostBack)
                    {
                        List<byte[]> bytes = new List<byte[]>();
                        foreach (var ah in listing.images)
                            bytes.Add(await WebCrawler.ReadBytes(ah));
                        Session["images"] = bytes;
                        try
                        {
                            if (bytes.Count > 0)
                                item1.Src = listing.images[0];
                            if (bytes.Count > 1)
                                item2.Src = listing.images[1];
                            if (bytes.Count > 2)
                                item3.Src = listing.images[2];
                            if (bytes.Count > 3)
                                item4.Src = listing.images[3];
                            if (bytes.Count > 4)
                                item5.Src = listing.images[4];
                            if (bytes.Count > 5)
                                item6.Src = listing.images[5];
                        }
                        catch { }
                        titleBox.Text = listing.title;
                        brandBox.Text = listing.brand;
                        descriptionBox.Text = listing.description;
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>setcategory('" + listing.category + "'); conditionClick('" + listing.condition + "');</script>", false);
                        TextBox1.Text = listing.price.ToString();
                        TextBox2.Text = listing.shippingPrice.ToString();
                    }
                }
                else
                    Response.Redirect("/MakeAListing.aspx", false);
            }
            catch { }
        }

        public async void publish_listing(object sender, EventArgs e)
        {
            if (ValidateListing())
                return;
            var listing = new Listing();
            try
            {
                var session = (SessionObject)Session["userSession"];
                listing.imagesBytes = (List<byte[]>)Session["images"];
                var thumbnailBytes = listing.imagesBytes.First();
                System.IO.MemoryStream myMemStream = new System.IO.MemoryStream(thumbnailBytes);
                System.Drawing.Image fullsizeImage = System.Drawing.Image.FromStream(myMemStream);
                System.Drawing.Image newImage = fullsizeImage.GetThumbnailImage(210, 280, null, IntPtr.Zero);
                System.IO.MemoryStream myResult = new System.IO.MemoryStream();
                newImage.Save(myResult, System.Drawing.Imaging.ImageFormat.Jpeg);

                for(int i = 0; i < listing.imagesBytes.Count; i++)
                {
                    System.IO.MemoryStream myMemStreamX = new System.IO.MemoryStream(listing.imagesBytes[i]);
                    System.Drawing.Image fullsizeImageX = System.Drawing.Image.FromStream(myMemStreamX);
                    System.Drawing.Image newImageX = fullsizeImageX.GetThumbnailImage(900, 1200, null, IntPtr.Zero);
                    System.IO.MemoryStream myResultX = new System.IO.MemoryStream();
                    newImageX.Save(myResultX, System.Drawing.Imaging.ImageFormat.Jpeg);
                    listing.imagesBytes[i] = myResultX.ToArray();
                }
                listing.thumbnailBytes = myResult.ToArray();

                listing.Id = editingListing != null ? editingListing.Id : Guid.NewGuid().ToString();
                listing.brand = brandBox.Text;
                listing.description = descriptionBox.Text;
                listing.title = titleBox.Text;
                listing.category = category.Value;
                listing.condition = condition.Value;
                listing.price = Convert.ToInt64(TextBox1.Text.Replace(".00", ""));
                listing.shippingPrice = string.IsNullOrEmpty(TextBox2.Text.Replace(".00", "")) ? 0 : Convert.ToInt64(TextBox2.Text.Replace(".00", ""));
                listing.sellerUsername = session.user.Id;
                listing.sellerPayPal = "";
                if (editingListing != null)
                {
                    var succes = await DatabaseCommunicator.EditListing(session.auth, listing);
                    if (succes.listingUpdated)
                        Response.Redirect("/MyProfile.aspx", false);
                    else
                    {
                        alert.InnerText = succes.errorMessage;
                        alert.Visible = true;
                        return;
                    }
                }
                var success = await DatabaseCommunicator.AddListing(session.auth, listing);
                if (success.listingPosted)
                    Response.Redirect("/MyProfile.aspx", false);
                else
                {
                    alert.InnerText = success.errorMessage;
                    alert.Visible = true;
                    return;
                }
            }
            catch { }
        }
        public List<string> ContainsFilteredWords(string source)
        {
            var filter = filteredWords_;
            List<string> filteredWords = new List<string>();
            string NonAlpha = @" ![%,]&-|'.=~(/=)*{?`}@:;^" + "\"";
            var sourcewords = source.Split(NonAlpha.ToArray());
            foreach (var word in sourcewords)
            {
                int index = filter.FindIndex(x => String.Compare(x, word, true) == 0);
                if (index >= 0)
                {
                    if (filteredWords.FindIndex(x => String.Compare(x, word, true) == 0) < 0)
                        filteredWords.Add(word);
                }
            }
            return filteredWords.ToList();
        }
        bool FilterListing(string source)
        {
            try
            {
                string alertMessageStart = "Please change or remove the following word(s): ";
                var filteredWords = ContainsFilteredWords(source).ToArray();
                if (filteredWords.SafeCount() > 0)
                {
                    if (filteredWords.Length == 1)
                    {
                        alertMessageStart = alertMessageStart.Replace("(s)", "");
                    }
                    else
                    {
                        alertMessageStart = alertMessageStart.Replace("(s)", "s");
                    }
                    alertMessageStart += String.Join(", ", filteredWords);
                    alert.Visible = true;
                    alert.InnerText = alertMessageStart;
                    return true;
                }
                return false;
            }
            catch { }
            return false;
        }
        bool ValidateListing()
        {
            var images = (List<byte[]>)Session["images"];
            if (images.SafeCount() == 0)
            {
                alert.InnerText = "Please upload at least 1 image.";
                alert.Visible = true;
                return true;
            }
            if (string.IsNullOrEmpty(titleBox.Text))
            {
                alert.InnerText = "Please include a title.";
                alert.Visible = true;
                return true;
            }
            if (string.IsNullOrEmpty(descriptionBox.Text))
            {
                alert.InnerText = "Please include a description.";
                alert.Visible = true;
                return true;
            }
            if (string.IsNullOrEmpty(category.Value))
            {
                alert.InnerText = "Please choose a category.";
                alert.Visible = true;
                return true;
            }
            if (string.IsNullOrEmpty(condition.Value))
            {
                alert.InnerText = "Please choose a condition.";
                alert.Visible = true;
                return true;
            }
            if (string.IsNullOrEmpty(TextBox1.Text) || Convert.ToInt32(TextBox1.Text) < 1)
            {
                alert.InnerText = "Please include an item price of at least $1.";
                alert.Visible = true;
                return true;
            }
            if (FilterListing(titleBox.Text + " " + descriptionBox.Text + " " + brandBox.Text))
                return true;
            return false;
        }

    }
}