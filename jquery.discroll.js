(function(a){var b;return a.discroll=b={events:{left:"left",right:"right",up:"up",down:"down",leftEdge:"leftEdge",rightEdge:"rightEdge"},options:{bindSelector:"body",scrollableSelector:"#articles",articleSelector:"article",lateralSelector:".column",verticalSelector:".panel",activeClass:"active",lateralScrollOpts:{axis:"x",duration:400,easing:"easeOutQuint"}}},a.fn.discroll=function(c){var d,e,f,g,h,i,j,k,l,m;return c==null&&(c={}),c=a.extend({},b.options,c),e=a(c.bindSelector),d=a(c.articleSelector),f=a(c.scrollableSelector),k=["left","right","up","down"],g=function(a,b){return a.removeClass(c.activeClass).eq(b).addClass(c.activeClass)},m=function(a){return f.scrollTo(a,c.lateralScrollOpts)},j=function(d){var e,f;return e={left:"first",right:"last"},f={left:-1,right:1},function(){var h,i,j;return j=a(this),i=j.find(c.lateralSelector),h=i.filter("."+c.activeClass),h.is(i[e[d]]())?j.triggerHandler(b.events[""+d+"Edge"]):m(g(i,h.index()+f[d]))}},l={left:j("left"),right:j("right")},h=function(){var a,d,f,g;d=function(a){return e.on(b.events[a],c.articleSelector,l[a])};for(f=0,g=k.length;f<g;f++)a=k[f],d(a);return null},i=function(){var e,f,g,h;f=function(e){return a(document).on("keydown",null,e,function(){return d.filter("."+c.activeClass).trigger(b.events[e])})};for(g=0,h=k.length;g<h;g++)e=k[g],f(e);return null},i(),h(),g(g(d,0).find(c.lateralSelector),0)}})(jQuery);