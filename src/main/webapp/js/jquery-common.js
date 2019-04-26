$.fn.jdtab=function(options){  
  var options=$.extend({},options);
  var that=$(this);
  var bigImgBox=that.find(".imgbig ul");
  var smallImgBox=that.find(".imgsmall ul");
  var smallLi=smallImgBox.find('li');
  var prve=$(this).find('.btn-left');
  var next=$(this).find('.btn-right');
  var n=w=0;
  var imgLength=smallImgBox.find('li').length;
  var oTxt=that.find(".img-title p");
  bigImgBox.css({"width":321*(imgLength)});
  smallImgBox.css({"width":83*(imgLength)});

  next.on('click',function(){
    if(!bigImgBox.is(":animated")){
      n++;tab(true);
    }
  });
  prve.on('click',function(){
    if(!bigImgBox.is(":animated")){
      n--;tab(false)
    }
  });
  smallImgBox.find('li').on('click',function(){
    if(!bigImgBox.is(":animated")){
      n2=$(this).index();
      if(n>n2){
        n=n2;
        tab(false)
      }else{
        n=n2;
        tab(true)
      }
    }

  });
  function tab(oblog){
    //w=n>2?++w:0;
    if(n>=imgLength){
      n=0
    }else if(n<0){
      n=imgLength-1
    };
    if(oblog){
      if(n>1 && n<imgLength-2){
        ++w
      }else if(n<1){
        w=0
      }  
    }else{    
      if(n>1 && n<imgLength-3){
        --w
      }else if(n<=1){
        w=0
      }else if(n>imgLength-3){
        w=imgLength-4
      }
    };
    bigImgBox.animate({"margin-left":-n*321});
    smallLi.eq(n).addClass("on").siblings().removeClass('on');
    smallImgBox.animate({"margin-left":-w*83});
    var txt=bigImgBox.find("li").eq(n).find('img').attr("alt");
    oTxt.html(txt);
  }
  tab()
}   
//首页  轮播
;$(function(){
  $.fn.tab=function(options){
    var options=$.extend({
      g:1,          //设置每次滚动的个数
      lg:4,         //默认一页显示4个li
      boxmargin:8,      //每个盒子的margin
      btnshow:false,
      otime:3000
    },options);

    var _this=$(this);
    var $ul=_this.find("ul");
    var $li=_this.find("li");
    var $prve=_this.parent().find(".prve");
    var $next=_this.parent().find(".next");
    var lilength=$li.length;
    var boxwidth=_this.width()/options.lg;
    var n=0;
    var t;
    $li.innerWidth(boxwidth-options.boxmargin-2);
    $li.clone(true).appendTo($ul)
    $prve.off().on("click",function(){        //点击左侧按钮
      boxwidth=_this.width()/options.lg;
      if(!n==0 && !$ul.is(":animated")){
        n--;
        $ul.animate({"margin-left":-boxwidth*n*options.g+"px"},800);
      }
    });
    $next.off().on("click",function(){        //点击右侧按钮
      boxwidth=_this.width()/options.lg;
      var m=lilength*boxwidth-_this.width();
      if(n*boxwidth*options.g<m && !$ul.is(":animated")){
        n++;
        $ul.animate({"margin-left":-boxwidth*n*options.g+"px"},800);
      }
    });
    $(window).resize(function(){
       $li=_this.find("li");
      var boxwidth=_this.width()/options.lg;
      $li.innerWidth(boxwidth-options.boxmargin-2);
      $ul.css({"margin-left":"0px"});
      n=0;
    });
    function change(){
      boxwidth=_this.width()/options.lg;
      var m=lilength*boxwidth-_this.width();
      if(n*boxwidth*options.g<m && !$ul.is(":animated")){
        n++;
        $ul.animate({"margin-left":-boxwidth*n*options.g+"px"},800);
      }else if(n*boxwidth*options.g>=m && !$ul.is(":animated")){
        n=0;
        $ul.animate({"margin-left":"0px"},1000);
      }
    }
    t=setInterval(change,options.otime);
    _this.parent().hover(function(){
      clearInterval(t);
    },function(){
      t=setInterval(change,options.otime);
    })
    if(options.btnshow==false){
      _this.parent().hover(function(){
        $prve.show();
        $next.show();
      },function(){
        $prve.hide();
        $next.hide();     
      });
    }else{
      $prve.show();
      $next.show();
    };
    return this
  }
});
(function($){
      $.extend({
        boxtab:function(a,b){
          a.on("click",function(){
            var n=$(this).index();
            $(this).addClass("on").siblings().removeClass("on")
            b.eq(n).show().siblings().hide()
          })
        }
      })
})(jQuery);
$(function(){
  $(".wrap-lnav li").on("click",function(){
    $(this).addClass("on").siblings().removeClass("on")
  })
})
