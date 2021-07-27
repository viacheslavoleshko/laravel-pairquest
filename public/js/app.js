"use strict";

// Dom7
var $ = Dom7;




if (document.getElementById("masonry") !== null) {
    var masonry = new Macy({
        container: '#masonry',
        mobileFirst: true,
        columns: 1,
        margin: {
            y: 10,
            x: 10,
        },
        breakAt: {
            320: 2,
            360: 2,
            576: 3,
            600: 3,
            768: 3,
            1024: 4,
        },
    });
}

// Menu
$("body").on("click", ".toolbar .link", function(e) {
    $(".link.tab-link-active").removeClass("tab-link-active");
    $(this).addClass("tab-link-active");
});


$(document).on('page:init', '.page[data-name="page-blog-four"]', function(e) {
    let masonry2 = new Macy({
        container: '#masonry-two',
        mobileFirst: true,
        columns: 1,
        margin: {
            y: 10,
            x: 10,
        },
        breakAt: {
            320: 2,
            360: 2,
            576: 3,
            600: 3,
            768: 3,
            1024: 4,
        },
    });
});


$('form').eq(0).on("change", function(e) {
    $('input[name^=field]').each(function() {
        if (e.target != this)
            this.checked = false;
    });
})

$('form').eq(0).on('submit', function() {
    return $('input[name^=field]:checked:enabled').length == 1;
});