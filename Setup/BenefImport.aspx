<%@ Page Title="FCMIS:Farmers" Language="C#" EnableViewState="true" ViewStateMode="Enabled" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="BenefImport.aspx.cs" Inherits="BenefImport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageTitle" runat="Server">
    Feeding Benefeciaries Information 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentDescription" runat="Server">
    Please Arrage Column Name in Excel sheet in the following order:
    <strong>{Name}</strong>,<strong>{FName}</strong>,<strong>{Gender:Male,Female}</strong>,<strong>{Village}</strong>,<strong>{Mob}</strong>
    <br />
    <strong>Note: Excel file should be XLX  workbook format</strong>. The above order is important , Sheet Name must be <strong>Sheet1</strong>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="contentBody" runat="Server">
        <script type="text/javascript">
        $(function () {
            $(".hideit").click(function () {
                //fades the notification out	
                $(this).fadeOut(900);
            });
        });
    </script>


    <div class="row">
        <div class="col-md-12 center text-md-center">
            <asp:Label ID="lblMsg"  runat="server" Text=""></asp:Label>
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
                                    <div class="form-body">
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlProvince">Province</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged1">
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator3" ValueToCompare="-1" Operator="NotEqual" ControlToValidate="ddlProvince" runat="server" ErrorMessage=""></asp:CompareValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlDistrict">District</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlDistrict" CssClass="form-control district" runat="server">
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlDistrict" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
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
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlProvince" EventName="SelectedIndexChanged" />
                                    <asp:PostBackTrigger ControlID="btnSave" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>

