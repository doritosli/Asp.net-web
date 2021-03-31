using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;
using System.Configuration;


namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        //string cs = ConfigurationManager.ConnectionStrings["TESTConnectionString_KS"].ConnectionString;
        string cs = ConfigurationManager.ConnectionStrings["TESTConnectionString_home"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GVbind();
            }

        }
        protected void GVbind()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT number,applydate,no," +
                   "department,project,system,item,software,path,reason,descript,username,finishdate,service,complete,closed," +
                   "status FROM TEST.dbo.HYData", con);

                //SqlCommand cmd = new SqlCommand("SELECT number,applydate,REPLICATE('0',3-LEN(num)) + RTRIM(CAST(num AS CHAR)) as num," +
                //    "CONVERT(varchar(100), applydate, 112)+REPLICATE('0',3-LEN(num)) + RTRIM(CAST(num AS CHAR)) as no," +
                //    "department,project,system,item,software,path,reason,descript,username,finishdate,service,complete,closed," +
                //    "status FROM TEST.dbo.HYData", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    GridView1.DataSource = dr;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GVbind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int number = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());  //筆數
            //DateTime applydate = DateTime.Parse(((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text); //申請日期
            //String.Format("{0:yyyy/MM/dd}", applydate);
            string applydatee = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            //string num = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text; //流水號
            string no = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text; //需求單號
            string department = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text; //提出部門
            string system = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text; //系統名稱
            string item = ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text; //需求項目
            string software = ((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text; //程式名稱
            string path = ((TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text; //路徑
            string reason = ((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Text; //需求原因
            string descript = ((TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0]).Text; //內容說明
            string username = ((TextBox)GridView1.Rows[e.RowIndex].Cells[10].Controls[0]).Text; //申請人
            string service = ((TextBox)GridView1.Rows[e.RowIndex].Cells[11].Controls[0]).Text; //資訊室窗口
            string status = ((TextBox)GridView1.Rows[e.RowIndex].Cells[12].Controls[0]).Text; //需求單狀態

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update HYData set applydate = '" + applydatee + "'," +
                    "no = '" + no + "', " +
                    "department = '" + department + "', system = '" + system + "', " +
                    "item = '" + item + "', software = '" + software + "', " +
                    "path = '" + path + "', reason = '" + reason + "', " +
                    "descript = '" + descript + "', username = '" + username + "', " +
                    "service = '" + service + "', status = '" + status + "' where number = '" + number + "'", con);
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('資料已更新!')</script>");
                    GridView1.EditIndex = -1;
                    GVbind();
                }
                
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GVbind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int number = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from HYData where number = '" + number + "'", con);
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('資料已刪除!')</script>");
                    GridView1.EditIndex = -1;
                    GVbind();
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //選取欲改的行
            GridViewRow gr = GridView1.SelectedRow;
            Response.Redirect("IT_department.aspx?noo=" + gr.Cells[2].Text);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}