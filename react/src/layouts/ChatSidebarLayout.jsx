/* eslint-disable no-unused-vars */
import * as React from 'react';
import { Outlet, Link, useLocation } from "react-router-dom";
import { useTheme } from '@mui/material/styles';
import 
    {
        Box, Avatar, List, CssBaseline, Grid, Typography, IconButton,
        Divider, ListItem, ListItemButton, ListItemIcon, ListItemText
    } from '@mui/material';
import { ChevronLeft, ChevronRight, Dashboard, Forum, Build } from '@mui/icons-material';
import DrawerHeader from '../components/DrawerHeader';
import Drawer from '../components/Drawer';

export default function ChatSidebarLayout() {
const theme = useTheme();
const itemStyle = {
        color: '#42a5f5'
};

const location = useLocation();
const [open, setOpen] = React.useState(false);
const [sizeAvatar, setSizeAvatar] = React.useState({
    transition: 'width 1.5s',
    height: '40px',
    width: '40px',
    marginLeft : '0px',
    marginTop: '0px'
});

const sidebarOptions = [
    { label: 'Dashboard', icon: <Dashboard fontSize="large" />, path: '/dashboard'}, 
    { label: 'Messages', icon: <Forum fontSize="large" />, path :'/chatspace'}, 
    { label: 'Settings', icon: <Build fontSize="large" />, path: '/settings'}, 
]


const handleDrawerOpen = () => {
    setOpen(true);
    setSizeAvatar(function(prev){
        return {
            height: '60px',
            width: '60px',
            marginLeft : '5px',
            marginTop: '5px'
        }
    })
};

const handleDrawerClose = () => {
    setOpen(false);
    setSizeAvatar(function(prev){
        return {
            height: '40px',
            width: '40px',
            marginLeft : '0px',
            marginTop: '0px'
        }
    })
};

const avatarStyle = {
    cursor: 'pointer',
    height: sizeAvatar.height,
    width: sizeAvatar.width,
    marginLeft: sizeAvatar.marginLeft,
    marginTop: sizeAvatar.marginTop
}

return (
    <Box sx={{ display: 'flex'}}>
        <CssBaseline />
        <Drawer variant="permanent" open={open}>
            <DrawerHeader>

                <Grid container justifyContent={'space-between'}>
                    <Grid item xs={3}>
                        <Avatar
                            color="inherit"
                            aria-label="open drawer"
                            onClick={handleDrawerOpen}
                            edge="start"
                            sx={avatarStyle}
                        >
                            JS
                        </Avatar>
                    </Grid>
                    
                    {open && <Grid item xs={7}>
                        <Grid item>
                            <Typography variant="h5">
                                <b>John Smith</b>
                            </Typography>
                        </Grid>

                        <Grid item>
                            ID#12345
                        </Grid>

                        <Grid item>
                            johnsmith@center.com
                        </Grid>
                    </Grid>}
                                        
                    <Grid item xs={2}>
                        {open && <IconButton onClick={handleDrawerClose} >
                            {theme.direction === 'rtl' ? <ChevronRight /> : <ChevronLeft />}
                        </IconButton>}
                    </Grid>

                </Grid>


            </DrawerHeader>
            <Divider />
            <List>
            {sidebarOptions.map((item, index) => (             
                    <ListItem component={Link} to={item.path} 
                    key={index} disablePadding sx={{ display: 'block' }}
                    >
                        <ListItemButton
                            sx={{
                            minHeight: 48,
                            justifyContent: open ? 'initial' : 'center',
                            px: 2.5,
                            py: 3
                            }}
                        >
                            <ListItemIcon
                            sx={{
                                minWidth: 0,
                                mr: open ? 3 : 'auto',
                                justifyContent: 'center',
                            }}
                            style={location.pathname == item.path ? itemStyle : null}
                            >
                                {item.icon}
                            </ListItemIcon>
                            
                            <ListItemText primary={item.label} 
                                sx={{color: 'black', opacity: open ? 1 : 0 }} 
                                style={location.pathname == item.path ? itemStyle : null}
                            />
                        </ListItemButton>
                    </ListItem>
                
            ))}
            </List>
        </Drawer>
        <Box component="main" sx={{ flexGrow: 1, p: 3 }}>
            <DrawerHeader />
        </Box>
            <Outlet />
    </Box>
);
}
