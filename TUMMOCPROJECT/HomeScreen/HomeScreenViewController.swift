//
//  HomeScreenViewController.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation
import UIKit
import CoreData
import SDWebImage

protocol HomeScreenViewProtocol: class {
    
    var presenter: HomeScreenPresenterProtocol? { get set }
    
    func viewHomeScreenSuccess(message: String,HomeScreenSuccess:[String:Any])
    
}

class HomeScreenViewController: UIViewController,HomeScreenViewProtocol,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var foodcollectionview: UICollectionView!
    
    @IBOutlet weak var giftcollectionview: UICollectionView!
    
    @IBOutlet weak var drinkcollectionview: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == foodcollectionview{
          return 4
        }
        else if collectionView == giftcollectionview{
         return 3
        }
       else {
          return 3
        }
     return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == foodcollectionview{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
        
            cell.favouritebtn.tag = indexPath.row
            
            cell.favouritebtn.addTarget(self, action: #selector(favouritebtntapped(_:)), for: .touchUpInside)
            
            let dict =   ["first":data1[0],"second":data1[1],"third":data1[2]]
            
            let data4 = data1[0] as! [String:Any]
            
            let data5 = data1[1] as! [String:Any]
            
            let data6 = data1[2] as! [String:Any]
            
           
            let data7 = data4["items"]
                        
            let data8 = data5["items"]
            
            let data9 = data6["items"]
            
            
            let dict2 =   ["first":data7]
            
            let data10 = dict2["first"] as! [Any]
            
            
            let icondata1 = data10[0] as! [String:Any]
            
            let icondata2 = data10[1] as! [String:Any]
            
            let icondata3 = data10[2] as! [String:Any]
            
            let icondata4 = data10[3] as! [String:Any]
            
            let icondata5 = data10[4] as! [String:Any]
            
           
            
            let iconarray:[String] = [icondata1["icon"] as! String,icondata2["icon"] as! String,icondata3["icon"] as! String,icondata4["icon"] as! String]
            
            let namearray:[String] = [icondata1["name"] as! String,icondata2["name"] as! String,icondata3["name"] as! String,icondata4["name"] as! String]
            
            let pricearray:[String] = [("\(icondata1["price"])") ,("\(icondata2["price"])"),("\(icondata3["price"])"),("\(icondata4["price"])")]
            
            print(iconarray)
            
            if indexPath.row < 4 {
                
                indexPath.row < 4
                
                cell.tabledata = namearray[indexPath.row]
                
                cell.tabledata2 = pricearray[indexPath.row]
                
                cell.tabledata3 = iconarray[indexPath.row]
                
            }
           
            return cell
            
        }
        
        else if collectionView == giftcollectionview {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCollectionViewCell", for: indexPath) as! GiftCollectionViewCell
            
            let dict =   ["first":data1[0],"second":data1[1],"third":data1[2]]
            
            let data4 = data1[0] as! [String:Any]
            
            let data5 = data1[1] as! [String:Any]
            
            let data6 = data1[2] as! [String:Any]
            
           
            let data7 = data4["items"]
                        
            let data8 = data5["items"]
            
            let data9 = data6["items"]
            
            
            let dict2 =   ["first":data8]
            
            let data10 = dict2["first"] as! [Any]
            
            
            let icondata1 = data10[0] as! [String:Any]
            
            let icondata2 = data10[1] as! [String:Any]
            
            let icondata3 = data10[2] as! [String:Any]
            
            let iconarray:[String] = [icondata1["icon"] as! String,icondata2["icon"] as! String,icondata3["icon"] as! String]
            
            let namearray:[String] = [icondata1["name"] as! String,icondata2["name"] as! String,icondata3["name"] as! String]
            
            let pricearray:[String] = [("\(icondata1["price"])") ,("\(icondata2["price"])"),("\(icondata3["price"])")]
            
            print(iconarray)
            
            if indexPath.row < 4 {
                
                indexPath.row < 4
                
                cell.tabledata = namearray[indexPath.row]
                
                cell.tabledata2 = pricearray[indexPath.row]
                
                cell.tabledata3 = iconarray[indexPath.row]
                
            }
           
            return cell
           
        }
        
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrinkCollectionViewCell", for: indexPath) as! DrinkCollectionViewCell
            
            let dict =   ["first":data1[0],"second":data1[1],"third":data1[2]]
            
            let data4 = data1[0] as! [String:Any]
            
            let data5 = data1[1] as! [String:Any]
            
            let data6 = data1[2] as! [String:Any]
            
           
            let data7 = data4["items"]
                        
            let data8 = data5["items"]
            
            let data9 = data6["items"]
            
            
            let dict2 =   ["first":data9]
            
            let data10 = dict2["first"] as! [Any]
            
            
            let icondata1 = data10[0] as! [String:Any]
            
            let icondata2 = data10[1] as! [String:Any]
            
            let icondata3 = data10[2] as! [String:Any]
            
            
            let iconarray:[String] = [icondata1["icon"] as! String,icondata2["icon"] as! String,icondata3["icon"] as! String]
            
            let namearray:[String] = [icondata1["name"] as! String,icondata2["name"] as! String,icondata3["name"] as! String]
            
            let pricearray:[String] = [("\(icondata1["price"])") ,("\(icondata2["price"])"),("\(icondata3["price"])")]
            
            print(iconarray)
            
            if indexPath.row < 4 {
                
                indexPath.row < 4
                
                cell.tabledata = namearray[indexPath.row]
                
                cell.tabledata2 = pricearray[indexPath.row]
                
                cell.tabledata3 = iconarray[indexPath.row]
                
            }
           
            return cell
        }
    }
    
    @objc func favouritebtntapped(_ sender:AnyObject) {
        let tag = sender.tag
        
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let newNote1 = Firstresponse(context: context)
        
        newNote1.setValue("\(tag)", forKey: #keyPath(Firstresponse.name))
        
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
   
    }
   
    
    var presenter: HomeScreenPresenterProtocol?
    
    var HomeScreenResult : Categorydata?
    
    var data1 = [Any]()
    
    var itemdata = [Any]()
    
    var notes = [Firstresponse]()
    
    func viewHomeScreenSuccess(message: String, HomeScreenSuccess: [String:Any])  {
        
        data1 = HomeScreenSuccess["categories"] as! [Any]

    }
  
    @IBAction func favouritebtn(_ sender: Any) {
        presenter?.presentingToFavouriteScreen()
    }
    
    @IBAction func cartbtn(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()  
 
        foodcollectionview.delegate = self
        foodcollectionview.dataSource = self
        giftcollectionview.delegate = self
        giftcollectionview.dataSource = self
        drinkcollectionview.delegate = self
        drinkcollectionview.dataSource = self
        
        print("first screen")
        
        foodcollectionview.register(UINib(nibName: "FoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCollectionViewCell")
        
        giftcollectionview.register(UINib(nibName: "GiftCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GiftCollectionViewCell")
        
        drinkcollectionview.register(UINib(nibName: "DrinkCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DrinkCollectionViewCell")
        
        presenter?.presentingHomeScreenDetails()

        // Do any additional setup after loading the view.
    }

    @IBAction func Buttonaction(_ sender: Any) {
        
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
