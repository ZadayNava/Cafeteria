/*console.log("Hola desde mi MiScript.js")*/
function enviar_formulario() {

    const fechaActual = new Date(Date.now());

    const horaActual = fechaActual.getHours();
    var miHora = document.getElementById('contact_hora').value;
    var miFecha = document.getElementById('contact_fecha').value;
    var numPersonas = parseInt(document.getElementById("contac_people").value);
    var numPerAdicionales = parseInt(document.getElementById("contact_add").value);
    var soloHora = parseInt(miHora.substring(0, 2));
    var horarioLaboral = true;
    var horaPermitida = horaActual + 2;
    var validacion = true;

    //console.log(Number.isNaN(numPersonas));

    var nombre = document.getElementById("contac_name").value;
    var regexNombre = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/;
    if (!regexNombre.test(nombre)) {
        validacion = false;
        Swal.fire({
            icon: "error",
            text: "Escribe bien el nombre",
        });
    }

    var correo = document.getElementById("contact_email").value;
    var regexEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!regexEmail.test(correo)) {
        validacion = false;
        Swal.fire({
            icon: "error",
            text: "Escribe bien el email",
        });
    }


    if (Number.isNaN(numPersonas) == false) {

        if (numPerAdicionales >= 5) {
            validacion = false;
            if (numPerAdicionales < 0) {
                validacion = false;
                Swal.fire({
                    title: numPerAdicionales + " personas adicionales?",
                    text: "El numero no puede ser negativo",
                    icon: "error"
                });
            }
            Swal.fire({
                title: numPerAdicionales + " personas adicionales?",
                text: "El numero limite es de 4 personas",
                icon: "error"
            });
        } else if (numPersonas < 1) {
            validacion = false;
            if (numPersonas >= 9) {
                validacion = false;
                Swal.fire({
                    title: numPersonas + "personas?",
                    text: "El numero limite max es de 8 personas",
                    icon: "error"
                });
            }
            Swal.fire({
                title: numPersonas + " personas?",
                text: "Es necesario mencionar el numero de personas",
                icon: "error"
            });
        }
    } else {

        validacion = false;
        Swal.fire({
            text: "El numero de personas no puede ser nulo",
            icon: "error"
        });
    }

    if (horaPermitida < 8) {
        horarioLaboral = false;

    } else if (horaPermitida > 19) {

        horarioLaboral = false;
    } else if (horaPermitida > 8 || horaPermitida < 19) {
        horarioLaboral = true;
    }


    if (miFecha >= fechaActual.toISOString().substring(0, 10)) {
        if (soloHora >= 8 || soloHora < 19) {
            if (soloHora < horaPermitida) {
                if (horarioLaboral == true) {
                    validacion = false;
                    Swal.fire({
                        text: "Favor de reservar al menos con 2 horas de antelacion",
                        icon: "error"
                    });
                } else {
                validacion = false;
                    Swal.fire("Nuestro horario es de 8 am - 7 pm");
                }
            }
        } else {
            validacion = false;
            Swal.fire("Nuestro horario: 8 am a las 7 pm");
        }
    } else {
        validacion = false;
        Swal.fire({
            title: "Estas reservando a las " + miHora,
            text: "Elige otro dia dentro del horario laboral",
            icon: "error"
        });
    }
}

function sumar() {
    // Get the values of the input fields
    let contactPeople = parseInt(document.getElementById("contac_people").value) || 0; // Default to 0 if empty
    let contactAdd = parseInt(document.getElementById("contact_add").value) || 0; // Default to 0 if empty

    // Calculate the total number of people
    let totalPeople = contactPeople + contactAdd;

    // Ensure total is within the valid range (1 to 12)
    if (totalPeople > 12) {
        Swal.fire({
            icon: "error",
            text: "exede el numero de personas ",
        }); // Max 12 people
    }

    // Update the output on the screen
    document.getElementById("total").textContent = totalPeople;

    // Log the total to the console
    console.log("Total de personas: " + totalPeople);

}

function validarNombre() {
    const input = document.getElementById('contac_name');
    if (!input.checkValidity()) {
        Swal.fire({
            icon: "error",
            text: "Ingresa el nombre correctamente",
        });
    }
}


function validarCorreo() {

    const input = document.getElementById('contact_email');

    if (!input.checkValidity()) {
        Swal.fire({
            icon: "error",
            text: "Ingresa el nombre correctamente",
        });
    }


}