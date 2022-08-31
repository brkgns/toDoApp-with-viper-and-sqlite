//
//  IsDetayVC.swift
//  toDoApp
//
//  Created by Berkay Güneş on 29.08.2022.
//

import UIKit

class IsDetayVC: UIViewController {
    @IBOutlet weak var tfIsAd: UITextField!
    
    var isler:Isler?
    
    var isDetayPresenterNesnesi:ViewToPresenterIsDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IsDetayRouter.createModule(ref: self)
                
        if let i = isler {
            tfIsAd.text = i.is_ad
        }

    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ia = tfIsAd.text , let i = isler {
            isDetayPresenterNesnesi?.guncelle(is_id: i.is_id!, is_ad: ia)
        }
    }
    
    
    
    
    
}
