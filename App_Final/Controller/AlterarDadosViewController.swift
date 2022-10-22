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
    var dentist = [TipoDentista]()
    override func viewDidLoad() {
        super.viewDidLoad()
        nameDoctor.text = Marcar.listMarcar[posicao].dentist
        date.text = Marcar.listMarcar[posicao].data
        print(Marcar.listMarcar[posicao].dentist)
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func apagar(_ sender: Any) {
        buscarDentista()
        let inserirDentista = TipoDentista(dentista: Marcar.listMarcar[posicao].dentist, data: Marcar.listMarcar[posicao].data)
        dentist.append(inserirDentista)
        Marcar.listMarcar.remove(at: posicao)
        salvarMarcado()
        salvarDentista()
        if let navController = self.navigationController {
            navController.popToRootViewController(animated: true)
        }
    }
    @IBAction func edit(_ sender: Any) {
        performSegue(withIdentifier: "editar", sender: self)
    }
    let arquivoDentista = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathExtension("list.dentista")
    func buscarDentista(){
        do{
            if let dados = try? Data(contentsOf: arquivoDentista!){
                let decodificador = PropertyListDecoder()
                dentist = try decodificador.decode([TipoDentista].self, from: dados)
            }
    }catch {
        print("Erro ao buscar: \(error)")
    }
    }
    func salvarDentista(){
        
        let codificador = PropertyListEncoder()
        do{
            let dados = try codificador.encode(dentist)
            try dados.write(to: self.arquivoDentista!)
        } catch{
            print("Erro ao gravar: \(error)")
        }
    }
    let arquivoMarcado = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathExtension("consultorio.odotonlogico")
    
    func buscarMarcado(){
        do{
            if let dados = try? Data(contentsOf: arquivoMarcado!){
                let decodificador = PropertyListDecoder()
                Marcar.listMarcar = try decodificador.decode([Consult].self, from: dados)
            }
    }catch {
        print("Erro ao buscar: \(error)")
    }
    }
    func salvarMarcado(){
        
        let codificador = PropertyListEncoder()
        do{
            let dados = try codificador.encode(Marcar.listMarcar)
            try dados.write(to: self.arquivoMarcado!)
        } catch{
            print("Erro ao gravar: \(error)")
        }
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
