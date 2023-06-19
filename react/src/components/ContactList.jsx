/* eslint-disable no-unused-vars */
import React from 'react';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemAvatar from '@mui/material/ListItemAvatar';
import Typography from '@mui/material/Typography';
import ListItemText from '@mui/material/ListItemText';
import Card from '@mui/material/Card';
import Divider from '@mui/material/Divider';
import Avatar from '@mui/material/Avatar';
import ListItemButton from '@mui/material/ListItemButton';


export default function ContactList() {
  const cardStyle = {
    borderRadius: '10px',
    height: '92vh',
    padding: '0',
    overflowY: 'scroll',
    marginBottom: '10px',
    width: '100%'
  }
  return (
      <Card style={cardStyle}>
          <List key={1}>
            {
              // Data will be mapped here for contacts
              // temporary
              ['12345', '2492', '2569', 
              '12345', '2492', '2569', 
              '25562', '23663', '12345',
              '596930', '590239', '2492'].map((num, index)=>(
                <>
                <ListItemButton key={index}>
                  <ListItem key={index} alignItems="flex-start">
                    <ListItemAvatar key={index}>
                      <Avatar alt="Remy Sharp" />
                    </ListItemAvatar>
                    <ListItemText
                      primary={
                        <Typography sx={{fontWeight: 'bold'}}
                            variant="h5"
                        >
                            {`Contact#${num}`}
                          </Typography>
                      }
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
