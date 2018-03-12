﻿$(function () {

    $.ajaxSetup({ cache: false });

    $('a[data-modal]').on('click', function (e) {

        // hide dropdown if any
        //$(e.target).closest('.btn-group').children('.dropdown-toggle').dropdown('toggle');


        $('#myModalContent').load(this.href, function () {


            $('#myModal').modal({
                /*backdrop: 'static',*/
                keyboard: true
            }, 'show');

            bindForm(this);
        });

        return false;
    });



});
function CallModalRoles(data) {
    $.ajaxSetup({ cache: false });
    var url = '/Cuenta/SeleccionarRol/';
    $('#myModalContent').load(url,{ data : data }, function () {


        $('#myModal').modal({
            /*backdrop: 'static',*/
            keyboard: true
        }, 'show');

        bindForm(this);
    });

    return false;
};
function bindForm(dialog) {

    $('form', dialog).submit(function () {
        var block = $('<div class="block-loading" />');
        $("body").prepend(block); 
        $.ajax({
            url: this.action,
            type: this.method,
            data: $(this).serialize(),
            success: function (result) {
                if (result.success) {
                    block.remove();
                    $('#myModal').modal('hide');
                    //Refresh
                    location.reload();
                } else {
                    block.remove();
                    $('#myModalContent').html(result);
                    bindForm();
                }
            }
        });
        return false;
    });
}