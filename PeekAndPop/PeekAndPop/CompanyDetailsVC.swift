//
//  CompanyDetailsVC.swift
//  PeekAndPop
//
//  Created by Anup Gupta on 11/06/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import UIKit

class CompanyDetailsVC: UIViewController {

    @IBOutlet weak var companyLogoImage: UIImageView!
     var picture: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

       companyLogoImage.image = picture
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
