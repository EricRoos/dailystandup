import React from 'react';

import { action } from '@storybook/addon-actions';

import MemberTile from './'

import '../../../css/application.css';

export default {
  title: 'Member Tile',
  component: MemberTile,
};

export const MemberTileDisplay = () => (
  <div className='grid grid-cols-12'>
    <MemberTile
      name='Matthew Q.'
      title='Developer'
      accent_url='https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F89%2F5b%2F28%2F895b281b1d2dd8cca4c98baaf2dcd972.jpg&f=1&nofb=1'
      avatar_url='https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.imgur.com%2FzfgDtzY.jpg&f=1&nofb=1'
    />
  </div>
)
