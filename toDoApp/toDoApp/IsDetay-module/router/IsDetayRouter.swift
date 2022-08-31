//
//  IsDetayRouter.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation
class IsDetayRouter:PresenterToRouterIsDetayProtocol {
    
    static func createModule(ref: IsDetayVC) {
        ref.isDetayPresenterNesnesi = IsDetayPresenter()
        ref.isDetayPresenterNesnesi?.isDetayInteractor = IsDetayInteractor()

    }
}
