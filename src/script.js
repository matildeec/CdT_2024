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
       if($(this).hasClass("selected")){
            $(this).removeClass("selected");
            if (buttonId === "btn-descBibl"){
                $("#descBibl").hide();
            }else if (buttonId === "btn-descCod") {
                $("#descCod").hide();
                
            }
       }else{
        $(this).addClass("selected")
        if (buttonId === "btn-descBibl" ) {
            $("#descBibl").show();
            $("#descCod").hide();
            $("#btn-descCod").removeClass("selected");
        } else if (buttonId === "btn-descCod") {
            $("#descCod").show();
            $("#descBibl").hide();
            $("#btn-descBibl").removeClass("selected");
        }
       }
   });

   $("span.character, span.bibl, span.org, span.publisher,span.literary, span.religion, span.person, span.place").mouseover(function(){
    $(this).css("text-decoration","underline");
    $(this).next("span.info").css("visibility","visible");
   })
   $("span.character, span.bibl, span.org, span.publisher,span.literary, span.religion, span.person, span.place").mouseout(function(){
    $(this).css("text-decoration","none")
    $(this).next("span.info").css("visibility","hidden");
   })

   $("area").click(function(){
        $("span").removeClass('selezionato');
        $areaId = $(this).attr('id');
        $("span[id="+$areaId+"]").addClass('selezionato');

        event.preventDefault(); 
        var target = $("span[id="+$areaId+"]");
        $('html, body').animate({
            scrollTop: $(target).offset().top
        }, 1000);
   });

});
