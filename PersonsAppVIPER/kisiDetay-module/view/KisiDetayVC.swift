//
//  DetayVC.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import UIKit

class KisiDetayVC: UIViewController {

    @IBOutlet weak var telefonTextField: UITextField!
    @IBOutlet weak var adTextField: UITextField!
    var kisi:Kisiler?
    var kisiDetayPresenterNesnesi:ViewToPresenterKisiDetayProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        kisiDetayRouter.creatModule(ref: self)
        
        if let k = kisi {
            adTextField.text = k.kisi_ad
            telefonTextField.text = k.kisi_tel
        }

        // Do any additional setup after loading the view.
    }
    

    @IBAction func guncelleTiklandi(_ sender: Any) {
        if let kAd = adTextField.text , let kTel = telefonTextField.text,let k = kisi {
            kisiDetayPresenterNesnesi?.guncelle(kisi_id: k.kisi_id!, kisi_ad: kAd, kisi_tel: kTel)
        }
        
    }

    

}
