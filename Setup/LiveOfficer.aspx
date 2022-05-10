<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="LiveOfficer.aspx.cs" Inherits="Setup_Benefeciary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPageTitle" runat="Server">
   Regional Livestock Officer Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentDescription" runat="Server">
    Fill below form for Regional Livestock officer. Also you can manipulate (Edit or Delete) livestock officer saved data .
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="Server">
    <script src="../Script/Officers.js"></script>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
              
                <div class="card-body collapse in">
                    <div class="card-block">
                     
                        <div id="Form1" class="form form-horizontal form-bordered">
                            <div class="form-body">
                                <h4 class="form-section"><i class="icon-head"></i>Personal Info</h4>

                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="txtName">Name </label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="txtName" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="txtFName">Father Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="txtFName" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="txtContactNo">Contact Number</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="txtContactNo" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlGender">Gender</label>
                                    <div class="col-md-9">
                                        <select id="ddlGender" class="form-control">
                                            <option value="1">Male</option>
                                            <option value="2">Female</option>
                                        </select>
                                    </div>
                                </div>

                                <h4 class="form-section"><i class="icon-location"></i>Location Info</h4>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="ddlRegion">Region</label>
                                    <div class="col-md-9">
                                        <asp:DropDownList ID="ddlRegion" class="select2 form-control region" runat="server"></asp:DropDownList>
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
                            </div>

                            <div class="form-body">
                                <h4 class="form-section blue"><i class=" icon-save"></i>Saved Officers Basic Information</h4>
                                <div class="form-group row">
                                    <div id="dvOfficersD" class="col-md-11 text-md-center offset-md-1 ">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnOfficerId" />
</asp:Content>

