//
//  Test.swift
//  AmentiaIndice
//  Created by cturrion on 22/11/22.

import SwiftUI
import Firebase

struct Test: View {
    
    @ObservedObject var model = ViewModel()
    
    // Guardar con una referencia de Estado
    @State var name = ""
    
    var body: some View {
        VStack {
            
            
            NavigationView {
                List(model.list) { item in
                    
                    NavigationLink(destination: DetailView(item: item)) {
                        HStack {
                            Text(String(item.orden))
                            Text(item.nombre)
                        }
                    }
                    
                }
                .navigationBarTitle(Text("Amentia"))
            }
            

        }
    }
    
    init() {
        model.getData()
    }
    
    
    
}

//MARK: - Funciones
extension Test {
    
    func imprimirCosas(){
        print("FUNCIONA")
    }
    
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
