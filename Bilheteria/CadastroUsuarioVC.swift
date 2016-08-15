//
//  CadastroUsuarioVC.swift
//  Bilheteria
//
//  Created by Ronan on 8/12/16.
//  Copyright © 2016 Ronan. All rights reserved.
//

import UIKit

class CadastroUsuarioVC: UIViewController {

    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showMessage(title: String, message: String){
        
        let dialog = UIAlertController(title: title,message: message,preferredStyle: UIAlertControllerStyle.Alert)
        
        dialog.addAction(UIAlertAction(title:"Ok", style: .Default, handler: nil))
        
        presentViewController(dialog, animated: true, completion: nil)
    }
    
    
//self.performSegueWithIdentifier("usuarioCadastrado", sender: self)
    @IBAction func cadastrarUsuario(sender: AnyObject) {
        
        let file = "file.txt" //this is the file. we will write to and read from it
        var usuario: String? = txtUsuario.text
        var senha: String? = txtSenha.text
        var telefone: String? = txtTelefone.text
        
        
        
        if txtUsuario.hasText() && txtSenha.hasText() && txtTelefone.hasText() {
            
            let text = "\(usuario!) \(senha!) \(telefone!)" //just a text
            
            if let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
                let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
                
                //writing
                do {
                    try text.writeToURL(path, atomically: false, encoding: NSUTF8StringEncoding)
                }
                catch {showMessage("Cadastro de Usuário", message: "ERRO")}
                self.performSegueWithIdentifier("usuarioCadastrado", sender: self)
                //reading
//                do {
//                    let text2 = try NSString(contentsOfURL: path, encoding: NSUTF8StringEncoding)
//                    
//                    showMessage("Cadastro de Usuário", message: "\(text2)")
//                }
//                catch {showMessage("Cadastro de Usuário", message: "ERRO")}
            }
            
        }else{
            showMessage("Cadastro de Usuário", message: "Preencha todos os campos")
        }
        
 
        
     
        
    }
    
    
    
    

}
