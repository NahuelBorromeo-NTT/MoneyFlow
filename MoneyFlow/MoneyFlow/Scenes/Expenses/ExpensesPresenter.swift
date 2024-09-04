//
//  ExpensesPresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

protocol ExpensesPresenterProtocol {
    
}

final class ExpensesPresenter: ExpensesPresenterProtocol {
    
    weak var view: ExpensesView!
    var interactor: ExpensesInteractorProtocol!
    var router: ExpensesRouterProtocol!
}
