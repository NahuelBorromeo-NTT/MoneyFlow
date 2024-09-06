//
//  Category.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 5/09/24.
//

import Foundation

enum Category: String, CaseIterable {
    case alimentación = "Alimentación"
    case hogar = "Hogar"
    case ropa = "Ropa"
    case viajes = "Viajes"
    case salidas = "Salidas"
    case inversión = "Inversión"
    case mascota = "Mascota"
    case varios = "Gastos Varios"
    case transporte = "Transporte"
    case entretenimiento = "Entretenimiento"
    case salud = "Salud"
    case educacion = "Educación"
    
    static var all: [Category] {
        return Category.allCases
    }
}
