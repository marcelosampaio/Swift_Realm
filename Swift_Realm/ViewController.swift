//
//  ViewController.swift
//  Swift_Realm
//
//  Created by Marcelo Sampaio on 05/09/22.
//

import UIKit
import RealmSwift


class ViewController: UIViewController {
    
    let schemaVersion: Int = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("📍 Realm path: \(path())")
//        add()
//
        readAll()
        
    }
    
    func path() -> String {
        let config = Realm.Configuration(
            schemaVersion: UInt64(schemaVersion))
        Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm()
        let realmPath: String = realm.configuration.fileURL?.absoluteString ?? ""
        return realmPath
    }

    
    func add() {
        
        let cat = Cat()
        cat.name = "Third"
        cat.gender = "Male"
        cat.color = "Brown"
        cat.health = "needsAttention"
        
        let config = Realm.Configuration(
            schemaVersion: UInt64(schemaVersion))
        let realm = try! Realm()
        Realm.Configuration.defaultConfiguration = config
        try! realm.write {
            realm.add(cat)
        }
    }
    
    func readAll() {
        let config = Realm.Configuration(
            schemaVersion: UInt64(schemaVersion))
        
        let realm = try! Realm()
        let cats = realm.objects(Cat.self)
        
        for cat in cats {
            
            print("👉 This is cat \(cat.name ?? "***")")
        }
        
    }

}

