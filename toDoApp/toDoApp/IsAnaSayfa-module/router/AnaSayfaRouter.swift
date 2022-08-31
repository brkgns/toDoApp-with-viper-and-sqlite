//
//  AnaSayfaRouter.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation
class AnaSayfaRouter:PresenterToRouterAnaSayfaProtocol {
    static func createModule(ref: AnaSayfaVC) {
        let presenter = AnaSayfaPresenter()
        
        //view katmanı!!!
        ref.anaSayfaPresenterNesnesi = presenter
        
        //Presenter katmanı!!!
        
        ref.anaSayfaPresenterNesnesi?.AnaSayfaInteractor = AnaSayfaInteractor()
        ref.anaSayfaPresenterNesnesi?.AnaSayfaView = ref
        
        //Interactor katmanı!!!
        ref.anaSayfaPresenterNesnesi?.AnaSayfaInteractor?.AnaSayfaPresenter = presenter
    }
}
