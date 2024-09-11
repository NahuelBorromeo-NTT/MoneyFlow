//
//  HomeInteractor.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 2/09/24.
//

import RealmSwift
import Foundation

protocol HomeInteractorProtocol {
    func getBalance() -> Double
    func getExpenses(with startDate: Date, and endDate: Date) -> [Expense]
    func getIncomes(with startDate: Date, and endDate: Date) -> [Income]
}

final class HomeInteractor {
    let realm = try! Realm()
}

extension HomeInteractor: HomeInteractorProtocol {
    func getExpenses(with startDate: Date, and endDate: Date) -> [Expense] {
        let expenses = realm.objects(Expense.self).filter("date >= %@ AND date <= %@", startDate, endDate)
        return Array(expenses)
    }
    
    func getIncomes(with startDate: Date, and endDate: Date) -> [Income] {
        let incomes = realm.objects(Income.self).filter("date >= %@ AND date <= %@", startDate, endDate)
        return Array(incomes)
    }
    
    func getBalance() -> Double {
        10000.00
    }
    
}
