//
//  IsKayitInteractor.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation
class IsKayitInteractor:PresenterToInteractorIsKayitProtocol {
    let db:FMDatabase? // Sqlite'i ekledikten sonra eklendi!!!!
    
    init(){   // Sqlite'i ekledikten sonra eklendi
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehberverileri.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    
    }
    
    func isKayit(is_ad: String) {
        db?.open()    //sqlite eklendikten sonra eklenildi!!!!
        
        do{
            try db!.executeUpdate("INSERT INTO isler (is_ad) VALUES(?)", values: [is_ad])
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
    }
}
