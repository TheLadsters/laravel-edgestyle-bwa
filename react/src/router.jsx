import {
    createBrowserRouter, 
    createRoutesFromElements, 
    Route
} from "react-router-dom";
import ChatSidebarLayout from './layouts/ChatSidebarLayout';
import ChatSpace from './views/ChatSpace';
import NotFound from './views/NotFound';
import Login from './views/Login';
import Dashboard from "./views/Dashboard";
import Settings from "./views/Settings";


const router = createBrowserRouter(createRoutesFromElements(
    <>
    <Route path="/" element={<ChatSidebarLayout />}>
        <Route path="chatspace" element={<ChatSpace />}></Route>
        <Route path="dashboard" element={<Dashboard />}></Route>
        <Route path="settings" element={<Settings />}></Route>
    </Route>
    <Route path="*" element={<NotFound />}></Route>
    <Route path="/login" element={<Login />}></Route>
    </>
))


export default router;