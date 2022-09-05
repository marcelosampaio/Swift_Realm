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
//        add()
        
        readAll()
        
    }

    
    func add() {
        
        let realmPath: String = realm.configuration.fileURL?.absoluteString ?? ""
        
        print("📍 Realm path: \(realmPath)")
        
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
            print("This is cat \(cat.name ?? "***")")
        }
        
    }

}

