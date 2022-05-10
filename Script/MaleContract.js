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
        }
        else {
            $("#ddlDistrict").attr("disabled", false);
            //ShowControlsByRoles();
            $.ajax({
                type: "POST",
                url: "MaleExtension.aspx/GetDistrict",
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
                },
                error: function (data) {
                    alert("error found");
                }
            });
        }
    });
    //var $villageSelect = $('#ddlVillage').select2();
    //$villageSelect.each(function (i, item) {

    $("#txtEndDate,#txtStartDate,#ddlDistrict,.province").on("change", function () {
        if ($("#ddlDistrict").val() && $("#ddlDistrict").val() != "-1" && $(".province").val() != "-1" && $("#txtStartDate").val() != "" && $("#txtEndDate").val() != "" ) {
            ShowVfuList($("#ddlDistrict").val(), $("#txtStartDate").val(), $("#txtEndDate").val());
        } else {
            $('#dvBenefeciaries').html('');
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
    var formDetail = {};
    formDetail.ContractStartDate = $('#txtStartDate').val();
    formDetail.ContractEndDate = $('#txtEndDate').val();
    formDetail.DistrictId = $('#ddlDistrict').val();
    var lst = new Array();
    $('#tblVfus tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:checkbox").is(":checked")) {
            detail.VfuId = $($(this).find('span:eq(0)')).html();
            lst.push(detail);
        }
    });
    formDetail.VFUlst = lst;

    var jsonObject = JSON.stringify({ formDetails: formDetail });

    $.ajax({
        type: "POST",
        url: "MaleContractExtension.aspx/SaveDetail",
        data: jsonObject,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            toastr.success("VFU Contract Information is successfully saved to the system !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
            Clear();
            // $('#btnDelete').remove();
        },
        error: function (data) {
            alert("error found");
        }

    });



}
var row = null;
function ShowVfuList(DistrictId, StartDate, EndDate) {
    var OB = JSON.stringify({ DistrictId: DistrictId, StartDate: StartDate, EndDate: EndDate });
    $.ajax({
        type: "POST",
        url: "MaleContractExtension.aspx/GetVFUList",
        data: OB,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblVfus'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'><input type='checkbox' name='checkAll' class='all'/> Check All </th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Mobile</th><th style='text-align:center;'>Bank Account #</th><th style='text-align:center;'>Contract Start Date</th><th style='text-align:center;'>Contract End Date</th></tr></thead>";
            $table += header;
            var count = 1;
            var flag = 0;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "</td><td><span  style='display:none'>" + x.VfuId + "</span>  <input type='checkbox' class='selector' name='rowChk' class='chkRow' " + (x.IsExist == 'True' ? "checked" : "") + "/></td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FatherName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Mobile + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Bank + "</span></td>" +
                    "<td style='text-align:center;'><span>" + x.ContractStartDate + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.ContractEndDate + "</span></td>" +
                   "</tr>";
                $table += row;
                count++;
                if (x.IsExist == 'True')
                    flag = 1;
            });
            $('#dvVFU_Act_Detail').html($table);
            $table += "</table>";
            $('#tblVfus').DataTable({
                "scrollY": '50vh', "scrollX": '20vh', "scrollCollapse": true, "paging": false, "ordering": false, "fnDrawCallback": function (oSettings) {
                    $('input[type="checkbox"]').iCheck({
                        checkboxClass: 'icheckbox_square-blue'
                    });
                    $('input.all').on('ifChecked', function (event) {
                        $('input.selector:not(.all)').iCheck('check');
                    }).on('ifUnchecked', function (event) {
                        $('input.selector:not(.all)').iCheck('uncheck');
                    });
                    $("input:checkbox").on('ifChanged', function (e) {
                        if (e.target.name == 'rowChk' && e.target.checked) {
                            var Tr = $(this).closest('tr');
                            if (e.target.checked) {
                                $(Tr).find("select").removeAttr("disabled");
                            }
                        } else if (e.target.name == 'rowChk' && e.target.checked == false) {
                            var Tr = $(this).closest('tr');
                            $(Tr).find("select").attr("disabled", "disabled");

                        }
                        //}
                    });
                }
            });
            if ($(":button[Id^='btnDelete']").length) {
                $(":button[Id^='btnDelete']").remove();
            }
            if (flag == 1) {
                $('<button>', {
                    'class': 'btn btn-danger mr-1 float-md-left',
                    'Id': 'btnDelete',
                    'html': $("<i>", { 'class': 'icon-delete', 'text': ' Delete All Records' }),
                    'type': 'button',
                    'click': function (e) {
                        e.preventDefault();
                        if (confirm("Are You Sure To Delete All Record from the Selected Table")) {
                            DeleteAll();
                        }
                        // alert('hi');
                    }

                }).insertAfter($(':submit'));
            }
            // $('#FarmerW').show();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function DeleteAll() {
    var formDetail = {};
    formDetail.ContractStartDate = $('#txtStartDate').val();
    formDetail.ContractEndDate = $('#txtEndDate').val();
    formDetail.DistrictId = $('#ddlDistrict').val();
    var jsonObject = JSON.stringify({ formDetails: formDetail });
    $.ajax({
        type: "POST",
        url: "MaleContractExtension.aspx/DeleteAll",
        data: jsonObject,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            toastr.success("All VFU Informations are successfully Deleted from system !", "LIVE-MIS:Deleted!", { closeButton: !0 });
            
            Clear();
            //$('#btnDelete').remove();

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
    $('#txtEndDate').val('');
    $('#txtStartDate').val('');
    $('#dvVFU_Act_Detail').html('');
    $(':submit').show();
    $('#btnUpdate').hide();
    $('#btnDelete').hide();
    $('#VfuId').val('');
}