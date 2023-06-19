/* eslint-disable no-unused-vars */
import React from 'react'
import 'bootstrap/dist/css/bootstrap.min.css';
import SearchIcon from '@mui/icons-material/Search';
import IconButton from '@mui/joy/IconButton';
import Input from '@mui/joy/Input';

export default function SearchBar() {
    const styles = {
        searchBar: {
          borderRadius: '20px',
          marginBottom: '20px', 
          marginTop: '20px',
        }
    }



  return (
    <Input sx={styles.searchBar}
      size="lg"
      placeholder="Search..."
      type="text"
      endDecorator={
        <IconButton color="white">
          <SearchIcon color="action" />
        </IconButton>
      }
  />

  )
}
