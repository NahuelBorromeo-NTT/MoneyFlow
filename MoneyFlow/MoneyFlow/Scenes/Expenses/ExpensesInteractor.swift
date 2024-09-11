//
//  ExpensesInteractor.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import Foundation
import RealmSwift

protocol ExpensesInteractorProtocol {
    func getExpenses(with startDate: Date, and endDate: Date) -> [Expense]
}

final class ExpensesInteractor {
    let realm = try! Realm()
}

extension ExpensesInteractor: ExpensesInteractorProtocol {
    func getExpenses(with startDate: Date, and endDate: Date) -> [Expense] {
        let expenses = realm.objects(Expense.self).filter("date >= %@ AND date <= %@", startDate, endDate)
        return Array(expenses)
    }
}
