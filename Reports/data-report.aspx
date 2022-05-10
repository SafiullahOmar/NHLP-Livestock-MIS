<%@ Page Title="INV_MIS:System Reports" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="data-report.aspx.cs" Inherits="Reports_data_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="Server">
   <%-- <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/forms/listbox/bootstrap-duallistbox.min.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/forms/dual-listbox.min.css">--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageTitle" runat="Server">
    SYSTEM DATA REPORTS
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentDescription" runat="Server">
    Select Your Required Field (Report Type,Report Year repectively) and then click on Generate Button.Your Report will be generated in Excel sheet.
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentBody" runat="Server">

    <script type="text/javascript">
        $(function () {
            //var $select = $('.duallistbox').select2();
            ////console.log($select);
            //$select.each(function (i, item) {
            //    //console.log(item);
            //    $(item).select2("destroy");
            //});
            //$(".duallistbox").data('select2').destroy();
            $(".duallistbox").bootstrapDualListbox();
            $('#btnGenerate').click(function () {
                $('#btnGenerate').prop("href", "Downoald.aspx?data-report=" + $('.duallistbox').val() + "&y=" + $('#ddlYear').val() + "&tp=" + $('#ddlReportType').val() + "");
                $('#btnGenerate').trigger('click');
            });

        });
    </script>
    <section class="basic-dual-listbox">
        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Data Reports</h4>
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
                            <div class="form form-horizontal">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="label-control" for="ddlReportType">Report Type</label>
                                                <select id="ddlReportType" class="form-control">
                                                    <option value="-1">--Select--</option>
                                                    <option value="1">Animal Production Beneficiaries Report</option>
                                                    <option value="2">Male VFUs Detail Report</option>
                                                    <option value="3">Female VFUs Detail Report</option>
                                                </select>
                                            </div>
                                        </div>
                                     
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="label-control" for="ddlYear">Report Year</label>
                                                <select id="ddlYear" class="form-control">
                                                    <option value="-1">--Select--</option>
                                                    <option value="2018">2018</option>
                                                    <option value="2017">2017</option>
                                                    <option value="2016">2016</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <select multiple="multiple" size="10" class="duallistbox">
                                                <option value="1">Kabul Province</option>
                                                <option value="3">Parwan</option>
                                                <option value="7">Paktia</option>
                                                <option value="8">Nangarhar</option>
                                                <option value="11">Badakhshan</option>
                                                <option value="13">Baghlan</option>
                                                <option value="14">Kunduz</option>
                                                <option value="16">Balkh</option>
                                                <option value="17">Jawzjan</option>
                                                <option value="20">Hirat</option>
                                                <option value="21">Farah</option>
                                                <option value="22">Nimroz</option>
                                                <option value="23">Hilmand</option>
                                                <option value="24">Kandahar</option>
                                                <option value="27">Ghor</option>
                                                <option value="28">Bamyan</option>
                                                <option value="29">Paktika</option>
                                                <option value="30">Nuristan</option>
                                                <option value="32">Khost</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="form-actions center">
                                <a id="btnGenerate" class="btn btn-primary  white">
                                    <i class=" icon-paper"></i>&nbsp Generate	                           
                                </a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    

</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="scripts" runat="Server">
 <%--   <script src="../app-assets/vendors/js/forms/listbox/jquery.bootstrap-duallistbox.min.js" type="text/javascript"></script>--%>
</asp:Content>
