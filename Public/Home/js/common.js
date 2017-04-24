/**
 * 公用 js
 */
$().ready(function(){
    $('#searchW').focus(function(){
        var value = $.trim($('#searchW').val());
        if(value == "请输入城市、名称、地址等关键字")
        {
            $('#searchW').val("");
        }
        this.parentNode.className='hover';

    });
    $('#searchW').blur(function(){
        var value = $.trim($('#searchW').val());
        if(value == "")
        {
            this.parentNode.className='';
            $('#searchW').val("请输入城市、名称、地址等关键字");
        }

    });
    $("#indexSearchForm").submit( function () {
        var value = $.trim($('#searchW').val());
        if(value == "" || value == "请输入城市、名称、地址等关键字")
            return false;
    } );
});
//收起  更多
$().ready(function(){
    /*var unfold = '收起',fold = '更多';
     $('.selitem').each(function(){
     var t = $(this);
     var dd = t.find('dd');
     var foldObj = t.find('span[class$=sql_fold]');
     var shangquan = t.find('div[class$=shangquan]');
     var row = dd.attr('row');
     if(dd.height() > 28*row)
     {
     dd.attr('class','fold'+row);
     var position = t.find('a[class$=select]').position()
     if((position && position.top>25*row) || shangquan.length > 0){
     dd.addClass('autoHeight');
     foldObj.attr('class','sql_unfold').text(unfold).show();
     }else{
     foldObj.attr('class','sql_fold').text(fold).show()
     };
     }
     foldObj.click(function(){
     var tag = $(this).attr('class');
     if(tag == 'sql_fold'){
     dd.addClass('autoHeight');
     foldObj.attr('class','sql_unfold').text(unfold).show();
     }else{
     dd.removeClass('autoHeight');
     foldObj.attr('class','sql_fold').text(fold).show();
     }
     return false;
     })
     })*/
});
$(function(){
    $('.tuanitem_mini').hover(function(){
        $(this).addClass('tuanitem_mini_hover');
    },function(){
        $(this).removeClass('tuanitem_mini_hover');
    });

});
$(function(){
    $('.tuanitem').hover(function(){
        $(this).addClass('tuanitem_hover');
    },function(){
        $(this).removeClass('tuanitem_hover');
    });

});
function emptyData( url ){
    $.post(url,function( res ){
        res = $.parseJSON( res );
        if( res.state == 1){
            $(".view_item").remove();
            $(".view_item_empty").show();
        }
    });

}