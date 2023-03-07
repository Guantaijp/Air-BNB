import './App.css';
import { useState, useEffect } from 'react';
import { BrowserRouter,Navigate , Routes, Route } from 'react-router-dom';
import HomePage from './components/HomePage';
import AirBnbPage from './components/AirBnbPage';

import AccountPage from './components/AccountPage';
import AddBnb from './components/AddBnb';
import About from './components/About';
import Booking from './components/Booking';
import NavBar from './components/NavBar';


function App() {

  const [airbnbs, setAirbnbs] = useState([]);

  useEffect(() => {
      fetch("http://localhost:9292/")
          .then((res) => res.json())
          .then((data) => {
              setAirbnbs(data);
              
          }
          );
  }, []);


  return (

    
   <>

 
    <BrowserRouter>
    <NavBar/>
      <Routes>
      <Route path="/" element={<Navigate to="/home"/>} />
      <Route path="/home" element={<HomePage/>}/>
      <Route path="/airbnb" element={<AirBnbPage
      airbnbs={airbnbs}
      setAirbnbs={setAirbnbs}
      />}/>
     
      <Route path="/addbnb" element={<AddBnb/>}/>
      <Route path="/about" element={<About/>}/>
      <Route path="/booking" element={<Booking 
      airbnbs={airbnbs}
      setAirbnbs={setAirbnbs}
      />}/>
      <Route path="/account" element={<AccountPage/>}/>
      </Routes>
    </BrowserRouter>

   </>
  );
}

export default App;
