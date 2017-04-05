bCancel = false;

function fUpper( texto ){
  return( texto.toUpperCase() );
}

function Trim ( texto ){
  if (texto.length) 
  {
    while( '' + texto.charAt(0) == " " )
    {
      texto = texto.substring( 1, texto.length);
    }
  }
  return texto;
}

function fTrim( texto )
{
  aux = Trim( texto );
  if( aux == "" ) 
    return false;
  else
    return true;
}  

function fNumero( texto )
{
  var mascara = new RegExp("^[0-9]{0,150}$","g");
  return mascara.test( texto )
}

function fFloat( texto )
{
  var mascara = new RegExp("^[0-9.]{0,150}$","g");
  if( ! mascara.test( texto ) )
  	return false;
  return ( ! isNaN(texto) );
}

function fLetraNumero( texto )
{
  var mascara = new RegExp("^[a-zA-Z0-9-ñÑ]{0,150}$","g");
  return mascara.test( texto );
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

function fHora( texto )
{
  var mascara = new RegExp("^[0-2]{1}[0-9]{1}:[0-5]{1}[0-9]{1}$","g");
  if (texto.length)
  {
    if( mascara.test(texto) )
    {
      var hh = texto.substring( 0,  2);
      var mm = texto.substring( 3,  2);

      if( hh>23 ) return false;
      if( mm>59 ) return false;

      return true;
    }
    else
      return false;
  }
  else
    return true;
}

function foNumero( texto )
{
  return ( fTrim(texto) && fNumero(texto) );
}

function foFloat( texto )
{
  return ( fTrim(texto) && fFloat(texto) );
}

function foFecha( texto )
{
  return ( fTrim(texto) && fFecha(texto) );
}

function foHora( texto )
{
  return ( fTrim(texto) && fHora(texto) );
}

function foLetraNumero( texto )
{
  return ( fTrim(texto) && fLetraNumero(texto) );
}

function fAduana ( texto )
{
  var mascara = new RegExp("^(071|072|101|201|211|221|231|232|233|234|241|242|244|261|291|301|311|331|332|361|401|421|422|431|432|491|501|521|531|542|543|601|621|622|631|641|643|701|711|721|722|731|732|733|734|735|736|737|738|741|743|761|791|831|841|862|931|)$","g");
  return mascara.test( texto );
}

//Para fecha y hora
function fFormato( fecha, hora )
{
  var fReg = fecha.substring( 6, 10) + fecha.substring( 3, 5) + fecha.substring( 0, 2) + hora.substring( 0, 2) + hora.substring( 3, 5);
  return fReg;
}

function fcFechas( fecinf, fecsup )
{
  if( fecinf > fecsup )
    return true;
  else
    return false;
}

function pConvierteFecha( fecha )
{
  var ff = fecha.substring( 6, 8) + "/" + fecha.substring( 4, 6) +  "/" + fecha.substring( 0, 4) + " " + fecha.substring( 8, 10) + ":" + fecha.substring( 10, 12);
  return ff;
}

function fDiferencia( fecha, hora )
{
  var fecreg = fFormato( fecha, hora );
  
}

function fNum2( texto )
{
  var mascara = new RegExp("^[0-9]{1,8}[.]{0,1}[0-9]{0,2}$","g");
  if( ! mascara.test( texto ) )
  	return false;
  return ( ! isNaN(texto) );
}


function fFecha2( texto )
{
  var mascara = new RegExp("^[0-3]{1}[0-9]{1}/(01|02|03|04|05|06|07|08|09|10|11|12)/[1-2][0-9]{3}$","g");
  if (texto.length)
  {
    if( mascara.test(texto) )
    {
      var dd = texto.substring( 0,  2);
      var mm = texto.substring( 3,  5);
      var aa = texto.substring( 6, 10);
  
      if( aa<1960 || aa>2040 ) return false; //verficar con la fecha actual
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
      /*if(fcFecha( texto, fHoy() ) )
        return false;*/

      return true;
    }
    else
      return false;
  }
  else
    return true;
}


function fHoy( )
{
  var fecha = new Date();
  
  var ano = fecha.getFullYear();
  var mes = (fecha.getMonth()<9) ? ("0" + (fecha.getMonth() + 1)) : (fecha.getMonth() + 1);
  var dia = (fecha.getDate()<=9) ? ("0" + fecha.getDate()) : (fecha.getDate());
  return (dia+"/"+mes+"/"+ano);
}


