//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by FUKO SUZUKI on 2019/04/21.
//  Copyright © 2019 FUKO.SUZUKI. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultimage: UIImageView!
    var enlargeimage: UIImage!
    @IBOutlet weak var returnsegue: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultimage.image = enlargeimage

        // Do any additional setup after loading the view.
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
