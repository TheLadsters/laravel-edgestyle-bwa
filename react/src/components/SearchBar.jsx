/* eslint-disable no-unused-vars */
import React from 'react'
import 'bootstrap/dist/css/bootstrap.min.css';
import SearchIcon from '@mui/icons-material/Search';

export default function SearchBar() {
    const styles = {
        inputGroup:  {
          width: '100%',
          height: '4%',
          marginBottom: '20px', 
          marginTop: '20px',
          size: '10px',
          border: 'none',
          borderRadius: '20px',
        },
        searchBar: {
          borderRadius: '20px',
        }
    }



  return (
    <div style={styles.inputGroup} className="input-group">
      <input placeholder="Search..."
      type="text" className='form-control' style={styles.searchBar} />
    </div>

  )
}
