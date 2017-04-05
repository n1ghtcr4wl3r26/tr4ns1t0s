/****************** NUEVO AJAX ********************/
function nuevoAjax()
  {	
    var xmlhttp=false;
    try {
      xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    }catch (e) {
      try {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (E) {
        xmlhttp = false;
      }                    
    }
    if (!xmlhttp && typeof XMLHttpRequest!="undefined") {
      xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
  } 

  function ajaxlistaDepManif(pcar_reg_year,pkey_cuo,pcar_reg_nber){
         
    div_metodo=document.getElementById("id_deptransitorio");
    ajax=nuevoAjax();
    var url='js/ajaxlistaDepTransitorio.jsp?vcar_reg_year='+pcar_reg_year+'&vkey_cuo='+pkey_cuo+'&vcar_reg_nber='+pcar_reg_nber;
    url+='&pq='+(Math.random()*10000);
    ajax.open ('GET', url, true);
  	ajax.onreadystatechange=function(){                        
      if (ajax.readyState==1) {
        div_metodo.innerHTML='<img src=img/load.gif>';
      }else if (ajax.readyState==4) {
        div_metodo.innerHTML=ajax.responseText;
      }
    }                
    ajax.send(null);
  } 
  
  function irajaxdeposito(f){
    if(fTrim(f.car_reg_year.value) && fTrim(f.key_cuo.value) && fTrim(f.car_reg_nber.value)){
        ajaxlistaDepManif(f.car_reg_year.value,f.key_cuo.value,f.car_reg_nber.value);
    }
    
  }
  $(document).ready(function(){
   var f = document.forms["RegLlegDepositoTransitorioForm"];
     irajaxdeposito(f);
     
  });
  
  

  
    


