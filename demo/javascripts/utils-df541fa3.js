(function(){$(document).ready(function(){return window.DevGile||(window.DevGile={}),$("#main-wrapper").fullpage({css3:!0,scrollingSpeed:700,paddingTop:"0",paddingBottom:"0",fixedElements:"#main-menu",sectionSelector:".section",keyboardScrolling:!0,onLeave:function(){return function(){return utils.setActiveMenu()}}(this)}),DevGile.Utils=function(){function e(){this.bindEvents(),setTimeout(function(e){return function(){return e.validateRoute()}}(this),100)}return e.prototype.bindEvents=function(){return $("#main-menu .link-page").on("click",function(e){return function(n){var t;return n.preventDefault(),t=n.currentTarget,e.evaluateLink(t),e.changeMenuActiveTo(t),e.trackEvent("click",$(t).attr("id"))}}(this)),$("#mobile-options .mobile-button").on("click",function(e){return function(){return e.toggleMenu()}}(this))},e.prototype.setActiveMenu=function(){var e,n,t;return t=$(".section.active").attr("id"),n="header"===t?"/":"/"+t+"/",e=$("#main-menu a[href='/"+t+"/']"),this.changeUrlTo(n),this.changeMenuActiveTo(e),this.changeMenu(t)},e.prototype.changeMenuActiveTo=function(e){return this.cleanMenuActive(),$(e).addClass("active")},e.prototype.cleanMenuActive=function(){return $("#main-menu a.active").removeClass("active")},e.prototype.trackEvent=function(e,n){return ga("send","event",e,n)},e.prototype.changeUrlTo=function(e){return history.pushState({},"",e)},e.prototype.evaluateLink=function(e){var n,t;return t=$(e).attr("href").replace("/",""),n=$(e).data("page"),this.changeUrlTo("/"+t),this.pageGoTo(n)},e.prototype.validateRoute=function(){var e,n,t;return t=window.location.pathname,e=$("#main-menu a[href='"+t+"']"),e.length>0?(n=$(e[0]).data("page"),this.pageGoTo(n)):void 0},e.prototype.pageGoTo=function(e){return $.fn.fullpage.moveTo(e>1?e:1),!1},e.prototype.changeMenu=function(e){return"header"===e?$("#logo-container a").addClass("hidden"):"header"!==e?$("#logo-container a").removeClass("hidden"):void 0},e.prototype.toggleMenu=function(){var e;return e=$("#main-menu .section-container"),e.hasClass("opened")?(e.removeClass("opened"),e.addClass("closed")):(e.removeClass("closed"),e.addClass("opened"))},e}(),window.utils=new DevGile.Utils})}).call(this);