/* eslint-disable no-unused-vars */
import React from 'react'
import TextField from '@mui/material/TextField';

export default function SearchBar() {
    // const style = {
        
    // }
  return (
    <TextField style={{width: '100%',
    marginBottom: '20px', 
    marginTop: '20px'}}
          id="filled-search"
          label="Search..."
          type="search"
          variant="filled"
        />
  )
}
