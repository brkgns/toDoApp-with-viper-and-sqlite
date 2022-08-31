//
//  IsDetayInteractor.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation
class IsDetayInteractor:PresenterToInteractorIsDetayProtocol {
    let db:FMDatabase? // Sqlite'i ekledikten sonra eklendi!!!!
    
    init(){   // Sqlite'i ekledikten sonra eklendi
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehberverileri.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    
    }
    
    
    
    func isGuncelle(is_id:Int,is_ad: String) {
        db?.open()    //sqlite eklendikten sonra eklenildi!!!!
        
        do{
            try db!.executeUpdate("UPDATE isler SET is_ad = ? WHERE is_id = ?", values: [is_ad,is_id])
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()

    }
}
