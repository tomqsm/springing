$.widget("lw.test", {
    options: {
        value: 0
    },
    _create: function(){
        this.element.html('<p>widget value: ' + this.options.value + '</p>');
    }
});