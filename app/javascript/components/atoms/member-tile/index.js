import React from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faBell, faCoffee } from '@fortawesome/free-solid-svg-icons'

const MemberTile = ({name, title, avatar_url, accent_url}) => (
  <div className='member-tile'>
    <div className='top'>
      <img className='accent-image' src={accent_url} />
      <div className='member-name'>{name}</div>
      <div className='avatar'><img src={avatar_url}/></div>
    </div>
    <div className='bottom'>
      <div className='title'>
        <span>{title}</span>
      </div>
      <div className='icons'>
        <span>
          <FontAwesomeIcon icon={faCoffee} />
        </span>
        <span>
          <FontAwesomeIcon icon={faBell} />
        </span>
      </div>
    </div>
  </div>
)

export default MemberTile;
