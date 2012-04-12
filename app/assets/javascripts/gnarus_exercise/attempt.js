var gnarus = {
	attemptForm : function(solution, viewer, returnUri) {
		
		var viewChanged = function(execution) {
			viewer(execution);
			if(execution.suceeded) {
				var form = $('<form action=' + returnUri + '></form>');
				var input = $('<input name="solution" />');
				input.val(execution.solution);
				form.insertAfter(input);
				form.submit();
			}
		};
		
		return {
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
