//
//  CustomCountPillView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 13/1/25.
//

import UIKit

@IBDesignable class CustomCountPillView: UIView {
    
    enum PillType {
        case income
        case expense
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var pillImageView: UIImageView!
    
    var pillType:PillType = .income
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView(){
        let xibView = Bundle.main.loadNibNamed("CustomCountPillView", owner: self, options: nil)?[0] as! UIView
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
        customizePillView()
    }
    
    
    func customizePillView(){
        
        
        switch self.pillType {
            
            case .income:
                self.titleLabel.text = "Income"
                self.containerView.backgroundColor = UIColor.RoyColor.customGreen
                let templateImage = UIImage(named: "income")?.withRenderingMode(.alwaysTemplate)
                self.pillImageView.image = templateImage
                self.pillImageView.tintColor = UIColor.RoyColor.customGreen
            
            case .expense:
                self.titleLabel.text = "Expense"
                self.containerView.backgroundColor = UIColor.RoyColor.customRed
                let templateImage = UIImage(named: "expense")?.withRenderingMode(.alwaysTemplate)
                self.pillImageView.image = templateImage
                self.pillImageView.tintColor = UIColor.RoyColor.customRed
        }
    }
    
    
}
