//
//  ExpenseRepositoryFirebase.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation

class ExpenseRepositoryFirebase: ExpensesRepository {
    func bindExpenses(to handler: @escaping Handler<[Expense]>) {
        <#code#>
    }
    
    func getExpenses(onSucess: @escaping Handler<[Expense]>, onError: @escaping Handler<Error>) {
        <#code#>
    }
    
    func createExpense(_ expense: Expense, completion: @escaping Handler<Error?>) {
        <#code#>
    }
    
    func updateExpense(_ expense: Expense, completion: @escaping Handler<Error?>) {
        <#code#>
    }
    
    func deleteExpense(_ expense: Expense, completion: @escaping Handler<Error?>) {
        <#code#>
    }
}
