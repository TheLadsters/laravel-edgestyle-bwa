/* eslint-disable no-unused-vars */
import React from 'react'
import ReactDOM from 'react-dom/client'
import './index.css'
import {BrowserRouter, Routes, Route, RouterProvider} from "react-router-dom";
import router from "./router.jsx";
import ChatSidebarLayout from './layouts/ChatSidebarLayout';
import ChatSpace from './views/ChatSpace';
import NotFound from './views/NotFound';
import Login from './views/Login';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/chatspace" element={<ChatSidebarLayout />}>
            <Route index element={<ChatSpace />}></Route>
        </Route>
        <Route path="*" element={<NotFound />}></Route>
        <Route path="/login" element={<Login />}></Route>
      </Routes>
    </BrowserRouter>
  </React.StrictMode>
)
