<%@ Page Title="FCMIS:Farmers" EnableEventValidation="false" Language="C#" EnableViewState="true" ViewStateMode="Enabled" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="BrucellosisImport.aspx.cs" Inherits="BenefImport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageTitle" runat="Server">
    VFU Vaccination Activity Report 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentDescription" runat="Server">
    Please Arrage Column Name in Excel sheet in the following order:
    <strong>{Date}</strong>,<strong>{Village}</strong>,<strong>{Owner}</strong>,<strong>{Mob}</strong>,<strong>{Sheep}</strong>,<strong>{Goat}</strong>,<strong>{Cattle}</strong>
    <br />
    Kochi Codes:
    Kochi:{k}<br />
    <strong>Note: Excel file should be XLX  workbook format</strong>. The above order is important , Sheet Name must be <strong>Sheet1</strong>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="contentBody" runat="Server">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/forms/selects/selectize.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/forms/selects/selectize.default.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/forms/selectize/selectize.min.css">

    <script type="text/javascript">

        $(function () {
            SetDatePicker();
            GetVFU();
           // validateVFUInsertionForm();
        });


        //var prm = Sys.WebForms.PageRequestManager.getInstance();
        //if (prm != null) {
        //    prm.pageLoaded(function (sender, e) {
        //        if (sender._postBackSettings.panelsToUpdate != null) {
        //            SetDatePicker();
        //       }
        //    });
        //};

        function GetVFU() {
            $('.vfu').on("change", function (e) {
                e.preventDefault();
                //$('#dvDetails :input').removeAttr("disabled");
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
                        $('.vfu').val('-1').trigger("change");
                    });
                    $('#btnSaveVFU').unbind("click").on('click', function (e) {
                        e.preventDefault();
                        if (validateVFUInsertionForm(e)) {
                            {
                                $.ajax({
                                    type: "POST",
                                    url: "BrucellosisImport.aspx/SaveVFUDetail",
                                    data: JSON.stringify({ Name: $('#txtVFUName').val(), FName: $('#txtFName').val(), Mob: $('#txtMob').val(), Year: $('.year').val(), DistrictId: $('.district').val() }),
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    async: true,
                                    success: function (data) {
                                        $('#txtVFUName').val('');
                                        $('#txtFName').val('');
                                        $('#txtMob').val('');
                                        $('#mdVFUInsertion').modal('hide');
                                        toastr.success("VFU Information is successfully saved to the system !", "LIVE-MIS: Form is Saved!", { closeButton: !0 });
                                        //window.location.reload(true);
                                        // var ddltst = document.getElementById('<%=ddlDistrict.ClientID  %>', '').getAttribute("name");
                                        //document.getElementById('<%=ddlDistrict.ClientID%>').selectedIndex = 0;
                                        $(".district option[value='-1']").attr("selected", "selected").trigger('change');
                                        // $('#ddlVFU option[value=' + data.d + ']').removeAttr("selected").attr("selected", "selected").trigger('change');
                                        //  setSelectedIndex(document.getElementById("ddlIP"), "16");
                                       
                                    },
                                    error: function (data) {
                                        alert("error found");
                                    }

                                });
                            }
                        }
                    });
                }

                //.add($('<div>', {
                //    'class': 'col-md-9', 'html': $('<select>').attr("id", "ddlPoultryType").addClass('form-control').append($("<option></option>").val('1').html('Layer')).append($("<option></option>").val('2').html('Broiler'))
                //}))
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
        function SetDatePicker() {
            $('select.form-control').select2({ containerCssClass: "select-xs" });
            $('.hideit').on('click', function () {
                $(this).hide();
            });
        }
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-12 center text-md-center">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <hr />
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title" id="horz-layout-card-center">Vaccination Benefeciaries Import Box</h4>
                    <a class="heading-elements-toggle"><i class="icon-ellipsis font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="icon-minus4"></i></a></li>
                            <li><a data-action="reload"><i class="icon-reload"></i></a></li>
                            <li><a data-action="expand"><i class="icon-expand2"></i></a></li>
                            <li><a data-action="close"><i class="icon-cross2"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-body collapse in">
                    <div class="card-block">
                        <div class="card-text">
                            <p>Attach <code>Excel File</code>  to the form to import mentioned benefeciaries. This form accept benefciaries <code>Province </code>,<code>District </code>and <code>VFU </code>,but this should be noted that the entire benefeciaries list should be of same <code>VFU</code> .</p>
                        </div>
                        <div class="form form-horizontal form-bordered">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                                <ContentTemplate>
                                    <script type="text/javascript">
                                        Sys.Application.add_load(SetDatePicker);
                                        Sys.Application.add_load(GetVFU);
                                       // Sys.Application.add_load(validateVFUInsertionForm);
                                    </script>
                                    <div class="form-body">
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlYear">Year</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control year">
                                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="2016">2016</asp:ListItem>
                                                    <asp:ListItem Value="2017">2017</asp:ListItem>
                                                    <asp:ListItem Value="2018">2018</asp:ListItem>

                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator5" ValueToCompare="-1" Operator="NotEqual" ControlToValidate="ddlYear" runat="server" ErrorMessage=""></asp:CompareValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlProvince">Province</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control province" AutoPostBack="true" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator3" ValueToCompare="-1" Operator="NotEqual" ControlToValidate="ddlProvince" runat="server" ErrorMessage=""></asp:CompareValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlDistrict">District</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlDistrict" AutoPostBack="True" CssClass="form-control district" runat="server" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlDistrict" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="ddlVFU">VFU</label>
                                            <div class="col-md-9">
                                                <asp:DropDownList ID="ddlVFU" CssClass="form-control vfu" runat="server">
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlVFU" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
                                            </div>
                                        </div>


                                        <div class="form-group row">
                                            <label class="col-md-3 label-control" for="FileUpload1">Excel File</label>
                                            <div class="col-md-9">
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="form-actions center">

                                        <asp:LinkButton ID="btnSave" class="btn btn-success mr-1" OnClick="btnSave_Click" runat="server"><i class="icon-push"></i> Import </asp:LinkButton>
                                    </div>


                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlProvince" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlVFU" EventName="SelectedIndexChanged" />
                                    <asp:PostBackTrigger ControlID="btnSave" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="modald"></div>
    <script src="../app-assets/vendors/js/forms/select/selectize.min.js" type="text/javascript"></script>
</asp:Content>

