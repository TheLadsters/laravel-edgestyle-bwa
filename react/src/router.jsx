import {createBrowserRouter} from "react-router-dom";
import ChatSpace from "./views/ChatSpace.jsx";
import Login from "./views/Login.jsx";
import NotFound from "./views/NotFound.jsx";

const router = createBrowserRouter([
    {
        path:'/chatspace',
        element: <ChatSpace />
    },
    {
        path:'/login',
        element: <Login />
    },
    {
        path:'*',
        element: <NotFound />
    }
])

export default router;