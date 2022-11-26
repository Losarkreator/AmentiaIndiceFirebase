//
//  ChaptersList.swift
//  AmentiaIndice
//  Created by cturrion on 22/11/22.

import SwiftUI
import Firebase

struct ChaptersList: View {
    
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
                .listStyle(.sidebar)
            }
            

        }
    }
    
    init() {
        model.getData()
    }
    
    
    
}

//MARK: - Funciones
extension ChaptersList {
    
    func imprimirCosas(){
        print("FUNCIONA")
    }
    
}

struct ChaptersList_Previews: PreviewProvider {
    static var previews: some View {
        ChaptersList()
    }
}
