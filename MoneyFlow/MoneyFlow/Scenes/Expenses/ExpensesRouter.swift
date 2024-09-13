//
//  ExpensesRouter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import UIKit

protocol ExpensesRouterProtocol {
    
}

final class ExpensesRouter: ExpensesRouterProtocol {
    var viewController: UIViewController!
    
    static func createModule() -> UIViewController {
        let viewController = ExpensesViewController()
        let interactor = ExpensesInteractor()
        let presenter = ExpensesPresenter()
        let router = ExpensesRouter()
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        viewController.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
