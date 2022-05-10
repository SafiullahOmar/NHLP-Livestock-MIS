$(function () {
    $('select.form-control:not(.duallistbox)').select2({ containerCssClass: "select-xs" });
    $(':submit').show();
    $('#btnUpdate').hide();
    $('.region').on("change", function () {
        if ($(this).val() == "-1") {

            $('#dvOfficersD').html('');
        } else {
            //Gridview List for Farmers
            if ($(this).val() != null)
                ShowOfficerList();
        }
    });
    $(':submit').on('click', function (e) {
        e.preventDefault();
        if (Validation(e)) {
            SaveOfficer();
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
function SaveOfficer() {
    var formDetails = {};
    formDetails.Name = $('#txtName').val();
    formDetails.Gender = $('#ddlGender').val();
    formDetails.FatherName = $('#txtFName').val();
    formDetails.ContactNo = $('#txtContactNo').val();
    formDetails.RegionId = $('.region').val();
    var jsonObject = JSON.stringify({ formDetails: formDetails });
    $.ajax({
        type: "POST",
        url: "LiveOfficer.aspx/SaveOfficer",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {

                toastr.success("Officer Information is successfully saved to the system !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
                //Clear components
                $('.btnUpdate').hide();
                //$('.btnDelete').hide();
                $('.btnSave').show();
                ShowOfficerList();
                Clear();
            }
            else {
                toastr.warning("Officer Information is already exist !", "LIVE-MIS: Warning", { closeButton: !0 });

            }
        },
        error: function (data) {
            alert("error found");
        }

    });
}
var row = null;
function ShowOfficerList() {
    $.ajax({
        type: "POST",
        url: "LiveOfficer.aspx/GetOfficerLists",
        data: '{RegionId:' + $('.region').val() + '}',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblOfficers'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Contact No</th><th></th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "<span id='spanSeedPlantedId' style='display:none'>" + x.OfficerId + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FatherName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.ContactNo + "</span></td>" +
                   (x.Edit == true ? "<td><a onclick='EditOfficerDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span id='spID' style='display:none'>" + x.OfficerId + "</span></td>" : "<td></td>") +
                   "</tr>";
                $table += row;
                count++;
            });
            $('#dvOfficersD').html($table);
            $table += "</table>";
            $('#tblOfficers').DataTable({ "bPaginate": true, "bLengthChange": true, "bFilter": true, "bSort": true, "bInfo": true, "bAutoWidth": true, });
            // $('#FarmerW').show();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function EditOfficerDetail(obj) {
    var td = obj.parentNode;
    var span = $(td).find('span');
    var OfficerId = span.html();
    $('#hdnOfficerId').val(OfficerId);
    var obj = JSON.stringify({ Id: OfficerId });
    $.ajax({
        type: "POST",
        url: "LiveOfficer.aspx/GetOfficerDetailByID",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            $('#txtName').val(r.d.Name);
            //$('#ddlDistrict').val(r.d.DistrictID);
            $('#txtFName').val(r.d.FatherName);
            $('#txtContactNo').val(r.d.ContactNo);
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
    formDetails.Gender = $('#ddlGender').val();
    formDetails.FatherName = $('#txtFName').val();
    formDetails.ContactNo = $('#txtContactNo').val();
    formDetails.OfficerId = $('#hdnOfficerId').val();
    formDetails.RegionId = $('.region').val();
    var jsonObject = JSON.stringify({ formDetails: formDetails });
    if ($('#hdnOfficerId').val()) {
        $.ajax({
            type: "POST",
            url: "LiveOfficer.aspx/UpdateFormDetail",
            data: jsonObject,
            dataType: "json",
            async: false,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data.d == false) {
                    toastr.success("Officer Information is successfully updated to the system !", "LIVE-MIS: Form is Updated!", { closeButton: !0 });
                    //Clear components
                    $(':submit').show();
                    $('#btnUpdate').hide();
                    $('#btnDelete').hide();
                    Clear();
                    ShowOfficerList();}
            },
            error: function (data) {
                alert("error found");
            }

        });
    }
}

function Validation() {
    var flag = true;
    if ($('.region').val() == '-1') {
        $('.region').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('.region').css('background-color', '#ffff'); }
    
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

    if (flag) { return true } else {
        toastr.warning("Enter Information in Red Backgrounds !", "LIVE-MIS: Form Validation", { closeButton: !0 });
        return false;
    }
}
function Clear() {
    $('#txtName').val('');
    $('#txtFName').val('');
    $('#txtContactNo').val('');
    $(':submit').show();
    $('#btnUpdate').hide();
    $('#btnDelete').hide();
    $('#hdnOfficerId').val('');
}