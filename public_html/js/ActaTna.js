function fEvalua( )
{
  var Mensaje = "";
  f = document.forms[0];

  if( bCancel == true ) return true;

  var j = 1;
  for( i=0; i<f.length; i++ )
  {
    if( (f[i].type == "text") && (f[i].name.substring( 0, 5) == 'lista') )
    {
      if( fTrim( f[i].value ) )
        Mensaje = Mensaje + "'Acta de Intervención la fila " + j + "' tiene el Nro. de Acta '" + f[i].value + "'\n";
      j++;
    }
  }

  if( Mensaje == "" )
    return true;
  else
    return confirm( Mensaje + 'Est\341 seguro de continuar');
}