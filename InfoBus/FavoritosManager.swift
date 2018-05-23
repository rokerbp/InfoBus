//
//  FavoritosManager.swift
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

class FavoritosManager {
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

