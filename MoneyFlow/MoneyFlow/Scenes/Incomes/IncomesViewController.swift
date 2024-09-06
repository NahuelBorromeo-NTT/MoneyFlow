//
//  IncomesViewController.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import UIKit

protocol IncomesView: AnyObject {
    
}

final class IncomesViewController: UIViewController {
    
    var presenter: IncomesPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension IncomesViewController: IncomesView {
    
}
