import Foundation
import React
import VitaleHealthSDK

@objc(VitaleSDKBridge)
class VitaleSDKBridge: RCTEventEmitter {

  override init() {
    super.init()
  }

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }

  @objc func startSDK(_ appID: String, password: String, userID: String, url: String?) {
    VitaleSDK.shared.startSDKWith(appID: appID, password: password, userID: userID, url: url)
  }

  @objc func setMainColor(_ color: String) {
    VitaleSDK.shared.setMainColor(color: color)
  }

  @objc func setPrimaryButtonColor(_ color: String) {
    VitaleSDK.shared.setPrimaryButtonColor(color)
  }

  @objc func setNavigationBarColor(_ color: String) {
    VitaleSDK.shared.setNavigationBarColor(color: color)
  }

  @objc func setNavigationTintColor(_ color: String) {
    VitaleSDK.shared.setNavigationTintColor(color: color)
    
  }

  @objc func showVitale() {
    DispatchQueue.main.async {
      VitaleSDK.shared.showVitale()
    }
  }

  @objc func showNutrition() {
    DispatchQueue.main.async {
      VitaleSDK.shared.showNutrition()
    }
  }
  
  @objc func setCountry(_ country: Int) {
    DispatchQueue.main.async {
      VitaleSDK.shared.setNutritionCountry(country: country)
    }
  }

  @objc func showTraining() {
    DispatchQueue.main.async {
      VitaleSDK.shared.showTraining()
    }
  }

  @objc func showTodaytraining() {
    DispatchQueue.main.async {
      VitaleSDK.shared.showTodaytraining()
    }
  }

  @objc func showLibrary() {
    DispatchQueue.main.async {
      VitaleSDK.shared.showLibrary()
    }
  }

  @objc func showCustomWorkouts() {
    VitaleSDK.shared.showCustomWorkouts()
    DispatchQueue.main.async {
 
    }
  }

  @objc func showTimeBasedWorkouts() {
    DispatchQueue.main.async {
      VitaleSDK.shared.showTimeBasedWorkouts()
    }
 }

  @objc func showProfile() {
    DispatchQueue.main.async {
      VitaleSDK.shared.showProfile()
    }
  }

  @objc func updatePersonalProfile(_ profile: [String: Any]) {
    VitaleSDK.shared.updatePersonalProfile(
      firstName: profile["firstName"] as? String,
      lastName: profile["lastName"] as? String,
      gender: UserGender(rawValue: profile["gender"] as? Int ?? 0),
      height: profile["height"] as? Int,
      weight: profile["weight"] as? Double,
      birthDate: profile["birthDate"] as? Date
    )
  }

  override func supportedEvents() -> [String]! {
    return []
  }

}
