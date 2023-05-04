//
//  KisiDetayPresenter.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation
import Firebase

class KisiDetayPresenter:ViewToPresenterKisiDetayProtocol{
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol?
    var refKisiler = Database.database().reference().child("kisiler")
    
    func guncelle(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        kisiDetayInteractor?.kisiGuncelle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
    
}
