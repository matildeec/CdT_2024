$(document).ready(function () {

    $('.expan, .ex, .corr, .reg').hide();

    $('.highlight').click(function () {
        $(this).toggleClass('active');
        $btnId = $(this).attr('id');
        $color = 'var(--' + $(this).attr('class').split(' ')[1] + ')';
        if ($(this).hasClass('active')) {
            $(this).css('background-color', $color);
            $('span.'+$btnId).css('background-color', $color);
        } else {
            $(this).css('background-color', 'white');
            $('span.'+$btnId).css('background-color', 'transparent');
        }
    })

});