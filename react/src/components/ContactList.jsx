/* eslint-disable no-unused-vars */
import React from 'react';
// import InboxIcon from '@mui/icons-material/InboxIcon';
// import DraftsIcon from '@mui/icons-material/DraftsIcon';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemIcon from '@mui/material/ListItemIcon';
import ListItemText from '@mui/material/ListItemText';
import Card from '@mui/material/Card';


export default function ChatList() {
  return (
          // Data will be mapped here for contacts
      <Card>
          <List>
                <ListItem disablePadding>
                  <ListItemButton>
                    <ListItemIcon>
                      {/* <InboxIcon /> */}
                    </ListItemIcon>
                    <ListItemText primary="Inbox" />
                  </ListItemButton>
                </ListItem>
                <ListItem disablePadding>
                  <ListItemButton>
                    <ListItemIcon>
                      {/* <DraftsIcon /> */}
                    </ListItemIcon>
                    <ListItemText primary="Drafts" />
                  </ListItemButton>
                </ListItem>
              </List>
      </Card>
  )
}
