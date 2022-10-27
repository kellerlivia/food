//
//  AdicionarItensViewController.swift
//  food
//
//  Created by Livia Carvalho Keller on 25/10/22.
//

import UIKit

protocol AdicionaItensDelegate {
    func add (_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func adicionarItem(_ sender: UIButton) {
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else { return }
        
        if let numeroDeCalorias = Double(calorias) {
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    }
}
