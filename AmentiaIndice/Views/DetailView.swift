//
//  DetailView.swift
//  AmentiaIndice
//  Created by Losark on 26/11/22.

import SwiftUI

struct DetailView: View {
    let item: Capitulo
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        VStack {
            
            ScrollView {
                Text(item.descripcion)
                    .font(.body)
                    .onLongPressGesture(minimumDuration: 2) {
                        model.testPrint()
                    }
                //.onTapGesture(count: 2)
                //.background(Color.yellow)
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .navigationBarTitle(Text(item.nombre), displayMode: .inline)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Capitulo.init(id: "dsadsa",
                                       nombre: "Capitulo 1",
                                       orden: 1, descripcion: "Test text. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n Fin")
        )
    }
}
