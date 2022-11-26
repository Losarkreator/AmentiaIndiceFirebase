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
            
            ScrollView {
                Text(item.descripcion ?? "Descripción no disponible")
                    .font(.body)
//                    .background(Color.yellow)
            }
            .padding(.horizontal)
            .padding(.top, 50)
        }
        .navigationTitle(Text(item.nombre))
        .frame(maxWidth: .infinity)
//        .background(Color.red)
        
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Capitulo.init(id: "dsadsa",
                                       nombre: "Capitulo 1",
                                       orden: 1, descripcion: "31 Octubre \n SUPERVIVENCIA. \n Resurrección. \n Aparcamiento - centro comercial. \n\n Despierta en un aparcamiento de un centro comercial con Sidur en la mano. \n\nSigue a Mial. \nContenedor de ropa.  \nLucha con los Sombríos - Sidur. \n(Insinuar la Empatía. Generar misterio.) \nRecuerda ser violada. \nErkop. \nEnvían al Agente (Ango Cheko) para investigar lo sucedido y tapar los hechos. \nSus drones rastrean las cercanías. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n Fin")
        )
    }
}
