//
//  KisiKayitRouter.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation

class kisiKayitRouter:PresenterToRouterKisiKayitProtocol {
    static func createModule(ref: KisiKayitVC) {
        ref.kisiKayitPresenterNesnesi = kisiKayitPresenter()
        ref.kisiKayitPresenterNesnesi?.kisiKayitInteractor = kisiKayitInteractor()
    }
    
    
}
