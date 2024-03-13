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

        print("Cola \(ejercicio2)")
    }
