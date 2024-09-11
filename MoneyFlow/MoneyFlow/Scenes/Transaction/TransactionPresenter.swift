//
//  TransactionPresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import RealmSwift
import Foundation

protocol TransactionPresenterProtocol {
    var categoriesCount: Int { get }
    var transactionType: TransactionType { get set}
    func getTitleForRow(row: Int) -> String
    func recordTransaction(amount: Double, detail: String, category: String, date: Date) -> Bool
}

final class TransactionPresenter {
    
    weak var view: TransactionView!
    var interactor: TransactionInteractorProtocol!
    var router: TransactionRouterProtocol!

    private var categories: [Category] = Category.all
    
    var transactionType: TransactionType = .expense
}

extension TransactionPresenter: TransactionPresenterProtocol {
    func recordTransaction(amount: Double, detail: String, category: String, date: Date) -> Bool {
        var success = false
        
        switch transactionType {
        case .income:
            let income = Income()
            income.amount = amount
            income.detail = detail
            income.date = date
            success = interactor.recordTransaction(transaction: income)
        case .expense:
            let expense = Expense()
            expense.amount = amount
            expense.detail = detail
            expense.category = category
            expense.date = date
            success = interactor.recordTransaction(transaction: expense)
        }

        if success {
            NotificationCenter.default.post(name: .transactionAdded, object: nil)
            router.dismissTransactionView()
        }
        
        return success
    }
    
    func getTitleForRow(row: Int) -> String {
        return categories[row].rawValue
    }
        
    var categoriesCount: Int {
        Category.all.count
    }
}
