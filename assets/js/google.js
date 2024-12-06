//Compruebo que mi referencia este bien hecha
console.log("Hola desde google.js");

$(document).ready(function () {
    obtenerUbicacion();
});

//Funcion para obtener la ubicacion
function obtenerUbicacion() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(mostrarUbicacion, muestraError);
    } else {
        alert("La geolocalizacion no es soportada por este navegador");
    }
}

//Funcio para mostrar la ubicacion (si es que podemos recuperarlo)
function mostrarUbicacion(position) {
    console.log(position);
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;
    //muestra la latitud y longitud
    console.log("Lattitud: " + lat + ", Longitud:" + lon);
    //llamar a la funcion para obtener la direccion
    obtenerDireccion(lat, lon);
    //Inicializar el mapa y el Street Vieew
    initMapComponents(lat,lon);
}

//Funcion que se ejecuta en caso de algun error al recuperar la geolocalizacion
function muestraError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            alert("El usuario nego el permiso de ubicacion");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("La ubicacion no esta disponible");
            break;
        case error.TIMEOUT:
            alert("Se agoto el tiempo de espera");
            break;
        default:
            alert("Error desconocido: " + error.messege);
            break;
    }
}

//Funcion para obtener direccion de las coordenadas
function obtenerDireccion(lat,lon) {
    const latLng = { lat: lat, lng: lon };
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ location: latLng }, function (results, status) {
        if (status === 'OK') {
            console.log(results)
            if (results[0]) {
                const direccion = results[0].formatted_address;
                //Mostrar la direccion obtenida en el HTML
                document.getElementById('direccion').innerText = "Direccion: " + direccion;
            } else {
                alert("No se encontraron resultados de direccion");
            }
        } else {
            alert("Geocodificacion fallida: " + status);
        }

    })
}

function initMapComponents(lat, lon) {
    const ubicacion = { lat: lat, lng: lon }

    //Inicializar el mapa
    const mapa = new google.maps.Map(document.getElementById("map"), {
        zoom: 15,
        center: ubicacion
    });

    //Añadir un marcador en el mapa
    new google.maps.Marker({
        position: ubicacion,
        map: mapa,
        title: "Ubicacion Actual"
    });

    //Configurar Street View
    const panorama = new google.maps.StreetViewPanorama(
        document.getElementById("street"), {
        position: ubicacion,
        pov: { heading: 90, pitch: 5 }
    }
    );

    //Vincular el Street View al mapa
    mapa.setStreetView(panorama);
}