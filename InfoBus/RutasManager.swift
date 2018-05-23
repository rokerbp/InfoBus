//
//  RutasManager.swift
//  InfoBus
//
//  Created by roker on 4/27/18.
//  Copyright © 2018 roker. All rights reserved.
//

import Foundation

// MARK: Paths
private var appSupportDirectory:URL = {
    let url = FileManager().urls(for:.applicationSupportDirectory,in: .userDomainMask).first!
    if !FileManager().fileExists(atPath: url.path) {
        do {
            try FileManager().createDirectory(at: url,
                                              withIntermediateDirectories: false)
        } catch let error as NSError {
            print("\(error.localizedDescription)")
        }
    }
    return url
}()
private var rutasFile:URL = {
    let filePath = appSupportDirectory.appendingPathComponent("Favoritos").appendingPathExtension("db")
    print(filePath)
    if !FileManager().fileExists(atPath: filePath.path) {
        if let bundleFilePath = Bundle.main.resourceURL?.appendingPathComponent("Favoritos").appendingPathExtension("db") {
            do {
                try FileManager().copyItem(at: bundleFilePath, to: filePath)
            } catch let error as NSError {
                //fingers crossed
                print("\(error.localizedDescription)")
            }
        }
    }
    return filePath
}()

class RutasManager {
    private lazy var rutas:[Ruta] = self.loadRutas()
    var rutaCount:Int {return rutas.count}
    func getRuta(at index:Int)->Ruta {
        return rutas[index]
    }
    private func loadRutas()->[Ruta] {
        return retrieveRutas() ?? []
    }
    func addRuta(_ ruta:Ruta) {
        rutas.append(ruta)
    }
    
    /*private func sampleRutas()->[Ruta] {
        return [
            Ruta(empresa: "Tran Pubenza", ruta: "7", tiempo: 5, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 9 pm"),
            Ruta(empresa: "Tran Pubenza", ruta: "2", tiempo: 5, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 9 pm"),
            Ruta(empresa: "Tran Tambo", ruta: "2", tiempo: 7, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 9 pm"),
            Ruta(empresa: "Sotracauca", ruta: "2", tiempo: 8, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 9 pm"),
            Ruta(empresa: "Sotracauca", ruta: "1", tiempo: 9, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 9 pm"),
            Ruta(empresa: "Sotracauca", ruta: "6", tiempo: 12, itinerario: "Campanario - Lacteos - El uvo - Sena - Torre Molinos - Esmeralda", horario: "L-V 7am a 6 pm")
        ]
    }*/
    
    func removeRuta (at index: Int){
        rutas.remove(at: index)
    }
    
    func getOpenDB()->FMDatabase? {
        let db = FMDatabase(path: rutasFile.path)
        guard db.open() else {
            print("Unable to open database")
            return nil
        }
        return db
    }
    
    //MARK: SQLite
    func retrieveRutas() -> [Ruta]? {
        guard let db = getOpenDB() else { return nil }
        var rutas:[Ruta] = []
        do {
            let rs = try db.executeQuery(
                "SELECT * FROM prueba", values: nil)
            while rs.next() {
                if let ruta = Ruta(rs: rs) {
                    rutas.append(ruta)
                }
            }
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        db.close()
        return rutas
    }
    
    //endSQL
    
}
