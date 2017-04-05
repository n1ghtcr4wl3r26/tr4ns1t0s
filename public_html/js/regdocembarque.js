function acepta(opcion,fila,key_cuo, key_voy_nber,key_dep_date, key_bol_ref) {      
  f = document.forms["BusqManifiestoForm"];  
   var Mensaje = "";
  if(opcion==4) { 
  
    if (!fFecha(f.docemb_fecha_embarque.value)) {
            Mensaje += '"Fecha de Salida" debe tener formato dd/mm/aaaa no mayor a hoy o tiene valores incorrectos.\n';
        }
    f.opcion.value=opcion;
    f.key_cuo.value=key_cuo;
    f.key_voy_nber.value=key_voy_nber;
    f.key_dep_date.value=key_dep_date;
    f.key_bol_ref.value=key_bol_ref;
    
    f.fila.value=fila;    
    return true;  
  }else if(opcion==6) {    
    f.opcion.value=opcion;
    f.fila.value=fila;    
    return true;  
  }else{
    return false;
  }
}

function fFecha( texto )
{
    var	today =	new	Date();
    var	yearNow	 = today.getFullYear() + 1;
    
    

  var mascara = new RegExp("^[0-3]{1}[0-9]{1}/(01|02|03|04|05|06|07|08|09|10|11|12)/[1-2][0-9]{3}$","g");
  if (texto.length)
  {
    if( mascara.test(texto) )
    {
      var dd = texto.substring( 0,  2);
      var mm = texto.substring( 3,  5);
      var aa = texto.substring( 6, 10);
  
      if( aa<1960 || aa> yearNow ) return false; //verficar con la fecha actual
      if( dd==0 ) return false;
      if( mm==4 || mm==6 || mm==9 || mm==11 )
      if( dd>30 ) return false;
      if( mm==2 )
      {
        var dias = aa%4 ? 28 : 29;
        if( dd>dias ) return false;
      }
      else
        if( dd>31) return false;
      return true;
    }
    else
      return false;
  }
  else
    return true;
}