//
//  Dentist.swift
//  App_Final
//
//  Created by Raison Robert on 08/10/22.
//

import Foundation
class Dentist{
    var listDentist = [TipoDentista]()
    init( ){
        listDentist.append(TipoDentista.init(dentista:"Dr. Luiz", data:"11/11/2022 - 11:00"))
        listDentist.append(TipoDentista.init(dentista:"Dr. Silva", data:"14/11/2022 - 11:00"))
        listDentist.append(TipoDentista.init(dentista:"Dr. Raison", data:"15/11/2022 - 11:00"))
        listDentist.append(TipoDentista.init(dentista:"Dr. Jõao", data:"16/11/2022 - 11:00"))
        listDentist.append(TipoDentista.init(dentista:"Dra. Maria", data:"17/11/2022 - 11:00"))
        listDentist.append(TipoDentista.init(dentista:"Dra. Bruna", data:"18/11/2022 - 11:00"))
        listDentist.append(TipoDentista.init(dentista:"Dr. Robert", data:"21/11/2022 - 11:00"))
        listDentist.append(TipoDentista.init(dentista:"Dra. Cris", data:"22/11/2022 - 11:00"))
    }
}
