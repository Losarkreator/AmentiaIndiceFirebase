//
//  DetailView.swift
//  AmentiaIndice
//  Created by Losark on 26/11/22.

import SwiftUI

struct DetailView: View {
    var item: Capitulo
    @ObservedObject var model = ViewModel()
    @State private var isShowingViewBottom = true
    @State var textoDescripcion = ""
    
    var body: some View {
        VStack {
            
            ScrollView {
                // Cambiar texto para que pueda ser editado:
                Text(item.descripcion)
//                Text(model.list.description)
                    .font(.body)
                    .frame(maxWidth: .infinity)
//                    .onLongPressGesture(minimumDuration: 2) //
                    .onTapGesture(count: 2)
                    {
                        switchButtonsView()
                        model.testPrint()
                    }
            }
            
            if isShowingViewBottom {
                HStack {
                    TextField("Placeholder", text: $textoDescripcion)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        // Accion
                        sendText()
                    }, label: {
                        Image(systemName: "paperplane")
                        Text("Guardar")
                    })
                }
                .frame(height: 50)
            }
            
            
        }
        .onAppear(perform: model.getData)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .navigationBarTitle(Text(item.nombre), displayMode: .inline)
        
    }
}

//MARK: - Funciones
extension DetailView {
    func switchButtonsView() {
        isShowingViewBottom = !isShowingViewBottom
    }
    
    func sendText() {
        model.updateData(capToUpdate: item, newText: textoDescripcion)
        model.getData()
        textoDescripcion = ""
    }
    
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
//        DetailView(item: ViewModel().list[2])
        
         DetailView(item: Capitulo.init(id: "dsadsa",
                                        nombre: "Capitulo 1",
                                        orden: 1, descripcion: "Test text. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n Fin")
         )

        
    }
}
