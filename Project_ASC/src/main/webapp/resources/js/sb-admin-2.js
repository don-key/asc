/*!
 * Start Bootstrap - SB Admin 2 v3.3.7+1 (http://startbootstrap.com/template-overviews/sb-admin-2)
 * Copyright 2013-2016 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap/blob/gh-pages/LICENSE)
 */
$(function() {
    $('#side-menu').metisMenu();
});

//Loads the correct sidebar on window load, 
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
		var height = (window.innerHeight > 0) ? window.innerHeight : screen.height;
		$("#page-wrapper").css("min-height", (height) + "px");
		$(".navbar-default sidebar").css("min-height", (height) + "px");
    $(window).bind("load resize", function() {
        var width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        var height = (this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height;
        $("#page-wrapper").css("min-height", (height) + "px");
        $(".navbar-default sidebar").css("min-height", (height) + "px");
    });
    
    var url = window.location;
    // var element = $('ul.nav a').filter(function() {
    //     return this.href == url;
    // }).addClass('active').parent().parent().addClass('in').parent();
    var element = $('ul.nav a').filter(function() {
        return this.href == url;
    }).addClass('active').parent();

    while (true) {
        if (element.is('li')) {
            element = element.parent().addClass('in').parent();
        } else {
            break;
        }
    }
});
