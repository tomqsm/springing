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
$.widget("lw.test", {
    options: {
        value: 0
    },
    _create: function(){
        this.element.text('widget value: ' + this.options.value);
    }
});
