//
//  ExpensesViewController.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import UIKit

protocol ExpensesView: AnyObject {
    
}

final class ExpensesViewController: UIViewController {
    
    var presenter: ExpensesPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ExpensesViewController: ExpensesView {
    
}
