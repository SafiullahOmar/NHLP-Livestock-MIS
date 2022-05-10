$(function () {
    $('select.form-control:not(.duallistbox)').select2({ containerCssClass: "select-xs" });
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
            $("#ddlVillage option:first").attr("selected", "selected").trigger('change');
            //ShowControlsByRoles();
            $.ajax({
                type: "POST",
                url: "Inputs.aspx/GetDistrict",
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
                },
                error: function (data) {
                    alert("error found");
                }
            });
        }
    });
    $('#ddlDistrict').change(function () {
        if ($(this).val() == "-1") {

            // $('#ddlVillage').find('option').remove();

        }
        else {
            var jsonObj = JSON.stringify({ DistrictID: $("#ddlDistrict").val(), Year: $('#ddlYear').val() }); $.ajax({
                type: "POST",
                url: "Inputs.aspx/GetVFUs",
                data: jsonObj,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    $('#ddlVFU').empty();
                    $.each(data.d, function (key, value) {
                        $('#ddlVFU').append($("<option></option>").val(value.Id).html(value.Name));
                    });
                    $('#ddlVFU').prepend("<option value='-1' selected='true'>-Select-</option>");
                    $('#ddlVFU option:first').attr("selected", "selected");
                },
                error: function (data) {
                    alert("error found");
                }
            });

        }
    })
    $('#ddlVFU').on("change", function () {
        if ($(this).val() == "-1") {
            $('#ddlVillage').attr("disabled", "disabled");
        } else {
            var jsonObj = JSON.stringify({ DistrictID: $("#ddlDistrict").val(), Year: $('#ddlYear').val(), VFUId: $(this).val() });
            // Village Dropdown list
            $.ajax({
                type: "POST",
                url: "Inputs.aspx/GetVillage",
                data: jsonObj,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    $('#ddlVillage option').remove();
                    $.each(data.d, function (key, value) {

                        $('#ddlVillage').append($("<option></option>").val(value.Name).html(value.Name));
                    });
                    $('#ddlVillage').prepend("<option value='-1' selected='true'>-Select or Add Village-</option>");
                    $('#ddlVillage option:first').attr("selected", "selected");
                },
                error: function (data) {
                    alert("error found");
                }

            });

        }
    });
    $('#ddlPkg').on("change", function () {
        if ($(this).val() == "-1") {

            $('#dvInsideModal').html('');
        } else {
            //Gridview List for Farmers
            if ($('#ddlDistrict').val() != "-1" && $('#ddlYear').val() != "-1" && $('#ddlVFU').val() != "-1" && $('#ddlVillage').val() != "-1")
                FindMembersRecord($('#ddlYear').val(), $('#ddlDistrict').val(), $('#ddlVFU').val(), $('#ddlVillage').val(), $(this).val());
        }
    });
    //$(':submit').on('click', function (e) {
    //    e.preventDefault();
    //    if (Validation(e)) {
    //        SaveBenf();
    //    }
    //});
    //$('#btnUpdate').on('click', function (e) {
    //    e.preventDefault();
    //    if (Validation(e)) {
    //        Update();
    //    }
    //});
    //$('#btnCancel').on("click", function () {
    //    Clear();
    //});
});
var row = null;
function FindMembersRecord(year, districtId, VfuId, Village, PackageId) {
    var jsonObj = JSON.stringify({ Year: year, DistrictID: districtId, VfuId: VfuId, Village: Village, PckgId: PackageId });
    // Village Dropdown list
    $.ajax({
        type: "POST",
        url: "Inputs.aspx/GetMemberRecords",
        data: jsonObj,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            BuilModal();
            var $table = "<table id='tblMembersD' width='100%' class='table table-xs table-striped table-bordered  table-hover mb-0'>";
            var header = "<thead><tr ><th><input type='checkbox' name='checkAll' class='all'/> Check All </th><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>FName</th><th style='text-align:center;'>Position</th></tr></thead>";
            $table += header;
            var count = 1;
            var trueCount = 0;
            $.each(data.d, function (i, x) {
                if (x.IsExist == 'True')
                    trueCount += 1;
                var row = "<tr ><td><input type='checkbox' class='selector' name='rowChk' class='chkRow' " + (x.IsExist == 'True' ? "checked" : "") + "/></td><td style='text-align:center;'>" + count + "<span  style='display:none'>" + x.VFUId + "</span><span  style='display:none'>" + x.MemberId + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                    "<td style='text-align:center;'><span>" + x.Name + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Position + "</span></td>" +

                   "</tr>";
                $table += row;
                count++;
            });
            $('#dvInsideModal').html($table);
            $table += "</table>";
            $('#tblMembersD').DataTable({
                "paging": false, "ordering": false, "fnDrawCallback": function (oSettings) {
                    $('input[type="checkbox"]').iCheck({
                        checkboxClass: 'icheckbox_square-red'
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
                    });
                }
            });



            if (count > 0) {

                if ($(":button[Id^='btnSave']").length) {
                    $(":button[Id^='btnSave']").remove();
                    $(":button[Id^='btnRemove']").remove();
                }
                $('<button>', {
                    'class': 'btn btn-success ml-1 float-md-right',
                    'Id': 'btnSave',
                    'html': $("<i>", { 'class': 'icon-save', 'text': ' Save Records Packages' }),
                    'type': 'button',
                    'click': function (e) {
                        e.preventDefault();
                        if (Validation(e)) {
                            if (confirm("Are you sure to submit the selected packages to selected record from  Table ?")) {
                                SavePackages();
                            }
                        }
                        // alert('hi');
                    }

                }).insertAfter($('#btnClose'));
                if (trueCount > 0) {
                    if ($('#ddlPkg').val() == "3")
                        $('input.selector:not(.all)').iCheck('check');

                    $('<button>', {
                        'class': 'btn btn-danger ml-1 float-md-left',
                        'Id': 'btnRemove',
                        'html': $("<i>", { 'class': 'icon-delete', 'text': ' Delete Saved Records Packages' }),
                        'type': 'button',
                        'click': function (e) {
                            e.preventDefault();
                            if (Validation(e)) {
                                if (confirm("Are you sure to delete the selected packages from the above benefeciaries ?")) {
                                    Delete();
                                }
                            }
                            // alert('hi');
                        }

                    }).insertAfter('#btnClose');
                }
            }

            $('#mdVFUMembers').modal('show');

        },
        error: function (data) {
            alert("error found");
        }

    });
}
function SavePackages() {
    var formDetails = {};
    formDetails.Year = $('#ddlYear').val();
    formDetails.PackageId = $('#ddlPkg').val();
    formDetails.VFUId = $('#ddlVFU').val();
    formDetails.Village = $('#ddlVillage').val();
    var lst = new Array();
    $('#tblMembersD tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:checkbox").is(":checked")) {
            detail.MemberId = $($(this).find('span:eq(1)')).html();
            lst.push(detail);
        }
    });
    formDetails._memberlst = lst;
    var jsonObject = JSON.stringify({ formDetail: formDetails });
    $.ajax({
        type: "POST",
        url: "Inputs.aspx/SavePackages",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            toastr.success("Package Information is successfully saved  !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
            //Clear components
            //$('.btnUpdate').hide();
            //$('.btnDelete').hide();
            //$('.btnSave').show();
            //ShowFarmers($('.EW').val(), $('#ddlVillage').val());
            Clear();

        },
        error: function (data) {
            alert("error found");
        }

    });
}
function Delete() {
    var formDetails = {};
    formDetails.Year = $('#ddlYear').val();
    formDetails.PackageId = $('#ddlPkg').val();
    formDetails.VFUId = $('#ddlVFU').val();
    formDetails.Village = $('#ddlVillage').val();;
    var jsonObject = JSON.stringify({ formDetails: formDetails });
    $.ajax({
        type: "POST",
        url: "Inputs.aspx/DeletePackages",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            toastr.success("Package Information is successfully deleted  !", "LIVE-MIS: Infomation is deleted!", { closeButton: !0 });
            //Clear components
            $(":button[Id^='btnRemove']").remove();
            FindMembersRecord($('#ddlYear').val(), $('#ddlDistrict').val(), $('#ddlVFU').val(), $('#ddlVillage').val(), $('#ddlPkg').val());
        },
        error: function (data) {
            alert("error found");
        }

    });
}

function ShowBenefList(DistrictId, Village) {
    var OB = JSON.stringify({ DistrictId: DistrictId, Village: Village });
    $.ajax({
        type: "POST",
        url: "Benefeciary.aspx/GetBenefLists",
        data: OB,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblBenef'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>District</th><th style='text-align:center;'>Contact No</th><th></th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "<span id='spanSeedPlantedId' style='display:none'>" + x.BenefId + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FatherName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.District + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.ContactNo + "</span></td>" +
                   (x.Edit == true ? "<td><a onclick='EditBenfDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span id='spID' style='display:none'>" + x.BenefId + "</span></td>" : "<td></td>") +
                   "</tr>";
                $table += row;
                count++;
            });
            $('#dvBenefeciaries').html($table);
            $table += "</table>";
            $('#tblBenef').DataTable({ "bPaginate": true, "bLengthChange": true, "bFilter": true, "bSort": true, "bInfo": true, "bAutoWidth": true, });
            // $('#FarmerW').show();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function EditBenfDetail(obj) {
    var td = obj.parentNode;
    var span = $(td).find('span');
    var BenefId = span.html();
    $('#hdnBenefId').val(BenefId);
    var obj = JSON.stringify({ Id: BenefId });
    $.ajax({
        type: "POST",
        url: "Benefeciary.aspx/GetBenfDetailByID",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            $('#txtName').val(r.d.Name);
            //$('#ddlDistrict').val(r.d.DistrictID);
            $('#txtFName').val(r.d.FatherName);
            $('#txtContactNo').val(r.d.ContactNo);
            $('#ddlVillage').val(r.d.Village).trigger('change');
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
    formDetails.BenefId = $('#hdnBenefId').val();
    var jsonObject = JSON.stringify({ formDetails: formDetails });
    if ($('#hdnBenefId').val()) {
        $.ajax({
            type: "POST",
            url: "Benefeciary.aspx/UpdateFormDetail",
            data: jsonObject,
            dataType: "json",
            async: false,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                toastr.success("Benefeciary Information is successfully updated to the system !", "LIVE-MIS: Form is Updated!", { closeButton: !0 });
                //Clear components
                $(':submit').show();
                $('#btnUpdate').hide();
                $('#btnDelete').hide();
                Clear();
                ShowBenefList($('#ddlDistrict').val(), $('#ddlVillage').val());
            },
            error: function (data) {
                alert("error found");
            }

        });
    }
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
    if ($('#ddlVillage').val() == '-1') {
        $('#ddlVillage').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlVillage').css('background-color', '#ffff'); }

    if ($('#ddlPkg').val() == '-1') {
        $('#ddlPkg').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlPkg').css('background-color', '#ffff'); }

    if ($('#ddlVFU').val() == '-1') {
        $('#ddlVFU').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlVFU').css('background-color', '#ffff'); }
    var count = 0;
    $('#tblMembersD tbody tr').each(function () {
        if ($(this).find("input:checkbox").is(":checked")) {
            count += 1;
        }

    });

    if (count == 0) {
        flag = false;
    }
    if (flag) { return true } else {
        toastr.warning("Enter Information in Red Backgrounds !", "LIVE-MIS: Form Validation", { closeButton: !0 });
        return false;
    }
}
function Clear() {
    $('#ddlPkg').val('-1').trigger('change');
    $('#dvInsideModal').html('');
    $('#mdVFUMembers').modal('hide');
    //$('#txtContactNo').val('');
    //$(':submit').show();
    //$('#btnUpdate').hide();
    //$('#btnDelete').hide();
    //$('#hdnBenefId').val('');
}
function BuilModal() {
    $('<div>', {
        'class': 'modal fade text-xs-left',
        'Id': 'mdVFUMembers',
        'role': 'dialog',
        'aria-labelledby': 'myModalLabel4',
        'aria-hidden': 'true',
        'html': $('<div>', {
            'class': 'modal-dialog modal-xl',
            'role': 'document',
            'html': $('<div>', {
                'class': 'modal-content',
                'html': $('<div>', {
                    'class': 'modal-header', 'html': $('<button>', {
                        'class': 'close', 'data-dismiss': 'modal', 'aria-label': 'Close'
                    }).add($('<h4>', { 'class': 'modal-title', 'text': 'Inputs Distribution Report' }))

                }).add($('<div>', {
                    'class': 'modal-body',
                    'html': $('<div>', {
                        'class': 'form-body',
                        'html': $('<div>', {
                            'class': '',
                            'Id': 'dvInsideModal'

                        })

                    })
                      .add($('<div>', {
                          'class': 'modal-footer',
                          'html': $('<button>', {
                              'class': 'btn grey btn-outline-secondary',
                              'data-dismiss': 'modal',
                              'text': 'Close',
                              'Id': 'btnClose'
                          })
                      }))

                })
            )
            })
        })
    }).appendTo('div[id="modalMembers"]');
}