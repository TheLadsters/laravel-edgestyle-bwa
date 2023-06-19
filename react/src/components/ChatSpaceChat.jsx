/* eslint-disable no-unused-vars */
import React, { useState } from 'react'
import {Grid, Card, Button, Typography, TextField, Divider, Box} from '@mui/material';
import {Forum, Info, Send, Error, Attachment} from '@mui/icons-material';
import EscalatePopup from './Modals/EscalatePopup';
import CustomerInfoPopup from './Modals/CustomerInfoPopup';


export default function ChatSpaceChat() {
    const [openEscalate, setOpenEscalate] = React.useState(false);
    const [openInfo, setOpenInfo] = React.useState(false);

    function openEscalateModal(){
        setOpenEscalate(true)
    }

    function closeEscalateModal(){
        setOpenEscalate(false)
    }

    function openInfoModal(){
        setOpenInfo(true)
    }

    function closeInfoModal(){
        setOpenInfo(false)
    }

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
                        <Button variant="contained" 
                        style={sendAndInfoStyle}
                        onClick={openInfoModal}
                        >
                            Customer Information
                            <Info style={{marginLeft: '5px'}} />
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
                            <Button variant="contained" style={escalateStyle}
                                onClick={openEscalateModal}
                            >
                                <Error style={{marginRight: '5px'}} />
                                Escalate
                            </Button>
                        </Grid>

                        <Grid item>
                            <Button variant="contained" style={templateStyle}>
                                <Forum style={{marginRight: '5px'}} />
                                Template
                            </Button>

                            <Button>
                                <Attachment xs={5} />
                            </Button>

                            <Button variant="contained" style={sendAndInfoStyle}>
                                Send
                                <Send style={{marginLeft: '5px'}} />
                            </Button>
                        </Grid>
                    </Grid>
                </Grid>
    </Card>

    <EscalatePopup open={openEscalate} handleClose={closeEscalateModal} />
    <CustomerInfoPopup open={openInfo} handleClose={closeInfoModal} />

    </>
  )
}
