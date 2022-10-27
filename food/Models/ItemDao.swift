//
//  ItemDao.swift
//  food
//
//  Created by Livia Carvalho Keller on 27/10/22.
//

import UIKit

class ItemDao {
    
    func save(_ itens: [Item]) {
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let path = recuperaDiretorio() else { return }
            try dados.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let path = diretorio.appendingPathComponent("itens")
        
        return path
    }
    
    func recupera() -> [Item] {
        do {
            guard let path = recuperaDiretorio() else { return [] }
            let dados = try Data(contentsOf: path)
            guard let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Item] else { return [] }
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
