//
//  DetailView.swift
//  AmentiaIndice
//  Created by Losark on 26/11/22.

import SwiftUI

// Tutorial text editor: https://www.swiftbeta.com/textedit-en-swiftui/

struct DetailView: View {
    var item: Capitulo
    @EnvironmentObject var model : ViewModel
    @State private var isShowingViewBottom = false
    @State private var textoDescripcion = ""
    @State private var fullText: String = "This is some editable text..."
    
    var body: some View {
        VStack {
            TextEditor(text: $textoDescripcion)
            
            Button(action: {
                sendText()
            }, label: {
                Image(systemName: "paperplane")
                Text("Guardar")
            })
            
        }
        .onAppear{
            model.getData()
            textoDescripcion = item.descripcion
        }
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
        //textoDescripcion = ""
        //MARK: - Alert
        /*
         Añadir Alert para decir que se ha guardado
         Cerrar el modo edicion del text editor:
            Dejar de editar
            Cerrar teclado
         */
        
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


//MARK: Seguridad
extension DetailView {
    
    //            ScrollView {
    //                // Cambiar texto para que pueda ser editado:
    //                Text(item.descripcion)
    //                    .font(.body)
    //                    .frame(maxWidth: .infinity)
    //               // Añadir gesto:
    ////                    .onLongPressGesture(minimumDuration: 2) //
    //                    .onTapGesture(count: 2)
    //                    {
    //                        switchButtonsView()
    //                    }
    //
    //            }
    
    
    //            if isShowingViewBottom {
    //                HStack {
    //                    TextField("Placeholder", text: $textoDescripcion)
    //                        .textFieldStyle(.roundedBorder)
    //
    //                    Button(action: {
    //                        // Accion
    //                        sendText()
    //                    }, label: {
    //                        Image(systemName: "paperplane")
    //                        Text("Guardar")
    //                    })
    //                }
    //                .frame(height: 50)
    //            }
}
