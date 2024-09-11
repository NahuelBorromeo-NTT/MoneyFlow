//
//  HomePresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 2/09/24.
//
import UIKit

protocol HomePresenterProtocol {
    func getPickerButtonTitle() -> String
    func getCurrentMonthIndex() -> Int?
    func getCurrentYearIndex() -> Int?
    func getMonth(with index: Int) -> String
    func getYear(with index: Int) -> Int
    func getAmountExpenses() -> Double
    func getAmountIncomes() -> Double
    func getBalance()
    var monthsCount: Int { get }
    var yearsCount: Int { get }
    var selectedMonth: Int { get set }
    var selectedYear: Int { get set }
}

final class HomePresenter {
    
    weak var view: HomeView!
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol!
    
    var selectedMonth: Int = Calendar.current.component(.month, from: Date())
    var selectedYear: Int = Calendar.current.component(.year, from: Date())
    
    private let months = DateUtils.months
    
    private let years = DateUtils.years
}

extension HomePresenter: HomePresenterProtocol {
    func getAmountExpenses() -> Double {
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
        let expensesAmount = expenses.reduce(0) { sum, expense in
            return sum + expense.amount
        }
        return expensesAmount
    }
    
    func getAmountIncomes() -> Double {
        let incomes: [Income]
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
        
        incomes = interactor.getIncomes(with: startDate, and: endDate)
        let incomesAmount = incomes.reduce(0) { sum, income in
            return sum + income.amount
        }
        return incomesAmount
    }
    
    func getBalance() {
        let balance = getAmountIncomes() - getAmountExpenses()
        view.updateBalance(balance)
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
}
