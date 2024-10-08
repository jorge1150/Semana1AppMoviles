// Lista para almacenar objetos de tipo Estudiante.
List<Estudiante> estudiantes = [];

void main() {
  // Añadir algunos estudiantes con sus respectivas asignaturas y calificaciones.
  agregarEstudiante('Jorge', {
    'Matemáticas': 9.5,
    'Ciencias': 8.0,
    'Historia': 9.0,
  });
  agregarEstudiante('Darwin', {
    'Matemáticas': 7.5,
    'Ciencias': 8.0,
    'Historia': 7.5,
  });
  agregarEstudiante('Olga', {
    'Matemáticas': 6.0,
    'Ciencias': 7.0,
    'Historia': 8.5,
  });

  // Estudiantes ingresados
  print('Estudiantes ingresados.');
  for (var estudiante in estudiantes) {
    print(estudiante);
  }

  saltoLinea();
  print('Promedios por estudiantes.');

  // Calcular y mostrar el promedio de cada estudiante.
  for (var estudiante in estudiantes) {
    print('Promedio de ${estudiante.nombre}: ${estudiante.calcularPromedio()}');
  }

  saltoLinea();
  print('Calificación más alta y más baja por asignatura.');

  // Determinar la calificación más alta y más baja para cada asignatura.
  Map<String, double> maxCalificaciones = {};
  Map<String, double> minCalificaciones = {};
  for (var estudiante in estudiantes) {
    estudiante.determinarCalificaciones(maxCalificaciones, minCalificaciones);
  }

  // Mostrar las calificaciones más altas y más bajas por asignatura.
  print('Calificación más alta por asignatura:');
  maxCalificaciones.forEach((asignatura, calificacion) {
    print('$asignatura: $calificacion');
  });

  print('\nCalificación más baja por asignatura:');
  minCalificaciones.forEach((asignatura, calificacion) {
    print('$asignatura: $calificacion');
  });

  saltoLinea();
  // Mostrar los estudiantes que tienen un promedio superior a un valor dado = 8.
  double valorDado = 8.0;
  print('Estudiantes con promedio superior a $valorDado:');
  for (var estudiante in estudiantes) {
    if (estudiante.calcularPromedio() > valorDado) {
      print(estudiante);
    }
  }

  saltoLinea();
  // Ordenar y mostrar los estudiantes por promedio en forma ascendente.
  print('Estudiantes ordenados por promedio ascendente:');
  estudiantes
      .sort((a, b) => a.calcularPromedio().compareTo(b.calcularPromedio()));
  for (var estudiante in estudiantes) {
    print(
        '${estudiante.nombre} con un promedio de ${estudiante.calcularPromedio()}');
  }

  saltoLinea();
  // Ordenar y mostrar los estudiantes por promedio en forma descendente.
  print('Estudiantes ordenados por promedio descendente:');
  estudiantes
      .sort((a, b) => b.calcularPromedio().compareTo(a.calcularPromedio()));
  for (var estudiante in estudiantes) {
    print(
        '${estudiante.nombre} con un promedio de ${estudiante.calcularPromedio()}');
  }
}

void agregarEstudiante(
    String nombre, Map<String, double> calificacionesPorAsignatura) {
  estudiantes.add(Estudiante(
      nombre: nombre,
      calificacionesPorAsignatura: calificacionesPorAsignatura));
}

// Clase que representa a un estudiante.
class Estudiante {
  String nombre; // Nombre del estudiante.
  Map<String, double>
      calificacionesPorAsignatura; // Mapa de asignaturas y calificaciones.

  // Constructor para inicializar los atributos.
  Estudiante({required this.nombre, required this.calificacionesPorAsignatura});

  // Sobrescribir el método toString para imprimir los detalles del estudiante.
  @override
  String toString() {
    return 'Estudiante: $nombre, Calificaciones: $calificacionesPorAsignatura';
  }

  // Método para calcular el promedio de las calificaciones del estudiante.
  double calcularPromedio() {
    double suma = calificacionesPorAsignatura.values.reduce((a, b) => a + b);
    return suma / calificacionesPorAsignatura.length;
  }

  // Método para determinar las calificaciones más altas y más bajas por asignatura.
  void determinarCalificaciones(Map<String, double> maxCalificaciones,
      Map<String, double> minCalificaciones) {
    calificacionesPorAsignatura.forEach((asignatura, calificacion) {
      // Verificar si la asignatura ya tiene una calificación máxima registrada.
      if (maxCalificaciones.containsKey(asignatura)) {
        // Si ya hay una calificación máxima registrada, compararla y actualizarla si es necesario.
        if (calificacion > maxCalificaciones[asignatura]!) {
          maxCalificaciones[asignatura] = calificacion;
        }
      } else {
        // Si no hay una calificación máxima registrada, asignar la actual.
        maxCalificaciones[asignatura] = calificacion;
      }

      // Verificar si la asignatura ya tiene una calificación mínima registrada.
      if (minCalificaciones.containsKey(asignatura)) {
        // Si ya hay una calificación mínima registrada, compararla y actualizarla si es necesario.
        if (calificacion < minCalificaciones[asignatura]!) {
          minCalificaciones[asignatura] = calificacion;
        }
      } else {
        // Si no hay una calificación mínima registrada, asignar la actual.
        minCalificaciones[asignatura] = calificacion;
      }
    });
  }
}

// Función para imprimir una línea divisoria.
void saltoLinea() {
  print('\n-------------------------------------------------------');
}
