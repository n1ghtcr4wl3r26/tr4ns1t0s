function envia(opcion) {

    var f = document.forms["ConsManifiestoForm"];
    var Mensaje = "";
    
    var cantDias;
    var fecinicio;
    var fecfin;
    
    f.aopcion.value = opcion;
    
    if (opcion == '81') {

        if (!fTrim(f.agestion.value)){
            Mensaje += "'Gesti\u00f3n' es Obligatorio.\n";
        }   
        if (f.aduanasel.value == "") {
            Mensaje += "'Aduana' es obligatorio.\n";
        }            

        if (!fTrim(f.anumero.value)){
            Mensaje += "'N\u00famero' es Obligatorio.\n";
        }
        if (Mensaje != "") {
            alert(Mensaje);
            return false;
        }
        else {
            f.submit();
        }
    }
    
    if (opcion == '80' || opcion == '82'  ) {

       /* if (!fTrim(f.agestion.value))
            Mensaje = Mensaje + "'Gesti\u00f3n' es Obligatorio\n";

        if (!fTrim(f.anumero.value))
            Mensaje = Mensaje + "'N\u00famero' es Obligatorio\n"; */

        if(!fTrim(f.bus_fecini.value))
            Mensaje = Mensaje + "'Fecha inicio' es obligatorio\n";
        if(!fFecha( f.bus_fecini.value ))                                 
            Mensaje = Mensaje + "'Fecha inicio' debe ser dd/mm/aaaa no mayor a hoy\n";
        if(!fTrim(f.bus_fecfin.value))
            Mensaje = Mensaje + "'Fecha fin' es obligatorio\n";
        if(!fFecha( f.bus_fecfin.value ))
            Mensaje = Mensaje + "'Fecha fin' debe ser dd/mm/aaaa no mayor a hoy\n";
        if(fTrim(f.bus_fecini.value)){
                if(!fMayorOIgualQueU(f.bus_fecfin.value, f.bus_fecini.value))
                        Mensaje = Mensaje + "'Fecha Fin' debe ser mayor a 'Fecha Inicio'\n";
        }


           fecinicio = f.bus_fecini.value;
           fecfin = f.bus_fecfin.value;
           
           var di= fecinicio.substr(0,2);
           var mi= fecinicio.substr(3,2);
           var ai= fecinicio.substr(6,9);
           var rfecinicio = ai+'/'+mi+'/'+di;
           
           var df= fecfin.substr(0,2);
           var mf= fecfin.substr(3,2);
           var af= fecfin.substr(6,9);
           var rfecfin = af+'/'+mf+'/'+df;
                       
           cantDias = daysBetween(rfecinicio , rfecfin);   

           if (cantDias > 90){
                Mensaje = Mensaje + "El rango de fechas debe ser menor a 90 dias";
           }                        

        if (Mensaje != "") {
            alert(Mensaje);
            return false;
        }
        else {
            f.submit();
        }
    }    


    if (opcion == '83'  ) {

        if(!fTrim(f.bus_fecini.value))
            Mensaje = Mensaje + "'Fecha inicio' es obligatorio\n";
        if(!fFecha( f.bus_fecini.value ))                                 
            Mensaje = Mensaje + "'Fecha inicio' debe ser dd/mm/aaaa no mayor a hoy\n";
        if(!fTrim(f.bus_fecfin.value))
            Mensaje = Mensaje + "'Fecha fin' es obligatorio\n";
        if(!fFecha( f.bus_fecfin.value ))
            Mensaje = Mensaje + "'Fecha fin' debe ser dd/mm/aaaa no mayor a hoy\n";

        if(fTrim(f.bus_fecini.value)){
                if(!fMayorOIgualQueU(f.bus_fecfin.value, f.bus_fecini.value))
                        Mensaje = Mensaje + "'Fecha Fin' debe ser mayor a 'Fecha Inicio'\n";
        }


           fecinicio = f.bus_fecini.value;
           fecfin = f.bus_fecfin.value;
           
           var di= fecinicio.substr(0,2);
           var mi= fecinicio.substr(3,2);
           var ai= fecinicio.substr(6,9);
           var rfecinicio = ai+'/'+mi+'/'+di;
           
           var df= fecfin.substr(0,2);
           var mf= fecfin.substr(3,2);
           var af= fecfin.substr(6,9);
           var rfecfin = af+'/'+mf+'/'+df;
                       
           cantDias = daysBetween(rfecinicio , rfecfin);   

           if (cantDias > 90){
                Mensaje = Mensaje + "El rango de fechas debe ser menor a 90 dias";
           }                        



        if (Mensaje != "") {
            alert(Mensaje);
            return false;
        }
        else {
            f.submit();
        }
    }   



}



function fFecha( texto )
{
  var mascara = new RegExp("^[0-3]{1}[0-9]{1}/(01|02|03|04|05|06|07|08|09|10|11|12)/[1-2][0-9]{3}$","g");
  if (texto.length)
  {
    if( mascara.test(texto) )
    {
      var dd = texto.substring( 0,  2);
      var mm = texto.substring( 3,  5);
      var aa = texto.substring( 6, 10);
      
      
  
      if( aa<1900 || aa>2100 ) return false; //verficar con la fecha actual
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
      if(fcFecha( texto, fHoy() ) )
        return false;

      return true;
    }
    else
      return false;
  }
  else
    return true;
}


function fTrim( texto )
{
  aux = Trim( texto );
  if( aux == "" ) 
    return false;
  else
    return true;
}

function Trim ( texto )
{
  if (texto.length) 
  {
    while( '' + texto.charAt(0) == " " )
    {
      texto = texto.substring( 1, texto.length);
    }
  }
  return texto;
}

function fcFecha( fecini, fecfin )
{
  var fini = fecini.substring( 6, 10) + fecini.substring( 3, 5) + fecini.substring( 0, 2);
  var ffin = fecfin.substring( 6, 10) + fecfin.substring( 3, 5) + fecfin.substring( 0, 2);
  if( fini > ffin )
    return true;
  else
    return false;
}

function fHoy( )
{
  var fecha = new Date();
  var ano = fecha.getFullYear();
  var mes = (fecha.getMonth()<9) ? ("0" + (fecha.getMonth() + 1)) : (fecha.getMonth() + 1);
  var dia = (fecha.getDate()<=9) ? ("0" + fecha.getDate()) : (fecha.getDate());
  return (dia+"/"+mes+"/"+ano);
}

function soloNumeros(e) 
{ 
var key = window.Event ? e.which : e.keyCode 
return ((key >= 48 && key <= 57) || (key==8) || (key==110)) 
} 