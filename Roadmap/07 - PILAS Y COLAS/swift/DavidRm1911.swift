/*
 * EJERCICIO:
 * Implementa los mecanismos de introducción y recuperación de elementos propios de las
 * pilas (stacks - LIFO) y las colas (queue - FIFO) utilizando una estructura de array
 * o lista (dependiendo de las posibilidades de tu lenguaje).
 *
 * DIFICULTAD EXTRA (opcional):
 * - Utilizando la implementación de pila y cadenas de texto, simula el mecanismo adelante/atrás
 *   de un navegador web. Crea un programa en el que puedas navegar a una página o indicarle
 *   que te quieres desplazar adelante o atrás, mostrando en cada caso el nombre de la web.
 *   Las palabras "adelante", "atrás" desencadenan esta acción, el resto se interpreta como
 *   el nombre de una nueva web.
 * - Utilizando la implementación de cola y cadenas de texto, simula el mecanismo de una
 *   impresora compartida que recibe documentos y los imprime cuando así se le indica.
 *   La palabra "imprimir" imprime un elemento de la cola, el resto de palabras se
 *   interpretan como nombres de documentos.
 */

 import Foundation
 import SwiftUI


 
 //pila (LAST IN, FIRST OUT)

 struct Stack{
    var pila:[String]=[]
    //push
    mutating func push(_ item: String){
        pila.append(item)
    }
    //Quitar
    mutating func pop() -> String? {
        return pila.popLast()
    }
    //peek
    func peek() -> String? {
        return pila.last
    }

 }

 //para mostrar el stack:
 extension Stack: CustomStringConvertible{
    var description:String{
        let arriba = "---Stack---\n"
        let abajo = "\n------------"
        let elementos = pila.reversed().joined(separator: "\n")

        return arriba+elementos+abajo
    }
 }

var pila = Stack()
pila.push("hola")
pila.push("Adios")

print(pila)

//queue
struct Queue<T> {
    private var elementos = [T]()

    //agregar elemento:

    mutating func enqueue(_ element: T){
        elementos.append(element)
    }

    mutating func dequeue() -> T?{
        guard !elementos.isEmpty else{
            return nil
        }
        return elementos.removeFirst()
    }
    func peek() -> T?{
        return elementos.first
    }
    func isEmpty() -> Bool{
        return elementos.isEmpty
    }
    func contar() -> Int{
        return elementos.count
    }
}

var ejemploqueue = Queue<Int>()
ejemploqueue.enqueue(12)
ejemploqueue.enqueue(13)


//ejercicio extra
var ejercicio1 = Stack()
var salida: Bool = true
while (salida==true){
    print("Ingresa cualquier nombre para agregar una pagina o adelante o atras para avanzar o retroceder o salir")
    var accion = readLine()!
    if (accion == "salir"){
         salida=false
    }
    else if (accion == "atras"){
   
            ejercicio1.pop()
        
    } 
    else {
        ejercicio1.push(accion)
    }


    print("Estas en la pagina \(ejercicio1.peek() ?? "inicio")")
}

//ejercicio 2
var ejercicio2 = Queue<String>()
    while(true){
        print("Escriba nombre del documento o Imprimir")
        var accion2 = readLine()!
        if(accion2 == "salir"){
            break
        }
        else if (accion2 == "imprimir"){
            print(ejercicio2.dequeue() ?? "nada")
        }
        else{
            ejercicio2.enqueue(accion2)
        }

        var cola = "Cola:"
        var colatemporal = ejercicio2
        while let documento = colatemporal.dequeue(){
            cola += "\(documento), "
        }
        print(cola)
    }
