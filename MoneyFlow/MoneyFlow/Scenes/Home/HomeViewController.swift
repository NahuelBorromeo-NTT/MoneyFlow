//
//  ViewController.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 2/09/24.
//

import UIKit

protocol HomeView: AnyObject {
    
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: HomeView {
    
}

