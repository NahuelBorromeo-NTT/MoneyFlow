//
//  NotificationNames.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 9/09/24.
//

import Foundation

extension Notification.Name {
    static let transactionAdded = Notification.Name("transactionAdded")
    static let transactionDeleted = Notification.Name("transactionDeleted")
    static let transactionEdited = Notification.Name("transactionEdited")
}
