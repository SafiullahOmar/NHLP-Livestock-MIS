<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="ActivityInfo.aspx.cs" Inherits="Activities_ActivityInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPageTitle" runat="Server">
    Animal Production
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentDescription" runat="Server">
    Fill form information of concern activity .In below form both contributional and non-contribution activity are populated , Incase of farmer contribution you have to enter the relavent contribution informaiton for the selected activity.Benefeciaries list are manipulated incase of need.
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="Server">
    <script src="../Script/Activities.js"></script>

    <div class="row">
        <div class="col-md-12">
            <div class="card">

                <div class="card-body collapse in">
                    <div class="card-block">

                        <div id="Form1" class="form form-horizontal form-bordered">
                            <div class="form-body">
                                <h4 class="form-section"><i class="icon-head"></i>Activity Info</h4>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlYear">Year </label>
                                    <div class="col-md-9">
                                        <select id="ddlYear" class=" form-control">
                                            <option value="-1">--Select--</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlProvince">Province</label>
                                    <div class="col-md-9">
                                        <asp:DropDownList ID="ddlProvince" class="select2 form-control province" runat="server"></asp:DropDownList>
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
                                    <label class="col-md-3 label-control" for="ddlSActivity">Activity</label>
                                    <div class="col-md-9">
                                        <select id="ddlSActivity" class=" form-control"></select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlIP">Implementation Partner</label>
                                    <div class="col-md-9">
                                        <select id="ddlIP" class=" form-control"></select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlVillage">Village</label>
                                    <div class="col-md-9">
                                        <select id="ddlVillage" class=" form-control">
                                        </select>
                                    </div>
                                </div>

                                <h4 class="form-section green"><i class=" icon-save"></i>Saved Benefeciary Basic Information</h4>
                                <div class="form-group row">
                                    <div id="dvBen_Act_Detail" class="col-md-11 text-md-center offset-md-1 ">
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions text-md-center">
                                <button type="button" id="btnCancel" class="btn btn-warning mr-1">
                                    <i class="icon-cross2"></i>Cancel
	                           
                                </button>
                                <button type="submit" class="btn btn-primary  ">
                                    <i class="icon-check2"></i>Save	                           
                                </button>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

