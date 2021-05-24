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
    
    func bindExpenses(onSucess: @escaping Handler<[Expense]>,
                      onError: @escaping Handler<Error>) {
        let user = db.collection("users").document("teste")
        
        user.collection("expenses")
            .order(by: "date", descending: true)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    onError(error!)
                    return
                }
                
                for doc in documents {
                    print(doc.data())
                }
                
                let expenses = documents
                    .map { try! FirestoreDecoder().decode(ExpenseObj.self, from: $0.data()) }
                    .compactMap({ $0.toModel() })
                
                onSucess(expenses)
            }
    }
    
    func getExpenses(onSucess: @escaping Handler<[Expense]>, onError: @escaping Handler<Error>) {
        
    }
    
    func createExpense(_ expense: Expense, completion: @escaping Handler<Error?>) {
        
    }
    
    func updateExpense(_ expense: Expense, completion: @escaping Handler<Error?>) {
        
    }
    
    func deleteExpense(_ expense: Expense, completion: @escaping Handler<Error?>) {
        
    }
}

extension QueryDocumentSnapshot {
    
    func prepareForDecoding() -> [String: Any] {
        var data = self.data()
        data["id"] = self.documentID
        
        return data
    }
}

extension JSONDecoder {
    func decode<T>(_ type: T.Type, fromJSONObject object: Any) throws -> T where T: Decodable {
        return try decode(T.self, from: try JSONSerialization.data(withJSONObject: object, options: []))
    }
}
