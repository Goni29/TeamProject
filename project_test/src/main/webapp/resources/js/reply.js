console.log("==Reply Module==");

var replyService = (function(){
    function add(reply, callback, error){
        $.ajax({
            type: 'post',
            url: '/reply/new',
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            
            success: function(resultData, state, xhr){
                if(callback){
                    callback(resultData);
                }
                
                // 위의 속성에서 정의한 요청에 대해 정상 처리 되었을 때
                // 호출하는 곳에서 넘겨받은 함수에게 자료를 넘겨주며 실행.
            },
            
            error: function(xhr, state, err){
                if(err){
                    error(err);
                }
            }
        });
    }
    
    function get(rno, callback, error){
        $.getJSON(
        "/reply/" + rno + ".json", 
            function(resultData, state, xhr) { // success
                
                if (callback) {
                    callback(resultData);
                }
            }).fail(function(xhr, state, err){
            	if (error){
            		error(err);
            	}
            });
    }

    function getList(param, callback, error){
        let bno = param.bno;
        let page = param.page;
        
        $.getJSON(
        "/reply/pages/" + bno + "/" + page + ".json", 
            function(resultData, state, xhr) { // success
                console.log(resultData);
                console.log(state);
                console.log(xhr);
                
                if (callback) {
                    callback(resultData);
                }
            }).fail(function(xhr, state, err){
            	if (error){
            		error(err);
            	}
            });
    }
    
    function getCount(param, callback, error){
        let bno = param.bno;
        
        $.getJSON(
        "/reply/count/" + bno + ".json", 
            function(resultData, state, xhr) { // success
                
                if (callback) {
                    callback(resultData);
                }
            }).fail(function(xhr, state, err){
            	if (error){
            		error(err);
            	}
            });
    }
    
    
    function remove(rno, callback, error){
       $.ajax({
            type: 'delete',
            url: '/reply/' + rno,
            
            success: function(resultData, state, xhr){
                if(callback){
                    callback(resultData);
                }
            },
            
            error: function(xhr, state, err){
                if(err){
                    error(err);
                }
            }
        });
    }
    
    function update(reply, callback, error){
        $.ajax({
            type: 'put',
            url: '/reply/' + reply.rno,
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            
            success: function(resultData, state, xhr){
                if(callback){
                    callback(resultData);
                }
            },
            
            error: function(xhr, state, err){
                if(err){
                    error(err);
                }
            }
        });
    }

    return {
        add: add,
        get: get,
        getList: getList,
        getCount: getCount,
        remove: remove,
        update: update
    };
})();