//
//  KisiDetayInteractor.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation
import Firebase

class kisiDetayInteractor:PresenterToInteractorKisiDetayProtocol{
    var refKisiler = Database.database().reference().child("kisiler")
    func kisiGuncelle(kisi_id:String,kisi_ad: String, kisi_tel: String) {
        let dict:[String:Any] = ["kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        refKisiler.child("kisi_id").updateChildValues(dict)
        
    }
        
}
