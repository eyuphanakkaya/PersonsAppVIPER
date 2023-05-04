//
//  AnasayfaProtocols.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol{
    var anasayftaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}//presenterdan interactor u tetiklicem
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}//presenterdan kolayca veri gönderebilmek için
    func kisilerAl()
    func sil(kisi_id:String)
    func ara(aramaKelimesi:String )
}
protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}//interactordan kolayca veri gönderebilmek için
    func tumKisilerAl()
    func kisiSil(kisi_id:String)
    func kisiAra(aramaKelimesi:String)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(kisiList:Array<Kisiler>)
}
protocol PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(kisiList:Array<Kisiler>)
}
protocol PresenterToRouterAnasayfaProtocol{
    static func createModule(ref:AnasayfaVC)
}
