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
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ConfigurationTableViewCell.self, forCellReuseIdentifier: "ConfigurationTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        title = "Configuración"
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension ConfigurationViewController: ConfigurationView {
    
}

extension ConfigurationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.configurationTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfigurationTableViewCell", for: indexPath) as? ConfigurationTableViewCell
        
        cell?.setup(title: presenter.configurationTitles[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    
}
