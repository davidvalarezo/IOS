//
//  ItemCreationViewController.swift
//  BookaFilmity
//
//  Created by cmulab on 25/12/2019.
//  Copyright © 2019 UPV. All rights reserved.
//

import UIKit

class ItemCreationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //se puede ocultar los container view hasta dar clic en el segment
        cv_libro.isHidden = true
        cv_film.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    var filmCreatedHandler: ((Film) -> Void)?
    var bookCreatedHandler: ((Book) -> Void)?
    
    @IBAction func typeChanged(_ sender: UISegmentedControl) {
        //hay dos maneras de hacer el cambio de vista
        //la primera es con alpha
        if sender.selectedSegmentIndex == 0 {
            cv_film.alpha = 1
            cv_libro.alpha = 0
            cv_film.isHidden = false
            cv_libro.isHidden = false
        } else {
            cv_film.alpha = 0
            cv_libro.alpha = 1
            cv_film.isHidden = false
            cv_libro.isHidden = false        }
        //la 2da es con segue
        /*
        if (performSegue(withIdentifier: "createfilm", sender: self)){}
        else {performSegue(withIdentifier: "createbook", sender: self)
         }*/
    }
    private var filmVC: FilmCreationViewController!
    private var bookVc: BookCreationViewController!
    
    @IBOutlet weak var cv_libro: UIView!
    
    @IBOutlet weak var cv_film: UIView!
    
    @IBAction func btn_crearitem(_ sender: Any) {
        if let book = bookVc.getData(){
            //invoca el closure
            bookCreatedHandler?(book)
        }
        if let film = filmVC.getData{
            filmCreatedHandler?(film)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
