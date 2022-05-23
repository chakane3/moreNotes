export default function BookList() {
    const bookTitle = ["moby dick", "the great gatsby", "of mice and men"]
    return (
        <ul className="bookTitles">
            {bookTitle.map(title => <li>{title}</li>)}
        </ul>
    )

}