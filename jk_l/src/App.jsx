import { useState } from 'react'

import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <div>
      <CardWrapper children={innercompo}></CardWrapper>
    </div>
  )
}
function CardWrapper({ children}){
  return (
    <div style={{border:"1px solid red", padding:"10px"}}>
      {children}
    </div>
  )
}
function innercompo(){
  return (
    <div>
      <h1>Inner Component</h1>
    </div>
  )
}

export default App
