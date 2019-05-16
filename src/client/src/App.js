import React from 'react';
import './App.css';
import SchoolsPage from './Components/SchoolsPage';
import { BrowserRouter, Route, Switch } from 'react-router-dom'
function App() {
  return (
    <BrowserRouter>
      <Switch>
        <Route path="/schools" component={SchoolsPage}/>
        <Route exact path="/" component={SchoolsPage}/>
      </Switch>
    </BrowserRouter>
  );
}

export default App;
