# Authentication

This is the process of verifying a user or client. It makes sure its really them, and not somebody else. Some ways websites can veridy who you are is usually by.
<ul>
<li>Something you know such as a password or security questions</li>
<li>Something you have such as a mobile phone or security token. Even biometrics such as fingerprints, facescan, etc</li>
</ul>

An authenticated user can have different levels of authorzation. For example a customer on a shopping website does not have the same access as the employees or admins do. We run into vunerabilities when the mechanism for authentication is weak (can be brute forced) or flaws in the implementation. <br>

# OAuth 2.0 Authentication

This is an authorization framework that websites use to request limited access to a users account on another website. For example, Spotify allows users to link their Facebook account which makes it easier for the user to log-in or use some other features on both ends. <br>
This works through a series of interactions between 3 parties:
<ul>
<li>Client - the website that wats the users data</li>
<li>Resource owner - The user </li>
<li>OAuth Service Provider - The 3rd party that controls what resources are passed to the client</li>
</ul>

Theres many ways that the OAuth process (grant types) is handled, but generally speaking:
<ul>
<li>The client requests access to some of the users data</li>
<li>The user then logs in to the account the resource live in and gives consent for the resources to be passed</li>
<li>The client receives a unique access token proving they have permission to take the users data</li>
<li>The client then uses this access token to make API calls fetching the data from the resource owner</li>
<ul>

## OAuth Grant Types

This determines the the steps necessary in the OAuth process. It affects how the client communicates with the OAuth service. This is also known as OAuth Flows. 
