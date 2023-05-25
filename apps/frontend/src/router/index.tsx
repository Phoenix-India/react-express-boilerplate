import {
  Route,
  createBrowserRouter,
  createRoutesFromElements,
} from "react-router-dom";

// Components
import App from "../App";

// Pages
import Homepage from "../Pages/Homepage";

// Creating Router
const router = createBrowserRouter(
  createRoutesFromElements(
    <Route element={<App />}>
      <Route path="/" element={<Homepage />} index />
    </Route>
  ),
);

export default router;
