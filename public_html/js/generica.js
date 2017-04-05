function imprimire(f){
  var msg = '';
  //f=document.forms[1];
  //VALIDAMOS LA EXISTENCIA DE ADUANA
  if(! fTrim(f.aduana.value))
    msg=msg + '"Aduana" es obligatorio\n';

  //VALIDAMOS LA EXISTENCIA DEL DATO GESTION
  /*if(!fNumero(f.gestion.value)) {
    msg=msg + 'Gestión es obligatorio o tiene valores que no son correctos\n';
  } else {
    if((f.gestion.value < 2013) || (f.gestion.value > 2025))
      msg=msg + 'Gestión tiene valores que no son correctos\n';
  }*/
  //VALIDAMOS LAS FECHAS DESDE Y HASTA
  if(!fTrim(f.fdesde.value)){
    msg = msg + '"Fecha desde" es obligatorio formato: dd/mm/yyyy\n';
    
  }else{
      if(!fFechaP1(f.fdesde.value))
            msg = msg + '"Fecha desde" debe pertenecer a esta gestion\n';
      if (fFechaM1(f.fdesde.value))
        msg = msg + '"Fecha desde" obligatorio formato: dd/mm/yyyy, no debe se menor a la fecha de hoy\n';
  }
  if(!fTrim(f.fhasta.value)){
    msg = msg + '"Fecha hasta" es obligatorio formato: dd/mm/yyyy\n';
  }else{
        if(!fFechaP1(f.fhasta.value))
            msg = msg + '"Fecha hasta" debe pertenecer a esta gestion\n';
      if (fFechaM1(f.fhasta.value)){
        msg = msg + '"Fecha hasta" obligatorio formato: dd/mm/yyyy, no debe se menor a la fecha de hoy\n';
      }else{
          
          if(fcFecha1( f.fdesde.value, f.fhasta.value) )
            msg = msg + '"Fecha desde" debe ser menor a Fecha hasta: dd/mm/yyyy \n';
          if(dFechas1( f.fdesde.value, f.fhasta.value )>180 )
            msg = msg + 'Rango de fechas no debe ser mayor a 180 dias \n';
      }
  }
  //VALIDAMOS LA CANTIDAD INGRESADA
  if((f.cantidad.value !='10' && f.cantidad.value !='20' && f.cantidad.value !='50')&& f.cantidad.value !='100')
        msg = msg + '"Cantidad" tiene un valor incorrecto\n';
  /*else if(f.cantidad.value !='50')
        msg = msg + 'Cantidad tiene un valor incorrecto\n';
  else if(f.cantidad.value !='100')
        msg = msg + 'Cantidad tiene un valor incorrecto\n';*/
  /*if(!f.cantidad.value.equals("50"))
    msg = msg + 'Cantidad tiene un valor incorrecto\n';
  if(!f.cantidad.value.equals("100"))
    msg = msg + 'Cantidad tiene un valor incorrecto\n';*/
  if(! fTrim(f.solicitud.value))
    msg=msg + '"Motivo" es obligatorio\n';
  if(msg != '')
  {    alert(msg);
     return false;
    }
    f.submit();
   //window.open( "Etiqueta.jsp?aduana="+f.aduana.value+"&gestion="+f.gestion.value+"&fdesde="+f.fdesde.value+"&fhasta="+f.fhasta.value+"&cantidad="+f.cantidad.value+"&impresora="+f.impresora.value+"&solicitud="+f.solicitud.value, "TRANSITOS", "menubar=0,scrollbars=1, width=700, height=500,top=200,left=250, resizable=1");  
   //return true;
}
function fFechaM1( texto )
{
  var fecha = new Date();
  var anio = fecha.getFullYear();
  var mascara = new RegExp("^[0-3]{1}[0-9]{1}/(01|02|03|04|05|06|07|08|09|10|11|12)/[1-2][0-9]{3}$","g");
  if (texto.length)
  {
    if( mascara.test(texto) )
    {
      var dd = texto.substring( 0,  2);
      var mm = texto.substring( 3,  5);
      var aa = texto.substring( 6, 10);
      if( aa<anio || aa>anio ) return false; //verficar con la fecha actual}
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
      if(fcFecha1( texto, fHoy1() ) )
        return false;
      return true;
    }
    else
      return false;
  }
  else
    return true;
}

function fFechaP1( texto )
{
  var fecha = new Date();
  var anio = fecha.getFullYear();
  var mascara = new RegExp("^[0-3]{1}[0-9]{1}/(01|02|03|04|05|06|07|08|09|10|11|12)/[1-2][0-9]{3}$","g");
  if (texto.length)
  {
    if( mascara.test(texto) )
    {
      var dd = texto.substring( 0,  2);
      var mm = texto.substring( 3,  5);
      var aa = texto.substring( 6, 10);
      if( aa>anio ) return false; //verficar con la fecha actual}
      //if( dd==0 ) return false;
      //if( mm==4 || mm==6 || mm==9 || mm==11 )
      //if( dd>30 ) return false;
      /*if( mm==2 )
      {
        var dias = aa%4 ? 28 : 29;
        if( dd>dias ) return false;
      }
      else
        if( dd>31) return false;
      if(fcFecha( texto, fHoy() ) )
        return false;*/

      return true;
    }
    else
      return false;
  }
  else
    return true;
}
function dFechas1 (fecini, fecfin) {

   //Obtiene dia, mes y año
   var fecha1 = new fecha3( fecfin );
   var fecha2 = new fecha3( fecini );
   //Obtiene objetos Date
   var miFecha1 = new Date( fecha1.anio, fecha1.mes, fecha1.dia );
   var miFecha2 = new Date( fecha2.anio, fecha2.mes, fecha2.dia );
   //Resta fechas y redondea
   var diferencia = miFecha1.getTime() - miFecha2.getTime();
   var dias = Math.floor(diferencia / (1000 * 60 * 60 * 24));
   return dias;
}
function fcFecha1( fecini, fecfin )
{
  var fini = fecini.substring( 6, 10) + fecini.substring( 3, 5) + fecini.substring( 0, 2);
  var ffin = fecfin.substring( 6, 10) + fecfin.substring( 3, 5) + fecfin.substring( 0, 2);
  if( fini >= ffin ){
    return true;
  }else
    return false;
}

function fHoy1( )
{
  var fecha = new Date();
  var ano = fecha.getFullYear();
  var mes = (fecha.getMonth()<9) ? ("0" + (fecha.getMonth() + 1)) : (fecha.getMonth() + 1);
  var dia = (fecha.getDate()<=9) ? ("0" + fecha.getDate()) : (fecha.getDate());
  return (dia+"/"+mes+"/"+ano);
}

function fecha3( cadena ) {

   //Separador para la introduccion de las fechas
   var separador = "/";

   //Separa por dia, mes y año
   if ( cadena.indexOf( separador ) != -1 ) {
        var posi1 = 0;
        var posi2 = cadena.indexOf( separador, posi1 + 1 );
        var posi3 = cadena.indexOf( separador, posi2 + 1 );
        this.dia = cadena.substring( posi1, posi2 );
        this.mes = cadena.substring( posi2 + 1, posi3 );
        this.anio = cadena.substring( posi3 + 1, cadena.length );
   } else {
        this.dia = 0;
        this.mes = 0;
        this.anio = 0;
   }
}
