//
//  AnasayfaRouter.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation

class AnasayfaRouter:PresenterToRouterAnasayfaProtocol{
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        ref.anasayfaPresenterNesnesi = presenter
        ref.anasayfaPresenterNesnesi?.anasayftaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        ref.anasayfaPresenterNesnesi?.anasayftaInteractor?.anasayfaPresenter = presenter
    }
    
    
}
