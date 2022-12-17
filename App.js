import React from 'react';
import {View, requireNativeComponent} from 'react-native';

// import { Container } from './styles';

const CoolWebView = requireNativeComponent('CoolWebView');
const App = () => {
  return (
    <View>
      <CoolWebView
        style={{
          height: 400,
          width: '100%',
          backgoundColor: 'gray',
        }}
      />
    </View>
  );
};

export default App;
