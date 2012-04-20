var gnarus = {
	attemptForm : function(solution, viewer, returnUri) {
		
		var finishWith = function(solution) {
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
		};
		
		var viewChanged = function(execution) {
			viewer(execution);
			if(execution.suceeded) finishWith(execution.solution);
		};
		
		return {
			skip : function() {
				finishWith("skiped");
			},
			process : function() {
				var target = $('#exercise').attr('action');
				$.post(target, solution(), function(r) {
					viewChanged(r);
				});
			},
			setup : function() {
				$('#try').click(this.process);
			}
		};	
	}
};
