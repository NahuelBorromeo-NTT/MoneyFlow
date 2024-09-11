//
//  IncomesInteractor.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import Foundation
import RealmSwift

protocol IncomesInteractorProtocol {
    func getIncomes(with startDate: Date, and endDate: Date) -> [Income]
}

final class IncomesInteractor {
    let realm = try! Realm()
}

extension IncomesInteractor: IncomesInteractorProtocol {
    func getIncomes(with startDate: Date, and endDate: Date) -> [Income] {
        let incomes = realm.objects(Income.self).filter("date >= %@ AND date <= %@", startDate, endDate)
        return Array(incomes)
    }
}
