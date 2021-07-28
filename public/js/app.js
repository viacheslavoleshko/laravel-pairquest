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