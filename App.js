import React from 'react';
import {View, requireNativeComponent} from 'react-native';
const SnooperImagePicker = requireNativeComponent('CoolWebView');

const App = () => {
  return (
    <View>
      <SnooperImagePicker
        style={{
          height: '90%',
          width: '100%',
          backgoundColor: 'gray',
        }}
      />
    </View>
  );
};

export default App;
