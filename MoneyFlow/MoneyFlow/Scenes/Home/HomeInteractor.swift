//
//  HomeInteractor.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 2/09/24.
//

protocol HomeInteractorProtocol {
    func getBalance() -> Double
}

final class HomeInteractor {
    
}

extension HomeInteractor: HomeInteractorProtocol {
    func getBalance() -> Double {
        10000.00
    }
}
