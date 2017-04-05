function envia(opcion) {


    var f = document.forms["BusqManifiestoForm"];
    var Mensaje = "";
    var vref = document.getElementById("ref");
    var vreg = document.getElementById("reg");
//alert("chequeado referencia");
    if ($("#ref").attr("checked")) {

        if (!fFecha(f.reffechaSalida.value)) {
            Mensaje += '"Fecha de Salida" debe tener formato dd/mm/aaaa no mayor a hoy o tiene valores incorrectos.\n';
        }
        if (!fTrim(f.refaduanasel.value)) {
            Mensaje += "'Aduana' es obligatorio.\n";
        }
        if (!fTrim(f.refnroViaje.value)) {
            Mensaje += "'N\u00famero de Viaje' es Obligatorio.\n";
        }
        
    }
    else if ($("#reg").attr("checked")) {

        if (!fNumero(f.reggestion.value)) {
            Mensaje += "'Gesti\u00f3n' es Obligatorio.\n";
        }
        if (f.regaduanasel.value == "") {
            Mensaje += "'Aduana' es obligatorio.\n";
        }

        if (!fNumero(f.regnroRegistro.value)) {
            Mensaje += "'N\u00famero de Registro' es Obligatorio.\n";

          
        }

    }
            f.aopcion.value = opcion;
    if (Mensaje != "") {
        alert(Mensaje);
        return false;
    }
    else {
        f.submit();
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

function fNumero( texto )
{
  var mascara = new RegExp("^[0-9]{0,150}$","g");
  return mascara.test( texto )
}