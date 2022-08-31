//
//  AnaSayfaInteractor.swift
//  toDoApp
//
//  Created by Berkay Güneş on 30.08.2022.
//

import Foundation
class AnaSayfaInteractor:PresenterToInteractorAnaSayfaProtocol {
    var AnaSayfaPresenter: InteractorToPresenterAnaSayfaProtocol?
    
    let db:FMDatabase? // Sqlite'i ekledikten sonra eklendi!!!!
    
    init(){   // Sqlite'i ekledikten sonra eklendi
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehberverileri.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func tumIsleriAl() {
        var liste = [Isler]()
        
        db?.open()    //sqlite eklendikten sonra eklenildi!!!!
        
        do{
            let q = try db!.executeQuery("SELECT * FROM isler", values: nil)
            
            while q.next() {
                let isler = Isler(is_id: Int(q.string(forColumn: "is_id"))!, is_ad: (q.string(forColumn: "is_ad"))!)
                
                liste.append(isler)
            }
            AnaSayfaPresenter?.presenteraVeriGönder(islerListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
    }
    func isAra(aramaKelimesi: String) { //sqlite eklendikten sonra eklenildi!!!!
        
        var liste = [Isler]()
        
        db?.open()
        
        do{
            let q = try db!.executeQuery("SELECT * FROM isler WHERE is_ad like '%\(aramaKelimesi)%'", values: nil)
            
            while q.next() {
                let isler = Isler(is_id: Int(q.string(forColumn: "is_id"))!, is_ad: (q.string(forColumn: "is_ad"))!)
                
                liste.append(isler)
            }
            AnaSayfaPresenter?.presenteraVeriGönder(islerListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    func isSil(is_id:Int) {     //sqlite eklendikten sonra eklenildi!!!!

        
        db?.open()    //sqlite eklendikten sonra eklenildi!!!!
        
        do{
            try db!.executeUpdate("DELETE FROM isler WHERE is_id = ?", values: [is_id])
            tumIsleriAl()
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
