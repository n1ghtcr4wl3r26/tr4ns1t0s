function fEvalua( ) {
  f=document.forms[1];
  if(!fTrim(f.etiqueta.value) && (!fTrim(f.gestion.value) || !fTrim(f.aduana.value) || !fTrim(f.registro.value)) ) {
    alert('Error:\n- Tiene que ingresar los datos leidos por el lector, o los datos del manifiesto.');
    return false;
  }
  
  if(fTrim(f.etiqueta.value)){
    f.gestion.value = '';
    f.aduana.value = '';
    f.registro.value = '';
  }
  
  return true;
}

function recibe(paduana,pgestion,pregistro) {

    f=document.forms[1];
  /*if( confirm('�Desea recepcionar el tr�mite: '+ valor1+'?') )
  { */
    f.opcion.value = 0;
    f.aduana.value = paduana;
    f.gestion.value = pgestion;
    f.registro.value = pregistro;
    f.submit();
    //}
}

function envia(opcion){
    var f=document.forms[1];
    f.opcion.value = opcion;
    var Mensaje = "";
    
    if( ! fTrim( f.peso.value ) )
        Mensaje = Mensaje + "'Peso de salida (Kg.)' es Obligatorio\n";
    else{ if( f.peso.value < 1)
	Mensaje = Mensaje + "'Peso de salida (Kg.)' debe ser mayor a cero\n";
    if (!fNum2( f.peso.value ))
	Mensaje = Mensaje + "'Peso de salida (Kg.)' debe tener el formato ###.##";
    }
    
    if( Mensaje != "" ) {
        alert(Mensaje);
        return false;
    }
		
    if(confirm("Se registrar\xe1 la salida de puerto, est\xe1 seguro de continuar?")) {
        f.submit();
    }
  }