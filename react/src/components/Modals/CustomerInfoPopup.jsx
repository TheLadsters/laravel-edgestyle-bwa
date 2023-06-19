/* eslint-disable react/prop-types */
/* eslint-disable no-unused-vars */
import { Modal, ModalDialog, ModalClose, Typography, Box } from '@mui/joy'
import React from 'react'

function CustomerInfoPopup(props) {
    const style = {
        dialog: {
            padding: '60px 20px',
            width: '40%'
        },
        box: {
            display: 'flex', gap: 1, 
            alignItems: 'flex-start', flexDirection: 'column', 
            pt: 1, mt: 2
        }
}

return (
<Modal open={props.open}>
    <ModalDialog size={'md'} sx={style.dialog}>
        <ModalClose onClick={props.handleClose} />
        <Box sx={style.box}>
            <Typography level="h2" sx={{marginBottom: '10px'}}>
                Contact Info
            </Typography>

            <Typography level="h6">
                Contact Number
            </Typography>
            <Typography level="body1">
                12345
            </Typography>

            <Typography level="h6">
                Contact Name
            </Typography>
            <Typography level="body1">
                Jake A.
            </Typography>

            <Typography level="h6">
                Contact Issue
            </Typography>
            <Typography level="body1">
                Software
            </Typography>

            <Typography level="h6">
                Contact Category
            </Typography>
            <Typography level="body1">
                Hardware
            </Typography>

            <Typography level="h6">
                Contact Sub-category
            </Typography>
            <Typography level="body1">
                Parts and Pieces
            </Typography>
        </Box>
    </ModalDialog>
</Modal>
  )
}

export default CustomerInfoPopup