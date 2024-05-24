//
//  InitCordel.swift
//  FolhetosDeForro
//
//  Created by Ana Guimarães on 24/05/24.
//

import SwiftUI

struct InitCordel: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Text("Folhetos De Forró")
                        .font(.title)
                        .bold()
                    Image("CordelFoto")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .ignoresSafeArea()
                    Text("Olá Pessoa Atrás da tela! Gerencie sua biblioteca pessoal de cordéis.")
                        .font(.title3)
                        .italic()
                    
                    Button("Novo Cordel") {
                        NotificationCenter.default.post(name: Notification.Name("update.initView"), object: nil)
                    }
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    
                }
            }
            .border(Color.white, width: 2) // Adiciona a borda em torno de toda a view
            .navigationBarHidden(false) // Oculta a barra de navegação
        }
    }
}
