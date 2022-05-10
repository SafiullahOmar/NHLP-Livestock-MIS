<%@ Page Title="FCMIS:Farmers" EnableEventValidation="false" Language="C#" EnableViewState="true" ViewStateMode="Enabled" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Inputs.aspx.cs" Inherits="BenefImport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageTitle" runat="Server">
    Distributed Inputs Information to Livestock Members 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentDescription" runat="Server">
    Please select the required members list in modal popup.<strong> Be carefull while submitting your form for choosing correct package for the correct members list in the system.</strong> 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="contentBody" runat="Server">
    <script src="../Script/Inputs.js"></script>


    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title" id="horz-layout-card-center">Inputs Distribution Box</h4>
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
                            <p>Check <code>Checkboxes</code> of members based on the packages which was distributed.You can find the members list from choosing of  <code>Province </code>and <code>District </code> and <code>VFU </code> repectivley.</p>
                        </div>
                        <div class="form form-horizontal form-bordered">

                            <div class="form-body">
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlYear">Year</label>
                                    <div class="col-md-9">
                                        <select id="ddlYear" class="form-control">
                                            <option value="-1">--Select--</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                        </select>

                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlProvince">Province</label>
                                    <div class="col-md-9">
                                        <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control province">
                                        </asp:DropDownList>
                                        <asp:CompareValidator ID="CompareValidator3" ValueToCompare="-1" Operator="NotEqual" ControlToValidate="ddlProvince" runat="server" ErrorMessage=""></asp:CompareValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlDistrict">District</label>
                                    <div class="col-md-9">
                                        <select class="form-control " id="ddlDistrict"></select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlVFU">VFU</label>
                                    <div class="col-md-9">
                                        <select class="form-control" id="ddlVFU"></select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlVillage">VFU Village</label>
                                    <div class="col-md-9">
                                        <select class="form-control" id="ddlVillage"></select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlPkg">Packages</label>
                                    <div class="col-md-9">
                                        <select class="form-control" id="ddlPkg">
                                            <option value="-1">--Select--</option>
                                            <option value="1">Stable Improvement Package</option>
                                            <option value="2">Milking Hygiene Kit</option>
                                            <option value="3">Medicine Package</option>
                                            <option value="4">Feed Ingredients for molasses</option>
                                        </select>
                                    </div>
                                </div>



                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="modalMembers"></div>
</asp:Content>

