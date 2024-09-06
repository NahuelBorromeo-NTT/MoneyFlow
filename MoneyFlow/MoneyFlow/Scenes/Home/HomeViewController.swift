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
    
    private let hiddenTextField = UITextField()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resumeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "CustomColorPrimary")
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = "Resumen"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let datePickerView: UIPickerView = {
       let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func setupUI() {
        
        view.backgroundColor = .white
        title = "Inicio"
        balanceLabel.attributedText = presenter.getBalance()

        pickerButton.setTitle(presenter.getPickerButtonTitle(), for: .normal)
        pickerButton.addTarget(self, action: #selector(pickerButtonTapped), for: .touchUpInside)
               
        hiddenTextField.inputView = datePickerView
        hiddenTextField.inputAccessoryView = createToolbar()

        datePickerView.delegate = self
        datePickerView.dataSource = self
        
        [balanceLabel, resumeLabel, pickerButton, hiddenTextField].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            balanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            resumeLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20),
            resumeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            
            pickerButton.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20),
            pickerButton.leadingAnchor.constraint(equalTo: resumeLabel.trailingAnchor, constant: 20),
            pickerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),

        ])
        
        if let currentMonthIndex = presenter.getCurrentMonthIndex() {
            datePickerView.selectRow(currentMonthIndex, inComponent: 0, animated: true)
        }
        
        if let currentYearIndex = presenter.getCurrentYearIndex() {
            datePickerView.selectRow(currentYearIndex, inComponent: 1, animated: true)
        }
    }
    
    @objc private func pickerButtonTapped() {
        hiddenTextField.becomeFirstResponder()
    }
    
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Listo", style: .done, target: self, action: #selector(doneTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        return toolbar
    }
        
    @objc private func doneTapped() {
        pickerButton.setTitle(presenter.getPickerButtonTitle(), for: .normal)
        hiddenTextField.resignFirstResponder()
    }
}

extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
       }
}

extension HomeViewController: HomeView {
    
}


