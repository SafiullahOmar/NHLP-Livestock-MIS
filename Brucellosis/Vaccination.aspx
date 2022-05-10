<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Vaccination.aspx.cs" Inherits="Setup_IPManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPageTitle" runat="Server">
    VFU Vaccination Activity Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentDescription" runat="Server">
    Vaccination information for goats,sheeps and cows are filled respectively .To fill the form you have to also select VFU from dropdown list if you wont find any related VFU in the list you are also have permission to save new VFU . Form data can be also manipulated in case of any need. 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="Server">
    <script src="../Script/Vaccination.js"></script>
    <div class="row">
        <div class="col-md-12">
            <div class="card">

                <div class="card-body collapse in">
                    <div class="card-block">

                        <div id="Form1" class="form form-horizontal form-bordered">
                            <div class="form-body">
                                <h4 class="form-section"><i class="icon-head"></i>Vaccination Info </h4>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlYear">Year</label>
                                    <div class="col-md-9">
                                        <select id="ddlYear" class="form-control">
                                            <option value="-1">--Select--</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
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
                                    <label class="col-md-3 label-control" for="ddlVFU">VFU</label>
                                    <div class="col-md-9">
                                        <select id="ddlVFU" class="select2 form-control">
                                        </select>
                                    </div>
                                </div>

                                <div id="dvDetails" class="bs-callout-info callout-border-left callout-bordered callout-round px-2 py-1">
                                    <div class="media">
                                        <div class="media-left media-middle bg-info callout-arrow-left position-relative px-2">
                                            <i class=" icon-address-book white font-medium-5"></i>
                                        </div>
                                        <div class="media-body p-1">
                                            <button type="button" id="btnSearch" class="btn btn-square btn-primary  "><i class=" icon-search4"></i></button>
                                            <strong>|New Vaccination Details!</strong>
                                            <div class="row">

                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="txtDate">
                                                            Date of Vaccine</label>
                                                        <input type="text" class="form-control" id="txtDate" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="txtVillage">*</label>
                                                        <input type="radio" name="LType" value="Village" id="Village" checked="checked" />
                                                        Village
                                                        <input type="radio" value="Kochi" name="LType" id="Kochi" />
                                                        Kochi 
                                                         <input type="text" class="form-control" placeholder="Village" id="txtVillage" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="txtOwner">
                                                            Name Of Owner</label>
                                                        <input type="text" class="form-control" placeholder="Owner Name" id="txtOwner" />
                                                    </div>
                                                </div>
                                                 <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="txtContactNumber">
                                                            Mobile Number</label>
                                                        <input type="text" class="form-control" placeholder="Contact Number" id="txtContactNumber" />
                                                    </div>
                                                </div>  
                                                <div class="col-md-1">
                                                    <div class="form-group">
                                                        <label for="txtSheep">
                                                            Sheep</label>
                                                        <input type="text" class="form-control" placeholder="Sheep" id="txtSheep" />
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <div class="form-group">
                                                        <label for="txtGoat">
                                                            Goat</label>
                                                        <input type="text" class="form-control" placeholder="Goat" id="txtGoat" />
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <div class="form-group">
                                                        <label for="txtCattle">
                                                            Cattle</label>
                                                        <input type="text" class="form-control" placeholder="Cattle" id="txtCattle" />
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <br />
                                                    

                                                </div>
                                                <div class="col-md-12 ">
                                                    <br />

                                                    <button id="btnAddItem" class="btn btn-defualt float-md-right">Add To List <i class="  icon-add_to_queue"></i></button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="bs-callout-info callout-square callout-bordered callout-transparent mt-1">
                                    <div class="media">
                                        <div class="media-left media-middle bg-info callout-arrow-left position-relative px-2">
                                            <i class=" icon-list white font-medium-5"></i>
                                        </div>
                                        <div class="media-body p-1">
                                            <strong>Vaccination Information</strong>
                                            <table id="tblV" class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Select</th>
                                                        <th>Serial</th>
                                                        <th>Date Of Vac</th>
                                                        <th>Village</th>
                                                        <th>Name Of Owner</th>
                                                        <th>Sheep</th>
                                                        <th>Goat</th>
                                                        <th>Cattle</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                            <button type="button" id="btnRemoveItem" class="btn btn-sm btn-danger "><i class="icon-trash-o"></i></button>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="form-actions text-md-center">
                                <button type="button" id="btnCancel" class="btn btn-warning mr-1">
                                    <i class="icon-cross2"></i>Cancel
	                           
                                </button>
                                <button type="button" id="btnSave" class="btn btn-primary">
                                    <i class="icon-check2"></i>Save
	                           
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="modald"></div>
     <div id="modalSearch"></div>
    <%--!<--MOdals-->--%>
    <%--<div class="modal fade text-xs-left" id="mdVFUInsertion" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel4">Add New VFU Details</h4>
                </div>
                <div class="modal-body">
                    <div class="form-body">
                        <div class="form-group row">
                            <label class="col-md-3 label-control" for="txtVFUName">VFU Name</label>
                            <div class="col-md-9">
                                <input type="text" id="txtVFUName" class="form-control" placeholder="VFU Name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 label-control" for="txtFName">VFU Father Name</label>
                            <div class="col-md-9">
                                <input type="text" id="txtFName" class="form-control" placeholder="VFU Father Name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 label-control" for="txtContactNumber">Remarks</label>
                            <div class="col-md-9">

                                <textarea id="txtContactNumber" class="form-control" placeholder="Mobile Number"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnClose" class="btn grey btn-outline-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="btnSaveVFU" class="btn btn-outline-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>

