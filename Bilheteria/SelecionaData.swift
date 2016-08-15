//
//  SelecionaData.swift
//  Bilheteria
//
//  Created by Ronan on 8/12/16.
//  Copyright © 2016 Ronan. All rights reserved.
//

import UIKit

class SelecionaData: UIViewController {

    var _usuario: String?
    var _telefone: String?
    var _dataFilme: String?
    
    @IBOutlet weak var selecionaData: UIDatePicker!

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "passaParaLista"{
            let loginOk = segue.destinationViewController as! ListaFilmeTableViewController
            loginOk._usuario = self._usuario
            loginOk._telefone = self._telefone
            loginOk._dataFilme = self._dataFilme
        }
        
    }
    
    
    func showMessage(title: String, message: String){
        
        let dialog = UIAlertController(title: title,message: message,preferredStyle: UIAlertControllerStyle.Alert)
        
        dialog.addAction(UIAlertAction(title:"Ok", style: .Default, handler: nil))
        
        presentViewController(dialog, animated: true, completion: nil)
    }
    
    
    @IBAction func pesquisaFilme(sender: AnyObject) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        _dataFilme = dateFormatter.stringFromDate(selecionaData.date)
        
        self.performSegueWithIdentifier("passaParaLista", sender: self)
        
    }
    

   
}
