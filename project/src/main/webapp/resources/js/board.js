console.log("==Board Module==");

var boardService = (function(){

    function jsonList(param, callback, error){
        let sort = param.sort;
        let page = param.page;
        let category = param.category;
        
        $.getJSON(
        "/board/json/" + sort + "/" + page + "/" + category + ".json", 
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
    
        function jsonListAll(param, callback, error){
        let sort = param.sort;
        
        $.getJSON(
        "/board/json/" + sort + ".json", 
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
        jsonList: jsonList,
        jsonListAll: jsonListAll
    };
})();