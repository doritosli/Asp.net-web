<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IT_department.aspx.cs" Inherits="WebApplication1.IT_department" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>資訊室同仁介面</title>
<link href="~/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="~/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="~/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
<div class="ousbox">
    <div class="box">
        <div class="container">
<%--第一區:需求單編號--%>
        <div class="row" style="margin-top: 20px; font-size: 20px;">
            <div class="col-8">
                <asp:Label ID="Label1" runat="server" Text="需求單編號 : "></asp:Label>
                <%--<asp:TextBox ID="TextBox1" runat="server" Width="134px"></asp:TextBox> --%>
                <asp:Label ID="Label9" runat="server"></asp:Label>
                <asp:CheckBox ID="CheckBox1" runat="server" />
                <asp:Label ID="Label8" runat="server" Text="專案任務"></asp:Label>
            </div>
            <div class="col-4"></div>              
        </div>
<%--第二區:資訊室窗口、預計完成日--%>
         <div class="row" style="margin-top: 20px; font-size:20px;">
             <div class="col-8">
                 <asp:Label ID="Label2" runat="server" Text="資訊室窗口 : "></asp:Label>
                 <asp:DropDownList ID="DropDownList1" runat="server" Width="127px">
                      <asp:ListItem>許智鈞</asp:ListItem>
                      <asp:ListItem>林暐佳</asp:ListItem>
                      <asp:ListItem>李卉軒</asp:ListItem>
                      <asp:ListItem>張雅淳</asp:ListItem>
                      <asp:ListItem>林鈺如</asp:ListItem>
                      <asp:ListItem>裴麗娟</asp:ListItem>
                 </asp:DropDownList>
            <asp:Label ID="Label3" runat="server" Text="預計完成日期 : "></asp:Label>
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="選擇日期" Font-Bold="False" Font-Italic="False" Font-Size="Small" OnClick="Button1_Click" />
             </div>
        <div class="col-4">           
        </div>
        </div>
<%--第三區:calender--%>
        <div class="row">
            <div class="col-12" style="padding-left:300px;">
                <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
            </div>
        </div>
<%--第四區:資訊窗口說明--%>
        <div class="row">
            <div class="col-12" style="margin-top: 20px; font-size: 20px;">
                <asp:Label ID="Label5" runat="server" Text="資訊窗口說明 : "></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" Width="462px"></asp:TextBox>
            </div>
        </div>
<%--第四.五區:需求單狀態--%>
        <div class="row">
            <div class="col-12" style="margin-top: 20px; font-size: 20px;">
                <asp:Label ID="Label7" runat="server" Text="需求單狀態 : "></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server">
                      <asp:ListItem>新增</asp:ListItem>
                      <asp:ListItem>進行中</asp:ListItem>
                      <asp:ListItem>完成</asp:ListItem>
                      <asp:ListItem>結案</asp:ListItem>
                      <asp:ListItem>退件</asp:ListItem>
                 </asp:DropDownList>

            </div>
        </div>
<%--第五區:是否完成--%>
            <div class="row">
                <div class="col-12" style="margin-top: 20px; font-size: 20px;">
                    <asp:Label ID="Label6" runat="server" Text="是否完成 : "></asp:Label>
                </div>              
            </div>
<%--第六區:Button--%>
            <div class="row">
                <div class="col" style="font-size: 20px; margin-bottom: 20px;">
                    <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <div class="col"></div>  
                <div class="col" style="font-size: 20px; margin-bottom: 20px;">
                    <asp:Button ID="Button2" runat="server" Text="確認" CssClass="btn btn-info" OnClick="Button2_Click" />
                    <asp:Button ID="Button4" runat="server" Text="取消" CssClass="btn btn-info" OnClick="Button4_Click" />
                </div>
            </div>
         </div>  <%--container--%>
    </div>  <%--box--%>
</div>  <%--ousbox--%> 
    </form>
</body>
</html>
