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
    
    private let hiddenTextField = UITextField()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ExpenseTableViewCell.self, forCellReuseIdentifier: "ExpenseTableViewCell")
        return tableView
    }()
    
    private let datePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    private let pickerButton: UIButton = {
        var configuration = UIButton.Configuration.tinted()
        configuration.titleAlignment = .leading
        let button = UIButton(type: .system)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    private func setupUI() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleTransactionAdded), name: .transactionAdded, object: nil)
        
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        
        pickerButton.setTitle(presenter.getPickerButtonTitle(), for: .normal)
        pickerButton.addTarget(self, action: #selector(pickerButtonTapped), for: .touchUpInside)
        
        hiddenTextField.inputView = datePickerView
        hiddenTextField.inputAccessoryView = createToolbar()
        
        datePickerView.delegate = self
        datePickerView.dataSource = self
        
        [tableView, pickerButton, hiddenTextField].forEach(view.addSubview)
                
        NSLayoutConstraint.activate([
            pickerButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40),
            pickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: pickerButton.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            
        ])
        
        if let currentMonthIndex = presenter.getCurrentMonthIndex() {
            datePickerView.selectRow(currentMonthIndex, inComponent: 0, animated: true)
        }
        
        if let currentYearIndex = presenter.getCurrentYearIndex() {
            datePickerView.selectRow(currentYearIndex, inComponent: 1, animated: true)
        }
    }
    @objc private func handleTransactionAdded() {
        tableView.reloadData()
    }
    
    @objc private func pickerButtonTapped() {
        hiddenTextField.becomeFirstResponder()
    }
    
    @objc private func doneTapped() {
        pickerButton.setTitle(presenter.getPickerButtonTitle(), for: .normal)
        hiddenTextField.resignFirstResponder()
    }
    
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Listo", style: .done, target: self, action: #selector(doneTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        return toolbar
    }
}

extension ExpensesViewController: ExpensesView {
    
}

extension ExpensesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.expensesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseTableViewCell", for: indexPath) as? ExpenseTableViewCell
        cell?.setup(title: presenter.getDetailAt(indexPath.row), amount: presenter.getAmountAt(indexPath.row), date: presenter.getDateAt(indexPath.row))
        return cell ?? UITableViewCell()
    }
}

extension ExpensesViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? presenter.monthsCount : presenter.yearsCount
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? presenter.getMonth(with: row) : "\(presenter.getYear(with: row))"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            presenter.selectedMonth = row + 1
        } else {
            presenter.selectedYear = presenter.getYear(with: row)
        }
        tableView.reloadData()
    }
}
