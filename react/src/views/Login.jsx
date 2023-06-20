/* eslint-disable no-unused-vars */
import React, { useState } from "react";
import { Navigate, useNavigate } from "react-router-dom";
import Card from "@mui/material/Card";
import Button from "@mui/material/Button";
import Grid from "@mui/material/Grid";
import IconButton from "@mui/joy/IconButton";
import Input from "@mui/joy/Input";
import KeyRoundedIcon from "@mui/icons-material/KeyRounded";
import VisibilityRoundedIcon from "@mui/icons-material/VisibilityRounded";
import PersonIcon from "@mui/icons-material/Person";
import axiosClient from "../axios-client";
import { useStateContext } from "../context/ContextProvider";

function Login() {
    const { token, setUser, setToken } = useStateContext();
    const [showPassword, setShowPassword] = useState(false);
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState(null);
    const navigate = useNavigate();

    const handleLogin = () => {
        setError(null);
        const payload = {
            email: email,
            password: password,
        };
        axiosClient
            .post("/login", payload)
            .then(({ data }) => {
                setUser(data.user);
                setToken(data.token);
                navigate("/chatspace");
            })
            .catch((err) => {
                const response = err.response;
                if (response && response.status === 422) {
                    setUser(null);
                    setToken(null);
                    setError(response.data.message);
                }
            });
    };

    const loginStyle = {
        div: {
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            height: "100vh",
        },

        card: {
            padding: "60px 20px",
            width: "40%",
        },
    };

    function handleShowPassword() {
        setShowPassword(!showPassword);
    }

    if (token) {
        return <Navigate to="/" />;
    }

    return (
        <div style={loginStyle.div}>
            <Card sx={loginStyle.card}>
                <Grid
                    container
                    spacing={2}
                    direction={"column"}
                    justifyContent={"center"}
                    alignContent={"center"}
                >
                    <Grid item>
                        <h1>Edge Style Login</h1>
                    </Grid>
                    <Grid item>
                        {error && (
                            <div className="alert alert-dark">{error}</div>
                        )}
                    </Grid>
                    <Grid item>
                        <Input
                            size="lg"
                            startDecorator={<PersonIcon />}
                            placeholder="Email"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            type="email"
                            required
                        />
                    </Grid>

                    <Grid item>
                        <Input
                            size="lg"
                            startDecorator={<KeyRoundedIcon />}
                            placeholder="Password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            type={!showPassword ? "text" : "password"}
                            endDecorator={
                                <IconButton
                                    onClick={handleShowPassword}
                                    color="neutral"
                                >
                                    <VisibilityRoundedIcon />
                                </IconButton>
                            }
                            required
                        />
                    </Grid>

                    <Grid item>
                        <Button
                            onClick={handleLogin}
                            fullWidth={true}
                            variant="contained"
                        >
                            Login
                        </Button>
                    </Grid>
                </Grid>
            </Card>
        </div>
    );
}

export default Login;
