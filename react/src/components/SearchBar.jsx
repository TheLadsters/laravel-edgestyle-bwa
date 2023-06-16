/* eslint-disable no-unused-vars */
import React from 'react'
import TextField from '@mui/material/TextField';

export default function SearchBar() {
    const style = {
      width: '100%',
      marginBottom: '20px', 
      marginTop: '20px',
      borderRadius: '20px'
    }
  return (
    <TextField sx={style}
          id="filled-search"
          label="Search..."
          type="search"
          variant="filled"
        />
  )
}
