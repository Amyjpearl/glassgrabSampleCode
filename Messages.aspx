<%@ Page Language="C#" AutoEventWireup="true" Async="true" MasterPageFile="MasterPage.Master" CodeBehind="Messages.aspx.cs" Inherits="GlassGrabAPI.Messages" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
    <script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
<div class="container">

    <div class="tab" style="text-align:center;  margin-top:25px;">

        <div class="col-xs-6">
            <a class="tablinks active" onclick="opencollapsable(event, 'Buy')" runat="server" id="buyTag">Buy (inboxnumber)</a>
        </div>
        <div class="col-xs-6">
            <a class="tablinks" onclick="opencollapsable(event, 'Sell')" runat="server" id="sellTag"> Sell (inboxnumber)</a>
        </div>

    </div>
</div>

<hr> <div id="Buy" style="text-align:center; display:block; " class="tabcontent">
    <div class="container">
        <div class="row" style="align-content:center;display:block;">
            <form>
               <%-- <div class="col-xs-6">
                    <input style=" width:105%; margin-left:30%;  background-color:#f2f2f2;color:#a1a0a8; border:none; " class="form-control" type="search" placeholder="Search Messages" aria-label="Search">
                </div>
                <div class="col-xs-6">
                    <button type="button" style="width:60px;height:32px; text-align:center;color: black; background-color:#f2f2f2" typeof="submit" class="btn btn-sm">Search</button>
                </div>--%>
            </form>
        </div>

        <div id="buyHtml" runat="server">

        </div>
    </div>
</div>
<div id="Sell" style="text-align:center; " class="tabcontent">
    <div class="container">
        <div class="row" style="align-content:center;display:block;">
            <form>
               <%-- <div class="col-xs-6">
                    <input style=" width:105%; margin-left:30%;  background-color:#f2f2f2;color:#a1a0a8; border:none; " class="form-control" type="search" placeholder="Search Messages" aria-label="Search">
                </div>
                <div class="col-xs-6">
                    <button type="button" style="width:60px;height:32px; text-align:center;color: black; background-color:#f2f2f2" typeof="submit" class="btn btn-sm">Search</button>
                </div>--%>
            </form>
        </div>
        <div id="sellHtml" runat="server">

        </div>
    </div>
</div>
<style>
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
</style>
    </asp:Content>