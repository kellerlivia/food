//
//  RefeicoesTableViewController.swift
//  food
//
//  Created by Livia Carvalho Keller on 25/10/22.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes: Array<Refeicao> = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        cell.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let cell = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            let alert = UIAlertController(title: refeicao.nome, message: "felicidade: \(refeicao.felicidade)", preferredStyle: .alert)
            
            let botaoCancelar = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(botaoCancelar)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    func add (_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}
