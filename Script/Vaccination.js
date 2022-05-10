$(function () {
    //getIPs();
    //getSubActivity();
    $('select.form-control:not(.duallistbox)').select2({ containerCssClass: "select-xs" });
    $("#txtDate").dateDropper({ dropWidth: 200, maxYear: "2020" });
    $('#dvDetails :input').attr('disabled', 'disabled');
    $(".province").change(function () {

        if ($(this).val() == "-1") {
            $("#ddlDistrict").attr("disabled", "disabled");
        }
        else {
            $("#ddlDistrict").attr("disabled", false);
            //ShowControlsByRoles();
            $.ajax({
                type: "POST",
                url: "Vaccination.aspx/GetDistrict",
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
    // $(".chk-select").iCheck({ checkboxClass: "icheckbox_square-blue" });
    $('#ddlDistrict').change(function () {
        if ($(this).val() == "-1") {
            $('#ddlVFU').attr("disabled", "disabled");
        }
        else {

            getVFUs();
        }
    });
    $('#ddlVFU').on("change", function (e) {
        e.preventDefault();
        $('#dvDetails :input').removeAttr("disabled");
        if ($(this).val() == 'new') {
            $('<div>', {
                'class': 'modal fade text-xs-left',
                'Id': 'mdVFUInsertion',
                'role': 'dialog',
                'aria-labelledby': 'myModalLabel4',
                'aria-hidden': 'true',
                'html': $('<div>', {
                    'class': 'modal-dialog',
                    'role': 'document',
                    'html': $('<div>', {
                        'class': 'modal-content',
                        'html': $('<div>', {
                            'class': 'modal-header', 'html': $('<button>', {
                                'class': 'close', 'data-dismiss': 'modal', 'aria-label': 'Close'
                            }).add($('<h4>', { 'class': 'modal-title', 'text': 'Add New VFU Details' }))

                        }).add($('<div>', {
                            'class': 'modal-body',
                            'html': $('<div>', {
                                'class': 'form-body',
                                'html': $('<div>', {
                                    'class': 'form-group row',
                                    'html': $('<span>', {
                                        'class': 'col-md-3 label-control', 'text': 'VFU Name'
                                    })
                                    .add($('<div>', {
                                        'class': 'col-md-9',
                                        'html': $('<input>', {
                                            'Id': 'txtVFUName',
                                            'class': 'form-control'
                                        })
                                    }))

                                }).add($('<div>', {
                                    'class': 'form-group row',
                                    'html': $('<span>', {
                                        'class': 'col-md-3 label-control', 'for': 'txtFName', 'text': 'VFU Father Name'
                                    })
                                        .add($('<div>', {
                                            'class': 'col-md-9',
                                            'html': $('<input>', {
                                                'Id': 'txtFName',
                                                'class': 'form-control',
                                                'placeholder': 'VFU Father Name'
                                            })
                                        }))


                                }))
                                .add($('<div>', {
                                    'class': 'form-group row',
                                    'html': $('<span>', {
                                        'class': 'col-md-3 label-control', 'for': 'txtMob', 'text': 'VFU Contact Number'
                                    })
                                        .add($('<div>', {
                                            'class': 'col-md-9',
                                            'html': $('<input>', {
                                                'Id': 'txtMob',
                                                'class': 'form-control',
                                                'placeholder': 'VFU Contact Number'
                                            })
                                        }))


                                }))

                            })
                              .add($('<div>', {
                                  'class': 'modal-footer',
                                  'html': $('<button>', {
                                      'class': 'btn grey btn-outline-secondary',
                                      'data-dismiss': 'modal',
                                      'text': 'Close',
                                      'Id': 'btnClose'
                                  })
                                  .add($('<button>', {
                                      'class': 'btn btn-outline-primary',
                                      'text': 'Save changes',
                                      'Id': 'btnSaveVFU'
                                  }))
                              }))

                        })
                    )
                    })
                })
            }).appendTo('div[id="modald"]');

            $('#mdVFUInsertion').modal('show');
            $('#btnClose').unbind("click").on('click', function (e) {
                e.preventDefault();
                $('#ddlVFU').val('-1').trigger("change");
            });
            $('#btnSaveVFU').unbind("click").on('click', function (e) {
                e.preventDefault();
                if (validateVFUInsertionForm(e)) {
                    SaveVFU();
                }
            });
        }

        //.add($('<div>', {
        //    'class': 'col-md-9', 'html': $('<select>').attr("id", "ddlPoultryType").addClass('form-control').append($("<option></option>").val('1').html('Layer')).append($("<option></option>").val('2').html('Broiler'))
        //}))
    });

    //$(document).bind('keydown', 'Ctrl+s', function (e) {
    //    e.preventDefault();
    //    e.stopImmediatePropagation();
    //    alert('hi');
    //    $('#btnSaveIP').trigger('click');
    //    return false;
    //});

    $('#btnSave').click(function (e) {
        e.preventDefault();
        if (formValidation(e)) {
            SaveVaccinationD();
        }
    });
    $('#btnCancel').click(function () {
        e.preventDefault();
        clear();
    });
    $('input:radio[name^="LType"]').change(function (e) {
        e.preventDefault();
        if ($(this).val() == 'Village') {
            $('input:text[id^="txtVillage"]').removeAttr("disabled");
        } else {
            $('input:text[id^="txtVillage"]').attr("disabled", "disabled");
        }
    });
    $('#btnAddItem').on('click', function (e) {
        e.preventDefault();
        if (validateVaccineDetailInsertionsForm(e)) {
            var count = $('#tblV tbody tr').length;
            var chkValue = $('input:radio[name^="LType"]:checked').val();
            if (chkValue == "Village")
                var village = $('#txtVillage').val();
            else
                var village = "kochi";
            var markup = "<tr><td><input type='checkbox' name='record'></td><td>" + (count + 1) + "</td><td><span>" + $('#txtDate').val() + "</span></td><td><span>" + village + "</span></td><td><span>" + $('#txtOwner').val() + "</span></td><td><span>" + $('#txtSheep').val() + "</span></td><td><span>" + $('#txtGoat').val() + "</span></td><td><span>" + $('#txtCattle').val() + "</span><span style='display:none'>" + $('#txtContactNumber').val() + "</span></td></tr>";
            $("#tblV tbody").append(markup);
            clearInsRow();
        }

    });
    $("#btnRemoveItem").click(function (e) {
        e.preventDefault();
        $("#tblV tbody").find('input[name="record"]').each(function () {
            if ($(this).is(":checked")) {
                $(this).parents("tr").remove();
            }
        });
    });
    $('#btnSearch').on('click', function (e) {
        e.preventDefault();
        if ($('#txtDate').val() != '' && $('#ddlVFU').val() != "-1") {
            SearchRecords($('#txtDate').val(), $('#ddlDistrict').val(), $('#ddlVFU').val());
        }
    });
});

function SaveVFU() {

    $.ajax({
        type: "POST",
        url: "Vaccination.aspx/SaveVFUDetail",
        data: JSON.stringify({ Name: $('#txtVFUName').val(), FName: $('#txtFName').val(), Mob: $('#txtMob').val(), Year: $('#ddlYear').val(), DistrictId: $('#ddlDistrict').val() }),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        async: true,
        success: function (data) {
            $('#txtVFUName').val('');
            $('#txtFName').val('');
            $('#txtMob').val('');
            getVFUs();
            $('#ddlVFU option[value=' + data.d + ']').removeAttr("selected").attr("selected", "selected").trigger('change');
            //  setSelectedIndex(document.getElementById("ddlIP"), "16");
            $('#mdVFUInsertion').modal('hide');
            toastr.success("VFU Information is successfully saved to the system !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
        },
        error: function (data) {
            alert("error found");
        }

    });



}
function getVFUs() {
    var jsonObj = JSON.stringify({ DistrictID: $("#ddlDistrict").val(), Year: $('#ddlYear').val() });
    // Village Dropdown list
    $.ajax({
        type: "POST",
        url: "Vaccination.aspx/GetVFU",
        data: jsonObj,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $('#ddlVFU option').remove();
            $.each(data.d, function (key, value) {
                $('#ddlVFU').append($("<option></option>").val(value.Id).html(value.Name));
            });
            $('#ddlVFU').append("<option value='new'>Add New VFU</option>");
            $('#ddlVFU').prepend("<option value='-1' selected='true'>-Select VFU-</option>");
            $('#ddlVFU option:first').attr("selected", "selected");
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function validateVFUInsertionForm(e) {

    var flag = true;
    if ($('#txtVFUName').val() == '') {
        $('#txtVFUName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtVFUName').css('background-color', '#ffff'); }

    if ($('#txtFName').val() == '') {
        $('#txtFName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtFName').css('background-color', '#ffff'); }

    if ($('#txtMob').val() == '') {
        $('#txtMob').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtMob').css('background-color', '#ffff'); }

    if ($('#ddlYear').val() == '-1') {
        $('#ddlYear').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlYear').css('background-color', '#ffff'); }


    if (flag) { return true } else {
        toastr.warning("Please enter informations in red background OR You Missed Items !", "INV-MIS: Validation Alert !", { progressBar: !0 });
        return false;
    }
}
function validateVaccineDetailInsertionsForm(e) {

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
    if ($('#ddlVFU').val() == '-1' || $('#ddlVFU').val() == 'new') {
        $('#ddlVFU').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlVFU').css('background-color', '#ffff'); }

    if ($('#txtDate').val() == '') {
        $('#txtDate').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtDate').css('background-color', '#ffff'); }

    if ($('#txtOwner').val() == '') {
        $('#txtOwner').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtOwner').css('background-color', '#ffff'); }

    if ($('#txtSheep').val() == '') {
        $('#txtSheep').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtSheep').css('background-color', '#ffff'); }

    if ($('#txtGoat').val() == '') {
        $('#txtGoat').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtGoat').css('background-color', '#ffff'); }

    if ($('#txtCattle').val() == '') {
        $('#txtCattle').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtCattle').css('background-color', '#ffff'); }
    if ($('#txtContactNumber').val() == '') {
        $('#txtContactNumber').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtContactNumber').css('background-color', '#ffff'); }

    if ($('input:radio[name^="LType"]:checked').val() == 'Village') {
        if ($('#txtVillage').val() == '') {
            $('#txtVillage').css('background-color', '#FFAAAA');
            flag = false;
        }
        else { $('#txtVillage').css('background-color', '#ffff'); }
    }


    if (flag) { return true } else {
        toastr.warning("Please enter informations in red background OR You Missed Items !", "INV-MIS: Validation Alert !", { progressBar: !0 });
        return false;
    }
}
function clearInsRow() {
    //$('#txtDate').val('');
    //$('#txtVillage').val('');
    $('#txtOwner').val('');
    $('#txtSheep').val('');
    $('#txtGoat').val('');
    $('#txtCattle').val('');
    $('#txtContactNumber').val('');
}
function SaveVaccinationD() {
    var formDetails = {};
    formDetails.VFUId = $('#ddlVFU').val();
    formDetails.DistrictId = $('#ddlDistrict').val();
    var lst = new Array();
    $('#tblV tbody tr').each(function () {
        var detail = {};
        var tr = $(this);
        detail.Date = $($(tr).find('span:eq(0)')).html();
        detail.Village = $($(tr).find('span:eq(1)')).html();
        detail.Owner = $($(tr).find('span:eq(2)')).html();
        detail.Sheep = $($(tr).find('span:eq(3)')).html();
        detail.Goat = $($(tr).find('span:eq(4)')).html();
        detail.Cattle = $($(tr).find('span:eq(5)')).html();
        detail.Mob = $($(tr).find('span:eq(6)')).html();
        lst.push(detail);
    });

    formDetails.Vaccinelst = lst;
    $.ajax({
        type: "POST",
        url: "Vaccination.aspx/SaveVaccination",
        data: JSON.stringify({ formDetails: formDetails }),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            toastr.success("Vaccination details for the mentioned VFU is successfully saved to the system !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
            $('#tblV tbody tr').remove()
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function SearchRecords(date,districtId,Vfu) {
    var jsonObj = JSON.stringify({ DistrictID: districtId, Date: date,VFUId:Vfu });
    // Village Dropdown list
    $.ajax({
        type: "POST",
        url: "Vaccination.aspx/GetRecords",
        data: jsonObj,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            BuilModal();
            var $table = "<table id='tblVfuVaccination' width='100%' class='table table-xs table-striped table-bordered  table-hover mb-0'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Vaccination date</th><th style='text-align:center;'>Village/Kochi</th><th style='text-align:center;'>Owner Name</th><th style='text-align:center;'>Mobile</th><th style='text-align:center;'>Sheep</th><th style='text-align:center;'>Goat</th><th style='text-align:center;'>Cattle</th><th></th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var vlg = (x.IsKochi == true ? "Kochi" : x.Village);
                var row = "<tr ><td style='text-align:center;'>" + count + "<span id='spanSeedPlantedId' style='display:none'>" + x.VFUId + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.VFUName + "  </span></td>" +
                    "<td style='text-align:center;'><span>" + x.Date + "</span></td>" +
                   "<td style='text-align:center;'><span>" + vlg + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Owner + "</span></td>" +
                    "<td style='text-align:center;'><span>" + x.Mob + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Sheep + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Goat + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Cattle + "</span></td>" +
                   (x.Edit == true ? "<td><a onclick='RemoveD(this)' class='btn-sm btn-danger' href='#'>Delete<i class='icon-trash4'></i></a><span id='spID' style='display:none'>" + x.VFUId + "</span></td>" : "<td></td>") +
                   "</tr>";
                $table += row;
                count++;
            });
            $('#dvInsideModalSearch').html($table);
            $table += "</table>";
            $('#tblVfuVaccination').DataTable({  "scrollCollapse": true, "paging": true, "ordering": true });
          
            $('#mdVFUVaccination').modal('show');

        },
        error: function (data) {
            alert("error found");
        }

    });
}
function clear() {
    $('#tblV tbody tr').remove();
}
function formValidation() {
    var flag = true;
    if ($('#ddlVFU').val() == '-1') {
        $('#ddlVFU').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlVFU').css('background-color', '#ffff'); }
    if ($('#ddlYear').val() == '-1') {
        $('#ddlYear').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlYear').css('background-color', '#ffff'); }

    if ($('.province').val() == '-1') {
        $('.province').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('.province').css('background-color', '#ffff'); }

    if ($('#tblV tbody tr').length == 0) {
        flag = false;
    }
    if (flag) { return true } else {
        toastr.warning("Please check the required fields ,Enter valid informations  !", "INV-MIS: Validation Alert !", { progressBar: !0 });
        return false;
    }
}
function BuilModal() {
    $('<div>', {
        'class': 'modal fade text-xs-left',
        'Id': 'mdVFUVaccination',
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
                    }).add($('<h4>', { 'class': 'modal-title', 'text': 'VFU Vaccination Activity Report' }))

                }).add($('<div>', {
                    'class': 'modal-body',
                    'html': $('<div>', {
                        'class': 'form-body',
                        'html': $('<div>', {
                            'class': '',
                            'Id':'dvInsideModalSearch'

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
    }).appendTo('div[id="modalSearch"]');
}
function RemoveD(obj) {
    if (confirm("Are you sure to delete the selected record ?")) {
        var tr = obj.parentNode.parentNode;
        var formDetails = {};
        formDetails.VFUId = $($(tr).find('span:eq(0)')).html();
        formDetails.Village = $($(tr).find('span:eq(3)')).html();
        formDetails.Owner = $($(tr).find('span:eq(4)')).html();
        formDetails.Date = $($(tr).find('span:eq(2)')).html();

        var jobj = JSON.stringify({ formDetails: formDetails });
        $.ajax({
            type: "POST",
            url: "Vaccination.aspx/DeleteRecord",
            data: jobj,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                toastr.success("Vaccination details  is successfully deleted from the system !", "LIVE-MIS: Record is Deleted!", { closeButton: !0 });
                SearchRecords($('#txtDate').val(), $('#ddlDistrict').val(), $('#ddlVFU').val());
            },
            error: function (data) {
                alert("error found");
            }

        });
    }
}