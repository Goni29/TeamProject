console.log("==Favorite Module==");

var favoriteService = (function(){
    function add(vo, callback, error){
        $.ajax({
            type: 'post',
            url: '/favorite/add',
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

    function remove(fno, callback, error){
       $.ajax({
            type: 'delete',
            url: '/favorite/' + fno,
            
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
        remove: remove
    };
})();