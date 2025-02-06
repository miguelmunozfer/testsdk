import { NativeModules } from 'react-native';

const { VitaleSDKBridge } = NativeModules;

export interface Profile {
  firstName?: string;
  lastName?: string;
  gender?: number;
  height?: number;
  weight?: number;
  birthDate?: Date;
}

export interface VitaleSDK {
  startSDK(appID: string, password: string, userID: string, url?: string): void;
  setMainColor(color: string): void;
  setPrimaryButtonColor(color: string): void;
  setNavigationBarColor(color: string): void;
  setNavigationTintColor(color: string): void;
  showVitale(): void;
  showNutrition(): void;
  setCountry(country: number): void;
  showTraining(): void;
  showTodaytraining(): void;
  showLibrary(): void;
  showCustomWorkouts(): void;
  showTimeBasedWorkouts(): void;
  showProfile(): void;
  updatePersonalProfile(profile: Profile): void;
  setPathologies(pathologies: string[]): void;
  getProfile(): Promise<Profile>;
}

export default VitaleSDKBridge as VitaleSDK; 