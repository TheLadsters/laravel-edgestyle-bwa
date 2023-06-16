/* eslint-disable no-unused-vars */
import React from 'react'
import { styled } from '@mui/material/styles';


const DrawerHeader = styled('div')(({ theme }) => ({
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginTop: '10px',
    marginBottom: '10px',
    padding: theme.spacing(2, 1.5),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
}));

export default DrawerHeader;