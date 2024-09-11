//
//  TransactionInteractor.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//
import RealmSwift

protocol TransactionInteractorProtocol {
    func recordTransaction<T:Object>(transaction: T) -> Bool
}

final class TransactionInteractor {
    let realm = try! Realm()
}

extension TransactionInteractor: TransactionInteractorProtocol {
    func recordTransaction<T:Object>(transaction: T) -> Bool {
        do {
            try realm.write({
                realm.add(transaction)
            })
            return true
        } catch {
            print("Error al registrar la transacción: \(error.localizedDescription)")
            return false
        }
    }
}
