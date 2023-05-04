//
//  KisiDetayRouter.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation

class kisiDetayRouter:PresenterToRouterKisiDetayProtocol{
    static func creatModule(ref: KisiDetayVC) {
        ref.kisiDetayPresenterNesnesi = KisiDetayPresenter()
        ref.kisiDetayPresenterNesnesi?.kisiDetayInteractor = kisiDetayInteractor()
    }
    
}
