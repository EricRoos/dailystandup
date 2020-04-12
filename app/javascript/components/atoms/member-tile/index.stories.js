import React from 'react';

import { action } from '@storybook/addon-actions';

import MemberTile from './'

import '../../../css/application.css';

export default {
  title: 'Member Tile',
  component: MemberTile,
};

export const MemberTileDisplay = () => <div className='grid grid-cols-12'><MemberTile name='Dorinda M.' title='Developer' /></div>;
