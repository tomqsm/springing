var app = (function f() {
    var pad = function pad(number, length) {
        var str = "" + number;
        while (str.length < length) {
            str = '0' + str;
        }
        return str;
    };
    var offset = new Date().getTimezoneOffset();
    offset = ((offset < 0 ? 'p' : 'm') + // Note the reversed sign!
            pad(parseInt(Math.abs(offset / 60)), 2) +
            pad(Math.abs(offset % 60), 2))
    
    return {
        getTimezoneOffset: offset
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
$.widget("lw.menuSelector", {
    options: {
        selected: $.noop
    },
    _create: function() {
        console.log(this.options.selected)
        $('#menu').find('#' + this.options.selected).parent().addClass('selected');

    }
});
$.widget("lw.getJson", {
    options: {
        templateEl: $.noop,
        handleData: $.noop,
        template: $.noop,
        app_context: app_context,
        url: 'ajax',
        data: '',
        ajaxloader: $('<img/>', {id: "ajaxloader", src: app_context + 'resources/images/ajax-loader.gif', style: "visibility:hidden"})
    },
    _create: function() {
        _.templateSettings = {
            interpolate: /\<\@\=(.+?)\@\>/gim,
            evaluate: /\<\@([\s\S]+?)\@\>/gim,
            escape: /\<\@\-(.+?)\@\>/gim
        };
        if (this.options['templateEl'] !== $.noop) {
            var templateHtml = this.options['templateEl'];
            this.options.template = _.template(templateHtml.html());
        }
        this.element.bind('click', $.proxy(function() {
            this.get();
        }, this));

        this.element.prepend(this.options.ajaxloader);
    },
    _setOption: function(key, value) {
        this.options[key] = value;
        this._update();
    },
    _update: function() {
        this.options.el = this.element;
        this.options.handleData(this.options.data, this.options);
    },
    get: function() {
        this.options.ajaxloader.css('visibility', 'visible');
        var jqxhr = $.ajax({
            url: this.options['app_context'] + '' + this.options.url + '?tzo=' + app.getTimezoneOffset,
            type: 'GET',
            timeout: 4000
        }).then(
                $.proxy(function(data) {
                    this._setOption('data', data);
                    return data;
                }, this),
                $.proxy(function(data) {
                    this.element.text(' failed ' + data.statusText);
                }, this),
                $.proxy(function() {
                }), this);
        jqxhr.always($.proxy(function() {
            this.options.ajaxloader.css('visibility', 'hidden');
        }, this));
    },
    _destroy: function() {
        this.element.unbind();
        this.element.remove(this.options.ajaxloader);
    }
});
$.widget("lw.getJsonOnLoad", {
    options: {
        templateEl: $.noop,
        handleData: $.noop,
        template: $.noop,
        app_context: app_context,
        url: 'ajax',
        data: '',
        ajaxloader: $('<img/>', {id: "ajaxloader", src: app_context + 'resources/images/ajax-loader.gif', style: "visibility:hidden"})
    },
    _create: function() {
        console.log('running');
        _.templateSettings = {
            interpolate: /\<\@\=(.+?)\@\>/gim,
            evaluate: /\<\@([\s\S]+?)\@\>/gim,
            escape: /\<\@\-(.+?)\@\>/gim
        };
        if (this.options['templateEl'] !== $.noop) {
            var templateHtml = this.options['templateEl'];
            this.options.template = _.template(templateHtml.html());
        }
        this.element.prepend(this.options.ajaxloader);
        console.log(this.options['app_context'] + '' + this.options.url + '?tzo=' + app.getTimezoneOffset);
        this.get();
    },
    _setOption: function(key, value) {
        console.log('running');

        this.options[key] = value;
        this._update();
    },
    _update: function() {
        this.options.el = this.element;
        this.options.handleData(this.options.data, this.options);
    },
    get: function() {
        this.options.ajaxloader.css('visibility', 'visible');
        var jqxhr = $.ajax({
            url: this.options['app_context'] + '' + this.options.url + '?tzo="' + app.getTimezoneOffset +'"',
            type: 'GET',
            timeout: 4000
        }).then(
                $.proxy(function(data) {
                    this._setOption('data', data);
                    return data;
                }, this),
                $.proxy(function(data) {
                    this.element.text(' failed ' + data.statusText);
                }, this),
                $.proxy(function() {
                }), this);
        jqxhr.always($.proxy(function() {
            this.options.ajaxloader.css('visibility', 'hidden');
        }, this));
    },
    _destroy: function() {
        this.element.unbind();
        this.element.remove(this.options.ajaxloader);
    }
});
