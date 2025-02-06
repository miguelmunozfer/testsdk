# VitaleSDK React Native Plugin Documentation

This documentation guides React Native developers through integrating and utilizing the VitaleSDK in their projects.

## Installation

```bash
npm install vitale-sdk-react-native
# or
yarn add vitale-sdk-react-native
```

## iOS Setup

### 1. Importing VitaleSDK with Swift Package Manager (SPM)

1. **Open your project in Xcode**: First, ensure your React Native project is open in Xcode.

2. **Adding Swift Package**:
   - Go to `File` -> `Swift Packages` -> `Add Package Dependency`.
   - Enter the URL for the VitaleSDK: `https://github.com/miguelmunozfer/VitaleSPM`
   - Follow the prompts to choose the version and options for integrating the package.

3. **Install CocoaPods Dependencies**:
```bash
cd ios
pod install
```

## Android Setup

1. **Add the AAR file**:
   - Place your `VitaleSDK.aar` file in the `android/libs/` directory.

2. **Update settings.gradle** (if not already present):
```gradle
include ':vitale-sdk-react-native'
project(':vitale-sdk-react-native').projectDir = new File(rootProject.projectDir, '../node_modules/vitale-sdk-react-native/android')
```

3. **Update app/build.gradle**:
```gradle
dependencies {
    implementation project(':vitale-sdk-react-native')
}
```

4. **Update MainApplication.java**:
```java
import com.tunombre.tuplugin.TuPluginPackage; // <- Add this import

public class MainApplication extends Application implements ReactApplication {
    @Override
    protected List<ReactPackage> getPackages() {
        return Arrays.asList(
            new MainReactPackage(),
            new TuPluginPackage() // <- Add this line
        );
    }
}
```

## Usage

After successfully integrating the SDK, you can use the provided methods in your React Native JavaScript code. Here's a brief overview of the available methods:

### `startSDK(appID, password, userID, url?)`
Starts the VitaleSDK session with the given user credentials.

#### Parameters:
- `appID`: String - The application ID.
- `password`: String - The password.
- `userID`: String - The user identifier.
- `url`: String (optional) - The optional URL for configuration.

#### Example:
```javascript
import { startSDK } from 'vitale-sdk-react-native';

startSDK('appID', 'password', 'userID');
```

### `setMainColor(color)`
Sets the main color for the SDK's UI elements.

#### Parameters:
- `color`: String - The color in a string format (e.g., hex code).

#### Example:
```javascript
setMainColor('#FF5733');
```

### `setPrimaryButtonColor(color)`
Sets the color of the primary button.

#### Parameters:
- `color`: String - The color in a string format.

#### Example:
```javascript
setPrimaryButtonColor('#00FF00');
```

### `setNavigationBarColor(color)`
Sets the color of the navigation bar.

#### Parameters:
- `color`: String - The color in a string format.

#### Example:
```javascript
setNavigationBarColor('#0000FF');
```

### `setNavigationTintColor(color)`
Sets the tint color of the navigation elements.

#### Parameters:
- `color`: String - The color in a string format.

#### Example:
```javascript
setNavigationTintColor('#FFFFFF');
```

### `showVitale()`
Displays the Vitale screen.

#### Example:
```javascript
showVitale();
```

### `showNutrition()`
Displays the Nutrition screen.

#### Example:
```javascript
showNutrition();
```

### `showTraining()`
Displays the Training screen.

#### Example:
```javascript
showTraining();
```

### `showTodaytraining()`
Displays today's training.

#### Example:
```javascript
showTodaytraining();
```

### `showLibrary()`
Displays the training library.

#### Example:
```javascript
showLibrary();
```

### `showCustomWorkouts()`
Displays custom workouts.

#### Example:
```javascript
showCustomWorkouts();
```

### `showTimeBasedWorkouts()`
Displays time-based workouts.

#### Example:
```javascript
showTimeBasedWorkouts();
```

### `showProfile()`
Displays the user profile screen.

#### Example:
```javascript
showProfile();
```

### `updatePersonalProfile(profile)`
Updates the personal profile with the provided details. The `profile` object can contain the following fields:

- `firstName` (String)
- `lastName` (String)
- `gender` (String)
- `height` (Number)
- `weight` (Number)
- `birthDate` (Date)

#### Example:
```javascript
updatePersonalProfile({
  firstName: 'John',
  lastName: 'Doe',
  gender: 'Male',
  height: 180,
  weight: 75,
  birthDate: new Date('1990-01-01')
});
```

### `setPathologies(pathologies)`
Sets the pathologies for the user. `pathologies` is an array of strings representing different conditions.

#### Parameters:
- `pathologies`: Array of Strings - The user's pathologies.

#### Example:
```javascript
setPathologies(['Diabetes', 'Hypertension']);
```

### `getProfile()`
Retrieves the user profile, returning an object containing the user details.

#### Example:
```javascript
getProfile().then(profile => {
  console.log('User Profile:', profile);
}).catch(error => {
  console.error(error);
});
```

## Complete Example

```javascript
import VitaleSDK from 'vitale-sdk-react-native';

// Initialize the SDK
VitaleSDK.startSDK('your-app-id', 'your-password', 'user-id', 'optional-url');

// Customize appearance
VitaleSDK.setMainColor('#FF5733');
VitaleSDK.setPrimaryButtonColor('#33FF57');
VitaleSDK.setNavigationBarColor('#5733FF');
VitaleSDK.setNavigationTintColor('#FFFFFF');

// Show different sections
VitaleSDK.showVitale();
VitaleSDK.showNutrition();
VitaleSDK.showTraining();

// Update user profile
const userProfile = {
  firstName: 'John',
  lastName: 'Doe',
  gender: 0, // 0 for male, 1 for female
  height: 180,
  weight: 75.5,
  birthDate: new Date('1990-01-01')
};

VitaleSDK.updatePersonalProfile(userProfile);

// Get user profile
try {
  const profile = await VitaleSDK.getProfile();
  console.log('User profile:', profile);
} catch (error) {
  console.error('Error getting profile:', error);
}
```

## TypeScript Support

The package includes TypeScript definitions. You can import types like this:

```typescript
import VitaleSDK, { ProfileType } from 'vitale-sdk-react-native';

const profile: ProfileType = {
  firstName: 'John',
  lastName: 'Doe',
  gender: 0,
  height: 180,
  weight: 75.5,
  birthDate: new Date()
};
```

## Troubleshooting

### iOS
- If you get Swift related errors, ensure your Xcode project has a bridging header properly configured
- If you get linking errors, ensure all dependencies are properly installed via CocoaPods

### Android
- If the AAR file is not found, ensure it's properly placed in the `android/libs/` directory
- If you get compilation errors, ensure your Android SDK version matches the requirements

## Support

For issues and feature requests, please file an issue on the GitHub repository.
