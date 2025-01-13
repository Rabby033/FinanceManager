//
//  ViewController.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 21/12/24.
//

import UIKit



class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            updateNextButtonTitle()
        }
    }
    var viewModel : OnboardingViewModel?
    var uicontens : [OnboardingUicontentModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initViews()
//        forceCrash()
        
    }
    
    
    
    func initViews(){
        viewModel = onboardingViewModelImpl()
        uicontens = viewModel?.getUiContents()
    }
    
    @IBAction func nexbuttonClicked(_ sender: Any) {
        if currentPage == pageControl.numberOfPages - 1 {
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "TabbarViewController") as! TabbarViewController
//            let rootVc = UINavigationController(rootViewController: vc)
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func updateNextButtonTitle(){
        currentPage == pageControl.numberOfPages - 1 ? nextButton.setTitle("Get Started", for: .normal) : nextButton.setTitle("Next", for: .normal)
    }
    
    

}
extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = uicontens?.count ?? 0
        return uicontens?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingPage", for: indexPath) as! onboardingCollectionViewCell
        cell.setView(content: uicontens?[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
    
}
