//
//  EditTableViewController.swift
//  App_Final
//
//  Created by Raison Robert on 20/10/22.
//

import UIKit

class EditTableViewController: UITableViewController {
var posicao = 0
var dentist = [TipoDentista]()
override func viewDidLoad() {
super.viewDidLoad()
if (Dentista.listDentist.isEmpty){
    dentist = Dentist().listDentist
}else{
    dentist = Dentista.listDentist
}
//
// Uncomment the following line to preserve selection between presentations
// self.clearsSelectionOnViewWillAppear = false

// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
// self.navigationItem.rightBarButtonItem = self.editButtonItem
}

// MARK: - Table view data source

override func numberOfSections(in tableView: UITableView) -> Int {
// #warning Incomplete implementation, return the number of sections
return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
// #warning Incomplete implementation, return the number of rows
return dentist.count
}


override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCell(withIdentifier: "editDoctor", for: indexPath)

// Configure the cell...
cell.textLabel?.text = "\(dentist[indexPath.row].dentist) - Data: \(dentist[indexPath.row].dataDisponivel)"
return cell
}
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

let consultMarcado = Consult(dentist: dentist[indexPath.row].dentist, data: dentist[indexPath.row].dataDisponivel)
dentist.append(TipoDentista.init(dentista: Marcar.listMarcar[posicao].dentist , data: Marcar.listMarcar[posicao].data ))
Marcar.listMarcar[posicao] = consultMarcado
dentist.remove(at: indexPath.row)
Dentista.listDentist = dentist
tableView.reloadData()
if let navController = self.navigationController {
    navController.popToRootViewController(animated: true)
}
}

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

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
// Get the new view controller using segue.destination.
// Pass the selected object to the new view controller.
}
*/

}
