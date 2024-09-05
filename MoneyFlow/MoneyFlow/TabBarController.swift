//
//  TabBarController.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 4/09/24.
//

import UIKit

class TabBarController: UITabBarController {

    let homeModule = HomeRouter.createModule()
    let incomesModule = IncomesRouter.createModule()
    let transactionModule = TransactionRouter.createModule()
    let expensesModule = ExpensesRouter.createModule()
    let configurationModule = ConfigurationRouter.createModule()
    
    var previusSelectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        viewControllers = [
            createNavController(for: homeModule, title: "Inicio", imageName: "house"),
            createNavController(for: incomesModule, title: "Ingresos", imageName: "dollarsign.circle"),
            createNavController(for: transactionModule, title: nil, imageName: "plus.circle.fill"),
            createNavController(for: expensesModule, title: "Gastos", imageName: "dollarsign.arrow.circlepath"),
            createNavController(for: configurationModule, title: "Configuración", imageName: "gear")
        ]
    }

    private func createNavController(for rootViewController: UIViewController, title: String?, imageName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        guard let title else {
            let normalSymbolConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .regular)
            let normalImage = UIImage(systemName: imageName, withConfiguration: normalSymbolConfig)?.withTintColor(UIColor(named: "CustomColorIncome") ?? .yellow, renderingMode: .alwaysOriginal)
            
            let selectedImage = UIImage(systemName: imageName, withConfiguration: normalSymbolConfig)?.withTintColor(.blue, renderingMode: .alwaysOriginal)
            
            navigationController.tabBarItem.image = normalImage
            navigationController.tabBarItem.selectedImage = selectedImage

            return navigationController
        }
        
        navigationController.tabBarItem.image = UIImage(systemName: imageName)?.withTintColor(UIColor(named: "CustomColorPrimary") ?? .green, renderingMode: .alwaysOriginal)

        navigationController.tabBarItem.selectedImage = UIImage(systemName: imageName)?.withTintColor(UIColor(named: "CustomColorSecondary") ?? .blue, renderingMode: .alwaysOriginal)
        
        navigationController.tabBarItem.title = title

        navigationController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "CustomColorPrimary") ?? .green], for: .normal)
        
        navigationController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "CustomColorSecondary") ?? .blue], for: .selected)
          
        return navigationController
    }
}

extension TabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if selectedIndex != 2 {
            previusSelectedIndex = selectedIndex
        }
        if self.selectedIndex == 2 {
            self.selectedIndex = previusSelectedIndex
            presentTransactionModule()
        }
    }
    
    private func presentTransactionModule() {
        let transactionModule = TransactionRouter.createModule()
        let navController = UINavigationController(rootViewController: transactionModule)
        self.present(navController, animated: true, completion: nil)
    }
}
