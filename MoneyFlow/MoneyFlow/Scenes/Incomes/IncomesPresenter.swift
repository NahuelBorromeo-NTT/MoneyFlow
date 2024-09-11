//
//  IncomesPresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import Foundation

protocol IncomesPresenterProtocol {
    func getDetailAt(_ row: Int) -> String
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
    var incomesCount: Int { get }
}

final class IncomesPresenter {
    
    weak var view: IncomesView!
    var interactor: IncomesInteractorProtocol!
    var router: IncomesRouterProtocol!
    
    var selectedMonth: Int = Calendar.current.component(.month, from: Date())
    var selectedYear: Int = Calendar.current.component(.year, from: Date())
    
    private let months = DateUtils.months
    private let years = DateUtils.years
    
    private func getIncomes() -> [Income] {
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
        
        return incomes
    }
}

extension IncomesPresenter: IncomesPresenterProtocol {
    
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
        let incomes = getIncomes()
        return incomes[row].detail
    }
    
    func getAmountAt(_ row: Int) -> String {
        let incomes = getIncomes()
        return "\(incomes[row].amount)"
    }
    
    func getDateAt(_ row: Int) -> Date {
        let incomes = getIncomes()
        return incomes[row].date
    }
    
    var incomesCount: Int {
        let incomes = getIncomes()
        return incomes.count
    }
}
