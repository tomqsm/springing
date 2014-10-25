var app = (function f($, doc) {
    $(doc).on("focus", "#menu li.selected", function() {
        console.log('initialise something on focus');
    });
    $(doc).ready(function() {
        $('#menu').menuSelector(
                {
                    selected: appInit['currentMenuItem']
                });
        $('#cookiesLegalNoteCloser').closeIt();
        $('#tab-container').easytabs();
        $('#topLeftImages').innerfade(
                {
                    animationtype: 'slide',
                    speed: 1500,
                    timeout: 6000
                });
        $('#news').innerfade({
            animationtype: 'slide',
            speed: 750,
            timeout: 6000,
            type: 'sequence',
            containerheight: '3em'
        });
        viewport = [1, 2]
    });
    var pad = function pad(number, length) {
        var str = "" + number;
        while (str.length < length) {
            str = '0' + str;
        }
        return str;
    };
    function calculateTimeZoneOffset() {
        var offset = new Date().getTimezoneOffset();
        return (pad(parseInt(Math.abs(offset / 60)), 2) + pad(Math.abs(offset % 60), 2))
    }
    function getViewport() {
        //http://stackoverflow.com/questions/1766861/find-the-exact-height-and-width-of-the-viewport-in-a-cross-browser-way-no-proto
        var viewPortWidth, viewPortHeight;
        // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
        if (typeof window.innerWidth !== 'undefined') {
            viewPortWidth = window.innerWidth,
                    viewPortHeight = window.innerHeight;
        }
        // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
        else if (typeof doc.documentElement !== 'undefined'
                && typeof doc.documentElement.clientWidth !==
                'undefined' && doc.documentElement.clientWidth !== 0) {
            viewPortWidth = doc.documentElement.clientWidth,
                    viewPortHeight = doc.documentElement.clientHeight;
        }
        // older versions of IE
        else {
            viewPortWidth = doc.getElementsByTagName('body')[0].clientWidth,
                    viewPortHeight = doc.getElementsByTagName('body')[0].clientHeight;
        }
        return [viewPortWidth, viewPortHeight];
    }

    return {
        getTimezoneOffset: calculateTimeZoneOffset(),
        getTimezoneOffsetURIEncoded: encodeURIComponent(calculateTimeZoneOffset()),
        getTZOMinutesURIEncoded: encodeURIComponent(calculateTimeZoneOffset()),
        getViewport: getViewport
    }
})($, document);