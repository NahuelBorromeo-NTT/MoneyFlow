//
//  TransactionRouter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import UIKit

protocol TransactionRouterProtocol {
    func dismissTransactionView()
}

final class TransactionRouter: TransactionRouterProtocol {
    func dismissTransactionView() {
        viewController.dismiss(animated: true)
    }
    
    
    unowned var viewController: UIViewController!
    
    static func createModule() -> UIViewController {
        let viewController = TransactionViewController()
        let interactor = TransactionInteractor()
        let presenter = TransactionPresenter()
        let router = TransactionRouter()
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        viewController.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
