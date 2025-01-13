//
//  TabbarViewController.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 21/12/24.
//

import UIKit

class TabbarViewController: UIViewController {
    
    
    @IBOutlet weak var viewforTab: UIView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var homeTab: TabItem!
    @IBOutlet weak var transactionTab: TabItem!
    @IBOutlet weak var addTransactionTab: TabItem!
    @IBOutlet weak var budgetTransactionItem: TabItem!
    @IBOutlet weak var profileTab: TabItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        // Do any additional setup after loading the view.
    }
    
    func initViews(){
        loadHome()
        addTabItem()
        setupSecondaryButtons()
        
    }
    
    
    
    let button1 = UIButton(type: .system)
    let button2 = UIButton(type: .system)
    let button3 = UIButton(type: .system)
    
    // Flag to track button visibility
    var areButtonsVisible = false
    
    
    func setupSecondaryButtons() {
        // Initialize the buttons and their properties
        let buttons = [button1, button2, button3]
        let colors: [UIColor] = [.systemBlue, .systemGreen, .systemRed]
        let images = [UIImage(named: "income"), UIImage(named: "expense"), UIImage(named: "transaction_fill")] // Replace with your image names
        let actions: [Selector] = [#selector(incomeTapped), #selector(expenseTapped), #selector(transferTapped)]
        
        // Convert `addTransactionTab`'s center to the main view's coordinate space
        let tabButtonCenterInParent = addTransactionTab.superview?.convert(addTransactionTab.center, to: self.view) ?? .zero

        for (index, button) in buttons.enumerated() {
            button.setImage(images[index], for: .normal)
            button.imageView?.contentMode = .scaleAspectFit // Ensure image fits nicely
            button.backgroundColor = colors[index] // Optional: Add a background color
            button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            button.tintColor = .white // Apply tint to match the style if images are templates
            button.layer.cornerRadius = 25
            button.frame = CGRect(
                x: tabButtonCenterInParent.x - 25,
                y: tabButtonCenterInParent.y - 25,
                width: 50,
                height: 50
            ) // Start hidden at the main button's position
            button.alpha = 0 // Hidden by default
            button.addTarget(self, action: actions[index], for: .touchUpInside) // Attach action
            self.view.addSubview(button)
        }
    }


    
    
    func mainButtonPressed() {
        areButtonsVisible.toggle()
        let buttons = [button1, button2, button3]
        let radius: CGFloat = 120
        let angleSpacing = CGFloat.pi / 5

        // Convert `addTransactionTab`'s center to `self.view`'s coordinate system
        let tabButtonCenterInParent = addTransactionTab.superview?.convert(addTransactionTab.center, to: self.view) ?? .zero

        UIView.animate(withDuration: 0.4) {
            for (index, button) in buttons.enumerated() {
                if self.areButtonsVisible {
                    // Adjust angle for upward layout (e.g., buttons spreading upwards like a fan)
                    let angle = -CGFloat.pi / 2 + CGFloat(index - 1) * angleSpacing // Centered upward (-90° ± angleSpacing)
                    let xOffset = cos(angle) * radius
                    let yOffset = sin(angle) * radius

                    button.center = CGPoint(
                        x: tabButtonCenterInParent.x + xOffset,
                        y: tabButtonCenterInParent.y + yOffset
                    ) // Properly calculated position
                    button.alpha = 1 // Make buttons visible
                } else {
                    // Animate buttons back to the main button's position
                    button.center = tabButtonCenterInParent
                    button.alpha = 0 // Hide
                }
            }
        }
    }


    
    
    func addTabItem(){
        homeTab.configure(with: UIImage(named: "home_fill"), title: TabItemEnum.HOME.rawValue)
        transactionTab.configure(with: UIImage(named: "transaction_fill"), title: TabItemEnum.TRANSACTION.rawValue)
        addTransactionTab.configure(with: UIImage(named: "Add"), title: TabItemEnum.ADD_TRANSACTION.rawValue)
        budgetTransactionItem.configure(with: UIImage(named: "pie-chart_fill"), title: TabItemEnum.BUDGET.rawValue)
        profileTab.configure(with: UIImage(named: "user_fill"), title: TabItemEnum.PROFILE.rawValue)
        
        homeTab.isSelected = true
        transactionTab.isSelected = false
        addTransactionTab.isSelected = false
        budgetTransactionItem.isSelected = false
        profileTab.isSelected = false 
        homeTab.delegate = self
        transactionTab.delegate = self
        addTransactionTab.delegate = self
        budgetTransactionItem.delegate = self
        profileTab.delegate = self
    }
        
    func loadHome(){
        guard let Home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
        contentView.addSubview(Home.view)
        Home.didMove(toParent: self)
    }
    

}

extension TabbarViewController : TabbarViewDelegate {
    
    func TabItemSelect(tab: TabItem) {
     
//        hideAddTransactionButton(tab: tab)
       
        switch tab.titleLabel.text {
            case TabItemEnum.HOME.rawValue:
                guard let Home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
                contentView.addSubview(Home.view)
                Home.didMove(toParent: self)
            case TabItemEnum.ADD_TRANSACTION.rawValue:
                mainButtonPressed()
            case TabItemEnum.TRANSACTION.rawValue:
                guard let Home = self.storyboard?.instantiateViewController(withIdentifier: "TransactionViewController") as? TransactionViewController else { return }
                contentView.addSubview(Home.view)
                Home.didMove(toParent: self)
            case TabItemEnum.BUDGET.rawValue:
                guard let Home = self.storyboard?.instantiateViewController(withIdentifier: "BudgetViewController") as? BudgetViewController else { return }
                contentView.addSubview(Home.view)
                Home.didMove(toParent: self)
            case TabItemEnum.PROFILE.rawValue:
                guard let Home = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
                contentView.addSubview(Home.view)
                Home.didMove(toParent: self)
            default:
                print("Something wrong")
                 
        }
    }
    
}
extension TabbarViewController {
        @objc func incomeTapped(){
            print("Income Tapped")
        }
        @objc func expenseTapped(){
            print("Expense Tapped")
        }
        @objc func transferTapped(){
            print("Transfer Tapped")
        }
}


