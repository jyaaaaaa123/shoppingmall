console.log("Module.....");

var replyService = (function(){
	
	function add(reply, callback, error) { //답변 달기
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
	
	//답변 가져오기
	function getByQnaCode(param, callback, error) { 
		var qna_code = param;
		
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
	
	//답변 삭제
	function remove(qna_reply_code, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/reply/' + qna_reply_code,
			success: function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	//답변 수정
	function update(reply, callback, error) {
	
		$.ajax({
			type: 'put',
			url: '/reply/' + reply.qna_reply_code,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function get(qna_reply_code, callback, error) {
		
		$.get("/reply/" + qna_reply_code + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	
	return {
		add: add,
		getByQnaCode: getByQnaCode,
		remove: remove,
		update: update,
		get: get
	};
})();


