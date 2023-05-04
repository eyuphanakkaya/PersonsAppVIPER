//
//  KisiKayitPresenter.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation

class kisiKayitPresenter:ViewToPresenterKisiKayitProtocol {
    var kisiKayitInteractor: PresenterToInteractorKisiKayitProtocol?
    func ekle(kisi_ad: String, kisi_tel: String) {
        kisiKayitInteractor?.kisiEkle(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
