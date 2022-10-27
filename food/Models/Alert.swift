//
//  Alert.swift
//  food
//
//  Created by Livia Carvalho Keller on 27/10/22.
//

import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "Atenção", mensagem: String) {
        
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
