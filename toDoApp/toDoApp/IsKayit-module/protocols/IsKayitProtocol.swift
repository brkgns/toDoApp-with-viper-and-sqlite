//
//  IsKayitProtocol.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation

protocol ViewToPresenterIsKayitProtocol {
    
    var isKayitInteractor:PresenterToInteractorIsKayitProtocol? {get set}
    func kayit(is_ad:String)

}

protocol PresenterToInteractorIsKayitProtocol {
    func isKayit(is_ad:String)
}

protocol PresenterToRouterIsKayitProtocol {
    static func createModule(ref:IsKayitVC)
}
