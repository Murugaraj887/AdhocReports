<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AdhocReports.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/menu.css?v=1" rel="stylesheet" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title></title>
    <script>

        function openPopUp(obj) {
            document.querySelector('#iframe1').height = window.innerHeight - 100;
            var url = obj.parentElement.getElementsByTagName('input')[0].value;
            var name = obj.innerText;
            document.getElementById("myModal").style.display = "block";
            document.getElementById('h2ModalHeader').innerText = name;
            document.getElementById('iframe1').src = url;

        }

        function openNewTab(obj) {
            var url = obj.parentElement.getElementsByTagName('input')[0].value;
            window.open(url,'_blank')
        }

    </script>

    

    <style>
        .modal-content
        {
            font-family: calibri; 
            font-size: 18px;
            
        }
        table {
            font-family: calibri;
            border-collapse: collapse;
            font-size: 20px;
            border:none
        }
        table td{
            border:none;
        }
        .alink{
            text-decoration:none;
            color: #0072bc;
            font-weight:bold;
            font-size:20px;

        }
        a{
            color:red;
        }
        .modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 5px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 95%;
  height:95%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.close {
  color: white !important;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: white;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: black;
  color: white;
}

.modal-body {padding: 2px 5px;}

.modal-footer {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}
    </style>

</head>
<body>
    <form id="form1" runat="server">
         <div class="topnav">
  <a class="active" href="home.aspx">Adhoc Reports</a>
  <a href="basedatareports.aspx">Base Reports</a>
  <a  href="finpulseactivities.aspx">Finpulse Activities</a>
 </div>
        <div style="padding-left:5px">
            <asp:GridView ID="gvAdhoc" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDataBound="gvAdhoc_RowDataBound">
                <Columns>


                    <asp:TemplateField HeaderText ="ADHOC REPORTS GENERATION" HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="25px" HeaderStyle-BackColor="Black"  >
                        <ItemTemplate>
                            <asp:HiddenField ID="htnfld"  runat="server" Value='<%# Bind("Link")  %>' />
                            <asp:Image ImageUrl="~/Content/images/bullet.png" runat="server" />
                            <asp:LinkButton ID="lkbtn" CssClass="alink" ToolTip="Open Link in Popup" Text='<%# Bind("ReportName")  %>' OnClientClick='openPopUp(this);return false;' runat="server" />
                            <asp:ImageButton runat="server" Height="14" ToolTip="Open Link in New Tab" OnClientClick='openNewTab(this);return false;' ImageUrl="~/Content/images/newtab.jpg" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header" >
      <span class="close">&times;</span>
      <h2 id="h2ModalHeader" style="margin:3px;">Modal Header</h2>
    </div>
    <div class="modal-body">
        <iframe id="iframe1" width="100%" height="100%" style="border:none">

        </iframe>
      
    </div>
    
  </div>

</div>

    <script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
//var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
//btn.onclick = function() {
//  modal.style.display = "block";
//}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>
