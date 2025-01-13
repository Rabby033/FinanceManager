//
//  CollectionViewCell.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 21/12/24.
//

import UIKit

class onboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setView(content : OnboardingUicontentModel?){
        contentImage.image = content?.image
        title.text = content?.title
        descriptionLabel.text = content?.description
    }
}
