//
//  FavouriteScreenViewController.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import UIKit
import CoreData

class FavouriteScreenViewController: UIViewController,FavouriteScreenViewProtocol {

    var presenter : FavouriteScreenPresenterProtocol?
    
    var iddata = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("favouritescreen")
       
        
        let noteFetch: NSFetchRequest<Firstresponse> = Firstresponse.fetchRequest()
        let sortByDate = NSSortDescriptor(key: #keyPath(Firstresponse.name), ascending: false)
        
        noteFetch.sortDescriptors = [sortByDate]
     
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            
            let result = try? context.fetch(noteFetch)
            
            let newNote1 = Firstresponse(context: context)
            
            for data in result as! [NSManagedObject] {
            
             let data1 = data.value(forKey: #keyPath(Firstresponse.name))
        
               
                
                if iddata.count < 4 {
                    iddata.append(data1)
                }
                
              print(iddata)
                
              
                    AppDelegate.sharedAppDelegate.coreDataStack.managedContext.delete(data)
            
          
        }
           
    
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
