import { useState } from 'react'
import './App.css'

function App() {
    const [todos, settodos] = useState([{
      title:"go to gym",
      description:"go to gym at 6 am",
      isCompleted:false
    },{
      title:"go to school",
      description:"go to school at 8 am",
      isCompleted:false
    }]);
  function addTodo(){
    settodos([...todos,{
      title:"new todo",
      description:"new todo description",
      isCompleted:false
    }])
  }
    
  return (
    <div>
      <button onClick={addTodo}>Add Todo</button>
      {
        todos.map(function(todo){
          return<Todo title={todo.title} description={todo.description} isCompleted={todo.isCompleted}/>
        })
      }
    </div>
  )
}
function Todo({title,description,isCompleted}){
  return <div>
    <h1>{title}</h1>
    <h2>{description}</h2>
    <h3>{isCompleted?"Completed":"Not Completed"}</h3>
  </div>
  }
 

export default App
