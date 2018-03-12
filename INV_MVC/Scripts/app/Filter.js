function FilterSelectList(selectListId, filterId) {
        var filter = $("#" + filterId).val();
        filter = filter.toUpperCase();

        var options = $("#" + selectListId + " option");
        for (var i = 0; i < options.length; i++) {
            if (options[i].text.toUpperCase().indexOf(filter) < 0)
                $(options[i]).css("display", "none");
            else
                $(options[i]).css("display", "block");
        }
    };
function Filter(dropdownul,filtro) {
    var value = filtro.toLowerCase();
    $('#' + dropdownul + ' li').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
};
function clickonSelectFilter(inputtext, value) {
    $('#' + inputtext).val(value.substr(1, value.length));
}
