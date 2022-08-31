//
//  AnaSayfaPresenter.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation
class AnaSayfaPresenter:ViewToPresenterAnaSayfaProtocol {
    
    var AnaSayfaInteractor: PresenterToInteractorAnaSayfaProtocol?
    var AnaSayfaView: PresenterToViewAnaSayfaProtocol?
    
    func isleriYükle() {
        AnaSayfaInteractor?.tumIsleriAl()
    }
    func ara(aramaKelimesi: String) {
        AnaSayfaInteractor?.isAra(aramaKelimesi: aramaKelimesi)
    }
    func sil(is_id: Int) {
        AnaSayfaInteractor?.isSil(is_id: is_id)
    }
}

extension AnaSayfaPresenter: InteractorToPresenterAnaSayfaProtocol {
    func presenteraVeriGönder(islerListesi: Array<Isler>) {
        AnaSayfaView?.vieweVeriGönder(islerListesi: islerListesi)
    }
}
