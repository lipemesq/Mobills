//
//  EditExpenseTableViewController.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import UIKit

class EditExpenseTableViewController: UITableViewController {
    
    @IBOutlet weak var valueInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var paidSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    
    var currentExpense: Expense?
    
    var doAddExpense: AddExpense!
    var doUpdateExpense: UpdateExpense!
    var doDeleteExpense: DeleteExpense!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupInputsListeners()
        if let data = currentExpense {
            setupCurrentData(with: data)
            setupDeleteButton()
            setupUpdateButton()
        }
        else {
            setupCancelButton()
            setupCreateButton()
        }
    }
    
    private func setupDeleteButton() {
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteExpense))
        self.navigationItem.rightBarButtonItem = deleteButton
    }
    
    private func setupCancelButton() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        self.navigationItem.rightBarButtonItem = cancelButton
    }
    
    private func setupCreateButton() {
        doneButton.titleLabel?.text = "Adicionar despesa"
        disableDoneButton()
    }
    
    private func setupUpdateButton() {
        doneButton.titleLabel?.text = "Atualizar despesa"
        enableDoneButton()
    }
    
    @objc private func deleteExpense() {
        doDeleteExpense(currentExpense!) { error in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc private func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupCurrentData(with expense: Expense) {
        valueInput.text = expense.value.formatAsCurrency()
        descriptionInput.text = expense.description
        paidSwitch.isOn = expense.paid
        datePicker.date = expense.date
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        if let data = currentExpense {
            let expenseValue = Double(valueInput.text ?? "0") ?? 0
            let expenseDescription = descriptionInput.text ?? ""
            let expense = Expense(id: data.id, value: expenseValue, description: expenseDescription, date: datePicker.date, paid: paidSwitch.isOn)
            
            doUpdateExpense(expense) { error in
                self.dismiss(animated: true, completion: nil)
            }
        }
        else {
            let expenseValue = Double(valueInput.text ?? "0") ?? 0
            let expenseDescription = descriptionInput.text ?? ""
            let expense = Expense(value: expenseValue, description: expenseDescription, date: datePicker.date, paid: paidSwitch.isOn)
            
            doAddExpense(expense) { error in
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    private func setupInputsListeners() {
        valueInput.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if text.isEmpty {
            disableDoneButton()
        }
        else {
            enableDoneButton()
        }
    }
    
    private func enableDoneButton() {
        doneButton.isEnabled = true
        doneButton.backgroundColor = .systemGreen
    }
    
    private func disableDoneButton() {
        doneButton.isEnabled = false
        doneButton.backgroundColor = .systemGray
    }
    
    // MARK: - Table view data source

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
