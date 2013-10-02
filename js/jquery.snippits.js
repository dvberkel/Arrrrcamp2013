(function($, undefined){
    $.fn.snippits = function( options ){
	var settings = $.extend({
	    'suffix' : 'snippit',
	    'directory' : 'snippits',
	    'onFinish' : function(){}
	}, options);

	this.each(function(){
	    var $this = $(this);
	    var url = settings.directory + '/' + this.dataset[ settings.suffix ];
	    $.ajax({
		url : url,
		dataType : "text",
		success : function(data){ $this.html(data) },
		async : false
	    });
	});

	settings.onFinish();

	return this;
    };
})( jQuery );
