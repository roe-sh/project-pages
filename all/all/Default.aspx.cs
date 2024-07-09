using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace all
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string filePath = Server.MapPath("courses.txt");
                string[] lines = File.ReadAllLines(filePath);


                HtmlGenericControl rowDiv = new HtmlGenericControl("div");
                rowDiv.Attributes["class"] = "row";

                foreach (string line in lines)
                {
                    string[] data = line.Split(',');
                    if (data.Length == 3)
                    {
                        string courseTitle = data[0].Trim();
                        string startDate = data[1].Trim();
                        string endDate = data[2].Trim();

                        HtmlGenericControl columnDiv = new HtmlGenericControl("div");
                        columnDiv.Attributes["class"] = "col-xl-3 col-md-6 mb-4";

                        HtmlGenericControl cardDiv = new HtmlGenericControl("div");
                        cardDiv.Attributes["class"] = "card border-left-info shadow h-100 py-2";
                        //cardDiv.Attributes["style"] = "width: 18rem;";
                        cardDiv.Attributes["style"] = "border-left: 0.25rem solid #fff1d0 !important";

                        HtmlGenericControl cardBodyDiv = new HtmlGenericControl("div");
                        cardBodyDiv.Attributes["class"] = "card-body";

                        HtmlGenericControl cardBodyCon = new HtmlGenericControl("div");
                        cardBodyCon.Attributes["class"] = "row no-gutters align-items-center";

                        // Card title
                        HtmlGenericControl cardTitleElement = new HtmlGenericControl("h5");
                        cardTitleElement.Attributes["class"] = "card-title font-weight-bold text-info mb-1";
                        cardTitleElement.InnerText = courseTitle;

                        // Card content
                        HtmlGenericControl startDateElement = new HtmlGenericControl("p");
                        startDateElement.Attributes["class"] = "card-text font-weight-normal text-info mb-1";
                        startDateElement.Attributes["style"] = "color: black !important";

                        startDateElement.InnerText = "Start Date: " + startDate;

                        HtmlGenericControl endDateElement = new HtmlGenericControl("p");
                        endDateElement.Attributes["class"] = "card-text font-weight-normal text-info mb-1";
                        endDateElement.InnerText = "End Date: " + endDate;
                        endDateElement.Attributes["style"] = "color: black !important";


                        cardBodyDiv.Controls.Add(cardTitleElement);
                        cardBodyDiv.Controls.Add(startDateElement);
                        cardBodyDiv.Controls.Add(endDateElement);

                        cardDiv.Controls.Add(cardBodyDiv);

                        columnDiv.Controls.Add(cardDiv);


                        rowDiv.Controls.Add(columnDiv);
                    }
                }

                if (!IsPostBack)
                {
                    string session = Server.MapPath("courses.txt");
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
                    cardContainer.Controls.Add(rowDiv);
                }
            }



        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            string filePath = "courses.txt";
            string[] delete = { };
            File.WriteAllLines(filePath, delete);

            Response.Redirect("~/home.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/login.aspx");
        }

    }
}
