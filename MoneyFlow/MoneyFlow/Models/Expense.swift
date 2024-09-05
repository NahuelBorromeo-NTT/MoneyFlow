//
//  Expense.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 4/09/24.
//

import Foundation
import RealmSwift

final class Expense: Object {
    
    @Persisted(primaryKey: true) var _id: String = UUID().uuidString
    @Persisted var name: String = ""
    @Persisted var amount: Double = 0.0
    @Persisted var date: Date
    @Persisted var category: Category?
    
}
