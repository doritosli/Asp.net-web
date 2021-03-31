using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;

namespace WebApplication1
{
    public partial class IT_department : System.Web.UI.Page
    {
        //FOR HOME
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TESTConnectionString_home"].ConnectionString);
        //FOR KS
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TESTConnectionString_KS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {           
            con.Open();
            Calendar2.Visible = false;
            //TextBox1.Text = Request.QueryString["noo"].ToString(); //帶出需求單號
            Label9.Text = Request.QueryString["noo"].ToString(); //帶出需求單號
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar2.Visible = true;
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            Label4.Text = Calendar2.SelectedDate.Date.Year.ToString();
            Label4.Text += "/" + Calendar2.SelectedDate.Date.Month.ToString();
            Label4.Text += "/" + Calendar2.SelectedDate.Date.Day.ToString();
            Calendar2.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string project;
            if (CheckBox1.Checked)
            {
                project = "Y";
            }
            else
            {
                project = "N";
            }
            string checkboxselect2 = "";
            for (int i = 0; i < CheckBoxList2.Items.Count; i++)
            {
                if (CheckBoxList2.Items[i].Selected)
                {
                    checkboxselect2 = CheckBoxList2.Items[i].Text;
                }
            }


            SqlCommand cmd = new SqlCommand("update HYData set [it_des] = '" + TextBox2.Text + "'," +
                " [estimate] = '" + Label4.Text + "',  [complete] = '" + checkboxselect2 + "'," +
                " [project] = '" + project + "', [service] = @service , " +
                "[status] = @status where [no] = '" + Request.QueryString["noo"].ToString() + "'",con);
            cmd.Parameters.AddWithValue("@service",DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@status", DropDownList2.SelectedItem.Value);
            cmd.ExecuteNonQuery();
            con.Close();
            
            Response.Redirect("WebForm2.aspx");


        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm2.aspx");
        }       
    }
}