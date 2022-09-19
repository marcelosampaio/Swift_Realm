//
//  Cat.swift
//  Swift_Realm
//
//  Created by Marcelo Sampaio on 05/09/22.
//

import Foundation
import RealmSwift


class Cat: Object {
    @objc dynamic var name: String?
    @objc dynamic var color: String?
    @objc dynamic var gender: String?
    @objc dynamic var health: String?
    @objc dynamic var pending: String?
}
