//
//  ViewController.swift
//  toDoApp
//
//  Created by Berkay Güneş on 29.08.2022.
//

import UIKit

class AnaSayfaVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var islerTableView: UITableView!
    
    var islerListe = [Isler]()
    
    var anaSayfaPresenterNesnesi:ViewToPresenterAnaSayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor(named: "Color3")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance


        navigationController?.navigationBar.tintColor = .black
        
        searchBar.delegate = self
        islerTableView.delegate = self
        islerTableView.dataSource = self
        
        veritabaniKopyalama()//sqlite'i ekledikten sonra eklendi!!!
        
        AnaSayfaRouter.createModule(ref: self)  // en son bu eklendi Viper Mimarisi oluştururken
    }
    override func viewWillAppear(_ animated: Bool) {
        anaSayfaPresenterNesnesi?.isleriYükle() //AnaSayfaya dönüldüğünde veriler yüklenmiş olur.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let isler = sender as? Isler{
                let gidilecekVC = segue.destination as? IsDetayVC
                gidilecekVC?.isler = isler
            }
        }
    }
    //Sqlite'i ekledikten sonra eklendi!!!
    func veritabaniKopyalama() {
        let bundleYolu = Bundle.main.path(forResource: "rehberverileri", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehberverileri.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
extension AnaSayfaVC:PresenterToViewAnaSayfaProtocol { //Sonradan ekledim !!!
    func vieweVeriGönder(islerListesi: Array<Isler>) {
        self.islerListe = islerListesi
        self.islerTableView.reloadData()
    }
}


extension AnaSayfaVC:UISearchBarDelegate {     //Sonradan ekledim!!!
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchBar.searchTextField.textColor = .black
        searchBar.tintColor = .black
        
        anaSayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
        
    }
}

extension AnaSayfaVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return islerListe.count
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let isler = islerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "islerHucre", for: indexPath) as! TableViewHucre
        hucre.isBilgiLabel.text = "\(isler.is_ad!)"
            
            hucre.selectionStyle = .none

    
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.backgroundColor = nil
        
        let isler = islerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: isler)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {
            (UIContextualAction,view,bool) in
            
            let isler = self.islerListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(isler.is_ad!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action
                in
                
                self.anaSayfaPresenterNesnesi?.sil(is_id: isler.is_id!) //sonradan ekledim öncekini silip!!!
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated:true)
        }
        return UISwipeActionsConfiguration(actions: [silAction] )

    }
}
