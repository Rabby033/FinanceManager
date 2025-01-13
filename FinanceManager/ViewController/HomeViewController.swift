//
//  HomeViewController.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 21/12/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var incomePillView: CustomCountPillView!
    @IBOutlet weak var expensePillView: CustomCountPillView!
    
    @IBOutlet weak var topView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()

    }
    
    override func viewDidAppear(_ animated: Bool) {
       addGradientBackground()
    }
    
    func initViews(){
        setupPillView()
        addGradientBackground()
    }
    


}

// MARK: All View initialization should be here.
extension HomeViewController {
    
    func setupPillView(){
        incomePillView.pillType = .income
        incomePillView.customizePillView()
        
        expensePillView.pillType = .expense
        expensePillView.customizePillView()
        
    }
    
    func addGradientBackground(){
        
        let lightCreamColor = #colorLiteral(red: 1.0, green: 0.9647058824, blue: 0.8980392157, alpha: 1.0)
        let lightCreamColorTransparent = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = topView.bounds
        gradientLayer.colors = [lightCreamColor.cgColor,lightCreamColorTransparent.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)  // Start at the top center
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        topView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
