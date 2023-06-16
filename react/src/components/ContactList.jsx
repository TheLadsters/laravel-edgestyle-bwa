/* eslint-disable no-unused-vars */
import React from 'react';
// import InboxIcon from '@mui/icons-material/InboxIcon';
// import DraftsIcon from '@mui/icons-material/DraftsIcon';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemAvatar from '@mui/material/ListItemAvatar';
import Typography from '@mui/material/Typography';
import ListItemText from '@mui/material/ListItemText';
import Card from '@mui/material/Card';
import Divider from '@mui/material/Divider';
import Avatar from '@mui/material/Avatar';
import ListItemButton from '@mui/material/ListItemButton';


export default function ChatList() {
  const cardStyle = {
    borderRadius: '10px',
    height: '92vh',
    padding: '0'
  }
  return (
      <Card style={cardStyle}>
          <List>
            {
              // Data will be mapped here for contacts
              // temporary
              ['12345', '2492', '2569', 
              '25562', '23663', '12345',
              '596930', '590239', '2492'].map((num, index)=>(
                <>
                <ListItemButton>
                  <ListItem alignItems="flex-start">
                    <ListItemAvatar>
                      <Avatar alt="Remy Sharp" src="/static/images/avatar/1.jpg" />
                    </ListItemAvatar>
                    <ListItemText
                      primary="Brunch this weekend?"
                      secondary={
                        <React.Fragment>
                          <Typography
                            sx={{ display: 'inline' }}
                            component="span"
                            variant="body2"
                            color="text.primary"
                          >
                            Ali Connors
                          </Typography>
                          {" — I'll be in your neighborhood doing errands this…"}
                        </React.Fragment>
                      }
                    />
                  </ListItem>
                  <Divider />
                </ListItemButton>
                </>
              ))
            }
            </List>
      </Card>
  )
}
