<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>


<!DOCTYPE html>




<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="StyleSheet1.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>資訊系統需求維護申請單</title>
<link href="~/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="~/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="~/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="particle-canvas"></div>

<%--區段一:標題--%>   
    <form id="form1" runat="server">
        <div class="left-box">
        <div class="bgc">
        <div class="container">
         <div>
          <div class="row" style="margin-top: 20px;">
            <div class="col"></div>
            <div class="col"><asp:Label ID="Label1" runat="server" Text="資訊系統需求維護申請單" Style=" font-size:28px;"></asp:Label></div>                
            <div class="col"></div>
             <%-- <div class="cube"><div class="box-jump"></div></div>--%>
          </div>
         </div>
        </div>
<%--區段二:提出部門--%>
        <div class="container">
            <div class="row" style="margin-top: 70px; font-size: 20px;">
            <div class="col-6">
                <asp:Label ID="Label2" runat="server" Text="提出部門 : "></asp:Label> 
                <asp:TextBox ID="TextBox1" runat="server" Width="91px"></asp:TextBox>
            </div>
          <%--  <div class="col">
                <asp:Label ID="Label3" runat="server" Text="申請日期 : "></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" Width="160px" placeholder="西元年/月/日"></asp:TextBox>
                <asp:Label ID="Label15" runat="server" Text="第"></asp:Label>
                <asp:TextBox ID="TextBox8" runat="server" Width="53px"></asp:TextBox>
                <asp:Label ID="Label16" runat="server" Text="張"></asp:Label>
            </div>--%>
            <div class="col-6">
                <asp:Label ID="Label4" runat="server" Text="流水號 : "></asp:Label>
                <asp:Label ID="Label7" runat="server"></asp:Label>
            </div>
            </div>           
        </div>
<%--區段二:申請日期--%>
            <div class="container">
                 <div class="row" style="margin-top: 20px; font-size: 20px;">
                 <div class="col-12">
                <asp:Label ID="Label3" runat="server" Text="申請日期 : "></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" Width="160px" placeholder="西元年/月/日"></asp:TextBox>
                <asp:Label ID="Label15" runat="server" Text="第" Visible="False"></asp:Label>
                <asp:TextBox ID="TextBox8" runat="server" Width="53px" Visible="False"></asp:TextBox>
                <asp:Label ID="Label16" runat="server" Text="張" Visible="False"></asp:Label>
                </div>
                </div>
            </div>

<%--區段二:申請人員--%>
        <div class="container">
            <div class="row" style="margin-top: 20px; font-size: 20px;">
                <div class="col">
                <asp:Label ID="Label8" runat="server" Text="申請人員 : "></asp:Label>
                <asp:TextBox ID="TextBox7" runat="server" Width="91px"></asp:TextBox>
                </div>
                <div class="col"></div>
                <div class="col"></div>
            </div>
        </div>
<%--區段三:紅色字--%>      
        <div class="container">
            <div class="row" style="margin-top: 40px; font-size: 20px; color:red;">
                <div class="col-12">
                    <asp:Label ID="Label5" runat="server" Text="★新增或修正程式，需先給副總核定才能送交至資訊室!資料修改和異常排除不用"></asp:Label>
                </div>
                <div class="col-12">                
                    <asp:Label ID="Label6" runat="server" Text="★需求確認後。若再新增需求，請重寫申請單"></asp:Label>
                </div>
            </div>
        </div>
<%--區段四:Checkbox勾選區--%>   
        <div class="container">
            <div class="row" style="margin-top: 20px; font-size: 20px;">
                <div class="col-12">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>iTEC系統</asp:ListItem>
                        <asp:ListItem>SAP系統</asp:ListItem>
                        <asp:ListItem>磅秤系統</asp:ListItem>
                        <asp:ListItem>刷卡系統</asp:ListItem>
                        <asp:ListItem>官網</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:CheckBoxList>                                
                </div>
            </div>   
        </div>
<%--區段五:Checkbox需求--%>  
    <div class="container">  
        <div class="row" style="margin-top: 10px; font-size: 20px;">
            <div class="col-12">
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>新增未有程式</asp:ListItem>
                    <asp:ListItem>修正已有程式</asp:ListItem>
                    <asp:ListItem>修改資料-人為因素</asp:ListItem>
                    <asp:ListItem>修改資料-系統因素</asp:ListItem>
                    <asp:ListItem>異常排除</asp:ListItem>
                </asp:CheckBoxList>                
            </div>        
        </div>
    </div>      
<%--區段六:程式名稱、位置、描述--%>
        <div class="container"> 
            <div class="row" style="margin-top: 20px; font-size: 20px;">
                <div class="col-12" style="margin-top: 12px; font-size: 20px;">
                    <asp:Label ID="Label11" runat="server" Text="程式名稱 : "></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server" Width="173px"></asp:TextBox>
                </div>
                <div class="col-12" style="margin-top: 12px; font-size: 20px;">
                <asp:Label ID="Label12" runat="server" Text="程式路徑(位置) : "></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" Width="410px"></asp:TextBox>
                </div>
                <div class="col-12" style="margin-top: 12px; font-size: 20px;">
                <asp:Label ID="Label13" runat="server" Text="需求原因(簡述) : "></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server" Width="410px"></asp:TextBox>
                </div>
                <div class="col" style="margin-top: 12px; margin-bottom: 40px; font-size: 20px;">
                <asp:Label ID="Label14" runat="server" Text="內容說明(詳述) : ">
                <asp:TextBox ID="TextBox6" runat="server" Width="410px"></asp:TextBox></asp:Label>
                </div>
                <div class="col-md-auto">
                <asp:Button ID="Button1" CssClass="btn btn-outline-info" runat="server" Text="新增" OnClick="Button1_Click" />
                <asp:Button ID="Button2" CssClass="btn btn-outline-info" runat="server" Text="查詢" OnClick="Button2_Click" Visible="False" />
                <asp:Button ID="Button3" CssClass="btn btn-outline-info" runat="server" Text="存檔" OnClick="Button3_Click" Visible="False" />
                <asp:Button ID="Button4" CssClass="btn btn-outline-info" runat="server" Text="查詢介面" OnClick="Button4_Click" />
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Button" Visible="False" />
                </div>
            </div>            
        </div>
     <%--class="left-box"--%>
     </div>
    <%--class="bgc"--%>
    </div>
        
<div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TESTConnectionString_home %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [HYData]">
    </asp:SqlDataSource>
</div>
</form>

</body>
</html>
