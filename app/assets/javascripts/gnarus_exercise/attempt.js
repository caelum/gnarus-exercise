var gnarus = {
	attemptForm : function(solution, viewer) {
		
		var viewChanged = function(execution) {
			viewer(execution);
			if(execution.suceeded) $('#exercise').submit();
		};
		
		var processAnswer = function() {
			var target = $('#exercise').attr('action');
			$.post(target, {solution : solution}, function(r) {
				viewChanged(r);
			});
		};
		
		return {
			setup : function() {
				$('#try').click(processAnswer);
			}
		};
		
	};	
};
