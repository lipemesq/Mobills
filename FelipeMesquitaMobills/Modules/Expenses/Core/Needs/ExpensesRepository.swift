//
//  ExpensesRepository.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation

protocol ExpensesRepository {
    func bindExpenses(onSucess: @escaping Handler<[Expense]>,
                      onError: @escaping Handler<Error>)
    
    func getExpenses(onSucess: @escaping Handler<[Expense]>,
                     onError: @escaping Handler<Error>)
    
    func createExpense(_ expense: Expense,
                       completion: @escaping Handler<Error?>)
    
    func updateExpense(_ expense: Expense,
                       completion: @escaping Handler<Error?>)
    
    func deleteExpense(_ expense: Expense,
                       completion: @escaping Handler<Error?>)
}
