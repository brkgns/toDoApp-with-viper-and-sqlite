//
//  IsKayitPresenter.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation
class IsKayitPresenter:ViewToPresenterIsKayitProtocol {
    
    var isKayitInteractor: PresenterToInteractorIsKayitProtocol?
    
    func kayit(is_ad: String) {
        isKayitInteractor?.isKayit(is_ad: is_ad)
    }
}
