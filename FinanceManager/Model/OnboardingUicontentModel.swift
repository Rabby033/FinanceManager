//
//  onboardingUicontentModel.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 21/12/24.
//

import Foundation
import UIKit

class OnboardingUicontentModel {
    
    var image : UIImage?
    var title : String?
    var description: String?
    
    init(imageName: String?=nil , title: String?=nil , description: String?=nil){
        self.image = UIImage(named: imageName ?? "")
        self.title = title
        self.description = description
    }
}
