//
//  KisiKayitProtocols.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation

protocol ViewToPresenterKisiKayitProtocol{
    var kisiKayitInteractor:PresenterToInteractorKisiKayitProtocol? {get set}
    func ekle(kisi_ad:String,kisi_tel:String)
}
protocol PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisi_ad:String,kisi_tel:String)
    
}
protocol PresenterToRouterKisiKayitProtocol {
    static func createModule(ref:KisiKayitVC)
}

