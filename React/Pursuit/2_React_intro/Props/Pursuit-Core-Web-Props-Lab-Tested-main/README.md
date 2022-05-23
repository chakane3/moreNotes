[![Pursuit Logo](https://avatars1.githubusercontent.com/u/5825944?s=200&v=4)](https://pursuit.org)

# Pursuit Core Web Props Lab

![goFundMe](./goFundMe.png)

Included in this repo is an [html file](./reference.html) that renders a static version in HTML.
Build a React app modeled after the image above.

> Most of your class names and HTML elements can be copied from the reference file.

It should use each of the following components declared under `src/Components` as a separate `.js` file, like `src/Components/TopBar.js`:

## Top Bar

Displays the welcome banner for the donation page.
We've created this one for you.

## Recent Donations

Displays a list of each of the previous donations, including the amounts, names and captions.
It should receive the list of donations as a `donations` prop.

## Progress

It should receive the total money amount as a `total` prop and the goal as a `goal` prop.
Use an `h2` for its heading.

- Displays how much total money has been raised out of the goal
- (Bonus) Display a progress bar that is filled up to the appropriate percentage. It should also display the exact percentage in text (`44.10%`)

## Donation Form

Should include:

- A field for the donor's name to be entered
- A field for the caption
- A [range](https://www.w3schools.com/tags/att_input_type_range.asp) that sets the donation amount
- A "Donate" submit button

> The "Donate" submit button won't do anything -- we haven't taught that yet.

## Getting Started

- Fork this repo
- Clone the forked repository
- `cd` to the directory where you cloned it
- `npm install` to install dependencies
- `npm run cypress` to open the cypress testing window
- `npm test` to run jest / node tests
- `npm run test:bonus` to run jest / node tests _including the bonus tests_

> _Note_: Remember to `git add`, `git commit` and `git push` regularly

## Submission Guidelines

- When finished, commit and push your work.
- Make a pull request on github.
- Submit the link to your pull request on Canvas.

[Additional instructions]
