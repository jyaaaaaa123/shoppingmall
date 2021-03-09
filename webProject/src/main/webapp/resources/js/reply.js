console.log("Module.....");

var replyService = (function(){
	
	function add(reply, callback, error) {
		$.ajax({
			url: '/reply/new',
			type: 'POST',
			data: JSON.stringify(reply),
			contentType: 'application/json; charset=utf-8',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	};
	
	function getByQnaCode(param, callback, error) {
		var qna_code = param.qna_code;
		
		$.getJSON("/reply/get/" + qna_code + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}	
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
	};
	
	return {
		add: add,
		getByQnaCode: getByQnaCode
	};
	
})();


