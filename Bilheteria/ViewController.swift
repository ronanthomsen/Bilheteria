//
//  ViewController.swift
//  Bilheteria
//
//  Created by Ronan on 8/12/16.
//  Copyright © 2016 Ronan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    var usuario: String?
    var telefone: String?

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
          if segue.identifier == "loginOK"{
            let loginOk = segue.destinationViewController as! SelecionaData
            loginOk._usuario = usuario
            loginOk._telefone = telefone
        }
        
    }

    


    func showMessage(title: String, message: String){
        
        let dialog = UIAlertController(title: title,message: message,preferredStyle: UIAlertControllerStyle.Alert)
        
        dialog.addAction(UIAlertAction(title:"Ok", style: .Default, handler: nil))
        
        presentViewController(dialog, animated: true, completion: nil)
    }
    
    
    @IBAction func validaLogin(sender: AnyObject) {
        usuario = txtUsuario.text
        var senha = txtSenha.text
        var _usuario: String
        var _senha: String
        var _telefone: String
        let textFromFile: String?
        var txtVet = [String]()
        
        if txtUsuario.hasText() && txtSenha.hasText() {
            
            
            let file = "file.txt"
            if let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
               let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
               //reading
               do {
               textFromFile = try String(contentsOfURL: path, encoding: NSUTF8StringEncoding)
               txtVet = textFromFile!.componentsSeparatedByString(" ")
               _usuario = txtVet[0]
               _senha = txtVet[1]
               _telefone = txtVet[2]
                telefone = _telefone
                
                if usuario == _usuario {
                    self.performSegueWithIdentifier("loginOK", sender: self)
                } else{
                    showMessage("Login", message: "Login ou senha incorretos")
                }
                
                
               } catch {showMessage("Usuario Cadastrado", message: "ERRO")}
            }
            
            
            
            
        }else{
            showMessage("Login", message: "Preencha todos os campos")
        }
        
    }

//botao teste
//    @IBAction func leituraUsuarioESenha(sender: AnyObject) {
//        
//        let nome: String
//        let senha: String
//        let telefone: String
//        let textFromFile: String?
//        var txtVet = [String]()
//        
//        let file = "file.txt"
//        if let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
//            let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
//            //reading
//            do {
//                 textFromFile = try String(contentsOfURL: path, encoding: NSUTF8StringEncoding)
//                txtVet = textFromFile!.componentsSeparatedByString(" ")
//                nome = txtVet[0]
//                senha = txtVet[1]
//                telefone = txtVet[2]
//                
//                showMessage("Usuario Cadastrado", message: "\(nome), \(senha), \(telefone)")
//                
//            }
//            catch {showMessage("Usuario Cadastrado", message: "ERRO")}
//        }
//        
//        
//        
//        
//        
//    }

    
}

