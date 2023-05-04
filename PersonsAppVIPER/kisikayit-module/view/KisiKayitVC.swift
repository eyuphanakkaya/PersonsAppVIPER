//
//  KisiKayitVC.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import UIKit

class KisiKayitVC: UIViewController {

    @IBOutlet weak var adTextField: UITextField!
    @IBOutlet weak var telefonTextField: UITextField!
    var kisiKayitPresenterNesnesi:kisiKayitPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        kisiKayitRouter.createModule(ref: self)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func kaydetTiklandi(_ sender: Any) {
        if let kAd = adTextField.text ,let kTel = telefonTextField.text {
            kisiKayitPresenterNesnesi?.ekle(kisi_ad: kAd, kisi_tel: kTel)
        }
        
    }
    
 
    

}

