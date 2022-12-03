//
//  TEST.swift
//  AmentiaIndice
//  Created by Losark on 3/12/22.

import SwiftUI

struct Test: View {
    
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Text("holaaaa")
            Button("Guardar") {
                isPresented = true
            }
            .actionSheet(isPresented: $isPresented, content: {
                ActionSheet(title: Text("¿Estas seguro?"),
                            message: Text("Esta acción no se puede deshacer."),
                            buttons: [.default(Text("Guardar"),
                                               action: {
                    print("Print")
                }),
                                      .destructive(Text("Cancelar"))
                            ]
                )
            })
        }
        
    }
}

struct TEST_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
