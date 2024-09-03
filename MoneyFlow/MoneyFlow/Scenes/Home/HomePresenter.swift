//
//  HomePresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 2/09/24.
//

import Foundation

protocol HomePresenterProtocol {
    
}

final class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeView!
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol!
}
