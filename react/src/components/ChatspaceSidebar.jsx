/* eslint-disable no-unused-vars */
import React, {useState} from 'react'
import { ProSidebar, Menu, MenuItem} from "react-pro-sidebar";
import Grid from '@mui/material/Grid';
// import Menu from '@mui/material/Menu';
// import MenuItem from '@mui/material/MenuItem';

const ChatSpaceSidebar = () => {
    // const style = {
       
    // }
    return (
        <div style={{ display: "flex", height: "100vh" }}>
            <ProSidebar className="app" style={{ backgroundColor: 'white', 
        width: '100%',}}>
                <Menu open={true}>
                    <MenuItem className="menu1">
                    
                    <Grid container
                        justifyContent="space-between"
                        alignItems="flex-start"
                        spacing={12}
                    >
                        
                        <Grid>

                        </Grid>
                    </Grid>

                    </MenuItem>
                    <MenuItem> Dashboard </MenuItem>
                    <MenuItem> Invoices </MenuItem>
                    <MenuItem> Charts </MenuItem>
                    <MenuItem> Wallets </MenuItem>
                    <MenuItem> Transactions </MenuItem>
                    <MenuItem> Settings </MenuItem>
                    <MenuItem> Logout </MenuItem>
                </Menu>
            </ProSidebar>
    </div>
    )
};



export default ChatSpaceSidebar;
