//
//  DeleteExpense.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation

protocol DeleteExpense {
    func callAsFunction(_ expense: Expense, completion: @escaping Handler<Error?>)
}

class DeleteExpenseImpl: DeleteExpense {
    let expensesRepository: ExpensesRepository
    
    init(expensesRepository: ExpensesRepository) {
        self.expensesRepository = expensesRepository
    }
    
    func callAsFunction(_ expense: Expense, completion: @escaping Handler<Error?>) {
        expensesRepository.deleteExpense(expense, completion: { genericError in
            if let error = genericError {
                completion(error)
            }
            else {
                completion(nil)
            }
        })
    }
}
