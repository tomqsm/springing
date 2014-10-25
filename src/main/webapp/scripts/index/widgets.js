$.widget("lw.closeIt", {
    options: {
        isCookiesOn: false
    },
    _create: function() {
        if ($.cookie('cookies') === 'ok') return;
        var cookiesAlertContainer = this.element.parent('.cookiesAlert');
        if (this.isCookiesOn()) {
            if ($.cookie('cookies') !== 'ok') {
                cookiesAlertContainer.show();
                this.element.on('click', $.proxy(function() {
                    $.cookie('cookies', 'ok', {expires: 30, path: '/'});
                    //Find the parent element of each paragraph with a class "cookiesAlert"
                    cookiesAlertContainer.hide();
                }, this));
            }
        } else {
            cookiesAlertContainer.hide();
        }
    },
    _destroy: function() {
        this.element.off();
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
        this.element.find('#' + this.options.selected).parent().addClass('selected');
    }
});
$.widget("lw.getJson", {
    options: {
        templateEl: $.noop,
        handleData: $.noop,
        template: $.noop,
        app_context: appInit['context'],
        url: 'ajax',
        data: '',
        ajaxloader: $('<img/>', {id: "ajaxloader", src: appInit['context'] + 'resources/images/ajax-loader.gif', style: "visibility:hidden"})
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
            url: this.options['app_context'] + '' + this.options.url + '?tzo=' + app.getTZOMinutesURIEncoded,
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
        app_context: appInit['context'],
        url: 'ajax',
        data: '',
        ajaxloader: $('<img/>', {id: "ajaxloader", src: appInit['context'] + 'resources/images/ajax-loader.gif', style: "visibility:hidden"})
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
        this.element.prepend(this.options.ajaxloader);
        console.log(this.options['app_context'] + '' + this.options.url + '?tzo=' + app.getTZOMinutesURIEncoded);
        this.get();
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
            url: this.options['app_context'] + '' + this.options.url + '?tzo=' + app.getTZOMinutesURIEncoded,
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

$.widget("lw.row", {
    options: {
    },
    _create: function() {
        console.log(this.element.html())
    },
    _setOption: function(key, value) {
    },
    _update: function() {
    },
    getViewport: function getViewport() {
        //http://stackoverflow.com/questions/1766861/find-the-exact-height-and-width-of-the-viewport-in-a-cross-browser-way-no-proto
        var viewPortWidth;
        var viewPortHeight;

        // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
        if (typeof window.innerWidth != 'undefined') {
            viewPortWidth = window.innerWidth,
                    viewPortHeight = window.innerHeight
        }

// IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
        else if (typeof document.documentElement != 'undefined'
                && typeof document.documentElement.clientWidth !=
                'undefined' && document.documentElement.clientWidth != 0) {
            viewPortWidth = document.documentElement.clientWidth,
                    viewPortHeight = document.documentElement.clientHeight
        }

        // older versions of IE
        else {
            viewPortWidth = document.getElementsByTagName('body')[0].clientWidth,
                    viewPortHeight = document.getElementsByTagName('body')[0].clientHeight
        }
        return [viewPortWidth, viewPortHeight];
    },
    _destroy: function() {
        this.element.unbind();
        this.element.remove(this.options.ajaxloader);
    }
});