//
//  ViewController.swift
//  Swift_Realm
//
//  Created by Marcelo Sampaio on 05/09/22.
//

import UIKit
import RealmSwift


class ViewController: UIViewController {
    
    private let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("📍 Realm path: \(path())")
//        add()
        
        readAll()
        
    }
    
    func path() -> String {
        let realmPath: String = realm.configuration.fileURL?.absoluteString ?? ""
        return realmPath
    }

    
    func add() {
        
        let cat = Cat()
        cat.name = "Martina"
        cat.gender = "Female"
        cat.color = "White"
        
        try! realm.write {
            realm.add(cat)
        }
    }
    
    func readAll() {
        let cats = realm.objects(Cat.self)
        
        for cat in cats {
            print("👉 This is cat \(cat.name ?? "***")")
        }
        
    }

}

