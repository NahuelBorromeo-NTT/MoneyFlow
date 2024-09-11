//
//  DateUtils.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 10/09/24.
//

import Foundation

final class DateUtils {
    static let months = [
        "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
        "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
    ]
    
    static let years: [Int] = {
            let currentYear = Calendar.current.component(.year, from: Date())
            return Array(currentYear - 5...currentYear)
    }()
    
    static func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM"
        
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
}
