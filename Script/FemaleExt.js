$(function () {
    // $('#txtEndDate').dateDropper();
    $('select.form-control:not(.duallistbox)').select2({ containerCssClass: "select-xs" });
    $(".form-control.date").dateDropper({ dropWidth: 200, maxYear: "2020" });
    $(':submit').show();
    $('#btnUpdate').hide();
    $('#btnDelete').hide();
    // $('#ddlVillage').selectize();
    $(".province").change(function () {

        if ($(this).val() == "-1") {
            $("#ddlDistrict").attr("disabled", "disabled");
            $("#ddlMaleVFU").attr("disabled", "disabled");
            $('#ddlMaleVFU option:first').attr("selected", "selected");
            $("#ddlMaleVFU option").remove();
        }
        else {
            $("#ddlDistrict").attr("disabled", false);
            $("#ddlVillage option:first").attr("selected", "selected").trigger('change');
            //ShowControlsByRoles();
            $.ajax({
                type: "POST",
                url: "FemaleExtension.aspx/GetDistrict",
                data: '{ProvinceID: ' + $('.province').val() + '}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    $('#ddlDistrict').empty();
                    $.each(data.d, function (key, value) {
                        $('#ddlDistrict').append($("<option></option>").val(value.DistrictId).html(value.DistrictName));
                    });
                    $('#ddlDistrict').prepend("<option value='-1' selected='true'>-Select-</option>");
                    $('#ddlDistrict option:first').attr("selected", "selected");
                    $('#ddlVillage').selectize()[0].selectize.destroy();
                    $('#ddlVillage option').remove();
                    $("#ddlMaleVFU option").remove();
                },
                error: function (data) {
                    alert("error found");
                }
            });
        }
    });
    //var $villageSelect = $('#ddlVillage').select2();
    //$villageSelect.each(function (i, item) {

    $('#ddlDistrict').change(function () {
        if ($(this).val() == "-1") {

            // $('#ddlVillage').find('option').remove();
            $('#ddlVillage').attr("disabled", "disabled");
            $('#ddlVillage').selectize()[0].selectize.destroy();
            $('#ddlVillage option').remove();
            
            $("#ddlMaleVFU").attr("disabled", "disabled");
            $('#ddlMaleVFU option:first').attr("selected", "selected");
        }
        else {

            getMaleVFU();

            var jsonObj = JSON.stringify({ DistrictID: $("#ddlDistrict").val() });
            // Village Dropdown list
            $.ajax({
                type: "POST",
                url: "FemaleExtension.aspx/GetVillage",
                data: jsonObj,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    //var $select = $('#ddlVillage').selectize();
                    //var control = $select[0].selectize;
                    //control.clear(true);
                    //$('#ddlVillage').selectize()[0].selectize.destroy();
                    //var selectize = $("#ddlVillage")[0].selectize;
                    //selectize.clear();
                    //selectize.clearOptions();
                    //selectize.renderCache['option'] = {};
                    //selectize.renderCache['item'] = {};
                    //var $select = $('#ddlVillage').selectize({});
                    //var control = $select[0].selectize;
                    //control.clearCache('option');
                    //control.clearOptions();
                    //control.refreshOptions(true);


                    $('#ddlVillage').selectize()[0].selectize.destroy();
                    $('#ddlVillage option').remove();
                    $.each(data.d, function (key, value) {
                        $('#ddlVillage').append($("<option></option>").val(value.VillageName).html(value.VillageName));
                    });
                    $('#ddlVillage').prepend("<option value='-1' selected='true'>-Select or Add Village-</option>");
                    $('#ddlVillage option:first').attr("selected", "selected")

                    //$('#ddlVillage').selectize({
                    //    create: true,
                    //    dropdownParent: "body",
                    //    persist: false,
                    //    sortField: {
                    //        field: 'text',
                    //        direction: 'asc'
                    //    }
                    //});


                    var select = $('#ddlVillage').selectize({
                        create: true,
                        dropdownParent: "body",
                        persist: false,
                        sortField: {
                            field: 'text',
                            direction: 'asc'
                        }
                    });
                    var selectSizeControl = select[0].selectize;

                    select[0].selectize.refreshItems();
                    select[0].selectize.refreshOptions();



                },
                error: function (data) {
                    alert("error found");
                }

            });

        }
    });
    $('#ddlVillage').on("change", function () {
        if ($(this).val() == "-1") {

            $('#dvBenefeciaries').html('');
        } else {
            //Gridview List for Farmers
            if ($('#ddlDistrict').val() != null)
                ShowVfuList($('#ddlDistrict').val(), $(this).val(), $('#ddlYear').val());
        }
    });
    $(':submit').on('click', function (e) {
        e.preventDefault();
        if (Validation(e)) {
            SaveVfu();
        }
    });
    $('#btnUpdate').on('click', function (e) {
        e.preventDefault();
        if (Validation(e)) {
            Update();
        }
    });
    $('#btnCancel').on("click", function () {
        Clear();
    });
});
function SaveVfu() {
    var formDetails = {};
    formDetails.Name = $('#txtName').val();
    formDetails.DistrictID = $('#ddlDistrict').val();
    formDetails.Gender = $('#ddlGender').val();
    formDetails.FatherName = $('#txtFName').val();
    formDetails.ContactNo = $('#txtContactNo').val();
    formDetails.Village = $('#ddlVillage').val();

    formDetails.BankNumber = $('#txtBank').val();
    formDetails.ContractStartDate = $('#txtStartDate').val();
    formDetails.ContractEndDate = $('#txtEndDate').val();
    formDetails.VfuHead = $('#ddlMaleVFU').val();

    var jsonObject = JSON.stringify({ formDetails: formDetails });
    $.ajax({
        type: "POST",
        url: "FemaleExtension.aspx/SaveBenef",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {

                toastr.success("Benefeciary Information is successfully saved to the system !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
                //Clear components
                //$('.btnUpdate').hide();
                //$('.btnDelete').hide();
                //$('.btnSave').show();
                //ShowFarmers($('.EW').val(), $('#ddlVillage').val());
                ShowVfuList($('#ddlDistrict').val(), $('#ddlVillage').val(),$('#ddlYear').val());
                Clear();
            }
            else {
                toastr.warning("Selected Vfu Information is already exist !", "LIVE-MIS: Warning", { closeButton: !0 });

            }
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function getMaleVFU() {

    $("#ddlMaleVFU").removeAttr("disabled");
   
    $.ajax({
        type: "POST",
        url: "FemaleExtension.aspx/GetMaleVFU",
        data: '{ProvinceID: ' + $('.province').val() + ',Year:'+$('#ddlYear').val()+'}',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $('#ddlMaleVFU').empty();
            $.each(data.d, function (key, value) {
                $('#ddlMaleVFU').append($("<option></option>").val(value.VFUDId).html(value.VFUName));
            });
            $('#ddlMaleVFU').prepend("<option value='-1' selected='true'>-Select-</option>");
            $('#ddlMaleVFU option:first').attr("selected", "selected");
        },
        error: function (data) {
            alert("error found");
        }
    });
}
var row = null;
function ShowVfuList(DistrictId, Village,Year) {
    var OB = JSON.stringify({ DistrictId: DistrictId, Village: Village,Year:Year });
    $.ajax({
        type: "POST",
        url: "FemaleExtension.aspx/GetVfuLists",
        data: OB,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblVfus'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Contract Start Date</th><th style='text-align:center;'>Bank Number</th><th></th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "<span id='spanSeedPlantedId' style='display:none'>" + x.VfuId + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FatherName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.ContractStartDate + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.BankNumber + "</span></td>" +
                   (x.Edit == true ? "<td><a onclick='EditVfuDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span id='spID' style='display:none'>" + x.VfuId + "</span></td>" : "<td></td>") +
                   "</tr>";
                $table += row;
                count++;
            });
            $('#dvVfus').html($table);
            $table += "</table>";
            $('#tblVfus').DataTable({ "bPaginate": true, "bLengthChange": true, "bFilter": true, "bSort": true, "bInfo": true, "bAutoWidth": true, });
            // $('#FarmerW').show();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function EditVfuDetail(obj) {
    var td = obj.parentNode;
    var span = $(td).find('span');
    var VfuId = span.html();
    $('#hdnVfuId').val(VfuId);
    var obj = JSON.stringify({ Id: VfuId });
    $.ajax({
        type: "POST",
        url: "FemaleExtension.aspx/GetVfuDetailByID",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            $('#txtName').val(r.d.Name);
            //$('#ddlDistrict').val(r.d.DistrictID);
            $('#txtFName').val(r.d.FatherName);
            $('#txtContactNo').val(r.d.ContactNo);
            $('#txtBank').val(r.d.BankNumber);
            $('#txtEndDate').val(r.d.ContractEndDate);
            $('#txtStartDate').val(r.d.ContractStartDate);
            $('#ddlVfuType').val(r.d.VfuType).trigger('change');
            $('#ddlMaleVFU').val(r.d.VfuHead).trigger('change');
            $('#ddlGender').val(r.d.Gender).trigger('change');
            $(':submit').hide();
            $('#btnUpdate').show();
            $('#btnDelete').show();
            toastr.info("Please fill validated controls !", "LIVE-MIS:Notification !", { closeButton: !0 });
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function Update() {
    var formDetails = {};
    formDetails.Name = $('#txtName').val();
    formDetails.DistrictID = $('#ddlDistrict').val();
    formDetails.Gender = $('#ddlGender').val();
    formDetails.FatherName = $('#txtFName').val();
    formDetails.ContactNo = $('#txtContactNo').val();
    formDetails.Village = $('#ddlVillage').val();

    formDetails.BankNumber = $('#txtBank').val();
    formDetails.ContractStartDate = $('#txtStartDate').val();
    formDetails.ContractEndDate = $('#txtEndDate').val();
    formDetails.VfuType = $('#ddlVfuType').val();

    formDetails.VfuId = $('#hdnVfuId').val();
    var jsonObject = JSON.stringify({ formDetails: formDetails });
    if ($('#hdnVfuId').val()) {
        $.ajax({
            type: "POST",
            url: "FemaleExtension.aspx/UpdateFormDetail",
            data: jsonObject,
            dataType: "json",
            async: false,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                toastr.success("Vfu Information is successfully updated to the system !", "LIVE-MIS: Form is Updated!", { closeButton: !0 });
                //Clear components
                $(':submit').show();
                $('#btnUpdate').hide();
                $('#btnDelete').hide();
                $('#hdnVfuId').val('');
                Clear();
                ShowVfuList($('#ddlDistrict').val(), $('#ddlVillage').val());
            },
            error: function (data) {
                alert("error found");
            }

        });
    }
}
function Delete() {
    var formDetails = {};
    formDetails.DistrictID = $('#ddlDistrict').val();
    formDetails.VfuId = $('#hdnVfuId').val();
    formDetails.Village = $('#ddlVillage').val();
    var jsonObject = JSON.stringify({ formDetails: formDetails });
    $.ajax({
        type: "POST",
        url: "FemaleExtension.aspx/DeleteFarmer",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == true) {
                toastr.warning("You are not allowed to Delete this Record!", "LIVE-MIS: Notification!", { closeButton: !0 });
                //Clear components
                $('.btnUpdate').hide();
                $('.btnDelete').hide();
                $('.btnSave').show();
                ShowFarmers($('.EW').val(), $('#ddlVillage').val());
                ClearForm();
                $("input:radio[name=rdSex][value='True']").prop('checked', 'checked');
            }
            else {
                $.alert({
                    icon: 'glyphicon glyphicon-saved',
                    closeIcon: true,
                    title: 'Form Updation Alert',
                    animation: 'news',
                    closeAnimation: 'news',
                    theme: 'dark',
                    type: 'green',
                    typeAnimated: true,
                    content: '<strong><font style="color:white;"> Farmer  Information Has been deleted into System !</font></strong>'
                });

                //Clear components
                $('.btnUpdate').hide();
                $('.btnDelete').hide();
                $('.btnSave').show();
                ShowFarmers($('.EW').val(), $('#ddlVillage').val());
                ClearForm();
                $("input:radio[name=rdSex][value='True']").prop('checked', 'checked');

            }
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function Validation() {
    var flag = true;
    if ($('.province').val() == '-1') {
        $('.province').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('.province').css('background-color', '#ffff'); }
    if ($('#ddlDistrict').val() == '-1') {
        $('#ddlDistrict').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlDistrict').css('background-color', '#ffff'); }

    if ($('#ddlMaleVFU').val() == '-1' || $('#ddlMaleVFU').val()==null) {
        $('#ddlMaleVFU').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlMaleVFU').css('background-color', '#ffff'); }

    if ($('#ddlVillage').val() == '-1' || $('#ddlVillage').val() == null) {
        $('#ddlVillage').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlVillage').css('background-color', '#ffff'); }
    if ($('#txtName').val() == '') {
        $('#txtName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtName').css('background-color', '#ffff'); }

    if ($('#txtFName').val() == '') {
        $('#txtFName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtFName').css('background-color', '#ffff'); }

    if ($('#ddlGender').val() == '-1') {
        $('#ddlGender').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlGender').css('background-color', '#ffff'); }

    if ($('#txtContactNo').val() == '') {
        $('#txtContactNo').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtContactNo').css('background-color', '#ffff'); }

    if ($('#txtBank').val() == '') {
        $('#txtBank').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtBank').css('background-color', '#ffff'); }

    if ($('#txtStartDate').val() == '') {
        $('#txtStartDate').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtStartDate').css('background-color', '#ffff'); }

    if ($('#txtEndDate').val() == '') {
        $('#txtEndDate').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtEndDate').css('background-color', '#ffff'); }

    if (flag) { return true } else {
        toastr.warning("Enter Information in Red Backgrounds !", "LIVE-MIS: Form Validation", { closeButton: !0 });
        return false;
    }
}
function Clear() {
    $('#txtName').val('');
    $('#txtFName').val('');
    $('#txtContactNo').val('');
    $('#txtBank').val('');
    $('#txtStartDate').val('');
    $('#txtEndDate').val('');
    $(':submit').show();
    $('#btnUpdate').hide();
    $('#btnDelete').hide();
    $('#VfuId').val('');
}