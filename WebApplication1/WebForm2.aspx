<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查詢介面</title>
<link href="~/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="~/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="~/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
    <%-- <div class="topnav">
         <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
       <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link active" href="WebForm1.aspx" style="color:black;">回首頁</a>
            </li>
            <li class="nav-item">
            </li>
            <li class="nav-item">
            </li>
        </ul>
       </div>--%>
     <ul class="bubble">
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
</ul>
    <div class="col-sm" style="margin-top:15px; top: 0px; left: 0px;"> 
        <a class="nav-link active" href="WebForm1.aspx" style="color:black; font-weight: bold;">回首頁</a>
        <asp:GridView ID="GridView1" CssClass="table table-dark table-hover" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="number" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="number" HeaderText="筆數" ReadOnly="True" Visible="False" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="applydate" HeaderText="申請日期" ApplyFormatInEditMode="True" DataFormatString="{0:d}" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="no" HeaderText="需求單號" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="department" HeaderText="提出部門" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="system" HeaderText="系統名稱" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="item" HeaderText="需求項目" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="software" HeaderText="程式名稱" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="path" HeaderText="路徑" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="reason" HeaderText="需求原因" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="descript" HeaderText="內容說明" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="username" HeaderText="申請人" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="service" HeaderText="資訊室窗口" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="需求單狀態" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/img/Cancel.ico" DeleteImageUrl="~/img/Delete.ico" EditImageUrl="~/img/Edit.ico" ShowEditButton="True" UpdateImageUrl="~/img/Update.ico" HeaderText="編輯" >
                <HeaderStyle BackColor="Gray" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/img/Delete.ico" ShowDeleteButton="True" HeaderText="刪除" >
                <HeaderStyle BackColor="Gray" HorizontalAlign="Center" />
                </asp:CommandField>
                <asp:CommandField ButtonType="Image" HeaderText="設定(限資訊)" SelectImageUrl="~/img/manager.ico" ShowSelectButton="True">
                <HeaderStyle BackColor="#FF9999" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
    </div>           
</form>
</body>
</html>
