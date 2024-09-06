//
//  TransactionInteractor.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

protocol TransactionInteractorProtocol {
    func getAllCategories() -> [Category]
}

final class TransactionInteractor: TransactionInteractorProtocol {
    func getAllCategories() -> [Category] {
        return Category.all
    }
    
    
}
