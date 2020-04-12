import React from 'react';

import { action } from '@storybook/addon-actions';
import { MyButton } from '../app/javascript/components'
import '../app/javascript/css/application.css';

export default {
  title: 'MyButton',
  component: MyButton,
};

export const Text = () => <MyButton onClick={action('clicked')}>Hello Button</MyButton>;

export const Emoji = () => (
  <MyButton onClick={action('clicked')}>
    <span role="img" aria-label="so cool">
      😀 😎 👍 💯
    </span>
  </MyButton>
);

Emoji.story = {
  name: 'with emoji',
};
