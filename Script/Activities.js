$(function () {

    getSubActivity();
    $('select.form-control:not(.duallistbox)').select2({ containerCssClass: "select-xs" });
    //$(".icheck1 input").iCheck('check');
    // $(".chk-remember").iCheck({ checkboxClass: "icheckbox_square-blue", radioClass: "iradio_square-blue" });
    // $("tblBenefActvtyD .icheck2 input").iCheck({ checkboxClass: "icheckbox_minimal", radioClass: "iradio_minimal" });
    $("#tblBenefActvtyD").on("click", '#checkAll', function () {
       
        //Determine the reference CheckBox in Header row.
        var chkAll = this;

        //Fetch all row CheckBoxes in the Table.
        var chkRows = $("#tblBenefActvtyD").find(".chkRow");

        //Execute loop over the CheckBoxes and check and uncheck based on
        //checked status of Header row CheckBox.
        chkRows.each(function () {
            $(this)[0].checked = chkAll.checked;
        });
    });
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
                url: "ActivityInfo.aspx/GetDistrict",
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
                    $('#ddlVillage option').remove();
                },
                error: function (data) {
                    alert("error found");
                }
            });
        }
    });
    $(".province,#ddlYear,#ddlSActivity").on("change", function () {
        if ($(".province").val() != "-1" && $("#ddlYear").val() != "-1" && $("#ddlSActivity").val() != "-1") {
            getIPByProvince($('.province').val(), $('#ddlYear').val(), $("#ddlSActivity").val());
        } else {
            $('#ddlIP option').remove();
        }
    });
    $('#ddlDistrict').change(function () {
        if ($(this).val() == "-1") {
            $('#ddlVillage option').remove();
        }
        else {
            var jsonObj = JSON.stringify({ DistrictID: $("#ddlDistrict").val() });
            // Village Dropdown list
            $.ajax({
                type: "POST",
                url: "ActivityInfo.aspx/GetVillage",
                data: jsonObj,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    $('#ddlVillage option').remove();
                    $.each(data.d, function (key, value) {
                        $('#ddlVillage').append($("<option></option>").val(value.VillageName).html(value.VillageName));
                    });
                    $('#ddlVillage').prepend("<option value='-1' selected='true'>-Select Village-</option>");
                    $('#ddlVillage option:first').attr("selected", "selected");
                },
                error: function (data) {
                    alert("error found");
                }

            });

        }
    });
    $("#ddlDistrict,#ddlYear,#ddlSActivity,#ddlVillage,#ddlIP").on("change", function () {
        if ($("#ddlDistrict").val() && $("#ddlDistrict").val() != "-1" && $("#ddlYear").val() != "-1" && $("#ddlSActivity").val() != "-1" && $("#ddlVillage").val() != "-1" && $("#ddlVillage").val() && $("#ddlIP").val() != "-1" && $("#ddlIP").val()) {
            ShowBenefActivityDList($('#ddlDistrict').val(), $('#ddlVillage').val(), $("#ddlIP").val(), $("#ddlSActivity").val(), $("#ddlYear").val());
        } else {
            $('#dvBen_Act_Detail').html('');
        }
    });
    $('#ddlSActivity').on('change', function () {

        alert($(this).val());

        if ($(this).val() == "4") {
            clearDynamicControls();
            $('<div>', {
                'class': 'form-group row',
                'html': $('<span>', { 'class': 'col-md-3 label-control', 'text': 'Poultry Type' })
                        .add($('<div>', {
                            'class': 'col-md-9', 'html': $('<select>').attr("id", "ddlPoultryType").addClass('form-control').append($("<option></option>").val('1').html('Layer')).append($("<option></option>").val('2').html('Broiler'))
                        }))
            }).insertAfter($('#ddlSActivity').parent('div').parent('div'));

            //remove others
            $('#txtPercentage').parent('div').parent('div').remove();
            $('#txtPkgAmount').parent('div').parent('div').remove();
            $('#txtFCAmount').parent('div').parent('div').remove();
            $('#ddlRegional').parent('div').parent('div').remove();
        }

        else if ($(this).val() == "6" || $(this).val() == "7" || $(this).val() == "8") {
            clearDynamicControls();
            var per = 0;
            if ($('#ddlYear').val() == "2017" || $('#ddlYear').val() == "2018" || $('#ddlYear').val() == "2019" || $('#ddlYear').val() == "2020") {
                if ($(this).val() == '8')
                    per = 10;                
                if ($(this).val() == '7')
                    per = 15;
                if ($(this).val() == '6')
                    per = 25;
            }
            //per
            $('<div>', {
                'class': 'form-group row',
                'html': $('<span>', { 'class': 'col-md-3 label-control', 'text': 'Contribution Percentage' })
                        .add($('<div>', {
                            'class': 'col-md-9', 'html': $('<input>').attr("id", "txtPercentage").attr("disabled", "disabled").addClass('form-control').val(per)
                        }))
            }).insertAfter($('#ddlVillage').parent('div').parent('div'));

            //pkg amount
            $('<div>', {
                'class': 'form-group row',
                'html': $('<span>', { 'class': 'col-md-3 label-control', 'text': 'Package Amount' })
                        .add($('<div>', {
                            'class': 'col-md-9', 'html': $('<input>').attr("id", "txtPkgAmount").addClass('form-control')
                        }))
            }).insertAfter($('#txtPercentage').parent('div').parent('div'));

            //FC amount
            $('<div>', {
                'class': 'form-group row',
                'html': $('<span>', { 'class': 'col-md-3 label-control', 'text': 'Contributional Amount' })
                        .add($('<div>', {
                            'class': 'col-md-9', 'html': $('<input>').attr("id", "txtFCAmount").attr("disabled", "disabled").addClass('form-control')
                        }))
            }).insertAfter($('#txtPkgAmount').parent('div').parent('div'));

            //regional officer
            $('<div>', {
                'class': 'form-group row',
                'html': $('<span>', { 'class': 'col-md-3 label-control', 'text': 'Responsible Regional Officer' })
                        .add($('<div>', {
                            'class': 'col-md-9', 'html': $('<select>').attr("id", "ddlRegional").addClass('form-control')
                        }))
            }).insertAfter($('#txtFCAmount').parent('div').parent('div'));

            getRegionals();

            //perc
            var mtotal = 0;
            $('#txtPkgAmount').keyup(function () {
                if ($('#txtPercentage').val() != '') {
                    mtotal = parseFloat($(this).val()) * parseFloat($('#txtPercentage').val()) / 100;
                    $('#txtFCAmount').val(mtotal.toString());
                }
            });
            //remove other
            $('#ddlPoultryType').parent('div').parent('div').remove();

        }
        else {
            $('#ddlPoultryType').parent('div').parent('div').remove();
            $('#txtPercentage').parent('div').parent('div').remove();
            $('#txtPkgAmount').parent('div').parent('div').remove();
            $('#txtFCAmount').parent('div').parent('div').remove();
            $('#ddlRegional').parent('div').parent('div').remove();
        }
    });

    
    $(':submit').click(function (e) {
        e.preventDefault();

        if (formValidation(e)) {
            SaveDetail();
        }
    });
    $('#btnCancel').click(function () {
        e.preventDefault();
        clear();
    });


});
function getSubActivity() {
    $.ajax({
        type: "POST",
        url: "ActivityInfo.aspx/GetSubActivity",
        data: '',
        async: true,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $('#ddlSActivity').empty();
            $.each(data.d, function (key, value) {
                $('#ddlSActivity').append($("<option></option>").val(value.SActivityId).html(value.SActivityName));
            });
            $('#ddlSActivity').prepend("<option value='-1' selected='true'>-Select-</option>");
            $('#ddlSActivity option:first').attr("selected", "selected");
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function getRegionals() {
    $.ajax({
        type: "POST",
        url: "ActivityInfo.aspx/GetRegionals",
        data: '{ProvinceId:' + $('.province').val() + '}',
        async: true,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $('#ddlRegional').empty();
            $.each(data.d, function (key, value) {
                $('#ddlRegional').append($("<option></option>").val(value.Id).html(value.Name));
            });
            $('#ddlRegional').prepend("<option value='-1' selected='true'>-Select-</option>");
            $('#ddlRegional option:first').attr("selected", "selected");
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function getIPByProvince(pro, year, SAct) {
    $.ajax({
        type: "POST",
        url: "ActivityInfo.aspx/GetIPByProvince",
        data: '{Year:' + year + ',ProvinceId:' + pro + ',SAct:' + SAct + '}',
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
            $('#ddlIP option:first').attr("selected", "selected");
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
            var $table = "<table id='tbl' width='50%'  class='table table-striped table-bordered '>";
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
function SelectAllCheckboxes(chk) {
    $('#tblBenefActvtyD').find("input:checkbox").each(function () {
        if (this != chk) {
            this.checked = chk.checked;
            Checkbox(this);
        }
    });
}
function Checkbox(chk) {
    var Tr = $(chk).closest('tr');
    if (chk.checked) {
        $(Tr).find("select").removeAttr("disabled");
    } else {
        $(Tr).find("select").attr("disabled", "disabled");
    }
}
function ShowBenefActivityDList(DistrictId, Village, IPId, S_ActivityId, Year) {
    var obj = JSON.stringify({ DistrictId: DistrictId, Village: Village, IPId: IPId, S_ActivityId: S_ActivityId, Year: Year });
    $.ajax({
        type: "POST",
        url: "ActivityInfo.aspx/GetBenefActivityDList",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblBenefActvtyD'  width='100%' class='table table-xs table-striped table-bordered  table-hover mb-0'>";
            var header = "<thead class='bg-grey-blue'><tr ><th>SN</th><th style='text-align:center;'> <input type='checkbox' name='checkAll' class='all'/> Check All </th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Mobile Number</th><th style='text-align:center;'>Financial Status</th><th style='text-align:center;'>Security Status</th><th style='text-align:center;'>Income Source</th><th style='text-align:center;'>Remove Record</th></tr></thead>";
            $table += header;
            $table += "<tbody>";
            var count = 1;
            var flag = 0;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "</td><td><span  style='display:none'>" + x.BenefId + "</span>  <input type='checkbox' class='selector' name='rowChk' class='chkRow' " + (x.IsExist == 'True' ? "checked" : "") + "/></td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FName + "  </span></td>" +
                    "<td style='text-align:center;'><span>" + x.Mob + "  </span></td>" +
                   "<td style='text-align:center;'><select id='ddlFS' class='form-control' " + (x.IsExist == 'True' ? "" : "disabled") + "><option value='Very Weak' " + (x.Fin_S == 'Very Weak' ? "selected='selected'" : "") + " >Very Weak</option><option value='Weak' " + (x.Fin_S == 'Weak' ? "selected='selected'" : "") + " >Weak</option><option value='Strong' " + (x.Fin_S == 'Strong' ? "selected='selected'" : '') + " >Strong</option></td>" +
                   "<td style='text-align:center;'><select id='ddlSS' class='form-control' " + (x.IsExist == 'True' ? "" : "disabled") + "><option value='Poor' " + (x.Sec_S == 'Poor' ? "selected='selected'" : "") + " >Poor</option><option value='Fair' " + (x.Sec_S == 'Fair' ? "selected='selected'" : "") + " >Fair</option><option value='Good' " + (x.Sec_S == 'Good' ? "selected='selected'" : "") + " >Good</option></td>" +
                   "<td style='text-align:center;'><select id='ddlIS' class='form-control' " + (x.IsExist == 'True' ? "" : "disabled") + "><option value='Laborer' " + (x.Inc_S == 'Laborer' ? "selected='selected'" : '') + " >Laborer</option><option value='Farmer' " + (x.Inc_S == 'Farmer' ? "selected='selected'" : "") + " >Farmer</option><option value='Worker' " + (x.Inc_S == 'Worker' ? "selected='selected'" : "") + " >Worker</option></td>" +
                   (x.Edit == true ? "<td>Delete</td>" : "<td></td>") +
                   "</tr>";
                $table += row;
                count++;
                if (x.IsExist == 'True')
                    flag = 1;
            });
            $('#dvBen_Act_Detail').html($table);
            $('#tblBenefActvtyD').DataTable({
                "scrollY": '50vh', "scrollX": '20vh', "scrollCollapse": true, "paging": false, "ordering": false, "fnDrawCallback": function (oSettings) {
                    $('input[type="checkbox"]').iCheck({
                        checkboxClass: 'icheckbox_square-blue'
                    });
                    $('select.form-control').select2({ containerCssClass: "select-xs" });
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
                        //else if (e.target.name == 'checkAll') {

                        //    //}).on('ifToggled', function (event) {
                        //    //    var chkToggle;
                        //    //    $(this).is(':checked') ? chkToggle = "check" : chkToggle = "uncheck";
                        //    //    $('input.selector:not(.all)').iCheck(chkToggle);
                        //    //});

                        //}
                    });
                }
            });
            $table += "</tbody></table>";
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
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function SaveDetail() {
    var formDetail = {};
    formDetail.DistrictId = $('#ddlDistrict').val();
    formDetail.SActivity = $('#ddlSActivity').val();
    if ($('#ddlSActivity').val() == "10") formDetail.SubSubActivityType = $('#ddlPoultryType').val(); else formDetail.SubSubActivityType = null;
    if ($('#ddlSActivity').val() == "6" || $('#ddlSActivity').val() == "7" || $('#ddlSActivity').val() == "8") {
        formDetail.FcAmount = $('#txtFCAmount').val();
        formDetail.PkgAmount = $('#txtPkgAmount').val();
        formDetail.Percentage = $('#txtPercentage').val();
        formDetail.OfficerId = $('#ddlRegional').val();
    }
    formDetail.IP = $('#ddlIP').val();
    formDetail.Year = $('#ddlYear').val();
    formDetail.Village = $('#ddlVillage').val();
    var lst = new Array();
    $('#tblBenefActvtyD tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:checkbox").is(":checked")) {
            detail.BenefId = $($(this).find('span:eq(0)')).html();
            detail.Fin_S = $(this).find("select[id^='ddlFS']").val();
            detail.Sec_S = $(this).find("select[id^='ddlSS']").val();
            detail.Inc_S = $(this).find("select[id^='ddlIS']").val();

            lst.push(detail);
        }
    });
    formDetail.BenefList = lst;

    var jsonObject = JSON.stringify({ formDetails: formDetail });

    $.ajax({
        type: "POST",
        url: "ActivityInfo.aspx/SaveDetail",
        data: jsonObject,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            toastr.success("IP Information is successfully saved to the system !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
            clear();
           // $('#btnDelete').remove();
        },
        error: function (data) {
            alert("error found");
        }

    });



}
function clearDynamicControls() {
    $('#txtPercentage').parent('div').parent('div').remove();
    $('#txtPkgAmount').parent('div').parent('div').remove();
    $('#txtFCAmount').parent('div').parent('div').remove();
    $('#ddlRegional').parent('div').parent('div').remove();
    $('#ddlPoultryType').parent('div').parent('div').remove();
}
function DeleteAll() {
    var formDetail = {};
    formDetail.DistrictId = $('#ddlDistrict').val();
    formDetail.SActivity = $('#ddlSActivity').val();
    formDetail.IP = $('#ddlIP').val();
    formDetail.Year = $('#ddlYear').val();
    formDetail.Village = $('#ddlVillage').val();
    var jsonObject = JSON.stringify({ formDetails: formDetail });
    $.ajax({
        type: "POST",
        url: "ActivityInfo.aspx/ActivityInfoDelete",
        data: jsonObject,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            toastr.success("Activity Informations are successfully Deleted from system !", "LIVE-MIS:Deleted!", { closeButton: !0 });
            clear();
            //$('#btnDelete').remove();

        },
        error: function (data) {
            alert("error found");
        }

    });



}
function clear() {
    $('#ddlVillage').val('-1').trigger("change");
    $('#ddlIP').val('-1').trigger("change");
    //$('#ddlYear').val('-1').trigger("change");
    //$('#ddlActivity option:selected').prop("selected", false).trigger("change");

    $('#tblBenefActvtyD tbody tr').remove();
    $(':button[id^="btnDelete"]').remove();
}
function formValidation() {
    var flag = true;
    var invalid = "";
    if ($('.province').val() == '-1') {
        $('.province').css('background-color', '#FFAAAA');
        flag = false;
        invalid += "*. province Name";
    }
    else { $('.province').css('background-color', '#ffff'); }

    if ($('#ddlIP').val() == '-1') {
        $('#ddlIP').css('background-color', '#FFAAAA');
        flag = false;
        invalid += "<br/>*. IP Name";
    }
    else { $('#ddlIP').css('background-color', '#ffff'); }


    if ($('#ddlYear').val() == '-1') {
        $('#ddlYear').css('background-color', '#FFAAAA');
        flag = false;
        invalid += "<br/>*. Year";
    }
    else { $('#ddlYear').css('background-color', '#ffff'); }

    if ($('#ddlDistrict').val() == '-1') {
        $('#ddlDistrict').css('background-color', '#FFAAAA');
        flag = false;
        invalid += "<br/>*. District Name";
    }
    else { $('#ddlDistrict').css('background-color', '#ffff'); }

    if ($('#ddlSActivity').val() == '-1') {
        $('#ddlSActivity').css('background-color', '#FFAAAA');
        flag = false;
        invalid += "<br/>*. Activity Name";
    }
    else { $('#ddlSActivity').css('background-color', '#ffff'); }

    if ($('#ddlVillage').val() == '-1') {
        $('#ddlVillage').css('background-color', '#FFAAAA');
        flag = false;
        invalid += "<br/>*. Village Name";
    }
    else { $('#ddlVillage').css('background-color', '#ffff'); }

    if ($('#ddlSActivity').val() == "4") {
        if ($('#ddlPoultryType').val() == '-1') {
            $('#ddlPoultryType').css('background-color', '#FFAAAA');
            flag = false;
            invalid += "<br/>*. PoultryType";
        }
        else { $('#ddlPoultryType').css('background-color', '#ffff'); }
    }
    else if ($('#ddlSActivity').val() == "6" || $('#ddlSActivity').val() == "7" || $('#ddlSActivity').val() == "8") {
        if ($('#txtPercentage').val() == '') {
            $('#txtPercentage').css('background-color', '#FFAAAA');
            flag = false;
            invalid += "<br/>*. Percentage";
        }
        else { $('#txtPercentage').css('background-color', '#ffff'); }

        if ($('#txtPkgAmount').val() == '') {
            $('#txtPkgAmount').css('background-color', '#FFAAAA');
            flag = false;
            invalid += "<br/>*. Total amount";
        }
        else { $('#txtPkgAmount').css('background-color', '#ffff'); }

        if ($('#txtFCAmount').val() == '') {
            $('#txtFCAmount').css('background-color', '#FFAAAA');
            flag = false;
            invalid += "<br/>*. Contributional Amount";
        }
        else { $('#txtFCAmount').css('background-color', '#ffff'); }

        if ($('#ddlRegional').val() == '-1') {
            $('#ddlRegional').css('background-color', '#FFAAAA');
            flag = false;
            invalid += "<br/>*. Regional Officer";
        }
        else { $('#ddlRegional').css('background-color', '#ffff'); }

    }

    var count = 0;
    $('#tblBenefActvtyD tbody tr').each(function () {
        if ($(this).find("input:checkbox").is(":checked")) {
            count += 1;
        }

    });

    if (count == 0) {
        flag = false;
        invalid += "<br/>*.Check Some Valued in table";
    }
    if (flag) { return true } else {
        toastr.warning("Please check the required fields ,Enter valid informations  ! Here Are Details : <br/>" + invalid, "LIVE-MIS: Validation Alert !", { progressBar: !0 });

        return false;
    }
}


//function validateIPInsertionForm(e) {

//    var flag = true;


//    if ($('#txtIPName').val() == '') {
//        $('#txtIPName').css('background-color', '#FFAAAA');
//        flag = false;
//    }
//    else { $('#txtIPName').css('background-color', '#ffff'); }

//    if (flag) { return true } else {
//        toastr.warning("Please enter informations in red background OR You Missed Items !", "INV-MIS: Validation Alert !", { progressBar: !0 });
//        return false;
//    }
//}
//function setSelectedIndex(s, valsearch) {

//    // Loop through all the items in drop down list

//    for (i = 0; i < s.options.length; i++) {

//        if (s.options[i].value == valsearch) {

//            // Item is found. Set its property and exit

//            s.options[i].selected = true;

//            break;

//        }

//    }

//    return;

//}
//function SaveIpProvinceD() {
//    var formDetails = {};
//    // formDetails.IS_By = $('#txtIssuedBy').val();
//    formDetails.IPId = $('#ddlIP').val();
//    formDetails.Year = $('#ddlYear').val();
//    var activitieslst = new Array();
//    if ($('#ddlActivity :selected').length > 0) {
//        $('#ddlActivity :selected').each(function (i, selected) {
//            var detail = {};
//            detail.SubId = $(selected).val();
//            activitieslst.push(detail);
//        });
//    }
//    console.log(activitieslst);
//    var provinceslst = new Array();
//    $('#tbl tbody tr').each(function () {
//        var detail = {};
//        if ($(this).find("input:checkbox").is(":checked")) {
//            var tr = $(this).closest('tr');
//            detail.ProvinceID = $($(tr).find('span:eq(1)')).html();
//            provinceslst.push(detail);
//        }
//    });

//    formDetails.ActivityArray = activitieslst;
//    formDetails.ProvinceArray = provinceslst;
//    $.ajax({
//        type: "POST",
//        url: "IPManagement.aspx/SaveIPProvinceD",
//        data: JSON.stringify({ formDetails: formDetails }),
//        dataType: "json",
//        contentType: "application/json; charset=utf-8",
//        success: function (data) {
//            toastr.success("Province Details for relevant IP  is successfully saved to the system !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
//            clear();
//        },
//        error: function (data) {
//            alert("error found");
//        }

//    });
//}