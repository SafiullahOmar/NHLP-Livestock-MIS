$(function () {
    $('select.form-control:not(.duallistbox)').select2({ containerCssClass: "select-xs" });
    getIPs();
    getSubActivity();
    $(".chk-select").iCheck({ checkboxClass: "icheckbox_square-blue"});
    $("#ddlIP,#ddlYear").on("change", function () {
        if ($("#ddlIP").val() != "-1" && $("#ddlYear").val() != "-1" && $("#ddlIP").val()!='new') {
            getIPProvinceDetail($('#ddlYear').val(), $('#ddlIP').val());
        }
    });
    $('#ddlIP').on("change", function (e) {
        e.preventDefault();
        if ($(this).val() == 'new') {
            $('#mdIPInsertion').modal('show');
        }
    });
    $('#btnClose').click(function (e) {
        e.preventDefault();
        $('#ddlIP').val('-1').trigger("change");
    });
    //$(document).bind('keydown', 'Ctrl+s', function (e) {
    //    e.preventDefault();
    //    e.stopImmediatePropagation();
    //    alert('hi');
    //    $('#btnSaveIP').trigger('click');
    //    return false;
    //});
    $('#btnSaveIP').click(function (e) {
        e.preventDefault();
        if (validateIPInsertionForm(e)) {
            SaveIP();
        }
    });
    $(':submit').click(function (e) {
        e.preventDefault();
        if (formValidation(e)) {
            SaveIpProvinceD();
        }
    });
    $('#btnCancel').click(function () {
        e.preventDefault();
        clear();
    });
});

function SaveIP() {

    $.ajax({
        type: "POST",
        url: "IPManagement.aspx/SaveIPDetail",
        data: JSON.stringify({ Name: $('#txtIPName').val(), Remarks: $('#txtRemarks').val() }),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        async: true,
        success: function (data) {
            $('#txtIPName').val('');
            $('#txtRemarks').val('');
            getIPs();
            $('#ddlIP option[value=' + data.d + ']').attr("selected", "selected").trigger('change');
            //  setSelectedIndex(document.getElementById("ddlIP"), "16");
            $('#mdIPInsertion').modal('hide');
            toastr.success("IP Information is successfully saved to the system !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
        },
        error: function (data) {
            alert("error found");
        }

    });



}
function getIPs() {
    $.ajax({
        type: "POST",
        url: "IPManagement.aspx/GetIP",
        data: '',
        async: true,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $('#ddlIP').empty();
            $.each(data.d, function (key, value) {
                $('#ddlIP').append($("<option></option>").val(value.Id).html(value.Name));
            });
            $('#ddlIP').prepend("<option value='-1' selected='true'>-Select-</option>");
            $('#ddlIP').append("<option value='new' >-Add New IP-</option>");
            $('#ddlIP option:first').attr("selected", "selected");
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function getSubActivity() {
    $.ajax({
        type: "POST",
        url: "IPManagement.aspx/GetSubActivity",
        data: '',
        async: true,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $('#ddlActivity').empty();
            $.each(data.d, function (key, value) {
                $('#ddlActivity').append($("<option></option>").val(value.SubId).html(value.SubActivity));
            });
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function getIPProvinceDetail(Year, IP) {

    $.ajax({
        type: "POST",
        url: "IPManagement.aspx/GetIPProvinceDetail",
        data: '{Year:' + Year + ',IP:' + IP + '}',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tbl' width='100%'  class='table table-striped table-bordered '>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Province Name </th><th style='text-align:center;'>Selection </th></tr></thead>";
            $table += header;
            var lstValues = new Array();
            var count = 1;
            $.each(data.d, function (i, x) {
                if (x.RwNumbr == "1") {
                    var row = "<tr ><td style='text-align:center;'>" + count + "</td>" +
                       "<td style='text-align:center;'><span>" + x.ProvinceName + "  </span><span style='display:none'>" + x.ProvinceID + "</span><span style='display:none'>" + x.SubActivityId + "</span></td>" +
                       "<td><input type='checkbox'   " + (x.chk == false ? '' : 'checked') + "/></td>" +
                    "</tr>";
                    $table += row;
                    count++;

                }
                if (x.SubActivityId)
                    lstValues.push(x.SubActivityId);
            });
            $('#dvTblProvince').html($table);
            $table += "</table>";
            $('#tbl').DataTable({ "scrollY": '50vh', "scrollCollapse": true, "paging": false });
            $('#ddlActivity').val(lstValues).trigger('change');

        },
        error: function (data) {
            alert("error found");
        }

    });
}
function validateIPInsertionForm(e) {

    var flag = true;


    if ($('#txtIPName').val() == '') {
        $('#txtIPName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtIPName').css('background-color', '#ffff'); }

    if (flag) { return true } else {
        toastr.warning("Please enter informations in red background OR You Missed Items !", "INV-MIS: Validation Alert !", { progressBar: !0 });
        return false;
    }
}
function setSelectedIndex(s, valsearch) {

    // Loop through all the items in drop down list

    for (i = 0; i < s.options.length; i++) {

        if (s.options[i].value == valsearch) {

            // Item is found. Set its property and exit

            s.options[i].selected = true;

            break;

        }

    }

    return;

}
function SaveIpProvinceD() {
    var formDetails = {};
    // formDetails.IS_By = $('#txtIssuedBy').val();
    formDetails.IPId = $('#ddlIP').val();
    formDetails.Year = $('#ddlYear').val();
    var activitieslst = new Array();
    if ($('#ddlActivity :selected').length > 0) {
        $('#ddlActivity :selected').each(function (i, selected) {
            var detail = {};
            detail.SubId = $(selected).val();
            activitieslst.push(detail);
        });
    }
    console.log(activitieslst);
    var provinceslst = new Array();
    $('#tbl tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:checkbox").is(":checked")) {
            var tr = $(this).closest('tr');
            detail.ProvinceID = $($(tr).find('span:eq(1)')).html();
            provinceslst.push(detail);
        }
    });

    formDetails.ActivityArray = activitieslst;
    formDetails.ProvinceArray = provinceslst;
    $.ajax({
        type: "POST",
        url: "IPManagement.aspx/SaveIPProvinceD",
        data: JSON.stringify({ formDetails: formDetails }),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            toastr.success("Province Details for relevant IP  is successfully saved to the system !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
            clear();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function clear() {
    $('#ddlIP').val('-1').trigger("change");
    $('#ddlYear').val('-1').trigger("change");
    $('#ddlActivity option:selected').prop("selected", false).trigger("change");
    $('#tbl tbody tr').each(function () {
        $(this).find("input:checkbox").attr("checked", false);
    });
    $('#tbl tbody tr').remove();
}
function formValidation() {
    var flag = true;
    if ($('#ddlIP').val() == '-1') {
        $('#ddlIP').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlIP').css('background-color', '#ffff'); }
    if ($('#ddlYear').val() == '-1') {
        $('#ddlYear').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlYear').css('background-color', '#ffff'); }

    if ($('#ddlActivity :selected').length == 0) {
        flag = false;
        $('#ddlActivity').css('background-color', '#FFAAAA');
    }
    else { $('#ddlActivity').css('background-color', '#ffff'); }
    var count = 0;
    $('#tbl tbody tr').each(function () {
        if ($(this).find("input:checkbox").is(":checked")) {
            count += 1;
        }

    });

    //alert(count);
    //alert($('#ddlActivity :selected').length);
    if (count == 0) {
        flag = false;
    }
    if (flag) { return true } else {
        toastr.warning("Please check the required fields ,Enter valid informations  !", "INV-MIS: Validation Alert !", { progressBar: !0 });
        return false;
    }
}