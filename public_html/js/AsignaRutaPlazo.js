


function fEvalua() {
  var Mensaje="";
  f=document.forms[0];

  if(bCancel==true) return true;

if(f.accion.value == 5) 
{
      var r = confirm("Est\341 seguro de eliminar la fotografia.")
      if (r == true) {
        return true;
      }
      else {
         return false;
      }

}


if(f.accion.value == 4) 
{

  if(! fTrim(f.tipo_img.value))
      Mensaje=Mensaje+"'Tipo de Documento' es obligatorio\n";

}


else
{
  f.pre1.value=fUpper(f.pre1.value);

  if(! foFecha(f.fecha.value))
    Mensaje=Mensaje+"'Fecha de Partida' es obligatorio o tiene valores que no son correctos (DD/MM/AAAA)\n";
  if(! foHora(f.hora.value))
    Mensaje=Mensaje+"'Hora de Partida' es obligatorio o tiene valores que no son correctos (HH:MM; HH:00~23;MM:00~59)\n";
  if(Mensaje=="")
  {
    var fecing=fFormato(f.fecha.value, f.hora.value);
    if(fcFechas(fecing, fActual))
      Mensaje=Mensaje+"'Fecha y Hora de Partida' no puede ser superior a la fecha y hora: "+pConvierteFecha(fActual)+"\n";
    if(fcFechas(fRegistro, fecing))
      Mensaje=Mensaje+"'Fecha y Hora de Partida' no puede ser inferior a la fecha de Registro del Manifiesto: "+pConvierteFecha(fRegistro)+"\n";
  }

  var adupas=f.elements["paso"];
  if(adupas != null) {
    if(! fTrim(f.paso.value))
      Mensaje=Mensaje+"'Aduana Paso' es obligatorio\n";
    if(! fTrim(f.obs.value))
      Mensaje=Mensaje+"'Observación' es obligatorio\n";
  }


  if(hayBoleta) {
    if(! fTrim(f.boleta.value))
      Mensaje=Mensaje+"'Nro. Boleta' es obligatorio o tiene valores que no son correctos\n";
    if(! fTrim(f.entidad.value))
      Mensaje=Mensaje+"'Entidad Financiera' es obligatorio\n";
    if(! foFloat(f.monto.value)) {
      Mensaje=Mensaje+"'Monto' es obligatorio o tiene valores que no son correctos\n";
    } else {
      if(f.monto.value==0)
        Mensaje=Mensaje+"'Monto' tiene que ser mayor a cero\n";
    }
    if(! fTrim(f.moneda.value))
      Mensaje=Mensaje+"'Tipo de Moneda' es obligatorio\n";
    if(! foFecha(f.fecini.value))
      Mensaje=Mensaje+"'Vigencia Fecha Inicial' es obligatorio o tiene valores que no son correctos (DD/MM/AAAA)\n";
    if(! foFecha(f.fecfin.value)) {
      Mensaje=Mensaje+"'Vigencia Fecha Final' es obligatorio o tiene valores que no son correctos (DD/MM/AAAA)\n";
    } else {
      if(Mensaje=="") {
        fecing=fFormato(f.fecha.value, f.hora.value);
        var ffinf1=fFormato(f.fecini.value, "00:00");
        var ffinf2=fFormato(f.fecini.value, "23:59");
        var ffsup=fFormato(f.fecfin.value, "23:59");

        if(fcFechas(fRegistro, ffinf2))
          Mensaje=Mensaje+"'Vigencia' la Fecha Inicial no tiene que ser inferior a la Fecha: "+pConvierteFecha(fRegistro)+"\n";
        if(fcFechas(ffinf1, fecing))
          Mensaje=Mensaje+"'Vigencia' la Fecha Inicial no tiene que ser superior a la Fecha: "+f.fecha.value+"\n";
        if(fcFechas(ffinf2, ffsup))
          Mensaje=Mensaje+"'Vigencia' la Fecha Final tiene que ser superior a la Fecha Inicial: "+f.fecini.value+"\n";
      }
    }
  }

  ruta=new Array(10);
  var j=0;
  for(i=0; i<f.length; i++) {
    if((f[i].type=="text" || f[i].type=="hidden") && (f[i].name.substring(0, 5)=='lista')) {
      if(! foNumero(f[i].value))
        Mensaje=Mensaje+"'Plan de Ruta en la fila "+(i-index) +"' es obligatorio o tiene valores que no son correctos\n";
      else
        ruta[j++]=f[i].value;
    }
  }
  ruta.sort();
  for(h=0; h<j; h++) {
    if(ruta[h] != (h+1))
      Mensaje=Mensaje+"'Plan de Ruta' falta el Tramo "+(h+1)+"\n";
  }


}




  if(Mensaje=="") {
    return true;
  } else {
    alert(Mensaje);
    return false;
  }
}