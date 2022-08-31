//
//  IsKayitVC.swift
//  toDoApp
//
//  Created by Berkay Güneş on 29.08.2022.
//

import UIKit

class IsKayitVC: UIViewController {
    @IBOutlet weak var tfIsAd: UITextField!
    
    var isKayitPresenterNesnesi:ViewToPresenterIsKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        IsKayitRouter.createModule(ref: self)

      
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ia = tfIsAd.text {
            isKayitPresenterNesnesi?.kayit(is_ad: ia)
        }
    }
    
    

}
