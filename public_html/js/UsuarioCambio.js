function fEvalua(){
  var Mensaje="";
  f=document.forms[0];

  if(bCancel==true)
    return true;

  f.usuario.value=fUpper(f.usuario.value);

  if(! fTrim(f.usuario.value))
    Mensaje=Mensaje + "'Usuario' es obligatorio\n";
  if(! fTrim(f.clave.value))
    Mensaje=Mensaje + "'Anterior Contraseña' es obligatorio\n";
  if(! fTrim(f.nuevo.value))
    Mensaje=Mensaje + "'Nueva Contraseña' es obligatorio\n";
  if(! fTrim(f.confnuevo.value))
    Mensaje=Mensaje + "'Confirmación Contraseña' es obligatorio\n";
  if(f.nuevo.value != f.confnuevo.value)
    Mensaje=Mensaje + "'Nueva Contraseña' y 'Confirmación Contraseña' no son iguales\n";

  if(Mensaje=="") {
    return true
  } else {
    Mensaje=Mensaje + "\n... corrija los anteriores errores para continuar";
    alert(Mensaje);
    return false;
  }
}
