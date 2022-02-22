$(document).ready(function(){
	
	var num = $('#num').val();
	
    $.ajax({
		type : 'post',
		url : '/food/view/address',
		data : num,
		dataType : 'json',
		contentType: "application/json; charset=utf-8",
		success : function(data){
			var resAddress = data.address2;
			
		    naver.maps.Service.geocode({
		        query: resAddress
		    }, function(status, response) {
		        if (status !== naver.maps.Service.Status.OK) {
                    return alert('return');
                    
		        }
				
		        var result = response.v2,
		            items = result.addresses; 

		        let x = parseFloat(items[0].x); 
		    	let y = parseFloat(items[0].y); 
		    	
                // 지도 띄우기 
		    	var map = new naver.maps.Map('map', {
		    	    center: new naver.maps.LatLng(y, x),
		    	    zoom: 19
		    	});
				
                // 마커 찍기 
		    	var marker = new naver.maps.Marker({
		    	    position: new naver.maps.LatLng(y, x),
		    	    map: map
		    	});
		    });
			
		}
	});
});
