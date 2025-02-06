//
//  VitaleSDK.swift
//  HealthBirdth
//
//  Created by Miguel Muñoz on 27/7/23.
//

import Foundation
import UIKit
import TrainingSDK

public class VitaleSDK{
    
    public static let shared = VitaleSDK()
    
    public weak var vitaleSDKDelegate: VitaleSDKDelegate?
    
    public func setDelegate(_ delegate: VitaleSDKDelegate){
        self.vitaleSDKDelegate = delegate
    }
    
    public func startSDKWith(appID: String, password: String, userID: String, url: String? = nil){
        SDKBridging.shared.startSDKsWithConfig(appID: appID, password: password, userID: userID, url: url)
    }
    
    public func setMainColor(color: String){
        VitaleSDKUtils.shared.setPrimaryColor(color: color)
    }
    
    public func setPrimaryButtonColor(_ color: String){
        VitaleSDKUtils.shared.setPrimaryButtonColor(color)
    }
    
    public func setNavigationBarColor(color: String){
        VitaleSDKUtils.shared.setNavigationBarColor(color: color)
    }
    
    public func setNavigationTintColor(color: String){
        VitaleSDKUtils.shared.setNavigationTintColor(color: color)
    }
    
    public func showVitale(){
        VitaleSDKUtils.shared.showVitale()
    }
    
    public func showNutrition(){
        VitaleSDKUtils.shared.showNutrition()
    }
    
    public func showTraining(){
        VitaleSDKUtils.shared.showTraining()
    }
    
    public func setNutritionCountry(country: Int){
        SDKBridging.shared.setCountry(country)
    }
    
    public func showTodaytraining(){
        WorkoutSDK.sharedInstance.showTodaytraining()
    }
    
    public func showLibrary() {
        WorkoutSDK.sharedInstance.showLibrary()

    }
        
    public func showCustomWorkouts() {
        WorkoutSDK.sharedInstance.showCustomWorkouts()

    }
    
    public func showTimeBasedWorkouts() {
        WorkoutSDK.sharedInstance.showTimeBasedWorkouts()

    }
    
    public func showProfile(){
        VitaleSDKUtils.shared.showProfile()
    }
    
    public func setSmallLogo(_ logo: UIImage?){
        VitaleSDKUtils.shared.setSmallLogo(logo: logo)
    }
    
    public func updatePersonalProfile(firstName: String? = nil, lastName: String? = nil, gender: UserGender? = nil, height: Int? = nil, weight: Double? = nil, birthDate: Date? = nil){
        VitaleSDKUtils.shared.updatePersonalProfile(firstName: firstName, lastName: lastName, gender: gender, height: height, weight: weight, birthDate: birthDate)
    }
    
    public func setPathologies(_ pathologies: [Pathologies]){
        SDKBridging.shared.setPathologies(pathologies)
    }
    
    public func getProfile(_ completion: @escaping(UserProfile?)->()){
        VitaleSDKUtils.shared.getUserProfile { userProfile in
            completion(userProfile)
        }
    }
}

public protocol VitaleSDKDelegate: AnyObject{
    func newEvent(_ eventName: String)
}
