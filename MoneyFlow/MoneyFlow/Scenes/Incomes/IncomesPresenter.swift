//
//  IncomesPresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

protocol IncomesPresenterProtocol {
    
}

final class IncomesPresenter: IncomesPresenterProtocol {
    
    weak var view: IncomesView!
    var interactor: IncomesInteractorProtocol!
    var router: IncomesRouterProtocol!
}
