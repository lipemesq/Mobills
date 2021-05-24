//
//  ExpenseRepositoryFirebase.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation
import Firebase
import CodableFirebase

class ExpenseRepositoryFirebase: ExpensesRepository {
    let db = Firestore.firestore()
    private let userData: UserData
    private let userId: String
    
    private var expensesColletion: CollectionReference
    
    init(user: UserData) {
        self.userData = user
        self.userId = userData.id
        
        let user = db.collection("users").document(userId)
        expensesColletion = user.collection("expenses")
    }
    
    func bindExpenses(onSucess: @escaping Handler<[Expense]>,
                      onError: @escaping Handler<Error>) {
        expensesColletion
            .order(by: "date", descending: true)
            .addSnapshotListener { querySnapshot, error in
                
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    onError(error!)
                    return
                }
                
                let expenses = documents
                    .map { doc -> ExpenseObj in
                        var obj = try! FirestoreDecoder().decode(ExpenseObj.self, from: doc.data())
                        obj.id = doc.documentID
                        return obj
                    }
                    .compactMap({ $0.toModel() })
                
                onSucess(expenses)
            }
    }
    
    func getExpenses(onSucess: @escaping Handler<[Expense]>, onError: @escaping Handler<Error>) {
        print(" --- ERROR: \(#function) not implemented yet because it's not used.")
        onError(NSError())
    }
    
    func createExpense(_ expense: Expense, completion: @escaping Handler<Error?>) {
        let obj = ExpenseObj(from: expense)
        let dic = try! FirestoreEncoder().encode(obj)

        expensesColletion.document().setData(dic) { err in
            if let err = err {
                print("Error adding document: \(err) at \(#function)")
                completion(err)
            } else {
                completion(nil)
            }
        }
    }
    
    func updateExpense(_ expense: Expense, completion: @escaping Handler<Error?>) {
        let obj = ExpenseObj(from: expense)
        let dic = try! FirestoreEncoder().encode(obj)

        expensesColletion.document(expense.id!).setData(dic) { err in
            if let err = err {
                print("Error updating document: \(err) at \(#function)")
                completion(err)
            } else {
                completion(nil)
            }
        }
    }
    
    func deleteExpense(_ expense: Expense, completion: @escaping Handler<Error?>) {
        expensesColletion.document(expense.id!).delete() { err in
            if let err = err {
                print("Error deleting document: \(err) at \(#function)")
                completion(err)
            } else {
                completion(nil)
            }
        }
    }
}
