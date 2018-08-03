$(function () {

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
        debugger;
        var block = $('<div class="block-loading" />');
        var dataString;
        var contentType;
        var processData;
        $("body").prepend(block);
        if (this.enctype === 'multipart/form-data') {
            dataString = new FormData($(this).get(0));
            
            //dataString.append('datos',$(this).serialize());
            contentType = false;
            processData = false;
        }
        else {
            dataString = $(this).serialize();
            contentType = this.enctype;
            processData = true;
        }
        $.ajax({
            url: this.action,
            type: this.method,
            data: dataString,
            //data: $(this).serialize(),
            processData: processData,
            contentType: contentType,
            success: function (result) {
                if (result.response) {
                    block.remove();
                    $('#myModal').modal('hide');
                    if (result.href != '') {
                        if (result.IsPartial) {
                            $('#' + result.ContainerRenderPartial).load(result.href);
                        }
                        else {
                            location.href = result.href;
                        }
                    }
                    else {
                        //Refresh
                        location.reload();
                    }
                    
                    
                } else {
                    block.remove();
                    $('#myModalContent').html(result);
                    bindForm();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest + '--' + textStatus + '--' +errorThrown);
            }
        });
        return false;
    });
}
function confirm(heading, question, cancelButtonTxt, okButtonTxt, callback) {
    $.ajaxSetup({ cache: false });

    var confirmModal = $('<div id="myModalConfirm" class="modal fade in"> ' +
        '	<div class="modal-dialog">                   ' +
        '		<div class="modal-content">              ' +
        '			<div id="myModalConfirmContent">     ' +
        '				<div class="modal-header">       ' +
        '					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> ' +
        '					<h4 class="modal-title" id="myModalLabel">' + heading + '</h4>                           ' +
        '				</div>                           ' +
        '				<div class="modal-body">         ' +
        '					<p>' + question + '</p>                     ' +
        '				</div>                           ' +
        '				<div class="modal-footer">       ' +
        '					<div class="text-center">    ' +
        '          ' +
        '						<a href="#" class="btn" data-dismiss="modal">' + cancelButtonTxt + '</a>  ' +
        '						<a href="#" id="okButton" class="btn btn-primary"> ' + okButtonTxt + '</a>' +
        '						                         ' +
        '          ' +
        '					</div>                       ' +
        '				</div>                           ' +
        '			</div>                               ' +
        '		</div>                                   ' +
        '	</div> ' +
        '</div>    ');

    

    confirmModal.find('#okButton').click(function (event) {
        callback();
        confirmModal.modal('hide');
        
    });
    
    confirmModal.modal('show');
};
