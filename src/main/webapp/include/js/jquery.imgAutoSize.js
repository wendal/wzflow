/**
 * Created by wizzer on 15-4-22.
 */
(function ($) {

    var loadImg = function (url, fn) {
        var img = new Image();
        img.src = url;
        if (img.complete) {
            fn.call(img);
        } else {
            img.onload = function () {
                fn.call(img);
                img.onload = null;
            };
        };
    };

    $.fn.imgAutoSize = function (padding) {
        var maxWidth = this.innerWidth() - (padding || 0);
        return this.find('img').each(function (i, img) {
            loadImg(this.src, function () {
                if (this.width > maxWidth) {
                    var height = maxWidth / this.width * this.height,
                        width = maxWidth;

                    img.width = width;
                    img.height = height;
                };
            });
        });
    };

})(jQuery);