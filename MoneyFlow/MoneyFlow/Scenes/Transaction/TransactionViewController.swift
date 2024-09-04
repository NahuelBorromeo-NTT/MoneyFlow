//
//  TransactionViewController.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import UIKit

protocol TransactionView: AnyObject {
    
}

final class TransactionViewController: UIViewController {
    
    var presenter: TransactionPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TransactionViewController: TransactionView {
    
}
