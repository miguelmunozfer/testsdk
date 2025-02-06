package com.tunombre.tuplugin;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

public class TuPluginModule extends ReactContextBaseJavaModule {
    private final ReactApplicationContext reactContext;

    public TuPluginModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "TuPlugin";
    }

    @ReactMethod
    public void tuMetodo(String param, Promise promise) {
        try {
            // Aquí implementas la lógica usando tu .aar
            promise.resolve("resultado");
        } catch (Exception e) {
            promise.reject("ERROR", e.getMessage());
        }
    }
} 