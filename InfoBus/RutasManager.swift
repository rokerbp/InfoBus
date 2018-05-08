//
//  RutasManager.swift
//  InfoBus
//
//  Created by roker on 4/27/18.
//  Copyright © 2018 roker. All rights reserved.
//

import Foundation
class RutasManager {
    private lazy var rutas:[Ruta] = self.loadRutas()
    var rutaCount:Int {return rutas.count}
    func getRuta(at index:Int)->Ruta {
        return rutas[index]
    }
    private func loadRutas()->[Ruta] {
        return sampleRutas()
    }
    func addRuta(_ ruta:Ruta) {
        rutas.append(ruta)
    }
    private func sampleRutas()->[Ruta] {
        return [
            Ruta(empresa: "Tran Pubenza", ruta: "7", tiempo: 5, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 9 pm"),
            Ruta(empresa: "Tran Pubenza", ruta: "2", tiempo: 5, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 9 pm"),
            Ruta(empresa: "Tran Tambo", ruta: "2", tiempo: 7, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 9 pm"),
            Ruta(empresa: "Sotracauca", ruta: "2", tiempo: 8, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 9 pm"),
            Ruta(empresa: "Sotracauca", ruta: "1", tiempo: 9, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 9 pm"),
            Ruta(empresa: "Sotracauca", ruta: "6", tiempo: 12, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 6 pm")
        ]
    }
    
    func removeRuta (at index: Int){
        rutas.remove(at: index)
    }
}
