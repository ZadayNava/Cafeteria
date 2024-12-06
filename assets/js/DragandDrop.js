//Los evento de JS son acciones o suscesos que ocurren en un docuemnto web y que pueden ser detectados y manejados por le código JS. Estos eventos puedes ser desencadenados por el usuario o generados automáticamente por le navegador

//En t+erminos más especificos, un evento es algo que sucede en el sistema que estámos programando. El sistema produce un señal de cierto tipo cuando en evento ocurre y proporciona un mecanismo para que una acción se lleve a cabo automáticamente como respuesta a dicho evento

//variables
var contador = 0;
var arrastrable = '';
var contadorA = 0;

//Fuciones para los eventos del HTML
function start(e) {
    //funcion que se ejecuta con el evento 'ondragstart', recibe como parámetro el propio evento
    console.log("start");
    e.dataTransfer.effectAllowed = "move";//define el efecto de movimiento del elemento
    e.dataTransfer.setData("Data", e.target.id);//guarda en memoria cache la info del elemeneto
    $("#" + e.target.id).css("opacity", "0.4")//mediante jquery busca el elemento en cuestion y cambia su propiedad CSS
    console.log(e.target.id);
    elemArrastrable = e.target.id//guardamos la variable global del elemento en cuestion

}

function end(e) {
    //funcion que se ejecuta con el evento ondragend, recibe como parametro el propi evento (como accion)
    console.log("end");
    e.target.style.opacity = "";//reestablece la propiedad de opacidad a su por defecto
    e.dataTransfer.clearData("Data");//limpia del cache los datos almacenados como data
    elemArrastrable = "";//limpia la variable global
    console.log(e.target.id)
}

//funciones de movimiento
function enter(e) {//funcion que se ejecuta con el evento ondragenter, recibe como parametro
    //el propio evento (como accion)
    console.log("enter");
    e.target.style.border = "12px dotted #555";//añadimos un borde de puntos color negro cuando un cuadradito entre  a un cuadro 
}

function leave(e) {//funcion que se ejecuta con el evento ondragleave, recibe como parametro
    //el propio evneto (como accion)
    console.log("leave");
    $("#" + e.target.id).css("border","")//cuando el cuadradito abandona el cuadro, borramos e borde creado
    
}

function over(e) {//funcion que se ejecuta con el evento ondragover, recibe como parametro
    //el propio evento (como accion)
    console.log("Over");
    var id= e.target.id //guardamos el valor del elmento enn cuestion
    if ((id == "cuadro1") || (id == "cuadro3") || (id == "papelera")) {
        return false //falso significa que permitira dejar "caer" elemenos sobre el 
    } else {
        return true //true significa que NO permitira dejar "caer" elemenos sobre el
    }
}

//Funciones de jugabilidad
function drop(e) {//funcion que se ejecuta con el evento endrop, recibe como parametro
    //el propio evento(como accion)
    console.log("drop");
    var elementoArrastrado = e.dataTransfer.getData("Data");//recuperamos el ID mediante el contenido guardado en el cache
    e.target.appendChild(document.getElementById(elementoArrastrado));//appendChild añade un elemento/nodo al nodo en cuestion
    //en este caso añade el cuadradito
    e.target.style.border = "";//limpiamos el border si es que dejamos caer (drop) algo
}

function remove(e) {//funcion que se ejecuta como el evento odrop, recibe como parametro
    //el propio evento (como accion)
    console.log("delete");

    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));//guardamos el elemento que existe dentro del primer elemento para poder eliminarlo
    elementoArrastrado.parentNode.removeChild(elementoArrastrado);//parentNode sirve para meternos dentro de los elementos que pudiera tener el elmento padre, romeveChild nos sirve para eliminar el elemento en cuestion
    e.target.style.border = "";
    contadorA--;
}

function clone(e) {//funcion que se ejecuta con el evento ondrop, rcibe como parametro
    //el propio evento (como accion)
    console.log("clone");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));//guardamos el elemento qe existe dentro del primer elemento para poder clonarlo
    elementoArrastrado.style.opacity = "";
    if (contadorA < 3) {
        var elementoClonado = elementoArrastrado.cloneNode(true)//cloneNode copia todo un elemento/nodo, en este caso dentro de una variable
        elementoClonado.id = "CloneNode" + contador;
        contador++;
        contadorA++;
        elementoClonado.style.position = "static";
        e.target.appendChild(elementoClonado);
    }
    e.target.style.border = "";
}