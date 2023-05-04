//
//  AnasayfaPresenter.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation

class AnasayfaPresenter:ViewToPresenterAnasayfaProtocol{
    var anasayftaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func kisilerAl() {
        anasayftaInteractor?.tumKisilerAl()
    }
    
    func sil(kisi_id: String) {
        anasayftaInteractor?.kisiSil(kisi_id: kisi_id)
    }
    
    func ara(aramaKelimesi: String) {
        anasayftaInteractor?.kisiAra(aramaKelimesi: aramaKelimesi)
    }
    
    
}
extension AnasayfaPresenter:InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(kisiList: Array<Kisiler>) {
        anasayfaView?.vieweVeriGonder(kisiList: kisiList)
    }
    
    
}
