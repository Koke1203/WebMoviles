/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function doSearch() {
    var tableReg = document.getElementById('datos');
    var searchText = document.getElementById('searchTerm').value.toLowerCase();
    var cellsOfRow = "";
    var found = false;
    var compareWith = "";



// Recorremos todas las filas con contenido de la tabla
    for (var i = 1; i < tableReg.rows.length; i++)
    {
        cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
        found = false;
// Recorremos todas las celdas
        for (var j = 0; j < cellsOfRow.length && !found; j++)
        {
            compareWith = cellsOfRow[j].innerHTML.toLowerCase();
// Buscamos el texto en el contenido de la celda
            if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1))
            {
                found = true;
            }
        }
        if (found)
        {
            tableReg.rows[i].style.display = '';
        } else {
// si no ha encontrado ninguna coincidencia, esconde la
// fila de la tabla
            tableReg.rows[i].style.display = 'none';
        }
    }
}

function validarLogin() {
    var idUsuario = document.form_login.txtIdentificacion;
    var contrasenia = document.form_login.passContrasenia;
    
  
    if (idUsuario.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese su identificación',
        })
        return false;
    }
    if (contrasenia.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese la contraseña',
        })
        return false;
    }
}

function validarRegistroCliente() {
    var idCliente = document.form_registro.txtIdentificacion;
    var nombre = document.form_registro.txtNombre;
    var primerApellido = document.form_registro.txtPrimerApellido;
    var segundoApellido = document.form_registro.txtSegundoApellido;
    var fechaNacimiento = document.form_registro.dateFechaNacimiento;
    var correo = document.form_registro.emailCorreo;
    var direccion = document.form_registro.txtDireccion;
    var telefono = document.form_registro.telTelefono;
    var celular = document.form_registro.telCelular;
    var contrasenia = document.form_registro.passConstrasenia;
    
  
    if (idCliente.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese su identificación',
        })
        return false;
    }

    if (nombre.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese el nombre',
        })
        return false;
    }

    if (primerApellido.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese el primer apellido',
        })
        return false;
    }
    
    if (segundoApellido.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese el segundo apellido',
        })
        return false;
    }

    if (fechaNacimiento.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese la fecha de nacimiento',
        })
        return false;
    }

    if (correo.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese su correo',
        })
        return false;
    }
    if (direccion.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese la dirección',
        })
        return false;
    }
    if (telefono.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese el teléfono',
        })
        return false;
    }
    if (celular.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese el celular',
        })
        return false;
    }
    if (contrasenia.value == "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Ingrese la contraseña',
        })
        return false;
    }
}

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

function validaDatosVuelo(){
    
    var idVuelo = document.form_avion.txtIdAviones;
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

