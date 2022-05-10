<%@ Page Title="FCMIS:Farmers" EnableEventValidation="false" Language="C#" EnableViewState="true" ViewStateMode="Enabled" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Members.aspx.cs" Inherits="BenefImport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageTitle" runat="Server">
    Extension Members  Information 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentDescription" runat="Server">
    Please Arrage Column Name in Excel sheet in the following order:
    <strong>{Name}</strong>,<strong>{FName}</strong>,<strong>{Gender:Male,Female}</strong>,<strong>{Village}</strong>,<strong>{Mob}</strong>,<strong>{Remarks}</strong>,<strong>{Position}</strong>
    <br />
    Position Codes:
    Representative:{1},
    Deputy Representative:{2},
    Cashier:{3},
    Farmer:{4}<br />
    <strong>Note: Excel file should be XLX  workbook format</strong>. The above order is important , Sheet Name must be <strong>Sheet1</strong>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="contentBody" runat="Server">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/forms/selects/selectize.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/forms/selects/selectize.default.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/forms/selectize/selectize.min.css">
   
    <script type="text/javascript">


        $(function () {
            SetDatePicker();
        });


        //var prm = Sys.WebForms.PageRequestManager.getInstance();
        //if (prm != null) {
        //    prm.pageLoaded(function (sender, e) {
        //        if (sender._postBackSettings.panelsToUpdate != null) {
        //            SetDatePicker();
        //       }
        //    });
        //};

        function SetDatePicker() {
            $('select.form-control').select2({ containerCssClass: "select-xs" });     
            $('#<%=ddlVillage.ClientID%>').selectize({
                create: true,
                dropdownParent: "body",
                persist: false,
                sortField: {
                    field: 'text',
                    direction: 'asc'
                }
            });

            $('#<%=ddlVillage.ClientID%>').change(function () {
                if ($(this).val() != "-1") {
                    $('#<%=hdnVillage.ClientID%>').val($(this).val());
                }
            });
        }
    </script>

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-12 center text-md-center">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <hr />
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title" id="horz-layout-card-center">Benefeciaries Import Box</h4>
                    <a class="heading-elements-toggle"><i class="icon-ellipsis font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="icon-minus4"></i></a></li>
                            <li><a data-action="reload"><i class="icon-reload"></i></a></li>
                            <li><a data-action="expand"><i class="icon-expand2"></i></a></li>
                            <li><a data-action="close"><i class="icon-cross2"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-body collapse in">
                    <div class="card-block">
                        <div class="card-text">
                            <p>Attach <code>Excel File</code> document to the form to import mentioned benefeciaries. This form accept benefciaries <code>Province </code>and <code>District </code>,but this should be noted that the entire benefeciaries list should be of same <code>District</code> .</p>
                        </div>
                        <div class="form form-horizontal form-bordered">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                                <ContentTemplate>
                                    <script type="text/javascript">
                                        Sys.Application.add_load(SetDatePicker);
                                    </script>
                                    <div class="form-body">
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlYear">Year</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="2013">2013</asp:ListItem>
                                                    <asp:ListItem Value="2014">2014</asp:ListItem>
                                                    <asp:ListItem Value="2015">2015</asp:ListItem>
                                                    <asp:ListItem Value="2016">2016</asp:ListItem>
                                                    <asp:ListItem Value="2017">2017</asp:ListItem>
                                                    <asp:ListItem Value="2018">2018</asp:ListItem>
                                                    <asp:ListItem Value="2019">2019</asp:ListItem>
                                                    <asp:ListItem Value="2020">2020</asp:ListItem>

                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator5" ValueToCompare="-1" Operator="NotEqual" ControlToValidate="ddlYear" runat="server" ErrorMessage=""></asp:CompareValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlProvince">Province</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control province" AutoPostBack="true" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator3" ValueToCompare="-1" Operator="NotEqual" ControlToValidate="ddlProvince" runat="server" ErrorMessage=""></asp:CompareValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlDistrict">District</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlDistrict" AutoPostBack="True" CssClass="form-control district" runat="server" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlDistrict" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlVFU">VFU</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlVFU" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlVFU" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlVillage">Group Name</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlVillage"  runat="server">
                                                </asp:DropDownList>
                                                 <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlVillage" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="FileUpload1">Excel File</label>
                                            <div class="col-md-9">
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="form-actions center">

                                        <asp:LinkButton ID="btnSave" class="btn btn-success mr-1" OnClick="btnSave_Click" runat="server"><i class="icon-push"></i> Import </asp:LinkButton>
                                    </div>


                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlProvince" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlYear" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlVFU" EventName="SelectedIndexChanged" />
                                    <asp:PostBackTrigger ControlID="btnSave" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../app-assets/vendors/js/forms/select/selectize.min.js" type="text/javascript"></script>
    <asp:hiddenfield ID="hdnVillage" runat="server"></asp:hiddenfield>
</asp:Content>

