//
//  ViewController.swift
//  PeekAndPop
//
//  Created by Anup Gupta on 11/06/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var companyCollectionViewList: UICollectionView!
    
    var companylogoArray : [UIImage] = [] ;
    var sourceCell: UICollectionViewCell?
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       companylogoArray = [#imageLiteral(resourceName: "Apple"),#imageLiteral(resourceName: "Google"),#imageLiteral(resourceName: "Github"),#imageLiteral(resourceName: "StackOverFlow"),#imageLiteral(resourceName: "Facebook"),#imageLiteral(resourceName: "GeekGuns"),#imageLiteral(resourceName: "Apple"),#imageLiteral(resourceName: "Google"),#imageLiteral(resourceName: "Github"),#imageLiteral(resourceName: "StackOverFlow"),#imageLiteral(resourceName: "Facebook"),#imageLiteral(resourceName: "GeekGuns"),#imageLiteral(resourceName: "Apple"),#imageLiteral(resourceName: "Google"),#imageLiteral(resourceName: "Github"),#imageLiteral(resourceName: "StackOverFlow"),#imageLiteral(resourceName: "Facebook"),#imageLiteral(resourceName: "GeekGuns")]
         self.navigationController?.delegate = self
        collectionView = companyCollectionViewList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return companylogoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "companyCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CompanyCollectionViewCell
        
       cell.companyLogo.image = companylogoArray[indexPath.row]
      
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CompanyDetailsVC
        let cell = sender as! CompanyCollectionViewCell
        // This next line is very importat for the proper functioning of the animation:
        // the sourceCell property tells the animator which is the cell involved in the transition
        sourceCell = cell
        vc.picture = cell.companyLogo.image
    }
    

}

//MARK: UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let screenRect = UIScreen.main.bounds
//        let screenWidth = screenRect.size.width
//        let cellW = (screenWidth - 2)/3
//        let cellH = cellW
//        
//        return CGSize(width: cellW, height: cellH)
//    }
}

//MARK: UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // In this method belonging to the protocol UINavigationControllerDelegate you must
        // return an animator conforming to the protocol UIViewControllerAnimatedTransitioning.
        // To perform the Pop in and Out animation PopInAndOutAnimator should be returned
        return PopInAndOutAnimator(operation: operation)
    }
}

//MARK: CollectionPushAndPoppable
extension ViewController: CollectionPushAndPoppable {}



