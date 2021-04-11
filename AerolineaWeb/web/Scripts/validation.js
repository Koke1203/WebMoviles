/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validaDatosAvion() {
    var idAvion = document.form_avion.txtIdAviones;
    var marca = document.form_avion.txtMarca;
    var modelo = document.form_avion.txtModelo;
    var year = document.form_avion.txtYear;
    var asiento = document.form_avion.txtAsientos;
    var fila = document.form_avion.txtFilas;
    var pasajero = document.form_avion.txtPasajeros;
  
    if (idAvion.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese ID del Avion',
        })
        return false;
    }

    if (marca.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese Marca del Avion',
        })
        return false;
    }

    if (modelo.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese Modelo del Avion',
        })
        return false;
    }

    if (year.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese el Año del Avion',
        })
        return false;
    }

    if (asiento.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese # Asientos',
        })
        return false;
    }
    if (fila.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese # Filas',
        })
        return false;
    }
    if (pasajero.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese # Pasajeros',
        })
        return false;
    }

}

