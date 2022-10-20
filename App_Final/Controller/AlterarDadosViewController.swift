//
//  AlterarDadosViewController.swift
//  App_Final
//
//  Created by Raison Robert on 20/10/22.
//

import UIKit

class AlterarDadosViewController: UIViewController {
    @IBOutlet weak var nameDoctor: UILabel!
    @IBOutlet weak var date: UILabel!
    var posicao = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        nameDoctor.text = Marcar.listMarcar[posicao].dentist
        date.text = Marcar.listMarcar[posicao].data
        print(Marcar.listMarcar[posicao].dentist)
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func apagar(_ sender: Any) {
        Marcar.listMarcar.remove(at: posicao)
        if let navController = self.navigationController {
            navController.popToRootViewController(animated: true)
        }
    }
    @IBAction func edit(_ sender: Any) {
        performSegue(withIdentifier: "editar", sender: self)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "editar" {
            if let next = segue.destination as? EditTableViewController {
                next.posicao = posicao
            }
        }
    }
}
