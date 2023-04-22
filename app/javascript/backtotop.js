$(document).ready(function() {
    $('#back-to-top').hide();

    // show or hide button depending on scroll position
    $(window).scroll(function() {
        if ($(this).scrollTop() > 10) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });

    $('#back-to-top').click(function() {
        $('body, html').animate({scrollTop: 0}, 400);
        return false;
    })
})