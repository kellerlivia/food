//
//  RemoveRefeicaoViewController.swift
//  food
//
//  Created by Livia Carvalho Keller on 27/10/22.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        
        let botaoCancelar = UIAlertAction(title: "cancelar", style: .cancel)
        alert.addAction(botaoCancelar)
        
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        alert.addAction(botaoRemover)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
