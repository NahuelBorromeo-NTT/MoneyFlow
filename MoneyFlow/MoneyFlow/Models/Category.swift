//
//  Category.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 4/09/24.
//

import Foundation
import RealmSwift

final class Category: Object {
    
    @Persisted(primaryKey: true) var _id: String = UUID().uuidString
    @Persisted var name: String = ""
    
}
