/*
 Copyright (C) 2013 Tomasz Kusmierczyk (letsweb.biz)
 Licence: MIT Licence
 Project: letsweb
 Date: 2013-listopad-08 14:20
 */
var app = (function f() {

    var init = function() {
        alert('initialising');
    };

    return {
        inits: function() {
            init();
        }
    }
})();
$.widget("lw.closeIt", {
    options: {
        isCookiesOn: false
    },
    _create: function() {
        if (this.isCookiesOn()) {
            if ($.cookie('cookies') !== 'ok') {
                this.element.parent('.cookiesAlert').show();
                this.element.bind('click', $.proxy(function() {
                    $.cookie('cookies', 'ok', {expires: 30, path: '/'});
                    //Find the parent element of each paragraph with a class "cookiesAlert"
                    this.element.parent('.cookiesAlert').hide();
                }, this));
            }
        } else {
            this.element.parent('.cookiesAlert').hide();
        }

    },
    _destroy: function() {
        this.element.unbind('click');
    },
    isCookiesOn: function() {
        var date = new Date();
        date.setTime(date.getTime() + (2000)); //set expiry to seconds
        $.cookie('cookieTest', 'ok', {expires: date, path: '/'});
        if ($.cookie('cookieTest') === 'ok') {
            return true;
        } else {
            return false;
        }
    }
});
