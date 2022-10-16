import { useEffect, useState } from "react";
import { BrowserRouter, Link, Routes, Route } from "react-router-dom";
import reactLogo from "./assets/react.svg";

function App() {
  /**
   * During development we can still access the base path at `/`
   * And this hook will make sure that we land on the base `/app`
   * path which will mount our App as usual.
   * In production, Phoenix makes sure that the `/app` route is
   * always mounted within the first request.
   * */
  useEffect(() => {
    if (window.location.pathname === "/") {
      window.location.replace("/app");
    }
  }, []);
  // const [count, setCount] = useState(0);

  useEffect(() => {
    fetch("http://localhost:4000/api/health").catch((err: Error) =>
      console.error(err.message)
    );
  });

  return (
    <>
      <BrowserRouter basename="app">
        <nav className="flex gap-2 p-2">
          <Link to="/">Home</Link>
          <Link to="/settings">Settings Page</Link>
          <br />
        </nav>
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="settings" element={<SettingsPage />} />
        </Routes>
      </BrowserRouter>
    </>
  );
}

function SettingsPage() {
  return (
    <div className="min-h-screen flex flex-col justify-center items-center gap-5">
      <h1>Settings Page</h1>
      <ul>
        <li>My profile</li>
        <li>Music</li>
        <li>About</li>
      </ul>
    </div>
  );
}

function HomePage() {
  return (
    <div className="min-h-screen flex flex-col justify-center items-center gap-5">
      <img src={reactLogo} className="h-[5rem] w-[5rem]" alt="React logo" />+
      {/* <img src="/vite.svg" className="h-[5rem] w-[5rem]" alt="Vite logo" /> */}
      <h1 className="text-3xl font-bold text-blue-600">
        Vite + React + Typescript + Tailwind
      </h1>
    </div>
  );
}

export default App;
