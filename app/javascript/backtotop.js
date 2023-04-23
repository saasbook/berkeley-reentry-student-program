$(document).ready(function() {
    $('.btn-back-to-top').hide();

    // show or hide button depending on scroll position
    $(window).scroll(function() {
        if ($(this).scrollTop() > 10) {
            $('.btn-back-to-top').fadeIn();
        } else {
            $('.btn-back-to-top').fadeOut();
        }
    });

    $('.btn-back-to-top').click(function() {
        $('body, html').animate({scrollTop: 0}, 400);
        return false;
    })
})