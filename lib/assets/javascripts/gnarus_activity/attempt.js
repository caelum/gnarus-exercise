var gnarus = {
	server : function(returnUri) {
		return {
			send : function(solution) {
				var form = $('<form/>');
				form.attr({
					action : returnUri,
					style : "display: none"
				});
				var input = $('<input name="solution" />');
				input.val(solution);
				input.appendTo(form);
				form.appendTo($('body'));
				form.submit();
			}
		};
	},
	
	/* 
	 * getUserResponse ==> function that returns the parameters for the form
	 * updateView ==> callback that allows you to update the view
	*/
	attemptForm : function(options) {
		
		var getUserResponse = options.solution;
		var updateView = options.callback;
		
		var ui = {
      viewChanged : function(execution) {
				updateView(execution);
				if(execution.suceeded){
					var server = gnarus.server(options.gnarusUri);
					server.send(execution.solution);
				}
			}
		};
		
		return {
			skip : function() {
				finishWith("skiped");
			},
			process : function() {
				var target = $('#exercise').attr('action');
				$.post(target, getUserResponse(), function(r) {
					ui.viewChanged(r);
				});
			},
			setup : function(tryButton, skipButton) {
				tryButton = tryButton || $('#try');
				skipButton = skipButton || $('#skip');

				tryButton.click(this.process);
				
				if(options.allowsSkip) {
					skipButton.click(this.skip);
				} else {
					skipButton.hide();
				}
			}
		};	
	}
};
