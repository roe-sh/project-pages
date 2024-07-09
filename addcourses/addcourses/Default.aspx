<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="addcourses.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="sb-admin-2.min.css" rel="stylesheet" />
    <link rel="icon" href="C:\Users\Orange\source\repos\addcourses\addcourses\imgs\spark.png" type="image/x-icon" />

    <style>
        body {
            background-color: #f7f9fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        .container {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 30px;
        }

        h2 {
            color: #00796b;
            font-weight: 700;
        }

        .form-control,
        .btn {
            border-radius: 30px;
        }

            .form-control::placeholder {
                color: #999;
            }

        .table {
            margin-top: 20px;
        }

            .table th {
                background-color: #00796b;
                color: #fff;
                border: none;
            }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 121, 107, 0.1);
        }

        .table-hover tbody tr:hover {
            background-color: rgba(0, 121, 107, 0.15);
        }

        .btn-primary {
            background-color: #00796b;
            border-color: #00796b;
        }

            .btn-primary:hover {
                background-color: #004d40;
                border-color: #004d40;
            }

        .btn-primary {
            --bs-btn-bg: #00B3AB;
            --bs-btn-border-color: #00B3AB;
            --bs-btn-hover-border-color: #00B3AB;
        }

        .btn-custom:focus {
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
            outline: none;
        }




        .text-primary {
            --bs-text-opacity: 1;
            color: #d85427 !important;
        }


        footer {
            padding: 20px 0;
            text-align: center;
            background-color: #01696b;
            border-top: 1px solid #dee2e6;
            margin-top: 30px;
            color: white;
        }
    </style>


    <title>Add student</title>
</head>

<body id="page-top">
    <form id="form1" runat="server">
        <!-- Navbar start -->
                               <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="background-color: #01696b !important;">
    <div class="container" style="
    background-color: #01686a;">
        <a class="navbar-brand" href="C:\Users\Orange\Desktop\Survey Project\Survey Project\home.aspx" >
            <img src="home_image\logo.png" style="width: 80px; height:40px"/>
        </a>

        <div class="collapse navbar-collapse" id="navbarNav" style="justify-content: flex-end;">
            <ul class="navbar-nav ms-auto" id="NavLinks" runat="server">
                <li class="nav-item">
                    <asp:HyperLink runat="server" NavigateUrl="~/home.aspx" CssClass="nav-link">Home</asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink runat="server" NavigateUrl="~/aboutus.aspx" CssClass="nav-link">About us</asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink runat="server" NavigateUrl="~/contactus.aspx" CssClass="nav-link">Contact us</asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="Dashboard" runat="server" NavigateUrl="~/dashboard.aspx" CssClass="nav-link" Style="display: none;">Dashboard</asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="Courses" runat="server" NavigateUrl="~/studentsCourses.aspx" CssClass="nav-link" Style="display: none;">Courses</asp:HyperLink>
                </li>
            </ul>

            <asp:Button ID="Login" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="Login_Click"/>

            <asp:Button ID="Logout" runat="server" Text="Log Out" CssClass="btn btn-secondary" Style="display: none;" OnClick="Logout_Click" />
        </div>
    </div>
</nav>
        <!-- Navbar End -->


        <div id="wrapper">

            <!-- start of sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #234652; background-image: linear-gradient(180deg, #234652 40%,#00B3AB 100%);">

                <asp:LinkButton ID="homepageLinkBtn" runat="server" class="sidebar-brand d-flex align-items-center justify-content-center">
                    <div class="sidebar-brand-icon" style="width:6em">
                        <img src="#" width="100%" />
                    </div>
                </asp:LinkButton>

                <hr class="sidebar-divider my-0" />

                <li class="nav-item active">
                    <asp:LinkButton ID="dashboardLinkBtn" runat="server" PostBackUrl='#' class="nav-link">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </asp:LinkButton>
                </li>

                <hr class="sidebar-divider" />

                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fa-solid fa-book"></i>
                        <span>Courses</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Courses:</h6>
                            <asp:LinkButton ID="newCoursesLinkBtn" runat="server" class="collapse-item">Add new course</asp:LinkButton>
                            <asp:LinkButton ID="showCoursesLinkBtn" runat="server" class="collapse-item">Show current courses</asp:LinkButton>
                        </div>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fa-solid fa-square-poll-vertical"></i>
                        <span>Surveys</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Surveys:</h6>
                            <asp:LinkButton ID="newSurveyLinkBtn" runat="server" class="collapse-item">Add new survey</asp:LinkButton>
                            <asp:LinkButton ID="showSurveyLinkBtn" runat="server" class="collapse-item">Show current surveys</asp:LinkButton>
                            <asp:LinkButton ID="coursesResultsLinkBtn" runat="server" class="collapse-item">Courses results</asp:LinkButton>
                        </div>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseST" aria-expanded="true" aria-controls="collapseST">
                        <i class="fa-solid fa-users"></i>
                        <span>Students</span>
                    </a>
                    <div id="collapseST" class="collapse" aria-labelledby="headingST" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Students:</h6>
                            <asp:LinkButton ID="addStudentLinkBtn" runat="server" class="collapse-item">Add new students</asp:LinkButton>
                            <asp:LinkButton ID="studentsListLinkBtn" runat="server" class="collapse-item">Students list</asp:LinkButton>
                        </div>
                    </div>
                </li>
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">



                    <div class="container-fluid">

                        <%--add page content here--%>

                        <div class="container mt-5">
                            <div class="p-4 add-course-section">
                                <h2 class="mb-4 text-center">Add Programming Course</h2>

                                <div class="form-group p-3 mb-3">
                                    <h3>Select course</h3>
                                    <asp:Label ID="lblSelectCourse" runat="server" Text="Select Course:"></asp:Label>
                                    <asp:CheckBoxList ID="CheckBoxList" runat="server" CssClass="custom-control-input-list" RepeatDirection="Vertical">
                                        <asp:ListItem Text="C# Programming" Value="C# Programming"></asp:ListItem>
                                        <asp:ListItem Text="PHP Programming" Value="PHP Programming"></asp:ListItem>
                                        <asp:ListItem Text="Node js Programming" Value="Node js Programming"></asp:ListItem>
                                        <asp:ListItem Text="front-end development" Value="front-end development"></asp:ListItem>
                                    </asp:CheckBoxList>
                                </div>
                                <h3>Course Start Date</h3>
                                <div class="form-group p-3 mb-3">
                                    <asp:Label ID="lblStartDate" runat="server" Text="C#" AssociatedControlID="TextBox1"></asp:Label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control course-date-input" TextMode="Date" /><br />
                                    <asp:Label ID="Label1" runat="server" Text="PHP" AssociatedControlID="TextBox1"></asp:Label>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control course-date-input" TextMode="Date" /><br />
                                    <asp:Label ID="Label2" runat="server" Text="Node js" AssociatedControlID="TextBox1"></asp:Label>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control course-date-input" TextMode="Date" /><br />
                                    <asp:Label ID="Label3" runat="server" Text="font-end development" AssociatedControlID="TextBox1"></asp:Label>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control course-date-input" TextMode="Date" />
                                </div>
                                <h3>Course End Date</h3>
                                <div class="form-group p-3 mb-3">
                                    <asp:Label ID="Label4" runat="server" Text="C# end date" AssociatedControlID="TextBox1"></asp:Label>
                                    <asp:TextBox ID="EndTextBox1" runat="server" CssClass="form-control course-date-input" TextMode="Date" /><br />
                                    <asp:Label ID="Label5" runat="server" Text="PHP end date" AssociatedControlID="TextBox1"></asp:Label>
                                    <asp:TextBox ID="EndTextBox2" runat="server" CssClass="form-control course-date-input" TextMode="Date" /><br />
                                    <asp:Label ID="Label6" runat="server" Text="Node js end date" AssociatedControlID="TextBox1"></asp:Label>
                                    <asp:TextBox ID="EndTextBox3" runat="server" CssClass="form-control course-date-input" TextMode="Date" /><br />
                                    <asp:Label ID="Label7" runat="server" Text="front-end development end date" AssociatedControlID="TextBox1"></asp:Label>
                                    <asp:TextBox ID="EndTextBox4" runat="server" CssClass="form-control course-date-input" TextMode="Date" />
                                </div>

                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-submit btn-block" OnClick="btnSubmit_Click" OnClientClick="showAlert();" />
                            </div>
                        </div>
                        <script>
                            function showAlert() {
                                alert('Courses have been successfully added!');
                            }
                        </script>


                        <%--end of page content--%>
                    </div>

                    <footer class="elementor-element">
                        <p style="font-weight: bold;">&copy; 2024 Logo. All rights reserved.</p>
                        <br>
                        <p style="float: inherit;"><a>Privacy Policy</a> &nbsp; | &nbsp; <a>Terms & Conditions</a></p>
                    </footer>

                </div>
            </div>
            <!-- End of Content Wrapper -->
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="jquery.min.js"></script>
        <script src="bootstrap.bundle.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    </form>
</body>
</html>
