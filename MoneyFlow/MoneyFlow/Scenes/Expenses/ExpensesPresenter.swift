//
//  ExpensesPresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import Foundation

protocol ExpensesPresenterProtocol {
    func getDetailAt(_ row: Int) -> String
    func getCategoryAt(_ row: Int) -> String
    func getAmountAt(_ row: Int) -> String
    func getDateAt(_ row: Int) -> Date
    func getMonth(with index: Int) -> String
    func getYear(with index: Int) -> Int
    func getPickerButtonTitle() -> String
    func getCurrentMonthIndex() -> Int?
    func getCurrentYearIndex() -> Int?
    var monthsCount: Int { get }
    var yearsCount: Int { get }
    var selectedMonth: Int { get set }
    var selectedYear: Int { get set }
    var expensesCount: Int { get }
}

final class ExpensesPresenter {
    weak var view: ExpensesView!
    var interactor: ExpensesInteractorProtocol!
    var router: ExpensesRouterProtocol!
    
    var selectedMonth: Int = Calendar.current.component(.month, from: Date())
    var selectedYear: Int = Calendar.current.component(.year, from: Date())
    
    private let months = DateUtils.months
    private let years = DateUtils.years
    
    private func getExpenses() -> [Expense] {
        let expenses: [Expense]
        let calendar = Calendar.current
        
        var components = DateComponents()
        components.year = selectedYear
        components.month = selectedMonth
        components.day = 1
        let startDate = calendar.date(from: components)!
        
        var endComponents = DateComponents()
        endComponents.year = selectedYear
        endComponents.month = selectedMonth + 1
        endComponents.day = 0
        let endDate = calendar.date(from: endComponents)!
        
        expenses = interactor.getExpenses(with: startDate, and: endDate)
        
        return expenses
    }
}

extension ExpensesPresenter: ExpensesPresenterProtocol {
    var monthsCount: Int {
        months.count
    }
    
    var yearsCount: Int {
        years.count
    }
    
    func getMonth(with index: Int) -> String {
        months[index]
    }
    
    func getYear(with index: Int) -> Int {
        years[index]
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
    
    func getDetailAt(_ row: Int) -> String {
        let expenses = getExpenses()
        return expenses[row].detail
    }
    
    func getCategoryAt(_ row: Int) -> String {
        let expenses = getExpenses()
        return expenses[row].category
    }
    
    func getAmountAt(_ row: Int) -> String {
        let expenses = getExpenses()
        return "\(expenses[row].amount)"
    }
    
    func getDateAt(_ row: Int) -> Date {
        let expenses = getExpenses()
        return expenses[row].date
    }
    
    var expensesCount: Int {
        let expenses = getExpenses()
        return expenses.count
    }
}
