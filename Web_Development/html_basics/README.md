# HTML

When a web browser displays a web page, it needs to know 3 things: (1) What is the content?, (2) How should the content appear?, (3) How should the page behave in response to the user?. HTML uses tags inside angle brackets: <> which tell the browser what type of information is inside. Heres a basic setup of what an HTML file looks like:

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Hello</title>
    </head>
    <body></body>
</html>
```

Heres how we create a link:
```html
<a href="website">Link text</a>
```

Heres how we embed an image:
```html
<img src="imgPath" alt="altText"/>
```

If we want to get some input from our website we use forms. They help us collect data. Theres different types of input elemets such as: (1) text fields, (2) checkboxes, (3) radio buttons, (4) submit buttons, and more. Input elements are made up of input tags which dictate what type of input it will be. Heres an example of what this may look like:
```html
<form>
    First Name: <br>
    <input type="text" name="fn" value="FN"/><br>
    Last name: <br>
    <input type="text" name="lastname" placeholder="LN"/><br>
</form>
```

With every form we submit, typically that info goes to a database or to a javascript file. A button can have an onClick() function to trigger a javascript function. Refer to <a href="https://www.w3schools.com/html/default.asp">w3schools</a> for more information/how-to's

# CSS

CSS allows you to create custom styling and specifies how a page is displayed to users. It is made up of:
<ul>
<li>Selectors</li>
<li>Properties</li>
<li>Values</li>
</ul>

The best way to implement a css file with our html file is the include it in our .html file. 
```html
<link rel="stylesheet" href="style.css"/>
```

Each selector in CSS has a value associated with it called "specifity". If 2 declaration blocks bot apply to an element but contain conflicting declarations, which ever one is more "specific" or is lower down in the file is used. (this is why our css reset code is in the top of the file).<br>

Different browsers have different default styling for html. We usually have a reset.css file to ensure our css file works across all browsers. We can think of our HTML elements  as a box. starting from the innder most part and extending out we have (refer to the box model: <a href="https://www.w3schools.com/css/css_boxmodel.asp">CSS box model</a>): 
<ul>
<li>Element</li>
<li>Padding - How much space is around the content. This affects the size of the element.</li>
<li>Border - Encloses the padding and element</li>
<li>Margin - How much space is around the element, outside of the border.</li>
</ul>

We can assign a class or id in our HTML elements and the use the class/id to access the tag in CSS for styling:
```html
<h1 class="heading-title">Title</h1>
<h1 id="list">Hi</h2>
```
```css
.heading {
    text-decoration: underline;
}

#list {
    text-decoration: underline;
}
```

We can group selectors together
```css
h1, h2, h3 {
    font-family: cursive;
}
```

Say we have an ordered list inside an unordered list and we want to apply a style based on the parent (ul). If we want to style the elements inside the ul we can do this:
```css
ul ol li {
    text-decoration: underline;
}
```

We have pseudoclasses in CSS where elments are styled only when they are in a speciic state such as: (1) hover, (2) checked, (3) visited, and more. Pseudo elements can also style any part of the element like first-line, or first-letter. Attribute selectors style elements using [].
```css
a:hover {
    text-decoration: underline;
}

p::first-line {
    text-transform: uppercase;
}

a[title] {
    color: purple;
}
```

An exact attribute selector (=) selects every attribute matching a value. Here, we only select 'a' tags that point to google:
```css
a[href="https://google.com"] {
    color: purple;
}
```

A "begins with" attribute selector (^=) is used to select every attribute beginning with a value. We can also have a "ends with" attribute selector ($=):
```css
a[href^="https://"] {
    color: blue;
}

a[href$=".org"] {
    color: green;
}
```

A global attribute selector (*=) selects a substring:
```css
a[href*="static"] {
    color: blue;
}
```


<details>
<summary>Elements can have different display qualities that we can use to customize its appearance and positon on the screen:</summary>

<ul>
<li>display: block -> An element generates a block element box that typically has a width of 100% inside the parent container</li>
<li>display: inline -> These dont generate line breaks and only take up as much space as their content requires</li>
<li>display: none -> Defines wether or not an element displays a box at all</li>
<li>position: static -> The element is positioned according to the normal flow of the document</li>
<li>position: relative -> The element is positioned according to the normal flow of the document and then offsets relative to itself based on the values of: top, right, bottom, left</li>
<li>position: absolute -> The element is positioned relative to its nearest non-static parent element</li>
<li>position: fixed -> The element is positioned relative to the browser window</li>
</ul>
</details>
