//
//  IsDetayProtocol.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation

protocol ViewToPresenterIsDetayProtocol {
    var isDetayInteractor:PresenterToInteractorIsDetayProtocol? {get set}
    func guncelle(is_id:Int,is_ad:String)
}

protocol PresenterToInteractorIsDetayProtocol {
    func isGuncelle(is_id:Int,is_ad:String)
}

protocol PresenterToRouterIsDetayProtocol {
    static func createModule(ref:IsDetayVC)
}
