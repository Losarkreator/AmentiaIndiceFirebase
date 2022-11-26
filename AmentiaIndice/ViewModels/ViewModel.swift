//
//  ViewModel.swift
//  AmentiaIndice
//  Created by cturrion on 22/11/22.

import Foundation
import Firebase

class ViewModel: ObservableObject {
    @Published var list = [Capitulo]()
    
    func getData() {
        let db = Firestore.firestore()
        
        db.collection("capitulos").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map({ document in
                            //Crear un documento por cada documento devuelto
                            return Capitulo(id: document.documentID,
                                            nombre: document["nombre"] as? String ?? "",
                                            orden: document["orden"] as? Int ?? 0,
                                            descripcion: document["descripcion"] as? String ?? "Descripción no disponible")
                        })
                        
                        //Ordenar la lista de menor a mayor
                        let sortedList = self.list.sorted { capA, capB in
                            return capA.orden < capB.orden
                        }
                        self.list = sortedList
                        
                    }
                } else {
                    // Handle error
                }
            }
        }
    }
    
    func testPrint() {
        print("Gesto reconocido")
    }
    
}




//class Reference {
//
//    //    @Published var list = ["Manzana", "Zanahoria", "Platano"]
//    @Published var list = [Todo]()
//
//    func updateData(todoToUpdate: Todo) {
//        // Get a reference to the database
//        let db = Firestore.firestore()
//        // Set the data to update
//        db.collection("todos").document(todoToUpdate.id).setData(["name":"Updated: \(todoToUpdate.name)"], merge: true) { error in
//            // Check for errors
//            if error == nil {
//                // Get the new data
//                self.getData()
//            }
//        }
//    }
//
//    func deleteData(todoToDelete: Todo) {
//        // Get a reference to the database
//        let db = Firestore.firestore()
//        // Specify the document to delete
//        db.collection("todos").document(todoToDelete.id).delete { error in
//            // Check for errors
//            if error == nil {
//                // No errors
//                // Update the UI from the main thread
//                DispatchQueue.main.async {
//                    // Remove the todo that was just deleted
//                    self.list.removeAll { todo in
//                        // Check for the todo to remove
//                        return todo.id == todoToDelete.id
//                    }
//                }
//            }
//        }
//
//    }
//
//    func addData(name: String, notes: String) {
//        // Get a reference to the database
//        let db = Firestore.firestore()
//        // Add a document to a collection
//        db.collection("todos").addDocument(data: ["name":name, "notes":notes]) { error in
//            // Check for errors
//            if error == nil {
//                // No errors
//                // Call get data to retrieve latest data
//                self.getData()
//            }
//            else {
//                // Handle the error
//            }
//        }
//    }
//
//    func getData() {
//        // Obtener una referencia a la base de datos
//        let db = Firestore.firestore()
//        // Leer los documentos en una ruta específica
//        db.collection("todos").getDocuments { snapshot, error in
//            // Comprobar si hay errores
//            if error == nil {
//                // No errors
//                if let snapshot = snapshot {
//                    // Actualizar lista en el hilo asincrono principal
//                    DispatchQueue.main.async {
//                        // Obtener todos los documentos y crear Todos
//                        self.list = snapshot.documents.map { d in
//                            // Crear un elemento Todo por cada documento que nos es devuelto
//                            return Todo(id: d.documentID,
//                                        name: d["name"] as? String ?? "",
//                                        notes: d["notes"] as? String ?? "")
//                        }
//                    }
//                }
//            }
//            else {
//                // Handle the error
//            }
//        }
//    }
//
//}
