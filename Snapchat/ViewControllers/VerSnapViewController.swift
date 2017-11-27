//
//  VerSnapViewController.swift
//  Snapchat
//
//  Created by JShanks on 11/26/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class VerSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text? = snap.descrip
        imageView.sd_setImage(with: URL(string: snap.imagenURL))

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Database.database().reference().child("usuarios").child(Auth.auth().currentUser!.uid).child("snaps").child(snap.id).removeValue()
        
        Storage.storage().reference().child("imagenes").child("\(snap.imagenID).jpg").delete{(error) in print("Se elimino la imagen correctamente")
            
        }
    }

}
