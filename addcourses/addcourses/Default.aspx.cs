using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

using System.Web.UI.WebControls;

namespace addcourses
{
    public partial class Default : System.Web.UI.Page
    {



        private string filePath = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string session = Server.MapPath("~/courses.txt");
                string[] userLogIn = File.ReadAllLines(session);

                foreach (string item in userLogIn)
                {
                    string[] user = item.Split(',');
                    string studentUserName = user[0];

                    if (studentUserName == "admin@admin.com")
                    {
                        Login.Style["display"] = "none";
                        Logout.Style["display"] = "inline-block";
                        Dashboard.Style["display"] = "inline-block";
                    }
                    else if (studentUserName == null)
                    {

                    }
                    else
                    {
                        Login.Style["display"] = "none";
                        Logout.Style["display"] = "inline-block";
                        Courses.Style["display"] = "inline-block";

                    }
                }




                filePath = Server.MapPath("Courses.txt");

                if (!IsPostBack)
                {

                    TextBox1.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    TextBox2.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    TextBox3.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    TextBox4.Text = DateTime.Today.ToString("yyyy-MM-dd");

                    EndTextBox1.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    EndTextBox2.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    EndTextBox3.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    EndTextBox4.Text = DateTime.Today.ToString("yyyy-MM-dd");
                }
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {

                File.WriteAllText(filePath, string.Empty);


                using (StreamWriter outputFile = new StreamWriter(filePath, true))
                {
                    try
                    {
                        for (int i = 0; i < CheckBoxList.Items.Count; i++)
                        {
                            if (CheckBoxList.Items[i].Selected)
                            {
                                string course = CheckBoxList.Items[i].Text;
                                string startDate = GetStartDateForCourse(i + 1);
                                string endDate = GetStartDateForCourse(i + 1);

                                outputFile.WriteLine($"{course},{startDate},{endDate}");
                            }
                        }

                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "showAlert();", true);
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"Error writing to file: {ex.Message}");
                    }
                }
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            string filePath = "";
            string[] delete = { };
            File.WriteAllLines(filePath, delete);

            Response.Redirect("~/home.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/login.aspx");
        }

        private string GetStartDateForCourse(int index)
        {
            switch (index)
            {
                case 1:
                    return TextBox1.Text;
                case 2:
                    return TextBox2.Text;
                case 3:
                    return TextBox3.Text;
                case 4:
                    return TextBox4.Text;
                default:
                    return DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

    }
}


