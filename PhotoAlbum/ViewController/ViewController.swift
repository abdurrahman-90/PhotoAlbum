//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by Akdag on 18.02.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
  var  pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title  = "Photo Album"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedImage))
        
        
        
        // Load Picture Name
       
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
    
    }
    
   @objc func sharedImage(){
    let message = "Do you want Photo share?"
    
    let vc = UIActivityViewController(activityItems: [message], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true, completion: nil)
        
    }
    
    
  
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = pictures[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        vc.selectedImageName = row
        navigationController?.pushViewController(vc, animated: true)
    
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            pictures.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
     }
    
}

