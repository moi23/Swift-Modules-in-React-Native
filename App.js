import React from 'react';
import {View, requireNativeComponent} from 'react-native';
const CoolWebView = requireNativeComponent('CoolWebView');

const App = () => {
  return (
    <View>
      <CoolWebView
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
