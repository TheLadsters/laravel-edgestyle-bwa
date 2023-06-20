/* eslint-disable no-unused-vars */
import React, { useState, useEffect } from "react";
import {
    Outlet,
    Link,
    useLocation,
    Navigate,
    useNavigate,
} from "react-router-dom";
import { useTheme } from "@mui/material/styles";
import {
    Box,
    Avatar,
    List,
    CssBaseline,
    Grid,
    Typography,
    IconButton,
    Divider,
    ListItem,
    ListItemButton,
    ListItemIcon,
    ListItemText,
} from "@mui/material";
import {
    ChevronLeft,
    ChevronRight,
    Dashboard,
    Forum,
    Build,
    Logout,
} from "@mui/icons-material";
import DrawerHeader from "../components/DrawerHeader";
import Drawer from "../components/Drawer";
import { useStateContext } from "../context/ContextProvider";
import axiosClient from "../axios-client";

export default function ChatSidebarLayout() {
    const { user, token, setUser, setToken } = useStateContext();
    const navigate = useNavigate();

    const theme = useTheme();
    const itemStyle = {
        color: "#42a5f5",
    };

    const location = useLocation();
    const [open, setOpen] = useState(false);
    const [sizeAvatar, setSizeAvatar] = useState({
        transition: "width 1.5s",
        height: "40px",
        width: "40px",
        marginLeft: "0px",
        marginTop: "0px",
    });

    const sidebarOptions = [
        {
            label: "Dashboard",
            icon: <Dashboard fontSize="large" />,
            path: "/dashboard",
        },
        {
            label: "Messages",
            icon: <Forum fontSize="large" />,
            path: "/chatspace",
        },
        {
            label: "Settings",
            icon: <Build fontSize="large" />,
            path: "/settings",
        },
    ];

    const handleDrawerOpen = () => {
        setOpen(true);
        setSizeAvatar(function (prev) {
            return {
                height: "60px",
                width: "60px",
                marginLeft: "5px",
                marginTop: "5px",
            };
        });
    };

    const handleDrawerClose = () => {
        setOpen(false);
        setSizeAvatar(function (prev) {
            return {
                height: "40px",
                width: "40px",
                marginLeft: "0px",
                marginTop: "0px",
            };
        });
    };

    const avatarStyle = {
        cursor: "pointer",
        height: sizeAvatar.height,
        width: sizeAvatar.width,
        marginLeft: sizeAvatar.marginLeft,
        marginTop: sizeAvatar.marginTop,
    };

    const onLogout = (ev) => {
        ev.preventDefault();

        axiosClient.post("/logout", user).then(() => {
            setUser({});
            setToken(null);
            navigate("/login");
        });
    };

    useEffect(() => {
        async function fetchUser(){
            try{
                await axiosClient.get("/user").then(({ data }) => {
                    setUser(data);
                });
            }
            catch(err){
                console.log(err);
            }
        }

        fetchUser();
    }, [setUser]);

    return (
        <Box sx={{ display: "flex" }}>
            <CssBaseline />
            <Drawer
                variant="permanent"
                open={open}
                onMouseEnter={handleDrawerOpen}
                onMouseLeave={handleDrawerClose}
            >
                <DrawerHeader>
                    <Grid container justifyContent={"space-between"}>
                        <Grid item xs={3}>
                            <Avatar
                                color="inherit"
                                aria-label="open drawer"
                                edge="start"
                                sx={avatarStyle}
                            >
                                <b>
                                    {user.first_name?.charAt(0)}
                                    {user.last_name?.charAt(0)}
                                </b>
                            </Avatar>
                        </Grid>

                        {open && (
                            <Grid item xs={9}>
                                <Grid item>
                                    <Typography variant="h5">
                                        <b>
                                            {user.first_name} {user.last_name}
                                        </b>
                                    </Typography>
                                </Grid>

                                <Grid item>ID#{user.id}</Grid>

                                <Grid item>{user.email}</Grid>
                            </Grid>
                        )}
                    </Grid>
                </DrawerHeader>
                <Divider />
                <List>
                    {sidebarOptions.map((item, index) => (
                        <ListItem
                            component={Link}
                            to={item.path}
                            key={index}
                            disablePadding
                            sx={{ display: "block" }}
                        >
                            <ListItemButton
                                sx={{
                                    minHeight: 48,
                                    justifyContent: open ? "initial" : "center",
                                    px: 2.5,
                                    py: 3,
                                }}
                            >
                                <ListItemIcon
                                    sx={{
                                        minWidth: 0,
                                        mr: open ? 3 : "auto",
                                        justifyContent: "center",
                                    }}
                                    style={
                                        location.pathname == item.path
                                            ? itemStyle
                                            : null
                                    }
                                >
                                    {item.icon}
                                </ListItemIcon>

                                <ListItemText
                                    primary={item.label}
                                    sx={{
                                        color: "black",
                                        opacity: open ? 1 : 0,
                                    }}
                                    style={
                                        location.pathname == item.path
                                            ? itemStyle
                                            : null
                                    }
                                />
                            </ListItemButton>
                        </ListItem>
                    ))}
                    <ListItem
                        disablePadding
                        sx={{ display: "block" }}
                        onClick={(ev) => onLogout(ev)}
                    >
                        <ListItemButton
                            sx={{
                                minHeight: 48,
                                justifyContent: open ? "initial" : "center",
                                px: 2.5,
                                py: 3,
                            }}
                        >
                            <ListItemIcon
                                sx={{
                                    minWidth: 0,
                                    mr: open ? 3 : "auto",
                                    justifyContent: "center",
                                    color: "red",
                                }}
                            >
                                <Logout fontSize="large" />
                            </ListItemIcon>
                            <ListItemText
                                primary="Logout"
                                sx={{
                                    color: "red",
                                    opacity: open ? 1 : 0,
                                }}
                            />
                        </ListItemButton>
                    </ListItem>
                </List>
            </Drawer>
            <Box component="main" sx={{ flexGrow: 1, p: 0 }}>
                <DrawerHeader />
            </Box>
            <Outlet />
        </Box>
    );
}
