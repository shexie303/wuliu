//显示选择导航
var cookieSign = '';//显示的标记
function setSortClick( sign ){
    if( !sign ) return false;
    var documentHeight = $(document).height();
    var windowHeight = $(window).height();
    if( documentHeight < windowHeight) documentHeight = windowHeight;

    var contentHeight = $("."+sign+"_nav").height();

    var newHeight = documentHeight;
    if( documentHeight < windowHeight) newHeight = windowHeight;

    var screen_mask = $("#screen_mask");
    var close_cross = $("#close_cross");
    var top_bar_mask = $("#top_bar_mask");
    var popup_list = $("#popup_list");
    if( screen_mask.is(":visible") && cookieSign == sign ){
        closeSortSelect();
    }else{
        cookieSign = sign;
        $('.nav_list').hide();
        $('.'+sign+'_nav').show();
        $('.triangle_mark_down').css('border-color','#878787 transparent transparent transparent');
        $('.'+sign+'_mark').css('border-color','#ed6d00 transparent transparent transparent');
        screen_mask.height( newHeight-112 ).show();
        top_bar_mask.show();
        popup_list.show();
        close_cross.show();
        var account_box = $("#account_box");
        var search_box = $("#search_box");
        if( account_box.is(":visible") ) account_box.hide();
        if( search_box.is(":visible") ) search_box.hide();
    }



}
//关闭
function closeSortSelect(){
    $("#screen_mask").height( 0 ).hide();
    $("#top_bar_mask").hide();
    $("#popup_list").hide();
    $("#close_cross").hide();
    $('.nav_list').hide();
}