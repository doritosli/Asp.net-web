using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;
using System.Configuration;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        //FOR HOME
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TESTConnectionString_home"].ConnectionString);
        //FOR KS
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TESTConnectionString_KS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();

            Label4.Visible = false;
            Label7.Visible = false;

        }

        protected void Button1_Click(object sender, EventArgs e) //新增按鈕
        {
            string checkboxselect = "";
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    checkboxselect = CheckBoxList1.Items[i].Text;
                }
            }
            string checkboxselect2 = "";
            for (int i = 0; i < CheckBoxList2.Items.Count; i++)
            {
                if (CheckBoxList2.Items[i].Selected)
                {
                    checkboxselect2 = CheckBoxList2.Items[i].Text;
                }
            }

            //流水號
            string a = TextBox2.Text.ToString();
            string CommandText = "SELECT COUNT(*) FROM [TEST].[dbo].[HYData] where applydate = '" + a + "'";
            SqlCommand command = new SqlCommand(CommandText, con);
            Int32 count = (Int32)command.ExecuteScalar();
            string no = a.Replace("/", "") + string.Format("{0:000}", count + 1);


            SqlCommand cmd = new SqlCommand("insert into HYData values('" + TextBox2.Text + "'" +
                   ",'" + no + "','" + TextBox1.Text + "'" +
                   ",'" + null + "','" + checkboxselect + "','" + checkboxselect2 + "'" +
                   ",'" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "'" +
                   ",'" + TextBox6.Text + "','" + TextBox7.Text + "','" + null + "'" +
                   ",'" + null + "','" + null + "','" + null + "'" +
                   ",'" + null + "','" + null + "','" + null + "')", con);
                cmd.ExecuteNonQuery();

                //TextBox1.Text = "";
                //TextBox2.Text = "";
                //TextBox3.Text = "";
                //TextBox4.Text = "";
                //TextBox5.Text = "";
                //TextBox6.Text = "";
                //TextBox7.Text = "";
                //TextBox8.Text = "";
                 
            Response.Redirect("WebForm2.aspx");
            


        }
        protected void Button2_Click(object sender, EventArgs e) //在首頁查詢
        {
            if (TextBox1.Text != "")
            {
                SqlCommand cmd2 = new SqlCommand("select username,convert(char,applydate,111)," +
                    "software,path,reason,descript from HYData where department = @department " +
                    "and username = @username", con);
                cmd2.Parameters.AddWithValue("@username", TextBox7.Text);
                cmd2.Parameters.AddWithValue("@department", TextBox1.Text);
                cmd2.Parameters.AddWithValue("@applydate", TextBox2.Text);
                cmd2.Parameters.AddWithValue("@software", TextBox3.Text);
                cmd2.Parameters.AddWithValue("@path", TextBox4.Text);
                cmd2.Parameters.AddWithValue("@reason", TextBox5.Text);
                cmd2.Parameters.AddWithValue("@descript", TextBox6.Text);
                SqlDataReader da = cmd2.ExecuteReader();
                while (da.Read())
                {
                    TextBox7.Text = da.GetValue(0).ToString();
                    TextBox2.Text = da.GetValue(1).ToString();
                    TextBox3.Text = da.GetValue(2).ToString();
                    TextBox4.Text = da.GetValue(3).ToString();
                    TextBox5.Text = da.GetValue(4).ToString();
                    TextBox6.Text = da.GetValue(5).ToString();
                    Button1.Visible = false;
                }
                con.Close();

                Label4.Visible = true;
                Label7.Visible = true;
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string checkboxselect = "";
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                checkboxselect = CheckBoxList1.Items[i].Text;
            }

            string checkboxselect2 = "";
            for (int j = 0; j < CheckBoxList2.Items.Count; j++)
            {
                checkboxselect2 = CheckBoxList2.Items[j].Text;
            }

            SqlCommand update = new SqlCommand("update HYData set[department] = '" + TextBox1.Text + "'," +
               "[username] = '" + TextBox7.Text + "'," + "[applydate] = '" + TextBox2.Text + "'," +
               "[system] = '" + checkboxselect + "'," + "[item] = '" + checkboxselect2 + "'," +
               "[software] = '" + TextBox3.Text + "'," + "[path] = '" + TextBox4.Text + "'," +
               "[reason] = '" + TextBox5.Text + "'," + "[descript] = '" + TextBox6.Text + "' where department = @department ", con);
            update.Parameters.AddWithValue("@department", TextBox1.Text);
            update.ExecuteNonQuery();
            con.Close();
            Button1.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e) //查看全部資料
        {
            Response.Redirect("WebForm2.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            SqlCommand del = new SqlCommand("TRUNCATE TABLE HYData",con);
            del.ExecuteNonQuery();
            con.Close();
        }
    }
}