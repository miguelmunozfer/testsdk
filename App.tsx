import React, { useEffect } from 'react';
import {
  SafeAreaView,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
  NativeModules
} from 'react-native';
import VitaleSDK, { Profile } from 'vitale-sdk-react-native';

const App = () => {
  useEffect(() => {
    // Log al inicio para verificar que todo está bien
    console.log('NativeModules disponibles:', Object.keys(NativeModules));
    console.log('VitaleSDK disponible:', VitaleSDK);
  }, []);

  const initSDK = () => {
    try {
      console.log('Iniciando SDK...');
      VitaleSDK.startSDK(
        'your-app-id',
        'your-password',
        'user-id',
        'optional-url'
      );
      console.log('SDK iniciado correctamente');
    } catch (error) {
      console.error('Error al iniciar SDK:', error);
    }
  };

  const testSDK = async () => {
    try {
      // Probar cada método del SDK
      console.log('Probando métodos del SDK...');
      
      // Test setMainColor
      VitaleSDK.setMainColor('#FF0000');
      console.log('setMainColor OK');
      
      // Test showVitale
      VitaleSDK.showVitale();
      console.log('showVitale OK');
      
      // Test getProfile
      const profile = await VitaleSDK.getProfile();
      console.log('getProfile OK:', profile);
      
    } catch (error) {
      console.error('Error en test:', error);
    }
  };

  const checkNativeModule = () => {
    console.log('Checking native module...');
    
    // Verificar que el módulo existe
    console.log('VitaleSDKBridge exists:', !!NativeModules.VitaleSDKBridge);
    
    // Listar métodos disponibles
    console.log('Available methods:', 
      Object.keys(NativeModules.VitaleSDKBridge)
    );
    
    // Verificar que los métodos son funciones
    console.log('startSDK is function:', 
      typeof NativeModules.VitaleSDKBridge.startSDK === 'function'
    );
  };

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView contentContainerStyle={styles.scrollContent}>
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Tests</Text>
          <Button title="Test SDK" onPress={testSDK} />
          {/* ... resto de los botones ... */}
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

// ... resto del código ... 