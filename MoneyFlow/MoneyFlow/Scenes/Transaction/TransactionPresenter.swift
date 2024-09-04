//
//  TransactionPresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

protocol TransactionPresenterProtocol {
    
}

final class TransactionPresenter: TransactionPresenterProtocol {
    
    weak var view: TransactionView!
    var interactor: TransactionInteractorProtocol!
    var router: TransactionRouterProtocol!
}
