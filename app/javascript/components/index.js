import React from 'react';
import ReactDOM from 'react-dom';

import {
  MemberTile
} from './atoms';

const componentMap = {
  'MemberTile':  MemberTile
}

window.renderReactComponent = (componentName, props, selector) => {
  const Component = componentMap[componentName];
  ReactDOM.render(<Component {...props} />, document.querySelector(selector))
}

export const MyButton = () => {
  return (
    <h1>MY BUTTON NOW</h1>
  );
}

