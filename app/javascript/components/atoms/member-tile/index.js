import React from 'react'

const MemberTile = ({name, title, avatar_url, accent_url}) => (
  <div className='member-tile'>
    <div className='top'>
      <div className='member-name'>{name}</div>
      <div className='avatar'></div>
    </div>
    <div className='bottom'>
      <div className='title'>
        <span>{title}</span>
      </div>
      <div className='icons'>
        X Y Z
      </div>
    </div>
  </div>
)

export default MemberTile;
