//
//  ContentView.swift
//  FerMovilAppPreferences
//
//  Created by MAC on 24/11/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var notificationsEnabled = true
    
    @State private var anunciosBecarios = true
    @State private var anunciosAspirantes = false
    @State private var anunciosGenerales = true
    
    @State private var reducirMovimiento = false
    
    
    var body: some View {
        
        
        ZStack {
            Color.white.ignoresSafeArea()
            VStack (spacing: 20) {
                
                // Top Bar
                TopBar()
                Spacer()
                
                // Main Content
                ScrollView (showsIndicators: false) {
                    VStack (spacing: 20) {
                        
                        // InfoTable()
                        
                        SettingHeadline(title: "Notificaciones", description: "Elige cómo quieres enterarte de las novedades")
                        SettingField(title: "Notificaciones push", description: "Recibe avisos directamente en tu celular.", isOn: $notificationsEnabled)
                        
                        SettingHeadline(title: "Temas de interés", description: "Selecciona qué publicaciones te interesan")
                        SettingField(title: "Anuncios para becarios", description: "Renovaciónes, requisitos y recordatorios", isOn: $anunciosBecarios)
                        SettingField(title: "Anuncios para aspirantes", description: "Convocatorias y procesos de solicitud", isOn: $anunciosAspirantes)
                        SettingField(title: "Avisos generales", description: "Eventos y noticias de la fundación", isOn: $anunciosGenerales)

                        SettingHeadline(title: "Apariencia", description: "Elige cómo se ve la aplicación")

                        SettingHeadline(title: "Accesibilidad", description: "Ajusta la app para leerla con más comodidad")
                        SettingField(title: "Reducir el movimiento", description: "Quita las animaciones que deslizan o agrandan elementos", isOn: $reducirMovimiento)
                        
                        SettingHeadline(title: "Acerca de la fundación", description: "Conoce más de la fundación y siguenos en redes sociales")
                    }
                    .padding()
                }
                
                Spacer()
                // Bottom Bar
                BottomBar()
            }
            .padding()
        }
    }
}


struct SettingHeadline : View {
    
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 8){
                Capsule()
                    .frame(width: 30, height: 3)
                .foregroundStyle(.indigo)
                Text(title.uppercased())
                    .font(.headline)
                    .bold()
                    .foregroundStyle(.indigo)
                Text(description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
    }
    
}

struct SettingField : View{
    
    let title: String
    let description: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack (spacing: 20) {
            VStack (alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .bold()
                Text(description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(.indigo)
        }
        Divider()
    }
}

struct BottomBar : View {
    
    var body : some View {
        HStack()
        {
            Spacer()
            BottomButton(name: "Anuncios", icon: "megaphone")
            Spacer()
            BottomButton(name: "Inicio", icon: "house")
            Spacer()
            BottomButton(name: "Preferencias", icon: "gearshape", selected: true)
            Spacer()
        }
        .frame(maxHeight: 0)
    }
    
}

struct BottomButton : View {
    let name : String
    let icon : String
    var selected : Bool = false
    
    var body : some View {
        VStack(spacing: 5) {
            Image(systemName: selected ? "\(icon).fill" : icon )
                .font(.title)
                .foregroundStyle( selected ? .indigo : .primary )
            Text(name)
                .foregroundStyle( selected ? .indigo : .primary)
        }
    }
    
}

struct TopBar : View {
    var body : some View {
        VStack(spacing: 20){
            HStack {
                Text("Preferencias")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "bell")
                    .font(.title)
            }
        }
    }
}

struct InfoTable : View {
    
    var body : some View {
        Text("hi")
    }
    
}

#Preview {
    ContentView()
}
