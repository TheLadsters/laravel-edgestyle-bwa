/* eslint-disable no-unused-vars */
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import Card from '@mui/material/Card';
import Button from '@mui/material/Button';
import Grid from '@mui/material/Grid';
import IconButton from '@mui/joy/IconButton';
import Input from '@mui/joy/Input';
import KeyRoundedIcon from '@mui/icons-material/KeyRounded';
import VisibilityRoundedIcon from '@mui/icons-material/VisibilityRounded';
import PersonIcon from '@mui/icons-material/Person';

function Login() {
const [showPassword, setShowPassword] = useState(false)

const loginStyle = {
    div: {
      display: 'flex',
      justifyContent: 'center',
      alignItems: 'center',
      height: '100vh'
  },

  card: {
    padding: '60px 20px',
    width: '40%'
  }
}

function handleShowPassword() {
  setShowPassword(!showPassword)
}

  return (
    <div style={loginStyle.div}>
      <Card sx={loginStyle.card}>
        <Grid container spacing={2} 
        direction={'column'} justifyContent={'center'}
        alignContent={'center'}
        >
          <Grid item>
            <h1>Edge Style Login</h1>
          </Grid>

          <Grid item>
            <Input
              size="lg"
              startDecorator={<PersonIcon />}
              placeholder="Username"
              type="text"
            />
          </Grid>

          <Grid item>
            <Input
              size="lg"
              startDecorator={<KeyRoundedIcon />}
              placeholder="Password"
              type={!showPassword ? 'text' : 'password'}
              endDecorator={
                <IconButton onClick={handleShowPassword} color="neutral">
                  <VisibilityRoundedIcon />
                </IconButton>
              }
            />
          </Grid>

          <Grid item>
            <Link to="/chatspace">
              <Button fullWidth={'100%'} variant="contained">Login</Button>
            </Link>
          </Grid>
        </Grid>
      </Card>
    </div>
  )
}

export default Login