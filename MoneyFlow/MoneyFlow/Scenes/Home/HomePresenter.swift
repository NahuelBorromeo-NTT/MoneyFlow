//
//  HomePresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 2/09/24.
//
import UIKit

protocol HomePresenterProtocol {
    func getBalance() -> NSMutableAttributedString
    func getPickerButtonTitle() -> String
    func getCurrentMonthIndex() -> Int?
    func getCurrentYearIndex() -> Int?
    func getMonth(with index: Int) -> String
    func getYear(with index: Int) -> Int
    var monthsCount: Int { get }
    var yearsCount: Int { get }
    var selectedMonth: Int { get set }
    var selectedYear: Int { get set }
}

final class HomePresenter {
    
    weak var view: HomeView!
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol!
    
    private var _selectedMonth: Int = Calendar.current.component(.month, from: Date())
    private var _selectedYear: Int = Calendar.current.component(.year, from: Date())
    
    private let months = [
        "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
        "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
    ]
    
    private let years: [Int] = {
        let currentYear = Calendar.current.component(.year, from: Date())
        return Array(currentYear - 5...currentYear)
    }()
    
}

extension HomePresenter: HomePresenterProtocol {

    func getBalance() -> NSMutableAttributedString {
        let balance = String(format: "%.2f", interactor.getBalance())
        let balanceText = "Saldo    S/. \(balance)"
        let attributedString = NSMutableAttributedString(string: balanceText)
        
        let balanceRange = (balanceText as NSString).range(of: "Saldo   ")
        let amountRange = (balanceText as NSString).range(of: "S/. \(balance)")
        
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "CustomColorPrimary") ?? .label, range: balanceRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "CustomColorAmount") ?? .yellow, range: amountRange)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32, weight: .regular), range: amountRange)
        
        return attributedString
    }
    
    func getPickerButtonTitle() -> String {
        "\(months[selectedMonth - 1]) \(selectedYear)"
    }
    
    func getCurrentMonthIndex() -> Int? {
        months.firstIndex(of: months[selectedMonth - 1])
    }
    
    func getCurrentYearIndex() -> Int? {
        years.firstIndex(of: selectedYear)
    }
    
    func getMonth(with index: Int) -> String {
        months[index]
    }
    
    func getYear(with index: Int) -> Int {
        years[index]
    }
    
    var monthsCount: Int {
        months.count
    }
    
    var yearsCount: Int {
        years.count
    }
    
    var selectedMonth: Int {
        get {
            return _selectedMonth
        }
        set {
            _selectedMonth = newValue
        }
    }
    
    var selectedYear: Int {
        get {
            return _selectedYear
        }
        set {
            _selectedYear = newValue
        }
    }
}
