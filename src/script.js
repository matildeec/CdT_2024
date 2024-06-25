$(document).ready(function(){

    $('.expan, .ex, .corr, .reg').hide();

    $('.highlight').click(function(){
        $(this).toggleClass('active');
        $btnId = $(this).attr('id');
        if($('span').hasClass($btnId)){
            $('span').addClass('display');
        }
    })
  
});