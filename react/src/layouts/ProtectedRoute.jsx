/* eslint-disable no-unused-vars */
import React, { useEffect } from "react";
import { Outlet, Navigate } from "react-router-dom";
import { useStateContext } from "../context/ContextProvider";
import axiosClient from "../axios-client";

function ProtectedRoute() {
    const { token } = useStateContext();

    if (!token) {
        console.log("Protected Route is called");
        return <Navigate to="/login" replace={true} />;
    }

    return (
        <div id="protectedRoute">
            <Outlet />
        </div>
    );
}

export default ProtectedRoute;
