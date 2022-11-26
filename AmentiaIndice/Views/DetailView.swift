//
//  DetailView.swift
//  AmentiaIndice
//
//  Created by Losark on 26/11/22.
//

import SwiftUI

struct DetailView: View {
    let item: Capitulo
    
    var body: some View {
        VStack {
            Text(item.nombre)
                .font(.largeTitle)
                .padding(.all)
            
            Text(item.descripcion ?? "Descripción no disponible")
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Capitulo.init(id: "dsadsa",
                                       nombre: "Capitulo 1",
                                       orden: 1)
        )
    }
}
