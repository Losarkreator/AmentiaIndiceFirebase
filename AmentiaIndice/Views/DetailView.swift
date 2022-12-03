//
//  DetailView.swift
//  AmentiaIndice
//  Created by Losark on 26/11/22.

import SwiftUI

// Tutorial text editor: https://www.swiftbeta.com/textedit-en-swiftui/

struct DetailView: View {
    var item: Capitulo
    @EnvironmentObject var model : ViewModel
    @State private var textoDescripcion = ""
    @FocusState private var nameIsFocused: Bool
    @State var isPresented = false
    
    var body: some View {
        VStack {
            TextEditor(text: $textoDescripcion)
                .focused($nameIsFocused)
//                .colorMultiply(nameIsFocused ? .yellow : .gray)
            
            if nameIsFocused {
                Button(action: {
                    isPresented = true
                }, label: {
                    Image(systemName: "paperplane")
                    Text("Guardar")
                })
                .actionSheet(isPresented: $isPresented, content: {
                    ActionSheet(title: Text("¿Estas seguro?"),
                                message: Text("Esta acción no se puede deshacer."),
                                buttons: [.default(Text("Guardar"),
                                                   action: {
                                                                nameIsFocused = false
                                                                sendText()
                    }),
                                          .destructive(Text("Cancelar"))
                                ]
                    )
                })
            }
            
        }
        .onAppear{
            //            model.getData()
            textoDescripcion = item.descripcion
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .navigationBarTitle(Text(item.nombre), displayMode: .inline)
        
    }
}

//MARK: - Funciones
extension DetailView {
    
    func sendText() {
        model.updateData(capToUpdate: item, newText: textoDescripcion)
        model.getData()
    }
    
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        //DetailView(item: ViewModel().list[2])
        DetailView(item: Capitulo.init(id: "dsadsa",
                                       nombre: "Capitulo 1",
                                       orden: 1, descripcion: "Test text. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n Fin")
        )
    }
}


//MARK: Alert
extension DetailView {
    //MARK: - Alert
    // https://youtu.be/xG9v4llPR3Y?t=236
    /*
     Alert(
     title: Text("Se ha guardado correctamente"),
     message: Text("Wear sunscreen"),
     dismissButton: .default(Text("OK"))
     )
     */
}


//MARK: Seguridad
extension DetailView {
    /*
     ScrollView {
     // Cambiar texto para que pueda ser editado:
     Text(item.descripcion)
     .font(.body)
     .frame(maxWidth: .infinity)
     // Añadir gesto:
     //                    .onLongPressGesture(minimumDuration: 2) //
     .onTapGesture(count: 2)
     {
     switchButtonsView()
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
     */
}
