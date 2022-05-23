import BookList from "./Components/BookList"
import Cards from "./Components/Cards"
export default function Hello() {
    const name = "Chakane"
    return (
        <div>
            <h1>Hello {name}!!</h1>
            <p>Below are some books</p>
            <BookList />
            <p>Below are some cards</p>
            <Cards />
        </div>
        
    )
}