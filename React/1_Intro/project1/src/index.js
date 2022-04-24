import React from "react"
import ReactDom from "react-dom"
import Header from "./Header"
import Footer from "./Footer"
import MainContent from "./MainContent"

function App() {
   return (
       <div>
           <Header />
           <MainContent />
           <Footer />
       </div>
   )
}

ReactDom.render(<App />, document.getElementById("root"))