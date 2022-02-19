/* Debounce resize */
(function($,sr){ 
	
	var debounce = function(func, threshold, execAsap) {
   		var timeout;
   
		     return function debounced () {
      	    var obj = this, args = arguments;
		         function delayed () {
      	        if (!execAsap)
		                 func.apply(obj, args);
      	        timeout = null; 
		         };
   
      	    if (timeout)
		             clearTimeout(timeout);
      	    else if (execAsap)
		             func.apply(obj, args);
   
      		   timeout = setTimeout(delayed, threshold || 100); 
		    };
	};
  
	jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');

/* Natural width & Natural height */
(function($){
  var
  props = ['Width', 'Height'],
  prop;

  while (prop = props.pop()) {
    (function (natural, prop) {
      $.fn[natural] = (natural in new Image()) ? 
      function () {
        return this[0][natural];
      } : 
      function () {
        var 
        node = this[0],
        img,
        value;

        if (node.tagName.toLowerCase() === 'img') {
          img = new Image();
          img.src = node.src,
          value = img[prop];
        }
        return value;
      };
    }('natural' + prop, prop.toLowerCase()));
  }
}(jQuery));

var pt = $.fn.popover.Constructor.prototype.show;
$.fn.popover.Constructor.prototype.show = function () {
	pt.call(this);
	if (this.options.afterShowed) {
		this.options.afterShowed();
	}
}
