import {
    createBrowserRouter, 
    createRoutesFromElements, 
    Route
} from "react-router-dom";
import ChatSidebarLayout from './layouts/ChatSidebarLayout';
import ChatSpace from './views/ChatSpace';
import NotFound from './views/NotFound';
import Login from './views/Login';


const router = createBrowserRouter(createRoutesFromElements(
    <>
    <Route path="/chatspace" element={<ChatSidebarLayout />}>
        <Route index element={<ChatSpace />}></Route>
    </Route>
    <Route path="*" element={<NotFound />}></Route>
    <Route path="/login" element={<Login />}></Route>
    </>
))


export default router;