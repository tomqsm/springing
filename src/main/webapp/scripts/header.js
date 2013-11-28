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