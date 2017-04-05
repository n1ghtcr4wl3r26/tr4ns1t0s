var dhoy=fHoy();
var danio;
function fHoy() {
  var fecha=new Date();
  danio=fecha.getFullYear();
}
function Trim(texto) {
  if(texto.length) {
    while(''+texto.charAt(0)==" ") {
      texto=texto.substring(1,texto.length);
    }
  }
  return texto;
}
function fTrim(texto) {
  aux=Trim(texto);
  if(aux=="")
    return false;
  else 
    return true;
}
function fNumero(texto) {
  var mascara=new RegExp("^[0-9]{1,7}$", "g");
  return mascara.test(texto)
}
function fCambia1(){
  f.b4.value=f.a4.value;
}
function fCambia2(){
  f.a4.value=f.b4.value;
}
function eAjax() {
  var xmlhttp=false;
  try {
    xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
  } catch (e) {
    try {
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    } catch (E) {
      xmlhttp=false;
    }
  }
  if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
    xmlhttp=new XMLHttpRequest();
  }
  return xmlhttp;
}
function sNull(texto) {
  if (texto=='null' || texto=='NULL') {
    return "";
  } else {
    return texto;
  }
}
function dNull(texto) {
  if (texto=='null' || texto=='NULL') {
    return "0.0";
  } else {
    return texto;
  }
}
function pi() {
  var menu=document.getElementById("tabs");
  var items=menu.getElementsByTagName("li");
  var cuerpos=document.getElementById("cuerpos");
  var itemsCuerpos=cuerpos.getElementsByTagName("div");
  items[0].className="selected";
  itemsCuerpos[0].className="tabSelected";
  AJAX('DespachoAction.do?opcion='+21,21);
}
function pm(menuSelected) {
  var menu=document.getElementById('tabs');
  var items=menu.getElementsByTagName("li");
  var cuerpos=document.getElementById('cuerpos');
  var itemsCuerpos=cuerpos.getElementsByTagName("div");
  for (var i=0;i < items.length;i++) {
    if (items[i] != menuSelected.parentNode) {
      items[i].className="";
      itemsCuerpos[i].className="tab";
    } else {
      menuSelected.parentNode.className="selected";
      itemsCuerpos[i].className="tabSelected";
    }
  }
}
function AJAX(url, opcion) {
  var msg=document.getElementById('msg');
  var ale=Math.floor(Math.random() * 1000);
  url=url+'&ale='+ale;
  ajax=eAjax();
  ajax.open("GET", url, true);
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
  ajax.onreadystatechange=function() {
  if(ajax.readyState==1) {
    msg.innerHTML="<img src=img/load.gif></img>";
  } else {
    if(ajax.readyState==4) {
      if(ajax.status==200) {
switch(opcion) {
  case 1:
  case 2:
    fDespliega(ajax.responseXML);
    break;
  case 3:
    fDespliega(ajax.responseXML);
    break;
  case 11:
    fAnsGenerar(ajax.responseXML);
    break;
  case 21:
    bCarga(ajax.responseXML);
    break;
  default:
    fError(ajax.responseXML);
}
        } else {
          if(ajax.status==404)
            msg.innerHTML="La página no existe";
          if(ajax.status==400) {
            msg.innerHTML="Se perdio la conexión.";
          } else {
            msg.innerHTML="Error:"+ajax.status;
          }
        }
      }
    }
  }
  ajax.send(null);
}
function bCarga(xml) {
  f.a2.length = 0;
  f.a4.length = 0;
  f.b2.length = 0;
  f.b4.length = 0;
  f.a2.options[0] = new Option('[ Seleccione Administración ]', '');
  f.b2.options[0] = new Option('[ Seleccione Administración ]', '');
  for (var i=0, j=-1; i<xml.getElementsByTagName('cod').length; i++) {
    f.a2.options[i+1] = new Option(xml.getElementsByTagName("dsc")[i].firstChild.data, xml.getElementsByTagName("cod")[i].firstChild.data);
    f.b2.options[i+1] = new Option(xml.getElementsByTagName("dsc")[i].firstChild.data, xml.getElementsByTagName("cod")[i].firstChild.data);
    if(xml.getElementsByTagName("dsc")[i].firstChild.data, xml.getElementsByTagName("si")[i].firstChild.data=='1') {
      f.a4.options[j+1] = new Option(xml.getElementsByTagName("dsc")[i].firstChild.data, xml.getElementsByTagName("cod")[i].firstChild.data);
      f.b4.options[j+1] = new Option(xml.getElementsByTagName("dsc")[i].firstChild.data, xml.getElementsByTagName("cod")[i].firstChild.data);
      j++;
    }
  }
  var msg=document.getElementById('msg');
  msg.innerHTML='';
}
function fCargaDUI(aux) {
  var ans="";
  if(aux==1){
    if(f.b1.value<2011 || f.b1.value>danio)
      ans=ans+" - Gestión de la DUI es obligatorio o tiene valores incorrectos.\n"
    if(fTrim(f.b2.value)=="")
      ans=ans+" - Código de Aduana de la DUI es obligatorio o tiene valores incorrectos.\n"
    if(fNumero(f.b3.value)=="")
      ans=ans+" - Nro. de Registro de la DUI es obligatorio o tiene valores incorrectos.\n"
    if(ans!="") {
      alert("Corrija los siguientes errores para continuar.\n"+ans);
      return;
    }
    AJAX('DespachoAction.do?opcion='+aux+'&gestion='+f.b1.value+'&aduana='+f.b2.value+'&registro='+f.b3.value,aux);
  } else {
    if(f.a1.value<2011 || f.a1.value>danio)
      ans=ans+" - Gestión del Manifiesto es obligatorio o tiene valores incorrectos.\n"
    if(fTrim(f.a2.value)=="")
      ans=ans+" - Código de Aduana del Manifiesto es obligatorio o tiene valores incorrectos.\n"
    if(fNumero(f.a3.value)=="")
      ans=ans+" - Nro. de Registro del Manifiesto es obligatorio o tiene valores incorrectos.\n"
    if(ans!="") {
      alert("Corrija los siguientes errores para continuar.\n"+ans);
      return;
    }
    AJAX('DespachoAction.do?opcion='+aux+'&gestion='+f.a1.value+'&aduana='+f.a2.value+'&registro='+f.a3.value,aux);
  }
}
function fDespliega(xmldoc) {
  var msg=document.getElementById('msg');
  if(xmldoc.getElementsByTagName('ans').item(0).firstChild.data!='correcto') {
    alert(xmldoc.getElementsByTagName('ans').item(0).firstChild.data);
    msg.innerHTML='';
    return;
  }
  lista="<table border='0' width='100%' cellpadding='3' cellspacing='1' class='marco' id='p'><caption>Detalle de la DUI</caption>" + 
    "<tr><th>DUI</th><td>"+xmldoc.getElementsByTagName('dui').item(0).firstChild.data+"</td></tr><tr><th>Importador</th><td>"+
    xmldoc.getElementsByTagName('duiimp').item(0).firstChild.data+"</td></tr><tr><th>Peso Bruto (kg)</th><td>"+
    xmldoc.getElementsByTagName('duipeso').item(0).firstChild.data+"</td></tr></table><br>"+
    "<table border='0' width='100%' cellpadding='3' cellspacing='1' class='marco' id='k'><caption>Detalle Manifiesto</caption>" + 
    "<tr><th>Opc.</th><th>Manifiesto</th><th>Importador</th><th>Peso (kg)</th><th>Destino</th><th>Modo</th><th>Tipo</th><th>Empresa</th><th>Placa</th></tr>";
  var reg="";

  for(var i=0; i<xmldoc.getElementsByTagName('doc').length; i++) {
    imprime = "<input class='im' type='button' heigth='128px' title='Imprime el Parte de Recepción.' onclick='fImprime(\""+xmldoc.getElementsByTagName("docadu")[i].firstChild.data+"\",\""+xmldoc.getElementsByTagName("docges")[i].firstChild.data+"\",\""+xmldoc.getElementsByTagName("docreg")[i].firstChild.data+"\")'/>";
    reg=reg+(((i%2)==0)?"<tr class='f2'>":"<tr class='f1'>");
    reg=reg+((xmldoc.getElementsByTagName("estado")[i].firstChild.data=="0")?"<td><input type='checkbox' onclick='fSuma()' name='na"+i+"'/></td>":"<td>"+imprime+"</td>");
    reg=reg+"<td>"+xmldoc.getElementsByTagName("docges")[i].firstChild.data + "/" +
      xmldoc.getElementsByTagName("docadu")[i].firstChild.data + "-" +
      xmldoc.getElementsByTagName("docreg")[i].firstChild.data + "<input type='hidden' name='man"+i+"' value='"+xmldoc.getElementsByTagName("docges")[i].firstChild.data + "/" +
      xmldoc.getElementsByTagName("docadu")[i].firstChild.data + "-" +
      xmldoc.getElementsByTagName("docreg")[i].firstChild.data+"'/></td><td>" + 
      xmldoc.getElementsByTagName("imp")[i].firstChild.data + "</td><td class='right'>" + 
      xmldoc.getElementsByTagName("peso")[i].firstChild.data + "<input type='hidden' name='pe"+i+"' value='"+xmldoc.getElementsByTagName("peso")[i].firstChild.data+"'/></td><td>" + 
      xmldoc.getElementsByTagName("destino")[i].firstChild.data + "</td><td>" + 
      xmldoc.getElementsByTagName("forma")[i].firstChild.data + "</td><td>" + 
      xmldoc.getElementsByTagName("tipo")[i].firstChild.data + "</td><td>" + 
      xmldoc.getElementsByTagName("empresa")[i].firstChild.data + "</td><td>" + 
      xmldoc.getElementsByTagName("placa")[i].firstChild.data + "</td></tr>";
  }
  msg.innerHTML=lista + reg +"<tfooter><tr class='f3'><td colspan='3'>Total Peso (kg)</td><td class='right'>"+xmldoc.getElementsByTagName('pesofin').item(0).firstChild.data+ "</td><td colspan='3' class='ro'></td><td colspan='2' class='right'><input type='hidden' name='fin' value='"+xmldoc.getElementsByTagName('pesofin').item(0).firstChild.data+"'/><input class='pr' title='Procesa los Manifiestos seleccionados.' type='button' value='Procesar' onclick='fProcesa()'/></td></tr></tfooter></table>";
}
function fError(xmldoc) {
  if(xmldoc.getElementsByTagName('ans').item(0).firstChild.data!='correcto') {
    var msg=document.getElementById('msg');
    msg.innerHTML='';
    alert(xmldoc.getElementsByTagName('ans').item(0).firstChild.data);
    return;
  }
}
function fSuma() {
  var peso= 0.00;
  var p = f.fin.value;
  var v;
  peso = parseFloat(p.replace(",","."));
 
  for(var i=0; i<f.elements.length; i++){
      if(f.elements[i].type=='checkbox') {
          if(f.elements[i].checked) {
            v= f.elements[i+2].value;
            peso=peso+parseFloat(v.replace(",","."))
          }
      }
  }
  var ce0=document.getElementById('k').rows[ document.getElementById('k').rows.length-1 ].cells[1];
  v= peso.toFixed(2);
  ce0.innerHTML= v.replace(".",",")
  var ce1=document.getElementById('p').rows[ document.getElementById('p').rows.length-1 ].cells[1];
  v0=ce1.innerHTML;
  var ce2=document.getElementById('k').rows[ document.getElementById('k').rows.length-1 ].cells[2];
  /*
  alert('peso dui '+peso+' peso manifiestos '+v0+' suma peso3 '+ peso3);
  if(v0*1 < peso) {
    ce2.innerHTML='Peso del (de los) Manifiesto(s) es superior al de la DUI.peso dui '+peso+' peso manifiestos '+v0+'suma float '+ peso2;
  } else {
    ce2.innerHTML='Peso del (de los) Manifiesto(s) es superior al de la DUI.peso dui '+peso+' peso manifiestos '+v0+'suma float '+ peso2;
  }
  */
  
 
  if(parseFloat(v0.replace(",",".")) < peso) {
    ce2.innerHTML='Peso del (de los) Manifiesto(s) es superior al de la DUI.';
  } else {
    ce2.innerHTML='';
  }
}

function fProcesa(index) {
  var lista='';
  for(var i=0; i<f.elements.length; i++){
      if(f.elements[i].type=='checkbox') {
          if(f.elements[i].checked) {
            lista=lista+f.elements[i+1].value+'|';
          }
      }
  }
  if(lista=='') {
    alert('No seleccion\363 ning\372n Manifiesto.');
    return;
  }
  var ce1=document.getElementById('p').rows[0].cells[1];
  var manifiestos=lista.replace("|","\n").replace('|','\n');
  if(!confirm("Desea continuar con el cierre del (de los) siguiente(s) Manifiesto(s)\n" + manifiestos + "\n\nNo podrá revertir esta operación."))
    return;
  lista=lista+ce1.innerHTML+'|';
  AJAX('DespachoAction.do?opcion='+11+'&gestion='+lista+'&aduana='+f.a4.value,11);
}
function fImprime(aduana,gestion,registro) {
  var ale=Math.floor(Math.random() * 1000);
  var param = { "aduana":aduana,"gestion":gestion,"registro":registro,"ran":ale};
  OpenWindowWithPost("especial/parte.jsp", "width=730,height=345", "Reporte Parte de Repcepción", param);
}

function OpenWindowWithPost(url, windowoption, name, params) {
  var form = document.createElement("form");
  form.setAttribute("method", "post");
  form.setAttribute("action", url);
  form.setAttribute("target", name);
  
  for (var i in params) {
    if (params.hasOwnProperty(i)) {
      var input = document.createElement('input');
      input.type = 'hidden';
      input.name = i;
      input.value = params[i];
      form.appendChild(input);
    }
  }
  
  document.body.appendChild(form);
  //window.open("post.htm");
  form.submit();
  document.body.removeChild(form);
}
function fAnsGenerar(xmldoc) {
  alert(xmldoc.getElementsByTagName('datos').item(0).firstChild.data);
  msg.innerHTML='';
  return;
}