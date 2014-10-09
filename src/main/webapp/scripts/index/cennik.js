//(function(){
    $(document).ready(function() {
        console.log('ready');
        $('#pricesDiv').getJsonOnLoad({url: 'ajax/prices', templateEl: $("script.prices"),
                        handleData: function(data, options) {
                            options.el.html(options.template({json: data}));
                        }
                });
    });
    
//})($);