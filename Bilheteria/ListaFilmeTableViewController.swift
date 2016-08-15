//
//  ListaFilmeTableViewController.swift
//  Bilheteria
//
//  Created by Ronan on 8/13/16.
//  Copyright © 2016 Ronan. All rights reserved.
//

import UIKit


struct filme{
    
    var tituloFilme: String?
    var horaFilme: String?
    var valorFilme: String?
    var imgFilme = UIImage?()

    
    init(tituloFilme: String, horaFilme: String, valorFilme: String, imgFilme: UIImage){
        self.tituloFilme = tituloFilme
        self.horaFilme = horaFilme
        self.valorFilme = valorFilme
        self.imgFilme = imgFilme
    }
    
}


class ListaFilmeTableViewController: UITableViewController {

    var _dataFilme:String?
    var _usuario:String?
    var _telefone:String?
    var listaFilmes: [filme]?
    var lastSelectIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        listaFilmes = criaListaFilme()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listaFilmes!.count
    }
    
    
    
    func criaListaFilme() -> [filme] {
    
        var listaFilmes: [filme] = [filme(tituloFilme:"Matrix", horaFilme: "21:30", valorFilme: "R$ 54,90", imgFilme:(UIImage(named: "matrix.jpg")!))]
        
        
        
        for index in 1...10 {
            
            listaFilmes.append(filme(tituloFilme:"Matrix \(index)", horaFilme: "21:\(index)", valorFilme: "R$ 54,\(index)", imgFilme:UIImage(named: "matrix.jpg")!  ))
            
        }
        
        
        return listaFilmes
        
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("templateCelFilme", forIndexPath: indexPath) as! CelulaFilme
        
        cell.dataFilme.text = _dataFilme
        cell.horaFilme.text = listaFilmes![indexPath.item].horaFilme
        cell.nomeFilme.text = listaFilmes![indexPath.item].tituloFilme
        cell.valorFilme.text = listaFilmes![indexPath.item].valorFilme
        cell.imgFilme.image = listaFilmes![indexPath.item].imgFilme
        
        
        return cell
    }
    
    
    //evento para celulas retornadas
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    
        lastSelectIndex = indexPath.item
        
        self.performSegueWithIdentifier("resumoFilme", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "resumoFilme"{
            let resumoOk = segue.destinationViewController as! resumoFilmeViewController
            
            resumoOk.txtUsuario = self._usuario
            resumoOk.txtTelefone = self._telefone
            resumoOk.txtData = _dataFilme
            resumoOk.txtTitulo = listaFilmes![lastSelectIndex].tituloFilme
            resumoOk.txtHorario = listaFilmes![lastSelectIndex].horaFilme
            resumoOk.txtValor = listaFilmes![lastSelectIndex].valorFilme
            resumoOk.imgFilmeResumo  = listaFilmes![lastSelectIndex].imgFilme
        }
        
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
