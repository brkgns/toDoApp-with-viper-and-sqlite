//
//  AnaSayfaProtocol.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation
//AnaProtokoller
protocol ViewToPresenterAnaSayfaProtocol{
    var AnaSayfaInteractor:PresenterToInteractorAnaSayfaProtocol? {get set}
    var AnaSayfaView:PresenterToViewAnaSayfaProtocol? {get set}
    
    func isleriYükle()
    func ara(aramaKelimesi:String)
    func sil(is_id:Int)
}

protocol PresenterToInteractorAnaSayfaProtocol{
    var AnaSayfaPresenter:InteractorToPresenterAnaSayfaProtocol? {get set}
    
    func tumIsleriAl()
    func isAra(aramaKelimesi:String)
    func isSil(is_id:Int)
}
//TaşıyıcıProtokoller
protocol InteractorToPresenterAnaSayfaProtocol{
    func presenteraVeriGönder(islerListesi:Array<Isler>)
}

protocol PresenterToViewAnaSayfaProtocol{
    func vieweVeriGönder(islerListesi:Array<Isler>)
}
// Router
protocol PresenterToRouterAnaSayfaProtocol{
    static func createModule(ref:AnaSayfaVC)
}
