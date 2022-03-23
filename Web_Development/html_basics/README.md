# HTML + CSS

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

