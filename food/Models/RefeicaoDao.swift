//
//  RefeicaoDao.swift
//  food
//
//  Created by Livia Carvalho Keller on 27/10/22.
//

import UIKit

class RefeicaoDao {
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let path = diretorio.appendingPathComponent("refeicao")
        
        return path
    }
    
    func save(_ refeicoes: [Refeicao]) {
        guard let path = recuperaCaminho() else { return }
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Refeicao] {
        guard let path = recuperaCaminho() else { return [] }
        do {
            let dados = try Data(contentsOf: path)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Refeicao] else { return [] }
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
