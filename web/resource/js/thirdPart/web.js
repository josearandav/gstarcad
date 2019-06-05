window.onload=function(){
var ua = navigator.userAgent;
if(ua.indexOf("MSIE")>0){   
  if(ua.indexOf("MSIE 6.0")>0){   
    //alert("ie6");    
	document.getElementById("t_clip").style.display="block";
  }   
  if(ua.indexOf("MSIE 7.0")>0){  
    document.getElementById("t_clip").style.display="block";   
  }   
  if(ua.indexOf("MSIE 8.0")>0 || (ua.indexOf("MSIE 9.0")>0 && !window.innerWidth)){
    document.getElementById("t_clip").style.display="block"; 
  }   
  if(ua.indexOf("MSIE 9.0")>0){  
    document.getElementById("t_clip").style.display="none";
  }   
} 
}        