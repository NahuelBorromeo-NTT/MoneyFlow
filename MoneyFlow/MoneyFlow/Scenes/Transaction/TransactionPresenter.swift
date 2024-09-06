//
//  TransactionPresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

protocol TransactionPresenterProtocol {
    var categoriesCount: Int { get }
    func getTitleForRow(row: Int) -> String
}

final class TransactionPresenter {
    
    weak var view: TransactionView!
    var interactor: TransactionInteractorProtocol!
    var router: TransactionRouterProtocol!
    
    lazy var Categories: [Category] = interactor.getAllCategories()
    
}

extension TransactionPresenter: TransactionPresenterProtocol {
    func getTitleForRow(row: Int) -> String {
        return Categories[row].rawValue
    }
        
    var categoriesCount: Int {
        Category.all.count
    }
}
