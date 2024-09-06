//
//  ConfigurationViewController.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import UIKit

protocol ConfigurationView: AnyObject {
    
}

final class ConfigurationViewController: UIViewController {
    
    var presenter: ConfigurationPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension ConfigurationViewController: ConfigurationView {
    
}
