export default function Cards() {
    const cardTitle = "Song Info"
    const author = "Andrew Bird"
    const songtitle = "Danse Caribe"
    const description = "A wonderful song off the album 'Break it yourself'"
    return (
        <div className="card">
            <h1 className="card-title">{cardTitle}</h1>
            <h2 className="author-title">{author} - {songtitle}</h2>
            <p>{description}</p>
        </div>

    )
}