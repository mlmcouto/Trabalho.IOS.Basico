//
//  ViewController.swift
//  SuperSenha
//
//  Created by aluno on 01/07/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var swCaptitalLetters: UISwitch!
   
    @IBOutlet weak var buttonPasswd: UIButton!
    
    @IBAction func trocouPreferencia(sender: UISwitch) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
  
    override func viewDidLayoutSubviews() {
        disabledButton()
    }
    


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if Int(tfTotalPasswords.text!) ?? 1 > 99 || Int(tfNumberOfCharacters.text!) ?? 1 > 16 {
        alerta()
        }
        let passwordsViewController = segue.destination as! PasswordViewController
        
        // forma mais segura (usar if let)
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            // se conseguir obter o valor do campo e converter para inteiro
            passwordsViewController.numberOfPasswords = numberOfPasswords
            }
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
            }
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCaptitalLetters.isOn
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        
        // forcar encerrar o modo de edicao // remove o foco e libera teclado
        view.endEditing(true)
    }

    
    func disabledButton() {
       
        let enabledButton = swLetters.isOn || swNumbers.isOn || swSpecialCharacters.isOn || swCaptitalLetters.isOn
        
        if (enabledButton == true) {
            buttonPasswd.isEnabled = true
        }
        else {
            buttonPasswd.isEnabled = false
        }
         
    }
    
    
    func alerta(){
        let alerta = UIAlertController (title: "Alerta", message: "Máximo", preferredStyle: UIAlertController.Style.alert)
        let janela1 = UIAlertAction (title: "99 senhas", style: UIAlertAction.Style.default, handler: nil)
        let janela2 = UIAlertAction (title: "16 caracteres", style: UIAlertAction.Style.default, handler: nil)
        let botaoOk = UIAlertAction (title: "OK", style: UIAlertAction.Style.default, handler: nil)
        if Int(tfTotalPasswords.text!) ?? 1 > 99 {
            alerta.addAction(janela1)
            alerta.addAction(botaoOk)
            }
        if Int(tfNumberOfCharacters.text!) ?? 1 > 16 {
            alerta.addAction(janela2)
            alerta.addAction(botaoOk)
            }
        self.present(alerta, animated: true, completion: nil)
        }
    
    
}

