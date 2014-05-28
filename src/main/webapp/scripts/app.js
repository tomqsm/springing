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
        },
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
$.widget("lw.getJson", {
    options: {
        app_context: app_context,
        url: 'ajax',
        data: '',
        ajaxloader: $('<img/>', {id: "ajaxloader", src: app_context+'/resources/images/ajax-loader.gif', style:"visibility:hidden"})
    },
    _create: function() {
        this.element.bind('click', $.proxy(function() {
            this.get();
        }, this));
        _.templateSettings = {
            interpolate: /\<\@\=(.+?)\@\>/gim,
            evaluate: /\<\@([\s\S]+?)\@\>/gim,
            escape: /\<\@\-(.+?)\@\>/gim
        };
        this.element.prepend(this.options.ajaxloader);
    },
    _setOption: function(key, value) {
        this.options[key] = value;
        this._update();
    },
    _update: function() {
        this.drawTable()
    },
    get: function() {
        this.options.ajaxloader.css('visibility','visible');
        var jqxhr = $.ajax({
            url: this.options['app_context'] + '' + this.options.url,
            type: 'GET',
            timeout: 3000
        }).then(
                $.proxy(function(data) {
                    this.element.text(data.name);
                    this._setOption('data', data);
                    return data;
                }, this),
                function() {

                },
                function() {

                });
        jqxhr.always(function() {
        });
    },
    drawTable: function() {
        var template = _.template($("script.template").html());
        var d = this.options['data'];
        var items = d.staff;
        this.element.html(template({items: items, name: d.name}));
    }
});
