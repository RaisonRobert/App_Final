//
//  Marcado.swift
//  App_Final
//
//  Created by Raison Robert on 11/10/22.
//

import Foundation
class Marcado: NSObject{
    
    var listMarcado : Array<Consult> = []
    
    init(_ consultaMarcada: Consult){
        self.listMarcado.append(consultaMarcada)
        for marcado in self.listMarcado{
            print("Inserido: ", marcado.dentist)
        }
//        self.listMarcado = consultaMarcada
    }
}
