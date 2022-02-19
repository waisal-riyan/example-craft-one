$('document').ready(function() {
	
	// Services Page Tab 

	$('.services-tab li a').click(function (e) {
		$('.start-tab').hide();
		e.preventDefault();
		$(this).tab('show');
		
		var myparent = $(this).parent('li');
		
		myparent.siblings('li').removeClass('selected').stop().animate({'height':'115px'});
		myparent.addClass('selected').css('height', '115px').stop().animate({ 'height':'135px' });
	});
	
	
	// Clients Page Tab
	
	window.setTimeout(function(){
		$('.tab-clients-nav li:first a').tab('show');
	}, 50);
	$('.tab-clients-nav li a').click(function (e) {
		e.preventDefault();
		$(this).tab('show');
	});
	
	$('.tab-clients-nav a[data-toggle="tab"]').on('shown', function (e) {
		refreshDot();
		fixClientsWrapper();
	})
	
	// Carousel
	$('.carousel').carousel();
	
	// LocalScroll
	$('.about-nav, #pages section#content.about-us .right-content > section footer').localScroll();
	
	var isIamVisible = false;
	var clickedAway = false;
	
	
	// Popover
	$('.map-dot, .team-list li .profile-image').popover({
		placement: 'top',
		offset: 15,
		trigger: 'manual',
		delay: { show: 350, hide: 100 },
		html: true,
	});
	
	var timer, popover_parent;
	
	function hidePopover(elem) {
		$(elem).popover('hide');
	}
	
	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
		$('.map-dot, .team-list li .profile-image').click(
			function() {
				var self = this;
				clearTimeout(timer);
				$('.popover').hide();
				popover_parent = self
				$(self).popover('show');            
			}
		);

		$(document).on({
			click: function() {
				clearTimeout(timer);
			},
			mouseleave: function() {
				var self = this;
				timer = setTimeout(function(){hidePopover(popover_parent)},300); 
			}
		}, '.popover');
	} else {
		$('.map-dot, .team-list li .profile-image').hover(
			function() {
				var self = this;
				clearTimeout(timer);
				$('.popover').hide();
				popover_parent = self
				$(self).popover('show');            
			}, 
			function() {
				var self = this;
				timer = setTimeout(function(){hidePopover(self)},300);                 
			}
		);

		$(document).on({
			mouseenter: function() {
				clearTimeout(timer);
			},
			mouseleave: function() {
				var self = this;
				timer = setTimeout(function(){hidePopover(popover_parent)},300); 
			}
		}, '.popover');
	} 
    
	
	$('body').on('click', '.popover-close', function(){
		$('.team-list li .profile-image, .map-dot').popover('hide');
	});
    
	/*
	var tmp = $.fn.popover.Constructor.prototype.show;
	$.fn.popover.Constructor.prototype.show = function () {
		tmp.call(this);
		if (this.options.callback) {
			this.options.callback();
		}
	}
	
	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
	
		// Popover - Clients
		$('.map-dot').popover({
			'trigger':'click',
			'html': true
		});
	
		// Popover - About Us
		$('.team-list li .profile-image').popover({
			'trigger':'click',
			'placement': 'top',
			'html': true
		});
		
	} else {
		
		$('.map-dot').popover({
			'trigger':'hover',
			'html': true, 
  			callback: function() { 
				console.log($('.popover:visible'));
			} 
		});
	
		$('.team-list li .profile-image').popover({
			'trigger':'hover',
			'placement': 'top',
			'html': true
		});
	}
	
	$('body').on('click', '.popover-close', function(){
		$('.team-list li .profile-image, .map-dot').popover('hide');
	});
	
	$(document).click(function (e) {
		if (isIamVisible & clickedAway) {
			$('.team-list li .profile-image, .map-dot').popover('hide');
			isIamVisible = false;
			clickedAway = false;
		} else {
			isIamVisible = true;
			clickedAway = true;
		}
	});
	
	var $visiblePopover;

	$('body').on('click', '.map-dot, .team-list li .profile-image', function(e) {
		
		var $this = $(this);
		
		if ($this.data('popover').tip().hasClass('in')) {
			$visiblePopover && $visiblePopover.popover('hide');
			$visiblePopover = $this;
			clickedAway = false;
			isIamVisible = false;
    	} else {
			$visiblePopover = '';
			clickedAway = false;
			isIamVisible = true;
		}
	});
	*/
	
	function refreshDot() {
		$('.dot-wrapper:visible').css({
			'height': $('.dot-wrapper:visible').find('img').outerHeight()+'px',
			'width': $('.dot-wrapper:visible').find('img').outerWidth()+'px',
		});
	
		if($('.map-dot').size() > 0) {
			$('.map-dot').each(function() {
				
				var myMap = $(this).parent('.dot-wrapper').find('img');
				
				$(this).css({
					'top': (($(this).attr('data-top') - 1) / myMap.outerHeight() * 100) + '%',
					'left': (($(this).attr('data-left') - 1) / myMap.outerWidth() * 100) + '%'
				});
			});
		}
	}
	
	// Map Dot Position
	function mapDot() {
		
		$(window).on('load', function() {
			$('.dot-wrapper:visible').css({
				'height': $('.dot-wrapper:visible').find('img').outerHeight()+'px',
				'width': $('.dot-wrapper:visible').find('img').outerWidth()+'px',
			});
	
			if($('.map-dot').size() > 0) {
				$('.map-dot').each(function() {
				
					var myMap = $(this).parent('.dot-wrapper').find('img');
				
					$(this).css({
						'top': (($(this).attr('data-top') - 1) / myMap.outerHeight() * 100) + '%',
						'left': (($(this).attr('data-left') - 1) / myMap.outerWidth() * 100) + '%'
					})
				});
			}
		});
	}
	
	mapDot();
	
	// Client list
	$('.clients-list li').hover(function() {
		$(this).css('text-decoration', 'underline');
	}, function() {
		$(this).css('text-decoration', 'none');
	});
	
	$('.map-dot:first-child').popover('show');
	
	$('.clients-list li').css('cursor', 'pointer').on('click', function() {
		clearTimeout(timer);
		$('.popover').hide();
		$('.map-dot[data-target-id='+ $(this).attr('data-target') +']').popover('show');
	});
	
	$(document).on('click', function(e) {
		currentClicked = $(e.target).attr('class');
		if(currentClicked != 'map-dot' && currentClicked != 'profile-image' && currentClicked != 'item-list-clicker') {
			clearTimeout(timer);
			$('.popover').hide();
		}
	});
	
	// Homepage background
	function addBackground() {
		if($('#home').size() > 0 && $(window).outerWidth() <= 767 ) {
			$('#home #wrapper').css({
				'height': $(window).outerHeight()+'px',
				'background': 'rgba(0,0,0,0.5)'
			});
		} else {
			$('#home #wrapper').css({
				'height': $(window).outerHeight()+'px',
				'background': 'none'
			});
		}
	}
	
	addBackground();
	
	// Recall
	$(window).on('resize', function() {
		fixClientsWrapper();
		refreshDot();
		addBackground();
	});
	
	function fixClientsWrapper() {
		if($(window).outerWidth() > 945) {
			if($('.clients-wrapper:visible').size() > 0) {
				$('.clients-wrapper:visible').css('height', $('.clients-wrapper').siblings('.map-wrapper').outerHeight()+'px');
				$('.clients-wrapper:visible').css('width', ($(window).outerWidth() - $('.clients-wrapper').siblings('.map-wrapper').outerWidth())+'px');
			}
		}
	}
	
	window.setTimeout(function() {
		fixClientsWrapper();
	}, 100);
	
	// Mobile menu
	$('.mobilemenu-toggle').toggle(function() {
		$('#pages header#header .mobilemenu').stop().animate({'height':'200px'});
	}, function() {
		$('#pages header#header .mobilemenu').stop().animate({'height':'38px'});
	});
	
	$(window).on('resize', function() {
		console.log($(window).outerWidth());
	})
});