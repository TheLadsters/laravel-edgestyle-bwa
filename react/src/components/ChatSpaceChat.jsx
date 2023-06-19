/* eslint-disable no-unused-vars */
import React from 'react'
import Grid from '@mui/material/Grid';
import Card from '@mui/material/Card';
import ForumIcon from '@mui/icons-material/Forum';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import InfoIcon from '@mui/icons-material/Info';
import SendIcon from '@mui/icons-material/Send';
import ErrorIcon from '@mui/icons-material/Error';
import AttachmentIcon from '@mui/icons-material/Attachment';
import TextField from '@mui/material/TextField';


export default function ChatSpaceChat() {
    const cardStyle = {
        borderRadius: '10px', marginTop: '20px', 
        height: '98vh', marginRight: '10px',
        padding: '20px 20px',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'space-between'
    }

    const sendAndInfoStyle = {
        borderRadius: '20px', padding: '10px 15px'
    }

    const escalateStyle = {
        borderRadius: '20px', backgroundColor: '#f05454',
        padding: '10px 10px'
    }

    const templateStyle = {
        borderRadius: '20px', backgroundColor: '#ba68c8',
        padding: '10px 10px'
    }
  return (
    <>
    <Card sx={{ minWidth: 275 }} style={cardStyle}>
                <Grid container 
                justifyContent={'space-between'}
                >
                    <Grid item>
                        <Typography variant="h5">
                            Ticket Number 12345
                        </Typography>
                    </Grid>
                    <Grid item>
                        <Button variant="contained" style={sendAndInfoStyle}>
                            Customer Information
                            <InfoIcon style={{marginLeft: '5px'}} />
                        </Button>
                    </Grid>
                </Grid>


                {/* SPACE FOR MESSAGES */}



                <Grid container direction={'column'}> 
                    <Grid container>
                        <Grid item xs={12}>
                        <TextField fullWidth label="Enter a message..." style={{marginBottom: '15px'}} />
                        </Grid>
                    </Grid>

                    <Grid container justifyContent={'space-between'}>
                        <Grid item>
                            <Button variant="contained" style={escalateStyle}>
                                <ErrorIcon style={{marginRight: '5px'}} />
                                Escalate
                            </Button>
                        </Grid>

                        <Grid item>
                            <Button variant="contained" style={templateStyle}>
                                <ForumIcon style={{marginRight: '5px'}} />
                                Template
                            </Button>

                            <Button>
                                <AttachmentIcon xs={5} />
                            </Button>

                            <Button variant="contained" style={sendAndInfoStyle}>
                                Send
                                <SendIcon style={{marginLeft: '5px'}} />
                            </Button>
                        </Grid>
                    </Grid>
                </Grid>
                 
                   
    </Card>
 
    </>
  )
}
