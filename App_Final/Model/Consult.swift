//
//  Consult.swift
//  App_Final
//
//  Created by Raison Robert  on 11/10/22.
//

import Foundation
class Consult : Codable {
var dentist: String
var data: String
init( dentist: String, data: String){
    self.dentist = dentist
    self.data = data

}
}
