/* eslint-disable no-unused-vars */
import React from 'react'
import ChatspaceSidebar from '../components/ChatspaceSidebar';
import ChatspaceChat from '../components/ChatspaceChat';
import SearchBar from '../components/SearchBar';
import ContactList from '../components/ContactList';
import Grid from '@mui/material/Grid';
function ChatSpace() {
  return (
    <>
        <Grid container spacing={2}>
            <Grid item={true} xs={3}>
                    <ChatspaceSidebar />    
            </Grid>
            
            {/* <Grid container xs={3} 
                direction="column"
                justifyContent="center"
                alignItems="center"
            >
                <Grid item={true} xs={3}>
                    <SearchBar />
                </Grid>

                <Grid item={true} xs={9}>
                    <ContactList />
                </Grid>
            </Grid> */}

            <Grid item={true} xs={6}>
                <ChatspaceChat />
            </Grid>
        </Grid>
    </>
  )
}

export default ChatSpace