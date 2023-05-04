//
//  KisiKayitInteractor.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation
import Firebase

class kisiKayitInteractor:PresenterToInteractorKisiKayitProtocol{
    var refKisiler = Database.database().reference().child("kisiler")
    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        
        let dict:[String:Any] = ["kisi_id":"" ,"kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        refKisiler.childByAutoId().setValue(dict)
        
        
        
    }
}
