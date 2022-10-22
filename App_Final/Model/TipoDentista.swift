//
//  TipoDentista.swift
//  App_Final
//
//  Created by Raison Robert on 12/10/22.
//

import Foundation
class TipoDentista: Codable{
var dentist: String
var dataDisponivel: String
init( dentista : String, data: String ){
    self.dentist = dentista
    self.dataDisponivel = data
}
}
