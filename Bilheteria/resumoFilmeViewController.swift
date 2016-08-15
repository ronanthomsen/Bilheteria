//
//  resumoFilmeViewController.swift
//  Bilheteria
//
//  Created by Ronan on 8/13/16.
//  Copyright © 2016 Ronan. All rights reserved.
//

import UIKit

class resumoFilmeViewController: UIViewController {

        
    @IBOutlet weak var _usuario: UILabel!
    @IBOutlet weak var _telefone: UILabel!
    @IBOutlet weak var _titulo: UILabel!
    @IBOutlet weak var _data: UILabel!
    @IBOutlet weak var horario: UILabel!
    @IBOutlet weak var _valor: UILabel!
    @IBOutlet weak var _imgFilme: UIImageView!
    
    var txtUsuario: String?
    var txtTelefone: String?
    var txtTitulo: String?
    var txtData: String?
    var txtHorario: String?
    var txtValor: String?
    var imgFilmeResumo: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _usuario.text = txtUsuario
        _telefone.text = txtTelefone
        _titulo.text = txtTitulo
        _data.text = txtData
        horario.text = txtHorario
        _valor.text = txtValor
        _imgFilme.image = imgFilmeResumo
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
