//
//  FavouriteViewController.swift
//  InfoBus
//
//  Created by roker on 4/16/18.
//  Copyright © 2018 roker. All rights reserved.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var favouriteView: UITableView!
    var dataModel = ["Ruta 1", "Ruta 2", "Ruta 3", "Ruta 4", "Ruta 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButton.layer.cornerRadius = editButton.frame.height / 2.0
        
        favouriteView.layer.cornerRadius = 25
        favouriteView.delegate = self
        favouriteView.dataSource = self
        favouriteView.showsVerticalScrollIndicator = false
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editPressed(_ sender: UIButton) {
        favouriteView.isEditing = !favouriteView.isEditing
        let title = (favouriteView.isEditing) ? "Hecho" : "Editar"
        editButton.setTitle(title, for: .normal)
    }
    
}

extension FavouriteViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = dataModel[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = dataModel[sourceIndexPath.row]
        dataModel.remove(at: sourceIndexPath.row)
        dataModel.insert(temp, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            dataModel.remove(at: indexPath.row)
            favouriteView.deleteRows(at: [indexPath], with: .left)
        }
    }
}
