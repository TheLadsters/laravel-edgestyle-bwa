/* eslint-disable no-unused-vars */
import React from 'react'
import Grid from '@mui/material/Grid';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
// import InfoIcon from '@mui/icons-material/Info';

export default function ChatSpaceChat() {
  return (
    <>
    <Card sx={{ minWidth: 275 }} style={{borderRadius: '10px', marginTop: '20px', height: '100%'}}>
        <CardContent>
            <Grid container
                justifyContent="space-between"
                alignItems="flex-start"
                spacing={12}
            >
                    <Grid item={true} xs={6}>
                        <Typography sx={{ fontSize: 23 }} color="text.primary" gutterBottom>
                            <b>Ticket Number 12345</b>
                        </Typography>
                    </Grid>

                    <Grid item={true} xs={6}>
                        <Button variant="contained">
                            Customer Information
                            {/* <InfoIcon></InfoIcon> */}
                        </Button>
                    </Grid>
            </Grid>
        </CardContent>

        <CardActions>
            <Button size="small">Learn More</Button>
        </CardActions>
    </Card>
 
    </>
  )
}
