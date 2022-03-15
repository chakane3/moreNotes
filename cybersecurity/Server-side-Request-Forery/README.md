# Server side request forgery

This attack happens when you make http/s requests to an unintended location. The attacker may cause the server to make a connection to internal-only services within the organizations infrastrucutre. They may also be able to force the server to connect to some external system, thus leaking sensitive data such as a users credentials. <br>

Some common sttacks exploit unauthorized actions from within an organization via back-end systems. Someone can perform an attack on the server itself, where the attacker created an application to send out an HTTP request back to the server that is hostng the application via loopback network interface. This would mean that the attacker would supply a URL with a hostname (127.0.0.1 -> points to the loopback adapter, or localhost). For example, a shopping application will let someone see if an item is in stock. To see whats in stock the application queries some back-end REST API's. A URL is passed to the backend API endpoint via a front-end HRRP request. It may look like this:

```

POST /product/stock HTTP/1.0
Content-Type: application/x-www-form-urlencoded
Content-Length: 118

stockApi=http://stock.weliketoshop.net:8080/product/stock/check%3FproductId%3D6%26storeId%3D1

```

Here, the server will make a request to that given RUL and return the items stock status. What an attacker would do is modify the request to specify a URL that is local to the server. The bad request would look like this:

```

POST /product/stock HTTP/1.0
Content-Type: application/x-www-form-urlencoded
Content-Length: 118

stockApi=http://localhost/admin

```

Now the server will fetch the contents of the /admin URL and return it to the user. We could also consider that the attacker could just visit /admin directly, however admin functionality may only be accessible to ONLY the vetted users. What happened in this case is that the normal access controls were bypassed and the application grants full access to admin functionality because the request appears to come from a trusted location.<br>

Applications may trust applications that come from the local macine because:
<ul>
    <li>The implementation of the access control check. The developer, etc may had that check sit in front of the application server.<li>
    <li>For special circumstances where an admin may need access without logging in when coming in from the local machine. This may happen in case the admin loses their credentials. tThe assumption here is that only a trusted user would be coming in from the server itself<li>
    <li>The admin interface may be listening in from a different port number other than the main application.<li>
<ul>
<br>

