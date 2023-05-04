//
//  ViewController.swift
//  PersonsAppVIPER
//
//  Created by Eyüphan Akkaya on 3.05.2023.
//

import UIKit
import Firebase

class AnasayfaVC: UIViewController {

    var ref:DatabaseReference?
    var kisiList = [Kisiler]()
    @IBOutlet weak var kisiTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        AnasayfaRouter.createModule(ref: self)
        
        searchBar.delegate = self
        kisiTableView.delegate = self
        kisiTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.kisilerAl()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let toDestination = segue.destination as? KisiDetayVC
        toDestination?.kisi = kisiList[indeks!]
    }


}
extension AnasayfaVC:PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(kisiList: Array<Kisiler>) {
        self.kisiList = kisiList
        DispatchQueue.main.async {
            self.kisiTableView.reloadData()
        }
        
    }
    
    
}

extension AnasayfaVC:UITableViewDelegate,UITableViewDataSource {
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisiList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let value = kisiList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre", for: indexPath) as! TableViewCell
        cell.adLabel.text = "\(value.kisi_ad!)  \(value.kisi_tel!)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetay", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let liste = self.kisiList[indexPath.row]
        let secilenSil = UIContextualAction(style: .destructive, title: "Sil") { contextTual, view, boolValue in
           // print("Silindi:\(self.kisiList[indexPath.row].kisi_ad)")
            let alert = UIAlertController(title: "Silme İşlemi", message: "İşlem Gerçekleşsin Mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "Hayır", style: .default)
            let evetAction = UIAlertAction(title: "Evet", style: .default){action in
                self.anasayfaPresenterNesnesi?.sil(kisi_id: liste.kisi_id! )
            }
            alert.addAction(iptalAction)
            alert.addAction(evetAction)
            self.present(alert,animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [secilenSil])
        
    }
    
}

extension AnasayfaVC:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            anasayfaPresenterNesnesi?.kisilerAl()

        }else {
            anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)

        }
    }
}


