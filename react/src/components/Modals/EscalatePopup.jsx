/* eslint-disable react/prop-types */
/* eslint-disable no-unused-vars */
import { Modal, ModalDialog, ModalClose, 
        Typography, Button } from '@mui/joy'
import { Box } from '@mui/material'
import React from 'react'

function EscalatePopup(props) {
    const style = {
        dialog: {
            textAlign: 'center',
            padding: '30px 50px',
        },
        button: {
            width: '30%'
        }
}
  return (
    <Modal open={props.open}>
    <ModalDialog size={'md'} sx={style.dialoge}>
        <ModalClose onClick={props.handleClose} />
        <Typography variant="h4">Do you want to Escalate this issue?</Typography>
        <Typography id="alert-dialog-modal-description" textColor="text.tertiary">
            Pressing continue will forward the conversation to your manager.
        </Typography>

        <Box sx={{ display: 'flex', gap: 1, justifyContent: 'center', pt: 1, mt: 2 }}>
            <Button sx={style.button} variant="solid" color="neutral" onClick={props.handleClose}>
                Cancel
            </Button>
            <Button sx={style.button} variant="solid" color="danger" onClick={props.handleClose}>
                Continue
            </Button>
        </Box>
    </ModalDialog>
</Modal>
  )
}

export default EscalatePopup