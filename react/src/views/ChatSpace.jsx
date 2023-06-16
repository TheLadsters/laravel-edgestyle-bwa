/* eslint-disable no-unused-vars */
import React from 'react'
import ChatspaceChat from '../components/ChatspaceChat';
import SearchBar from '../components/SearchBar';
import ContactList from '../components/ContactList';
import Grid from '@mui/material/Grid';
function ChatSpace() {
  return (
    <>
        <Grid container spacing={2}>
            
            
            <Grid item xs={4}>
                <SearchBar />
                <ContactList />
            </Grid>

            <Grid item xs={8}>
                <ChatspaceChat />
            </Grid>
        </Grid>
    </>
  )
}

export default ChatSpace