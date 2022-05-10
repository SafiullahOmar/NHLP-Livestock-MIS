<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="MaleContractExtension.aspx.cs" Inherits="Setup_Benefeciary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPageTitle" runat="Server">
    Male Extension (VFU Worker) Conrtact Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentDescription" runat="Server">
    Fill VFU contract extension detail in below form .  You are also allowed to edit and delete relevant information of MALE VFU Worker.
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="Server">
    <script src="../Script/MaleContract.js"></script>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body collapse in">
                    <div class="card-block">
                        <div id="Form1" class="form form-horizontal form-bordered">
                            <div class="form-body">
                                <h4 class="form-section"><i class="icon-head"></i>Contract Extension Info</h4>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="txtStartDate">Contract Start Date</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control date" id="txtStartDate" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="txtEndDate">Contract End Date</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control date" id="txtEndDate" />
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-12">

                                        <h4 class="form-section"><i class="icon-location"></i>Location Info</h4>

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
                                        <h4 class="form-section green"><i class=" icon-save"></i>VFUs Basic Information</h4>
                                        <div class="form-group row">
                                            <div id="dvVFU_Act_Detail" class="col-md-11 text-md-center offset-md-1 ">
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

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnVfuId" />
</asp:Content>

