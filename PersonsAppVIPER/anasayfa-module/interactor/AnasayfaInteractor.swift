//
//  AnasayfaInteractor.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation
import Firebase
class AnasayfaInteractor:PresenterToInteractorAnasayfaProtocol{
    var refKisiler = Database.database().reference().child("kisiler")
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisilerAl() {
        refKisiler.observe(.value, with: { snapshot in
            var kisiList = [Kisiler]()
            
            if let gelenVeriButunu = snapshot.value  as? [String:AnyObject]{
                for gelenSatirVerisi in gelenVeriButunu {
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        let key = gelenSatirVerisi.key
                        let ad = sozluk["kisi_ad"]
                        let tel = sozluk["kisi_tel"]
                        
                        let kisi = Kisiler(kisi_id: key, kisi_ad: ad as? String ?? "", kisi_tel: tel as? String ?? "")
                        kisiList.append(kisi)
                        self.anasayfaPresenter?.presenteraVeriGonder(kisiList: kisiList)

                    }
                }
            }
            
        })
        
    }
    
    func kisiSil(kisi_id: String) {
        refKisiler.child(kisi_id).removeValue()
    }
    
    func kisiAra(aramaKelimesi: String) {
        
        refKisiler.observe(.value, with: { snapshot in
            var kisiList = [Kisiler]()
            
            if let gelenVeriButunu = snapshot.value  as? [String:AnyObject]{
                for gelenSatirVerisi in gelenVeriButunu {
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_tel = sozluk["kisi_tel"]  as? String ?? ""
                        
                        if  kisi_ad.lowercased().contains(aramaKelimesi.lowercased()){
                            let kisi = Kisiler(kisi_id: key, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                            kisiList.append(kisi)
                        }
                       
                        self.anasayfaPresenter?.presenteraVeriGonder(kisiList: kisiList)

                    }
                }
            }
            
        })    }
    
    
}
