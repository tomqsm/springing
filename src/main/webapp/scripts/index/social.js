$(document).ready(function() {
    window.fbAsyncInit = function() {
        FB.init({
            appId: '1521793401395580',
            xfbml: true,
            version: 'v2.1',
            status: true
        });
        FB.Event.subscribe('auth.statusChange', function(response) {
            // Checking user status on page load
            if (response.status === 'connected') {
                // the user is logged in and has authenticated your
                // app, and response.authResponse supplies
                // the user's ID, a valid access token, a signed
                // request, and the time the access token 
                // and signed request each expire
                var uid = response.authResponse.userID;
                var accessToken = response.authResponse.accessToken;
                console.log(response.status);
//                console.log(uid);
//                console.log(accessToken);
                FB.api('/lukasfloor/statuses', function(response) {
                    console.log(response);
                });
            } else if (response.status === 'not_authorized') {
                console.log(response.status);
                // the user is logged in to Facebook, 
                // but has not authenticated your app
            } else {
                console.log('unknown');
                // the user isn't logged in to Facebook.
            }
        });
        /* make the API call */
//        FB.login(function(response) {
//            alert(response.authResponse.accessToken);
//        }, {scope: 'read_stream,publish_stream,offline_access'});
//        FB.api(
//                "/me/feed",
//                function(response) {
//                    if (response && !response.error) {
//                        /* handle the result */
//                        console.log(response);
//                    }
//                }
//        );
        
//        FB.getLoginStatus(function(response) {
//            if (response.status === 'connected') {
//                // the user is logged in and has authenticated your
//                // app, and response.authResponse supplies
//                // the user's ID, a valid access token, a signed
//                // request, and the time the access token 
//                // and signed request each expire
//                var uid = response.authResponse.userID;
//                var accessToken = response.authResponse.accessToken;
//            } else if (response.status === 'not_authorized') {
//                // the user is logged in to Facebook, 
//                // but has not authenticated your app
//            } else {
//                // the user isn't logged in to Facebook.
//            }
//        });

//        FB.login(function(response) {
//            if (response.authResponse && !response.error) {
//                console.log('Welcome!  Fetching your information.... ');
//                FB.api('/lukasfloor/posts', function(response) {
//                    console.log(response);
//                });
//            } else {
//                console.log('User cancelled login or did not fully authorize.');
//            }
//        });
    };

    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/pl_PL/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
});
