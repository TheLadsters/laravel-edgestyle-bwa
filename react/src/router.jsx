import { createBrowserRouter, Navigate } from "react-router-dom";
import ChatSidebarLayout from "./layouts/ChatSidebarLayout";
import ChatSpace from "./views/ChatSpace";
import NotFound from "./views/NotFound";
import Login from "./views/Login";
import Dashboard from "./views/Dashboard";
import Settings from "./views/Settings";
import ProtectedRoute from "./layouts/ProtectedRoute";

const router = createBrowserRouter([
    {
        path: "/",
        element: <ProtectedRoute />,
        children: [
            {
                path: '/',
                element: <Navigate to="/dashboard"/>
            },
            {
                element: <ChatSidebarLayout />,
                children: [
                    {
                        path: "/dashboard",
                        element: <Dashboard />,
                    },
                    {
                        path: "/chatspace",
                        element: <ChatSpace />,
                    },
                    {
                        path: "/settings",
                        element: <Settings />,
                    },
                ],
            },
        ],
    },
    {
        path: "/login",
        element: <Login />,
    },
    {
        path: "*",
        element: <NotFound />,
    },
]);

/*createBrowserRouter(createRoutesFromElements(
    <>
    <Route element={<ProtectedRoute />}>
        <Route path="/" element={<ChatSidebarLayout />}>
            <Route path="chatspace" element={<ChatSpace />}></Route>
            <Route path="dashboard" element={<Dashboard />}></Route>
            <Route path="settings" element={<Settings />}></Route>
        </Route>
    </Route>

    <Route path="*" element={<NotFound />}></Route>
    <Route path="/login" element={<Login />}></Route>
    </>
    */

export default router;
