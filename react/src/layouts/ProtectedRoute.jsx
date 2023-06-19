/* eslint-disable no-unused-vars */
import React from 'react'
import { Outlet, Navigate } from 'react-router-dom'

function ProtectedRoute() {
    const isLogin = true;
    if(!isLogin){
        return <Navigate to="/login" />
    }

    return <Outlet />
}

export default ProtectedRoute