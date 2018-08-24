// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require_tree .

$(document).ready(function() {
    $('#display-search-form').click(function(){
        console.log($(this).parent().find(".dropdown-menu"))
        $(this).parent().find(".dropdown-menu").css({
            "display"    : "block",
            "margin-top" : "28px !important",
            "opacity"    : "1",
            "visibility" : "visible",
            "-webkit-transform": "translateY(0)",
            "-moz-transform": "translateY(0)",
            "transform": "translateY(0)"
        });
    });

// ------------------------------------------------------------------
// jQuery for back to Top
// ------------------------------------------------------------------
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0) {
            $('#toTop').fadeIn(200);
        } else {
            $('#toTop').fadeOut(200);
        }
    }); 

    $('#toTop').on('click',function(){
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });

// -------------------------------------------------------------
// Google Map
// -------------------------------------------------------------
    




})



$(window).scroll(function() {
  if ($(this).scrollTop() >= 50) {
      $(".menu-icon").addClass('d-none')
      $('nav.navbar').addClass('sticky-nav');
  }
  else {
      $(".menu-icon").removeClass('d-none')
      $('nav.navbar').removeClass('sticky-nav');
  }
});


function initMap() {
    if ($('#googleMap').length > 0) {

        //set your google maps parameters
        var $latitude = -6.917864, //If you unable to find latitude and longitude of your address. Please visit http://www.latlong.net/convert-address-to-lat-long.html you can easily generate.
            $longitude = 107.625573,
            $map_zoom = 16; /* ZOOM SETTING */

        //google map custom marker icon
        var $marker_url = 'assets/google-map-marker.png';

        //we define here the style of the map
        var style = [{
            "stylers": [{
                "hue": "#000"
            }, {
                "saturation": -100
            }, {
                "gamma": 0.15
            }, {
                "lightness": 12
            }]
        }];

        //set google map options
        var map_options = {
            center: new google.maps.LatLng($latitude, $longitude),
            zoom: $map_zoom,
            panControl: false,
            zoomControl: false,
            mapTypeControl: false,
            streetViewControl: false,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            scrollwheel: false,
            styles: style,
        }
        //initialize the map
        var map = new google.maps.Map(document.getElementById('googleMap'), map_options);
        //add a custom marker to the map
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng($latitude, $longitude),
            map: map,
            visible: true,
            icon: $marker_url
        });
    }
};


