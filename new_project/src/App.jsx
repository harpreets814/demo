import { useState } from "react";
import "./App.css";

function App() {
    const [todos, setTodos] = useState([
        {
            id: 1,
            title: "Go to gym",
            description: "Go to gym at 6 am"
        },
        {
            id: 2,
            title: "Go to school",
            description: "Go to school at 8 am"
        },
        {
            id: 3,
            title: "Go to work",
            description: "Go to work at 9 am"
        }
    ]);
    function addtodo(){
      setTodos([...todos,{
        id:4,
        title:Math.random(),
        description:Math.random()
      }])
    }
    return (
        <div>
            {todos.map((item) => {
                return (
                    <div key={item.id}>
                        <h1>{item.title}</h1>
                        <p>{item.description}</p>
                        <button onClick={addtodo}>Add Todo</button>
                    </div>
                    
                );
            })}
        </div>
    );
}

function HeaderWithButton() {
    const [title, setTitle] = useState("Hello World");

    function updateTitle() {
        setTitle("My name is " + Math.random());
    }

    return (
        <div>
            <button onClick={updateTitle}>
                Update the Title
            </button>

            <Header title={title} />
        </div>
    );
}

function Header({ title }) {
    return <div>{title}</div>;
}

export default App;