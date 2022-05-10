<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="FemaleExtension.aspx.cs" Inherits="Setup_Benefeciary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPageTitle" runat="Server">
    Female Extension VFU Worker Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentDescription" runat="Server">
     Fill Female VFU Personal and place information in below form . You are also allowed to edit and delete relevant information of Female VFU Worker.
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="Server">
    <script src="../Script/FemaleExt.js"></script>
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/forms/selects/selectize.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/forms/selects/selectize.default.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/forms/selectize/selectize.min.css">

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                
                <div class="card-body collapse in">
                    <div class="card-block">
                       
                        <div id="Form1" class="form form-horizontal form-bordered">
                            <div class="form-body">
                                <h4 class="form-section"><i class="icon-head"></i>Personal Info</h4>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-md-4 label-control" for="txtName">Name </label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="txtName" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4 label-control" for="txtFName">Father Name</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="txtFName" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4 label-control" for="txtContactNo">Contact Number</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="txtContactNo" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4 label-control" for="txtBank">Bank Account Number</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="txtBank" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-md-5 label-control" for="txtStartDate">Contract Start Date</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control date" id="txtStartDate" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-5 label-control" for="txtEndDate">Contract End Date</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control date" id="txtEndDate" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-5 label-control" for="ddlGender">Gender</label>
                                            <div class="col-md-7">
                                                <select id="ddlGender" class="form-control">
                                                    <option value="1">Male</option>
                                                    <option value="2">Female</option>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-12">

                                        <h4 class="form-section"><i class="icon-location"></i>Location Info</h4>
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlYear">Year</label>
                                            <div class="col-md-9">
                                                <select id="ddlYear" class="select2 form-control">
                                                    <option value="-1">--Select--</option>
                                                    <option value="2020">2020</option>
                                                    <option value="2019">2019</option>
                                                    <option value="2018">2018</option>
                                                    <option value="2017">2017</option>
                                                     <option value="2016">2016</option>
                                                    <option value="2015">2015</option>
                                                    <option value="2014">2014</option>
                                                    <option value="2013">2013</option>
                                                    
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlProvince">Province</label>
                                            <div class="col-md-9">
                                                <asp:dropdownlist id="ddlProvince" class="select2 form-control province" runat="server"></asp:dropdownlist>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlDistrict">District</label>
                                            <div class="col-md-9">
                                                <select id="ddlDistrict" class="select2 form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlMaleVFU">Responsible Male VFU</label>
                                            <div class="col-md-9">
                                                <select id="ddlMaleVFU" class="select2 form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlVillage">Village</label>
                                            <div class="col-md-9">
                                                <select id="ddlVillage" class="selectize-select">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>





                            </div>
                            <div class="form-actions text-md-center">
                                <button type="button" id="btnCancel" class="btn btn-warning mr-1">
                                    <i class="icon-cross2"></i>Cancel
	                           
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    <i class="icon-check2"></i>Save
	                           
                                </button>
                                <button type="button" id="btnUpdate" class="btn btn-info">
                                    <i class="icon-record2"></i>Update
	                           
                                </button>
                                <button type="button" id="btnDelete" class="btn btn-danger">
                                    <i class=" icon-delete"></i>Delete
	                           
                                </button>
                            </div>

                            <div class="form-body">
                                <h4 class="form-section blue"><i class=" icon-save"></i>Female Extension Workers Basic Information</h4>
                                <div class="form-group row">
                                    <div id="dvVfus" class="col-md-11 text-md-center offset-md-1 ">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../app-assets/vendors/js/forms/select/selectize.min.js" type="text/javascript"></script>
    <input type="hidden" id="hdnVfuId" />
</asp:Content>

