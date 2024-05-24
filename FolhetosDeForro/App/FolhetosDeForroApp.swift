//
//  FolhetosDeForroApp.swift
//  FolhetosDeForro
//
//  Created by Ana Guimarães on 23/05/24.
//
import SwiftUI

@main
struct FolhetosDeForroApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    
    var body: some Scene {
        WindowGroup {
            builderBody
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onReceive(NotificationCenter.default.publisher(for: Notification.Name("update.initView")), perform: { _ in
                    isFirstLaunch = false
                })
        }
    }
    
    
    @ViewBuilder var builderBody: some View {
        if !isFirstLaunch {
            ContentView()
        } else {
            InitCordel()
        }
    }
    
}


class KeyService {
    
    
    enum Keys: String {
        case isFirstLaunch
    }
    
    static func get(_ key: KeyService.Keys) -> Any? {
        UserDefaults.standard.value(forKey: key.rawValue)
    }
    
    static func has(_ key: KeyService.Keys) -> Bool {
        UserDefaults.standard.value(forKey: key.rawValue) != nil
    }
 
    static func set(_ value: Any, for key: KeyService.Keys) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
}
