//
//  OnboardingViewModel.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 21/12/24.
//

import Foundation

protocol OnboardingViewModel {
    func getUiContents() -> [OnboardingUicontentModel]
}

class onboardingViewModelImpl: OnboardingViewModel {
    
    
    init(){
        
    }
    
    func getUiContents() -> [OnboardingUicontentModel] {
        
        var images = ["onboarding1","onboarding2","onboarding3"]
        var titles = ["Gain total control of your money","Know where your money goes","Planning ahead"]
        var description = ["Become your own money manager and make every cent count","Track your transaction easily, with categories and financial report","Setup your budget for each category so you in control"]
        
        var contents = [OnboardingUicontentModel]()
        
        for index in 0..<images.count {
            contents.append(OnboardingUicontentModel(imageName: images[index],title: titles[index], description: description[index]))
        }
        return contents
    }
    
}
