<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="IPManagement.aspx.cs" Inherits="Setup_IPManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPageTitle" runat="Server">
    Executing Body / Implementation Partner
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentDescription" runat="Server">
    Select or check Implementation Partner for the selected activities in the required provinces.
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="Server">
    <script src="../Script/IPmanagement.js"></script>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                
                <div class="card-body collapse in">
                    <div class="card-block">
                       
                        <div id="Form1" class="form form-horizontal form-bordered" >
                            <div class="form-body">
                                <h4 class="form-section"><i class=" icon-info"></i>Info</h4>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlIP">EB/IP</label>
                                    <div class="col-md-9">
                                        <select id="ddlIP" class="select2 form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlYear">Year</label>
                                    <div class="col-md-9">
                                        <select id="ddlYear" class="form-control">
                                            <option value="-1">--Select--</option>
                                             <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlActivity">Activity</label>
                                    <div class="col-md-9">
                                        <select id="ddlActivity"  multiple="multiple"      class="form-control">
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div id="dvTblProvince"  class="col-md-6 text-md-center offset-md-3 ">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--!<--MOdals-->--%>
    <div class="modal fade text-xs-left" id="mdIPInsertion" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel4">Add New IP/EB Details</h4>
                </div>
                <div class="modal-body">
                    <div class="form-body">
                        <div class="form-group row">
                            <label class="col-md-3 label-control" for="txtIPName">EB/IP Name</label>
                            <div class="col-md-9">
                                <input type="text" id="txtIPName" class="form-control" placeholder="IP Name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 label-control" for="txtRemarks">Remarks</label>
                            <div class="col-md-9">

                                <textarea id="txtRemarks" class="form-control" placeholder="Remarks"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnClose" class="btn grey btn-outline-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="btnSaveIP" class="btn btn-outline-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

