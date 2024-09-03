//
//  HomeRouter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 2/09/24.
//

import UIKit

protocol HomeRouterProtocol {
    
}

final class HomeRouter: HomeRouterProtocol {
    
    static func createModule() -> UIViewController {
        let viewController = HomeViewController()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        viewController.presenter = presenter
        return viewController
    }
}
