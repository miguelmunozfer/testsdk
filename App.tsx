import React from 'react';
import {
  SafeAreaView,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import VitaleSDK, { Profile } from 'vitale-sdk-react-native';

const App = () => {
  const initSDK = () => {
    VitaleSDK.startSDK(
      'your-app-id',
      'your-password',
      'user-id',
      'optional-url'
    );
  };

  const updateProfile = () => {
    const profile: Profile = {
      firstName: 'John',
      lastName: 'Doe',
      gender: 0,
      height: 180,
      weight: 75,
      birthDate: new Date('1990-01-01')
    };
    VitaleSDK.updatePersonalProfile(profile);
  };

  const getProfile = async () => {
    try {
      const profile = await VitaleSDK.getProfile();
      console.log('Profile:', profile);
    } catch (error) {
      console.error('Error getting profile:', error);
    }
  };

  const setColors = () => {
    VitaleSDK.setMainColor('#FF0000');
    VitaleSDK.setPrimaryButtonColor('#00FF00');
    VitaleSDK.setNavigationBarColor('#0000FF');
    VitaleSDK.setNavigationTintColor('#FFFFFF');
  };

  const Button = ({ title, onPress }: { title: string; onPress: () => void }) => (
    <TouchableOpacity style={styles.button} onPress={onPress}>
      <Text style={styles.buttonText}>{title}</Text>
    </TouchableOpacity>
  );

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView contentContainerStyle={styles.scrollContent}>
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Setup</Text>
          <Button title="Initialize SDK" onPress={initSDK} />
          <Button title="Set Colors" onPress={setColors} />
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Profile</Text>
          <Button title="Update Profile" onPress={updateProfile} />
          <Button title="Get Profile" onPress={getProfile} />
          <Button title="Show Profile" onPress={VitaleSDK.showProfile} />
          <Button 
            title="Set Pathologies" 
            onPress={() => VitaleSDK.setPathologies(['diabetes', 'hypertension'])} 
          />
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Navigation</Text>
          <Button title="Show Vitale" onPress={VitaleSDK.showVitale} />
          <Button title="Show Nutrition" onPress={VitaleSDK.showNutrition} />
          <Button 
            title="Set Country" 
            onPress={() => VitaleSDK.setCountry(1)} 
          />
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Training</Text>
          <Button title="Show Training" onPress={VitaleSDK.showTraining} />
          <Button title="Show Today's Training" onPress={VitaleSDK.showTodaytraining} />
          <Button title="Show Library" onPress={VitaleSDK.showLibrary} />
          <Button title="Show Custom Workouts" onPress={VitaleSDK.showCustomWorkouts} />
          <Button title="Show Time Based Workouts" onPress={VitaleSDK.showTimeBasedWorkouts} />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5F5F5',
  },
  scrollContent: {
    padding: 16,
  },
  section: {
    marginBottom: 24,
    backgroundColor: '#FFFFFF',
    borderRadius: 8,
    padding: 16,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 12,
    color: '#333',
  },
  button: {
    backgroundColor: '#007AFF',
    padding: 12,
    borderRadius: 8,
    marginVertical: 4,
  },
  buttonText: {
    color: '#FFFFFF',
    fontSize: 16,
    textAlign: 'center',
    fontWeight: '600',
  },
});

export default App; 