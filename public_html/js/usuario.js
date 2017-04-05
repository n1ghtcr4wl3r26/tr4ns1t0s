function fEvalua( ){
  var Mensaje = "";
  f = document.forms[0];

  f.usuario.value = fUpper( f.usuario.value );

  if( ! fTrim( f.usuario.value ) )
    Mensaje = Mensaje + "'Usuario' es obligatorio\n";
  if( ! fTrim( f.clave.value ) )
    Mensaje = Mensaje + "'Contraseña' es obligatorio\n";

  if( Mensaje == "" ) {
    return true;
  } else {
    alert( Mensaje );
    return false;
  }
}
