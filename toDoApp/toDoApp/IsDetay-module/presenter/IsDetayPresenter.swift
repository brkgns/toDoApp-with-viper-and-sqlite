//
//  IsDetayPresenter.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation
class IsDetayPresenter:ViewToPresenterIsDetayProtocol {
    
    var isDetayInteractor: PresenterToInteractorIsDetayProtocol?
    
    func guncelle(is_id:Int,is_ad: String) {
        isDetayInteractor?.isGuncelle(is_id: is_id , is_ad: is_ad)
    }
}
