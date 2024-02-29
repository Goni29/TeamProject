console.log("==Search Module==");

var searchService = (function(){
    function insert(vo, callback, error){
        $.ajax({
            type: 'post',
            url: '/search/insert',
            data: JSON.stringify(vo),
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
    
    function getCountList(sortTime, callback, error){
        $.getJSON(
        "/search/getCountList/" + sortTime + ".json", 
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
    
    function getStatList(sortTime, sort, callback, error){
        $.getJSON(
        "/search/getStatList/" + sortTime + "/" + sort + ".json", 
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

    return {
        insert:insert,
        getCountList:getCountList,
        getStatList:getStatList
    };
    
    
})();