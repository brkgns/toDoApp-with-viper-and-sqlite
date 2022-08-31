//
//  IsKayitRouter.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation
class IsKayitRouter:PresenterToRouterIsKayitProtocol {
    
    static func createModule(ref: IsKayitVC) {
        ref.isKayitPresenterNesnesi = IsKayitPresenter()
        ref.isKayitPresenterNesnesi?.isKayitInteractor = IsKayitInteractor()
    }
}
