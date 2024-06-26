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

    $('.show').click(function () {
        $(this).toggleClass('active');
        $btnId = $(this).attr('id');
        $color = 'var(--' + $(this).attr('class').split(' ')[1] + ')';
        if ($(this).hasClass('active')) {
            $(this).css('background-color', $color);
            $('span.'+$btnId).css('background-color', $color);
            $('span.'+$btnId).show();
        } else {
            $(this).css('background-color', 'white');
            $('span.'+$btnId).css('background-color', 'transparent');
            $('span.'+$btnId).hide();
        }
    })

   $("#descBibl").hide();
   $("#descCod").hide();

   $(".desc").click(function() {
       var buttonId = $(this).attr('id');

       if (buttonId === "btn-descBibl") {
           $("#descBibl").show();
           $("#descCod").hide();
       } else if (buttonId === "btn-descCod") {
           $("#descCod").show();
           $("#descBibl").hide();
       }
   });
});
