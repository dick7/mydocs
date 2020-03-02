# [Flask](https://palletsprojects.com/p/flask/)

![flask]()

Welcome to Flask’s documentation. Get started with Installation and then get an overview with the Quickstart. There is also a more detailed Tutorial that shows how to create a small but complete application with Flask. Common patterns are described in the Patterns for Flask section. The rest of the docs describe each component of Flask in detail, with a full reference in the API section.

Flask depends on the Jinja template engine and the Werkzeug WSGI toolkit. The documentation for these libraries can be found at:

    Jinja documentation

    Werkzeug documentation

User’s Guide

This part of the documentation, which is mostly prose, begins with some background information about Flask, then focuses on step-by-step instructions for web development with Flask.
Foreword

Read this before you get started with Flask. This hopefully answers some questions about the purpose and goals of the project, and when you should or should not be using it.
What does “micro” mean?

“Micro” does not mean that your whole web application has to fit into a single Python file (although it certainly can), nor does it mean that Flask is lacking in functionality. The “micro” in microframework means Flask aims to keep the core simple but extensible. Flask won’t make many decisions for you, such as what database to use. Those decisions that it does make, such as what templating engine to use, are easy to change. Everything else is up to you, so that Flask can be everything you need and nothing you don’t.

By default, Flask does not include a database abstraction layer, form validation or anything else where different libraries already exist that can handle that. Instead, Flask supports extensions to add such functionality to your application as if it was implemented in Flask itself. Numerous extensions provide database integration, form validation, upload handling, various open authentication technologies, and more. Flask may be “micro”, but it’s ready for production use on a variety of needs.
Configuration and Conventions

Flask has many configuration values, with sensible defaults, and a few conventions when getting started. By convention, templates and static files are stored in subdirectories within the application’s Python source tree, with the names templates and static respectively. While this can be changed, you usually don’t have to, especially when getting started.
Growing with Flask

Once you have Flask up and running, you’ll find a variety of extensions available in the community to integrate your project for production.

As your codebase grows, you are free to make the design decisions appropriate for your project. Flask will continue to provide a very simple glue layer to the best that Python has to offer. You can implement advanced patterns in SQLAlchemy or another database tool, introduce non-relational data persistence as appropriate, and take advantage of framework-agnostic tools built for WSGI, the Python web interface.

Flask includes many hooks to customize its behavior. Should you need more customization, the Flask class is built for subclassing. If you are interested in that, check out the Becoming Big chapter. If you are curious about the Flask design principles, head over to the section about Design Decisions in Flask.

Continue to Installation, the Quickstart, or the Foreword for Experienced Programmers.
Foreword for Experienced Programmers
Thread-Locals in Flask

One of the design decisions in Flask was that simple tasks should be simple; they should not take a lot of code and yet they should not limit you. Because of that, Flask has a few design choices that some people might find surprising or unorthodox. For example, Flask uses thread-local objects internally so that you don’t have to pass objects around from function to function within a request in order to stay threadsafe. This approach is convenient, but requires a valid request context for dependency injection or when attempting to reuse code which uses a value pegged to the request. The Flask project is honest about thread-locals, does not hide them, and calls out in the code and documentation where they are used.
Develop for the Web with Caution

Always keep security in mind when building web applications.

If you write a web application, you are probably allowing users to register and leave their data on your server. The users are entrusting you with data. And even if you are the only user that might leave data in your application, you still want that data to be stored securely.

Unfortunately, there are many ways the security of a web application can be compromised. Flask protects you against one of the most common security problems of modern web applications: cross-site scripting (XSS). Unless you deliberately mark insecure HTML as secure, Flask and the underlying Jinja2 template engine have you covered. But there are many more ways to cause security problems.

The documentation will warn you about aspects of web development that require attention to security. Some of these security concerns are far more complex than one might think, and we all sometimes underestimate the likelihood that a vulnerability will be exploited - until a clever attacker figures out a way to exploit our applications. And don’t think that your application is not important enough to attract an attacker. Depending on the kind of attack, chances are that automated bots are probing for ways to fill your database with spam, links to malicious software, and the like.

Flask is no different from any other framework in that you the developer must build with caution, watching for exploits when building to your requirements.
Installation
Python Version

We recommend using the latest version of Python 3. Flask supports Python 3.5 and newer, Python 2.7, and PyPy.
Dependencies

These distributions will be installed automatically when installing Flask.

    Werkzeug implements WSGI, the standard Python interface between applications and servers.

    Jinja is a template language that renders the pages your application serves.

    MarkupSafe comes with Jinja. It escapes untrusted input when rendering templates to avoid injection attacks.

    ItsDangerous securely signs data to ensure its integrity. This is used to protect Flask’s session cookie.

    Click is a framework for writing command line applications. It provides the flask command and allows adding custom management commands.

Optional dependencies

These distributions will not be installed automatically. Flask will detect and use them if you install them.

    Blinker provides support for Signals.

    SimpleJSON is a fast JSON implementation that is compatible with Python’s json module. It is preferred for JSON operations if it is installed.

    python-dotenv enables support for Environment Variables From dotenv when running flask commands.

    Watchdog provides a faster, more efficient reloader for the development server.

Virtual environments

Use a virtual environment to manage the dependencies for your project, both in development and in production.

What problem does a virtual environment solve? The more Python projects you have, the more likely it is that you need to work with different versions of Python libraries, or even Python itself. Newer versions of libraries for one project can break compatibility in another project.

Virtual environments are independent groups of Python libraries, one for each project. Packages installed for one project will not affect other projects or the operating system’s packages.

Python 3 comes bundled with the venv module to create virtual environments. If you’re using a modern version of Python, you can continue on to the next section.

If you’re using Python 2, see Install virtualenv first.
Create an environment

Create a project folder and a venv folder within:

$ mkdir myproject
$ cd myproject
$ python3 -m venv venv

On Windows:

$ py -3 -m venv venv

If you needed to install virtualenv because you are using Python 2, use the following command instead:

$ python2 -m virtualenv venv

On Windows:

> \Python27\Scripts\virtualenv.exe venv

Activate the environment

Before you work on your project, activate the corresponding environment:

$ . venv/bin/activate

On Windows:

> venv\Scripts\activate

Your shell prompt will change to show the name of the activated environment.
Install Flask

Within the activated environment, use the following command to install Flask:

$ pip install Flask

Flask is now installed. Check out the Quickstart or go to the Documentation Overview.
Living on the edge

If you want to work with the latest Flask code before it’s released, install or update the code from the master branch:

$ pip install -U https://github.com/pallets/flask/archive/master.tar.gz

Install virtualenv

If you are using Python 2, the venv module is not available. Instead, install virtualenv.

On Linux, virtualenv is provided by your package manager:

# Debian, Ubuntu
$ sudo apt-get install python-virtualenv

# CentOS, Fedora
$ sudo yum install python-virtualenv

# Arch
$ sudo pacman -S python-virtualenv

If you are on Mac OS X or Windows, download get-pip.py, then:

$ sudo python2 Downloads/get-pip.py
$ sudo python2 -m pip install virtualenv

On Windows, as an administrator:

> \Python27\python.exe Downloads\get-pip.py
> \Python27\python.exe -m pip install virtualenv

Now you can return above and Create an environment.
Quickstart

Eager to get started? This page gives a good introduction to Flask. Follow Installation to set up a project and install Flask first.
A Minimal Application

A minimal Flask application looks something like this:

from flask import Flask
from markupsafe import escape

app = Flask(__name__)

@app.route("/")
def hello_world():
    return f"<p>Hello, {escape(name)}!</p>"

So what did that code do?

    First we imported the Flask class. An instance of this class will be our WSGI application.

    Next we create an instance of this class. The first argument is the name of the application’s module or package. __name__ is a convenient shortcut for this that is appropriate for most cases. This is needed so that Flask knows where to look for resources such as templates and static files.

    We then use the route() decorator to tell Flask what URL should trigger our function.

    The function returns the message we want to display in the user’s browser. The default content type is HTML, so HTML in the string will be rendered by the browser.

Note

HTML escaping

When returning HTML (the default response type in Flask), any user input rendered in the output must be escaped to protect from injection attacks. HTML templates in Jinja, introduced later, will do this automatically. escape(), shown above, can be used manually. It’s omitted for brevity in the examples below.

Save it as hello.py or something similar. Make sure to not call your application flask.py because this would conflict with Flask itself.

To run the application, use the flask command or python -m flask. Before you can do that you need to tell your terminal the application to work with by exporting the FLASK_APP environment variable:

$ export FLASK_APP=hello.py
$ flask run
 * Running on http://127.0.0.1:5000/

If you are on Windows, the environment variable syntax depends on command line interpreter. On Command Prompt:

C:\path\to\app>set FLASK_APP=hello.py

And on PowerShell:

PS C:\path\to\app> $env:FLASK_APP = "hello.py"

This launches a very simple builtin server, which is good enough for testing but probably not what you want to use in production. For deployment options see Deployment Options.

Now head over to http://127.0.0.1:5000/, and you should see your hello world greeting.

Externally Visible Server

If you run the server you will notice that the server is only accessible from your own computer, not from any other in the network. This is the default because in debugging mode a user of the application can execute arbitrary Python code on your computer.

If you have the debugger disabled or trust the users on your network, you can make the server publicly available simply by adding --host=0.0.0.0 to the command line:

$ flask run --host=0.0.0.0

This tells your operating system to listen on all public IPs.
What to do if the Server does not Start

In case the python -m flask fails or flask does not exist, there are multiple reasons this might be the case. First of all you need to look at the error message.
Old Version of Flask

Versions of Flask older than 0.11 use to have different ways to start the application. In short, the flask command did not exist, and neither did python -m flask. In that case you have two options: either upgrade to newer Flask versions or have a look at Development Server to see the alternative method for running a server.
Invalid Import Name

The FLASK_APP environment variable is the name of the module to import at flask run. In case that module is incorrectly named you will get an import error upon start (or if debug is enabled when you navigate to the application). It will tell you what it tried to import and why it failed.

The most common reason is a typo or because you did not actually create an app object.
Debug Mode

(Want to just log errors and stack traces? See Application Errors)

The flask script is nice to start a local development server, but you would have to restart it manually after each change to your code. That is not very nice and Flask can do better. If you enable debug support the server will reload itself on code changes, and it will also provide you with a helpful debugger if things go wrong.

To enable all development features (including debug mode) you can export the FLASK_ENV environment variable and set it to development before running the server:

$ export FLASK_ENV=development
$ flask run

(On Windows you need to use set instead of export.)

This does the following things:

    it activates the debugger

    it activates the automatic reloader

    it enables the debug mode on the Flask application.

You can also control debug mode separately from the environment by exporting FLASK_DEBUG=1.

There are more parameters that are explained in Development Server.

Attention

Even though the interactive debugger does not work in forking environments (which makes it nearly impossible to use on production servers), it still allows the execution of arbitrary code. This makes it a major security risk and therefore it must never be used on production machines.

Screenshot of the debugger in action:
screenshot of debugger in action

More information on using the debugger can be found in the Werkzeug documentation.

Have another debugger in mind? See Working with Debuggers.
Routing

Modern web applications use meaningful URLs to help users. Users are more likely to like a page and come back if the page uses a meaningful URL they can remember and use to directly visit a page.

Use the route() decorator to bind a function to a URL.

@app.route('/')
def index():
    return 'Index Page'

@app.route('/hello')
def hello():
    return 'Hello, World'

You can do more! You can make parts of the URL dynamic and attach multiple rules to a function.
Variable Rules

You can add variable sections to a URL by marking sections with <variable_name>. Your function then receives the <variable_name> as a keyword argument. Optionally, you can use a converter to specify the type of the argument like <converter:variable_name>.

from markupsafe import escape

@app.route('/user/<username>')
def show_user_profile(username):
    # show the user profile for that user
    return f'User {username}'

@app.route('/post/<int:post_id>')
def show_post(post_id):
    # show the post with the given id, the id is an integer
    return f'Post {post_id}'

@app.route('/path/<path:subpath>')
def show_subpath(subpath):
    # show the subpath after /path/
    return f'Subpath {subpath}'

Converter types:

string


(default) accepts any text without a slash

int


accepts positive integers

float


accepts positive floating point values

path


like string but also accepts slashes

uuid


accepts UUID strings
Unique URLs / Redirection Behavior

The following two rules differ in their use of a trailing slash.

@app.route('/projects/')
def projects():
    return 'The project page'

@app.route('/about')
def about():
    return 'The about page'

The canonical URL for the projects endpoint has a trailing slash. It’s similar to a folder in a file system. If you access the URL without a trailing slash, Flask redirects you to the canonical URL with the trailing slash.

The canonical URL for the about endpoint does not have a trailing slash. It’s similar to the pathname of a file. Accessing the URL with a trailing slash produces a 404 “Not Found” error. This helps keep URLs unique for these resources, which helps search engines avoid indexing the same page twice.
URL Building

To build a URL to a specific function, use the url_for() function. It accepts the name of the function as its first argument and any number of keyword arguments, each corresponding to a variable part of the URL rule. Unknown variable parts are appended to the URL as query parameters.

Why would you want to build URLs using the URL reversing function url_for() instead of hard-coding them into your templates?

    Reversing is often more descriptive than hard-coding the URLs.

    You can change your URLs in one go instead of needing to remember to manually change hard-coded URLs.

    URL building handles escaping of special characters and Unicode data transparently.

    The generated paths are always absolute, avoiding unexpected behavior of relative paths in browsers.

    If your application is placed outside the URL root, for example, in /myapplication instead of /, url_for() properly handles that for you.

For example, here we use the test_request_context() method to try out url_for(). test_request_context() tells Flask to behave as though it’s handling a request even while we use a Python shell. See Context Locals.

from flask import url_for

@app.route('/')
def index():
    return 'index'

@app.route('/login')
def login():
    return 'login'

@app.route('/user/<username>')
def profile(username):
    return f'{username}\'s profile'

with app.test_request_context():
    print(url_for('index'))
    print(url_for('login'))
    print(url_for('login', next='/'))
    print(url_for('profile', username='John Doe'))

/
/login
/login?next=/
/user/John%20Doe

HTTP Methods

Web applications use different HTTP methods when accessing URLs. You should familiarize yourself with the HTTP methods as you work with Flask. By default, a route only answers to GET requests. You can use the methods argument of the route() decorator to handle different HTTP methods.

from flask import request

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        return do_the_login()
    else:
        return show_the_login_form()

If GET is present, Flask automatically adds support for the HEAD method and handles HEAD requests according to the HTTP RFC. Likewise, OPTIONS is automatically implemented for you.
Static Files

Dynamic web applications also need static files. That’s usually where the CSS and JavaScript files are coming from. Ideally your web server is configured to serve them for you, but during development Flask can do that as well. Just create a folder called static in your package or next to your module and it will be available at /static on the application.

To generate URLs for static files, use the special 'static' endpoint name:

url_for('static', filename='style.css')

The file has to be stored on the filesystem as static/style.css.
Rendering Templates

Generating HTML from within Python is not fun, and actually pretty cumbersome because you have to do the HTML escaping on your own to keep the application secure. Because of that Flask configures the Jinja2 template engine for you automatically.

To render a template you can use the render_template() method. All you have to do is provide the name of the template and the variables you want to pass to the template engine as keyword arguments. Here’s a simple example of how to render a template:

from flask import render_template

@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)

Flask will look for templates in the templates folder. So if your application is a module, this folder is next to that module, if it’s a package it’s actually inside your package:

Case 1: a module:

/application.py
/templates
    /hello.html

Case 2: a package:

/application
    /__init__.py
    /templates
        /hello.html

For templates you can use the full power of Jinja2 templates. Head over to the official Jinja2 Template Documentation for more information.

Here is an example template:

<!doctype html>
<title>Hello from Flask</title>
{% if name %}
  <h1>Hello {{ name }}!</h1>
{% else %}
  <h1>Hello, World!</h1>
{% endif %}

Inside templates you also have access to the request, session and g 1 objects as well as the get_flashed_messages() function.

Templates are especially useful if inheritance is used. If you want to know how that works, head over to the Template Inheritance pattern documentation. Basically template inheritance makes it possible to keep certain elements on each page (like header, navigation and footer).

Automatic escaping is enabled, so if name contains HTML it will be escaped automatically. If you can trust a variable and you know that it will be safe HTML (for example because it came from a module that converts wiki markup to HTML) you can mark it as safe by using the Markup class or by using the |safe filter in the template. Head over to the Jinja 2 documentation for more examples.

Here is a basic introduction to how the Markup class works:

>>> from markupsafe import Markup
>>> Markup('<strong>Hello %s!</strong>') % '<blink>hacker</blink>'
Markup(u'<strong>Hello &lt;blink&gt;hacker&lt;/blink&gt;!</strong>')
>>> Markup.escape('<blink>hacker</blink>')
Markup(u'&lt;blink&gt;hacker&lt;/blink&gt;')
>>> Markup('<em>Marked up</em> &raquo; HTML').striptags()
u'Marked up \xbb HTML'

Changelog

1

    Unsure what that g object is? It’s something in which you can store information for your own needs, check the documentation of that object (g) and the Using SQLite 3 with Flask for more information.

Accessing Request Data

For web applications it’s crucial to react to the data a client sends to the server. In Flask this information is provided by the global request object. If you have some experience with Python you might be wondering how that object can be global and how Flask manages to still be threadsafe. The answer is context locals:
Context Locals

Insider Information

If you want to understand how that works and how you can implement tests with context locals, read this section, otherwise just skip it.

Certain objects in Flask are global objects, but not of the usual kind. These objects are actually proxies to objects that are local to a specific context. What a mouthful. But that is actually quite easy to understand.

Imagine the context being the handling thread. A request comes in and the web server decides to spawn a new thread (or something else, the underlying object is capable of dealing with concurrency systems other than threads). When Flask starts its internal request handling it figures out that the current thread is the active context and binds the current application and the WSGI environments to that context (thread). It does that in an intelligent way so that one application can invoke another application without breaking.

So what does this mean to you? Basically you can completely ignore that this is the case unless you are doing something like unit testing. You will notice that code which depends on a request object will suddenly break because there is no request object. The solution is creating a request object yourself and binding it to the context. The easiest solution for unit testing is to use the test_request_context() context manager. In combination with the with statement it will bind a test request so that you can interact with it. Here is an example:

from flask import request

with app.test_request_context('/hello', method='POST'):
    # now you can do something with the request until the
    # end of the with block, such as basic assertions:
    assert request.path == '/hello'
    assert request.method == 'POST'

The other possibility is passing a whole WSGI environment to the request_context() method:

with app.request_context(environ):
    assert request.method == 'POST'

The Request Object

The request object is documented in the API section and we will not cover it here in detail (see Request). Here is a broad overview of some of the most common operations. First of all you have to import it from the flask module:

from flask import request

The current request method is available by using the method attribute. To access form data (data transmitted in a POST or PUT request) you can use the form attribute. Here is a full example of the two attributes mentioned above:

@app.route('/login', methods=['POST', 'GET'])
def login():
    error = None
    if request.method == 'POST':
        if valid_login(request.form['username'],
                       request.form['password']):
            return log_the_user_in(request.form['username'])
        else:
            error = 'Invalid username/password'
    # the code below is executed if the request method
    # was GET or the credentials were invalid
    return render_template('login.html', error=error)

What happens if the key does not exist in the form attribute? In that case a special KeyError is raised. You can catch it like a standard KeyError but if you don’t do that, a HTTP 400 Bad Request error page is shown instead. So for many situations you don’t have to deal with that problem.

To access parameters submitted in the URL (?key=value) you can use the args attribute:

searchword = request.args.get('key', '')

We recommend accessing URL parameters with get or by catching the KeyError because users might change the URL and presenting them a 400 bad request page in that case is not user friendly.

For a full list of methods and attributes of the request object, head over to the Request documentation.
File Uploads

You can handle uploaded files with Flask easily. Just make sure not to forget to set the enctype="multipart/form-data" attribute on your HTML form, otherwise the browser will not transmit your files at all.

Uploaded files are stored in memory or at a temporary location on the filesystem. You can access those files by looking at the files attribute on the request object. Each uploaded file is stored in that dictionary. It behaves just like a standard Python file object, but it also has a save() method that allows you to store that file on the filesystem of the server. Here is a simple example showing how that works:

from flask import request

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        f = request.files['the_file']
        f.save('/var/www/uploads/uploaded_file.txt')
    ...

If you want to know how the file was named on the client before it was uploaded to your application, you can access the filename attribute. However please keep in mind that this value can be forged so never ever trust that value. If you want to use the filename of the client to store the file on the server, pass it through the secure_filename() function that Werkzeug provides for you:

from werkzeug.utils import secure_filename

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        f = request.files['the_file']
        f.save('/var/www/uploads/' + secure_filename(f.filename))
    ...

For some better examples, checkout the Uploading Files pattern.
Cookies

To access cookies you can use the cookies attribute. To set cookies you can use the set_cookie method of response objects. The cookies attribute of request objects is a dictionary with all the cookies the client transmits. If you want to use sessions, do not use the cookies directly but instead use the Sessions in Flask that add some security on top of cookies for you.

Reading cookies:

from flask import request

@app.route('/')
def index():
    username = request.cookies.get('username')
    # use cookies.get(key) instead of cookies[key] to not get a
    # KeyError if the cookie is missing.

Storing cookies:

from flask import make_response

@app.route('/')
def index():
    resp = make_response(render_template(...))
    resp.set_cookie('username', 'the username')
    return resp

Note that cookies are set on response objects. Since you normally just return strings from the view functions Flask will convert them into response objects for you. If you explicitly want to do that you can use the make_response() function and then modify it.

Sometimes you might want to set a cookie at a point where the response object does not exist yet. This is possible by utilizing the Deferred Request Callbacks pattern.

For this also see About Responses.
Redirects and Errors

To redirect a user to another endpoint, use the redirect() function; to abort a request early with an error code, use the abort() function:

from flask import abort, redirect, url_for

@app.route('/')
def index():
    return redirect(url_for('login'))

@app.route('/login')
def login():
    abort(401)
    this_is_never_executed()

This is a rather pointless example because a user will be redirected from the index to a page they cannot access (401 means access denied) but it shows how that works.

By default a black and white error page is shown for each error code. If you want to customize the error page, you can use the errorhandler() decorator:

from flask import render_template

@app.errorhandler(404)
def page_not_found(error):
    return render_template('page_not_found.html'), 404

Note the 404 after the render_template() call. This tells Flask that the status code of that page should be 404 which means not found. By default 200 is assumed which translates to: all went well.

See Error handlers for more details.
About Responses

The return value from a view function is automatically converted into a response object for you. If the return value is a string it’s converted into a response object with the string as response body, a 200 OK status code and a text/html mimetype. If the return value is a dict, jsonify() is called to produce a response. The logic that Flask applies to converting return values into response objects is as follows:

    If a response object of the correct type is returned it’s directly returned from the view.

    If it’s a string, a response object is created with that data and the default parameters.

    If it’s a dict, a response object is created using jsonify.

    If a tuple is returned the items in the tuple can provide extra information. Such tuples have to be in the form (response, status), (response, headers), or (response, status, headers). The status value will override the status code and headers can be a list or dictionary of additional header values.

    If none of that works, Flask will assume the return value is a valid WSGI application and convert that into a response object.

If you want to get hold of the resulting response object inside the view you can use the make_response() function.

Imagine you have a view like this:

from flask import render_template

@app.errorhandler(404)
def not_found(error):
    return render_template('error.html'), 404

You just need to wrap the return expression with make_response() and get the response object to modify it, then return it:

from flask import make_response

@app.errorhandler(404)
def not_found(error):
    resp = make_response(render_template('error.html'), 404)
    resp.headers['X-Something'] = 'A value'
    return resp

APIs with JSON

A common response format when writing an API is JSON. It’s easy to get started writing such an API with Flask. If you return a dict from a view, it will be converted to a JSON response.

@app.route("/me")
def me_api():
    user = get_current_user()
    return {
        "username": user.username,
        "theme": user.theme,
        "image": url_for("user_image", filename=user.image),
    }

Depending on your API design, you may want to create JSON responses for types other than dict. In that case, use the jsonify() function, which will serialize any supported JSON data type. Or look into Flask community extensions that support more complex applications.

from flask import jsonify

@app.route("/users")
def users_api():
    users = get_all_users()
    return jsonify([user.to_json() for user in users])

Sessions

In addition to the request object there is also a second object called session which allows you to store information specific to a user from one request to the next. This is implemented on top of cookies for you and signs the cookies cryptographically. What this means is that the user could look at the contents of your cookie but not modify it, unless they know the secret key used for signing.

In order to use sessions you have to set a secret key. Here is how sessions work:

from flask import session

# Set the secret key to some random bytes. Keep this really secret!
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

@app.route('/')
def index():
    if 'username' in session:
        return f'Logged in as {session["username"]}'
    return 'You are not logged in'

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        session['username'] = request.form['username']
        return redirect(url_for('index'))
    return '''
        <form method="post">
            <p><input type=text name=username>
            <p><input type=submit value=Login>
        </form>
    '''

@app.route('/logout')
def logout():
    # remove the username from the session if it's there
    session.pop('username', None)
    return redirect(url_for('index'))

How to generate good secret keys

A secret key should be as random as possible. Your operating system has ways to generate pretty random data based on a cryptographic random generator. Use the following command to quickly generate a value for Flask.secret_key (or SECRET_KEY):

$ python -c 'import os; print(os.urandom(16))'
b'_5#y2L"F4Q8z\n\xec]/'

A note on cookie-based sessions: Flask will take the values you put into the session object and serialize them into a cookie. If you are finding some values do not persist across requests, cookies are indeed enabled, and you are not getting a clear error message, check the size of the cookie in your page responses compared to the size supported by web browsers.

Besides the default client-side based sessions, if you want to handle sessions on the server-side instead, there are several Flask extensions that support this.
Message Flashing

Good applications and user interfaces are all about feedback. If the user does not get enough feedback they will probably end up hating the application. Flask provides a really simple way to give feedback to a user with the flashing system. The flashing system basically makes it possible to record a message at the end of a request and access it on the next (and only the next) request. This is usually combined with a layout template to expose the message.

To flash a message use the flash() method, to get hold of the messages you can use get_flashed_messages() which is also available in the templates. Check out the Message Flashing for a full example.
Logging
Changelog

Sometimes you might be in a situation where you deal with data that should be correct, but actually is not. For example you may have some client-side code that sends an HTTP request to the server but it’s obviously malformed. This might be caused by a user tampering with the data, or the client code failing. Most of the time it’s okay to reply with 400 Bad Request in that situation, but sometimes that won’t do and the code has to continue working.

You may still want to log that something fishy happened. This is where loggers come in handy. As of Flask 0.3 a logger is preconfigured for you to use.

Here are some example log calls:

app.logger.debug('A value for debugging')
app.logger.warning('A warning occurred (%d apples)', 42)
app.logger.error('An error occurred')

The attached logger is a standard logging Logger, so head over to the official logging docs for more information.

Read more on Application Errors.
Hooking in WSGI Middleware

To add WSGI middleware to your Flask application, wrap the application’s wsgi_app attribute. For example, to apply Werkzeug’s ProxyFix middleware for running behind Nginx:

from werkzeug.middleware.proxy_fix import ProxyFix
app.wsgi_app = ProxyFix(app.wsgi_app)

Wrapping app.wsgi_app instead of app means that app still points at your Flask application, not at the middleware, so you can continue to use and configure app directly.
Using Flask Extensions

Extensions are packages that help you accomplish common tasks. For example, Flask-SQLAlchemy provides SQLAlchemy support that makes it simple and easy to use with Flask.

For more on Flask extensions, have a look at Extensions.
Deploying to a Web Server

Ready to deploy your new Flask app? Go to Deployment Options.
Tutorial
Project Layout

Create a project directory and enter it:

$ mkdir flask-tutorial
$ cd flask-tutorial

Then follow the installation instructions to set up a Python virtual environment and install Flask for your project.

The tutorial will assume you’re working from the flask-tutorial directory from now on. The file names at the top of each code block are relative to this directory.

A Flask application can be as simple as a single file.
hello.py

from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello():
    return 'Hello, World!'

However, as a project gets bigger, it becomes overwhelming to keep all the code in one file. Python projects use packages to organize code into multiple modules that can be imported where needed, and the tutorial will do this as well.

The project directory will contain:

    flaskr/, a Python package containing your application code and files.

    tests/, a directory containing test modules.

    venv/, a Python virtual environment where Flask and other dependencies are installed.

    Installation files telling Python how to install your project.

    Version control config, such as git. You should make a habit of using some type of version control for all your projects, no matter the size.

    Any other project files you might add in the future.

By the end, your project layout will look like this:

/home/user/Projects/flask-tutorial
├── flaskr/
│   ├── __init__.py
│   ├── db.py
│   ├── schema.sql
│   ├── auth.py
│   ├── blog.py
│   ├── templates/
│   │   ├── base.html
│   │   ├── auth/
│   │   │   ├── login.html
│   │   │   └── register.html
│   │   └── blog/
│   │       ├── create.html
│   │       ├── index.html
│   │       └── update.html
│   └── static/
│       └── style.css
├── tests/
│   ├── conftest.py
│   ├── data.sql
│   ├── test_factory.py
│   ├── test_db.py
│   ├── test_auth.py
│   └── test_blog.py
├── venv/
├── setup.py
└── MANIFEST.in

If you’re using version control, the following files that are generated while running your project should be ignored. There may be other files based on the editor you use. In general, ignore files that you didn’t write. For example, with git:
.gitignore

venv/

*.pyc
__pycache__/

instance/

.pytest_cache/
.coverage
htmlcov/

dist/
build/
*.egg-info/

Continue to Application Setup.
Application Setup

A Flask application is an instance of the Flask class. Everything about the application, such as configuration and URLs, will be registered with this class.

The most straightforward way to create a Flask application is to create a global Flask instance directly at the top of your code, like how the “Hello, World!” example did on the previous page. While this is simple and useful in some cases, it can cause some tricky issues as the project grows.

Instead of creating a Flask instance globally, you will create it inside a function. This function is known as the application factory. Any configuration, registration, and other setup the application needs will happen inside the function, then the application will be returned.
The Application Factory

It’s time to start coding! Create the flaskr directory and add the __init__.py file. The __init__.py serves double duty: it will contain the application factory, and it tells Python that the flaskr directory should be treated as a package.

$ mkdir flaskr

flaskr/__init__.py

import os

from flask import Flask


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    return app

create_app is the application factory function. You’ll add to it later in the tutorial, but it already does a lot.

    app = Flask(__name__, instance_relative_config=True) creates the Flask instance.

        __name__ is the name of the current Python module. The app needs to know where it’s located to set up some paths, and __name__ is a convenient way to tell it that.

        instance_relative_config=True tells the app that configuration files are relative to the instance folder. The instance folder is located outside the flaskr package and can hold local data that shouldn’t be committed to version control, such as configuration secrets and the database file.

    app.config.from_mapping() sets some default configuration that the app will use:

        SECRET_KEY is used by Flask and extensions to keep data safe. It’s set to 'dev' to provide a convenient value during development, but it should be overridden with a random value when deploying.

        DATABASE is the path where the SQLite database file will be saved. It’s under app.instance_path, which is the path that Flask has chosen for the instance folder. You’ll learn more about the database in the next section.

    app.config.from_pyfile() overrides the default configuration with values taken from the config.py file in the instance folder if it exists. For example, when deploying, this can be used to set a real SECRET_KEY.

        test_config can also be passed to the factory, and will be used instead of the instance configuration. This is so the tests you’ll write later in the tutorial can be configured independently of any development values you have configured.

    os.makedirs() ensures that app.instance_path exists. Flask doesn’t create the instance folder automatically, but it needs to be created because your project will create the SQLite database file there.

    @app.route() creates a simple route so you can see the application working before getting into the rest of the tutorial. It creates a connection between the URL /hello and a function that returns a response, the string 'Hello, World!' in this case.

Run The Application

Now you can run your application using the flask command. From the terminal, tell Flask where to find your application, then run it in development mode. Remember, you should still be in the top-level flask-tutorial directory, not the flaskr package.

Development mode shows an interactive debugger whenever a page raises an exception, and restarts the server whenever you make changes to the code. You can leave it running and just reload the browser page as you follow the tutorial.

For Linux and Mac:

$ export FLASK_APP=flaskr
$ export FLASK_ENV=development
$ flask run

For Windows cmd, use set instead of export:

> set FLASK_APP=flaskr
> set FLASK_ENV=development
> flask run

For Windows PowerShell, use $env: instead of export:

> $env:FLASK_APP = "flaskr"
> $env:FLASK_ENV = "development"
> flask run

You’ll see output similar to this:

* Serving Flask app "flaskr"
* Environment: development
* Debug mode: on
* Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
* Restarting with stat
* Debugger is active!
* Debugger PIN: 855-212-761

Visit http://127.0.0.1:5000/hello in a browser and you should see the “Hello, World!” message. Congratulations, you’re now running your Flask web application!

Continue to Define and Access the Database.
Define and Access the Database

The application will use a SQLite database to store users and posts. Python comes with built-in support for SQLite in the sqlite3 module.

SQLite is convenient because it doesn’t require setting up a separate database server and is built-in to Python. However, if concurrent requests try to write to the database at the same time, they will slow down as each write happens sequentially. Small applications won’t notice this. Once you become big, you may want to switch to a different database.

The tutorial doesn’t go into detail about SQL. If you are not familiar with it, the SQLite docs describe the language.
Connect to the Database

The first thing to do when working with a SQLite database (and most other Python database libraries) is to create a connection to it. Any queries and operations are performed using the connection, which is closed after the work is finished.

In web applications this connection is typically tied to the request. It is created at some point when handling a request, and closed before the response is sent.
flaskr/db.py

import sqlite3

import click
from flask import current_app, g
from flask.cli import with_appcontext


def get_db():
    if 'db' not in g:
        g.db = sqlite3.connect(
            current_app.config['DATABASE'],
            detect_types=sqlite3.PARSE_DECLTYPES
        )
        g.db.row_factory = sqlite3.Row

    return g.db


def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()

g is a special object that is unique for each request. It is used to store data that might be accessed by multiple functions during the request. The connection is stored and reused instead of creating a new connection if get_db is called a second time in the same request.

current_app is another special object that points to the Flask application handling the request. Since you used an application factory, there is no application object when writing the rest of your code. get_db will be called when the application has been created and is handling a request, so current_app can be used.

sqlite3.connect() establishes a connection to the file pointed at by the DATABASE configuration key. This file doesn’t have to exist yet, and won’t until you initialize the database later.

sqlite3.Row tells the connection to return rows that behave like dicts. This allows accessing the columns by name.

close_db checks if a connection was created by checking if g.db was set. If the connection exists, it is closed. Further down you will tell your application about the close_db function in the application factory so that it is called after each request.
Create the Tables

In SQLite, data is stored in tables and columns. These need to be created before you can store and retrieve data. Flaskr will store users in the user table, and posts in the post table. Create a file with the SQL commands needed to create empty tables:
flaskr/schema.sql

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

Add the Python functions that will run these SQL commands to the db.py file:
flaskr/db.py

def init_db():
    db = get_db()

    with current_app.open_resource('schema.sql') as f:
        db.executescript(f.read().decode('utf8'))


@click.command('init-db')
@with_appcontext
def init_db_command():
    """Clear the existing data and create new tables."""
    init_db()
    click.echo('Initialized the database.')

open_resource() opens a file relative to the flaskr package, which is useful since you won’t necessarily know where that location is when deploying the application later. get_db returns a database connection, which is used to execute the commands read from the file.

click.command() defines a command line command called init-db that calls the init_db function and shows a success message to the user. You can read Command Line Interface to learn more about writing commands.


Register with the Application

The close_db and init_db_command functions need to be registered with the application instance; otherwise, they won’t be used by the application. However, since you’re using a factory function, that instance isn’t available when writing the functions. Instead, write a function that takes an application and does the registration.
flaskr/db.py

def init_app(app):
    app.teardown_appcontext(close_db)
    app.cli.add_command(init_db_command)

app.teardown_appcontext() tells Flask to call that function when cleaning up after returning the response.

app.cli.add_command() adds a new command that can be called with the flask command.

Import and call this function from the factory. Place the new code at the end of the factory function before returning the app.
flaskr/__init__.py

def create_app():
    app = ...
    # existing code omitted

    from . import db
    db.init_app(app)

    return app

Initialize the Database File

Now that init-db has been registered with the app, it can be called using the flask command, similar to the run command from the previous page.

Note

If you’re still running the server from the previous page, you can either stop the server, or run this command in a new terminal. If you use a new terminal, remember to change to your project directory and activate the env as described in Activate the environment. You’ll also need to set FLASK_APP and FLASK_ENV as shown on the previous page.

Run the init-db command:

$ flask init-db
Initialized the database.

There will now be a flaskr.sqlite file in the instance folder in your project.

Continue to Blueprints and Views.
Blueprints and Views

A view function is the code you write to respond to requests to your application. Flask uses patterns to match the incoming request URL to the view that should handle it. The view returns data that Flask turns into an outgoing response. Flask can also go the other direction and generate a URL to a view based on its name and arguments.
Create a Blueprint

A Blueprint is a way to organize a group of related views and other code. Rather than registering views and other code directly with an application, they are registered with a blueprint. Then the blueprint is registered with the application when it is available in the factory function.

Flaskr will have two blueprints, one for authentication functions and one for the blog posts functions. The code for each blueprint will go in a separate module. Since the blog needs to know about authentication, you’ll write the authentication one first.
flaskr/auth.py

import functools

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

from flaskr.db import get_db

bp = Blueprint('auth', __name__, url_prefix='/auth')

This creates a Blueprint named 'auth'. Like the application object, the blueprint needs to know where it’s defined, so __name__ is passed as the second argument. The url_prefix will be prepended to all the URLs associated with the blueprint.

Import and register the blueprint from the factory using app.register_blueprint(). Place the new code at the end of the factory function before returning the app.
flaskr/__init__.py

def create_app():
    app = ...
    # existing code omitted

    from . import auth
    app.register_blueprint(auth.bp)

    return app

The authentication blueprint will have views to register new users and to log in and log out.


The First View: Register

When the user visits the /auth/register URL, the register view will return HTML with a form for them to fill out. When they submit the form, it will validate their input and either show the form again with an error message or create the new user and go to the login page.

For now you will just write the view code. On the next page, you’ll write templates to generate the HTML form.
flaskr/auth.py

@bp.route('/register', methods=('GET', 'POST'))
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        db = get_db()
        error = None

        if not username:
            error = 'Username is required.'
        elif not password:
            error = 'Password is required.'
        elif db.execute(
            'SELECT id FROM user WHERE username = ?', (username,)
        ).fetchone() is not None:
            error = 'User {} is already registered.'.format(username)

        if error is None:
            db.execute(
                'INSERT INTO user (username, password) VALUES (?, ?)',
                (username, generate_password_hash(password))
            )
            db.commit()
            return redirect(url_for('auth.login'))

        flash(error)

    return render_template('auth/register.html')

Here’s what the register view function is doing:

    @bp.route associates the URL /register with the register view function. When Flask receives a request to /auth/register, it will call the register view and use the return value as the response.

    If the user submitted the form, request.method will be 'POST'. In this case, start validating the input.

    request.form is a special type of dict mapping submitted form keys and values. The user will input their username and password.

    Validate that username and password are not empty.

    Validate that username is not already registered by querying the database and checking if a result is returned. db.execute takes a SQL query with ? placeholders for any user input, and a tuple of values to replace the placeholders with. The database library will take care of escaping the values so you are not vulnerable to a SQL injection attack.

    fetchone() returns one row from the query. If the query returned no results, it returns None. Later, fetchall() is used, which returns a list of all results.

    If validation succeeds, insert the new user data into the database. For security, passwords should never be stored in the database directly. Instead, generate_password_hash() is used to securely hash the password, and that hash is stored. Since this query modifies data, db.commit() needs to be called afterwards to save the changes.

    After storing the user, they are redirected to the login page. url_for() generates the URL for the login view based on its name. This is preferable to writing the URL directly as it allows you to change the URL later without changing all code that links to it. redirect() generates a redirect response to the generated URL.

    If validation fails, the error is shown to the user. flash() stores messages that can be retrieved when rendering the template.

    When the user initially navigates to auth/register, or there was a validation error, an HTML page with the registration form should be shown. render_template() will render a template containing the HTML, which you’ll write in the next step of the tutorial.

Login

This view follows the same pattern as the register view above.
flaskr/auth.py

@bp.route('/login', methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        db = get_db()
        error = None
        user = db.execute(
            'SELECT * FROM user WHERE username = ?', (username,)
        ).fetchone()

        if user is None:
            error = 'Incorrect username.'
        elif not check_password_hash(user['password'], password):
            error = 'Incorrect password.'

        if error is None:
            session.clear()
            session['user_id'] = user['id']
            return redirect(url_for('index'))

        flash(error)

    return render_template('auth/login.html')

There are a few differences from the register view:

    The user is queried first and stored in a variable for later use.

    check_password_hash() hashes the submitted password in the same way as the stored hash and securely compares them. If they match, the password is valid.

    session is a dict that stores data across requests. When validation succeeds, the user’s id is stored in a new session. The data is stored in a cookie that is sent to the browser, and the browser then sends it back with subsequent requests. Flask securely signs the data so that it can’t be tampered with.

Now that the user’s id is stored in the session, it will be available on subsequent requests. At the beginning of each request, if a user is logged in their information should be loaded and made available to other views.
flaskr/auth.py

@bp.before_app_request
def load_logged_in_user():
    user_id = session.get('user_id')

    if user_id is None:
        g.user = None
    else:
        g.user = get_db().execute(
            'SELECT * FROM user WHERE id = ?', (user_id,)
        ).fetchone()

bp.before_app_request() registers a function that runs before the view function, no matter what URL is requested. load_logged_in_user checks if a user id is stored in the session and gets that user’s data from the database, storing it on g.user, which lasts for the length of the request. If there is no user id, or if the id doesn’t exist, g.user will be None.
Logout

To log out, you need to remove the user id from the session. Then load_logged_in_user won’t load a user on subsequent requests.
flaskr/auth.py

@bp.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))

Require Authentication in Other Views

Creating, editing, and deleting blog posts will require a user to be logged in. A decorator can be used to check this for each view it’s applied to.
flaskr/auth.py

def login_required(view):
    @functools.wraps(view)
    def wrapped_view(**kwargs):
        if g.user is None:
            return redirect(url_for('auth.login'))

        return view(**kwargs)

    return wrapped_view

This decorator returns a new view function that wraps the original view it’s applied to. The new function checks if a user is loaded and redirects to the login page otherwise. If a user is loaded the original view is called and continues normally. You’ll use this decorator when writing the blog views.


Endpoints and URLs

The url_for() function generates the URL to a view based on a name and arguments. The name associated with a view is also called the endpoint, and by default it’s the same as the name of the view function.

For example, the hello() view that was added to the app factory earlier in the tutorial has the name 'hello' and can be linked to with url_for('hello'). If it took an argument, which you’ll see later, it would be linked to using url_for('hello', who='World').

When using a blueprint, the name of the blueprint is prepended to the name of the function, so the endpoint for the login function you wrote above is 'auth.login' because you added it to the 'auth' blueprint.

Continue to Templates.
Templates

You’ve written the authentication views for your application, but if you’re running the server and try to go to any of the URLs, you’ll see a TemplateNotFound error. That’s because the views are calling render_template(), but you haven’t written the templates yet. The template files will be stored in the templates directory inside the flaskr package.

Templates are files that contain static data as well as placeholders for dynamic data. A template is rendered with specific data to produce a final document. Flask uses the Jinja template library to render templates.

In your application, you will use templates to render HTML which will display in the user’s browser. In Flask, Jinja is configured to autoescape any data that is rendered in HTML templates. This means that it’s safe to render user input; any characters they’ve entered that could mess with the HTML, such as < and > will be escaped with safe values that look the same in the browser but don’t cause unwanted effects.

Jinja looks and behaves mostly like Python. Special delimiters are used to distinguish Jinja syntax from the static data in the template. Anything between {{ and }} is an expression that will be output to the final document. {% and %} denotes a control flow statement like if and for. Unlike Python, blocks are denoted by start and end tags rather than indentation since static text within a block could change indentation.
The Base Layout

Each page in the application will have the same basic layout around a different body. Instead of writing the entire HTML structure in each template, each template will extend a base template and override specific sections.
flaskr/templates/base.html

<!doctype html>
<title>{% block title %}{% endblock %} - Flaskr</title>
<link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">
<nav>
  <h1>Flaskr</h1>
  <ul>
    {% if g.user %}
      <li><span>{{ g.user['username'] }}</span>
      <li><a href="{{ url_for('auth.logout') }}">Log Out</a>
    {% else %}
      <li><a href="{{ url_for('auth.register') }}">Register</a>
      <li><a href="{{ url_for('auth.login') }}">Log In</a>
    {% endif %}
  </ul>
</nav>
<section class="content">
  <header>
    {% block header %}{% endblock %}
  </header>
  {% for message in get_flashed_messages() %}
    <div class="flash">{{ message }}</div>
  {% endfor %}
  {% block content %}{% endblock %}
</section>

g is automatically available in templates. Based on if g.user is set (from load_logged_in_user), either the username and a log out link are displayed, or links to register and log in are displayed. url_for() is also automatically available, and is used to generate URLs to views instead of writing them out manually.

After the page title, and before the content, the template loops over each message returned by get_flashed_messages(). You used flash() in the views to show error messages, and this is the code that will display them.

There are three blocks defined here that will be overridden in the other templates:

    {% block title %} will change the title displayed in the browser’s tab and window title.

    {% block header %} is similar to title but will change the title displayed on the page.

    {% block content %} is where the content of each page goes, such as the login form or a blog post.

The base template is directly in the templates directory. To keep the others organized, the templates for a blueprint will be placed in a directory with the same name as the blueprint.
Register
flaskr/templates/auth/register.html

{% extends 'base.html' %}

{% block header %}
  <h1>{% block title %}Register{% endblock %}</h1>
{% endblock %}

{% block content %}
  <form method="post">
    <label for="username">Username</label>
    <input name="username" id="username" required>
    <label for="password">Password</label>
    <input type="password" name="password" id="password" required>
    <input type="submit" value="Register">
  </form>
{% endblock %}

{% extends 'base.html' %} tells Jinja that this template should replace the blocks from the base template. All the rendered content must appear inside {% block %} tags that override blocks from the base template.

A useful pattern used here is to place {% block title %} inside {% block header %}. This will set the title block and then output the value of it into the header block, so that both the window and page share the same title without writing it twice.

The input tags are using the required attribute here. This tells the browser not to submit the form until those fields are filled in. If the user is using an older browser that doesn’t support that attribute, or if they are using something besides a browser to make requests, you still want to validate the data in the Flask view. It’s important to always fully validate the data on the server, even if the client does some validation as well.
Log In

This is identical to the register template except for the title and submit button.
flaskr/templates/auth/login.html

{% extends 'base.html' %}

{% block header %}
  <h1>{% block title %}Log In{% endblock %}</h1>
{% endblock %}

{% block content %}
  <form method="post">
    <label for="username">Username</label>
    <input name="username" id="username" required>
    <label for="password">Password</label>
    <input type="password" name="password" id="password" required>
    <input type="submit" value="Log In">
  </form>
{% endblock %}

Register A User

Now that the authentication templates are written, you can register a user. Make sure the server is still running (flask run if it’s not), then go to http://127.0.0.1:5000/auth/register.

Try clicking the “Register” button without filling out the form and see that the browser shows an error message. Try removing the required attributes from the register.html template and click “Register” again. Instead of the browser showing an error, the page will reload and the error from flash() in the view will be shown.

Fill out a username and password and you’ll be redirected to the login page. Try entering an incorrect username, or the correct username and incorrect password. If you log in you’ll get an error because there’s no index view to redirect to yet.

Continue to Static Files.
Static Files

The authentication views and templates work, but they look very plain right now. Some CSS can be added to add style to the HTML layout you constructed. The style won’t change, so it’s a static file rather than a template.

Flask automatically adds a static view that takes a path relative to the flaskr/static directory and serves it. The base.html template already has a link to the style.css file:

{{ url_for('static', filename='style.css') }}

Besides CSS, other types of static files might be files with JavaScript functions, or a logo image. They are all placed under the flaskr/static directory and referenced with url_for('static', filename='...').

This tutorial isn’t focused on how to write CSS, so you can just copy the following into the flaskr/static/style.css file:
flaskr/static/style.css

html { font-family: sans-serif; background: #eee; padding: 1rem; }
body { max-width: 960px; margin: 0 auto; background: white; }
h1 { font-family: serif; color: #377ba8; margin: 1rem 0; }
a { color: #377ba8; }
hr { border: none; border-top: 1px solid lightgray; }
nav { background: lightgray; display: flex; align-items: center; padding: 0 0.5rem; }
nav h1 { flex: auto; margin: 0; }
nav h1 a { text-decoration: none; padding: 0.25rem 0.5rem; }
nav ul  { display: flex; list-style: none; margin: 0; padding: 0; }
nav ul li a, nav ul li span, header .action { display: block; padding: 0.5rem; }
.content { padding: 0 1rem 1rem; }
.content > header { border-bottom: 1px solid lightgray; display: flex; align-items: flex-end; }
.content > header h1 { flex: auto; margin: 1rem 0 0.25rem 0; }
.flash { margin: 1em 0; padding: 1em; background: #cae6f6; border: 1px solid #377ba8; }
.post > header { display: flex; align-items: flex-end; font-size: 0.85em; }
.post > header > div:first-of-type { flex: auto; }
.post > header h1 { font-size: 1.5em; margin-bottom: 0; }
.post .about { color: slategray; font-style: italic; }
.post .body { white-space: pre-line; }
.content:last-child { margin-bottom: 0; }
.content form { margin: 1em 0; display: flex; flex-direction: column; }
.content label { font-weight: bold; margin-bottom: 0.5em; }
.content input, .content textarea { margin-bottom: 1em; }
.content textarea { min-height: 12em; resize: vertical; }
input.danger { color: #cc2f2e; }
input[type=submit] { align-self: start; min-width: 10em; }

You can find a less compact version of style.css in the example code.

Go to http://127.0.0.1:5000/auth/login and the page should look like the screenshot below.

[login_page]()

You can read more about CSS from Mozilla’s documentation. If you change a static file, refresh the browser page. If the change doesn’t show up, try clearing your browser’s cache.

Continue to Blog Blueprint.
Blog Blueprint

You’ll use the same techniques you learned about when writing the authentication blueprint to write the blog blueprint. The blog should list all posts, allow logged in users to create posts, and allow the author of a post to edit or delete it.

As you implement each view, keep the development server running. As you save your changes, try going to the URL in your browser and testing them out.
The Blueprint

Define the blueprint and register it in the application factory.
flaskr/blog.py

from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint('blog', __name__)

Import and register the blueprint from the factory using app.register_blueprint(). Place the new code at the end of the factory function before returning the app.
flaskr/__init__.py

def create_app():
    app = ...
    # existing code omitted

    from . import blog
    app.register_blueprint(blog.bp)
    app.add_url_rule('/', endpoint='index')

    return app

Unlike the auth blueprint, the blog blueprint does not have a url_prefix. So the index view will be at /, the create view at /create, and so on. The blog is the main feature of Flaskr, so it makes sense that the blog index will be the main index.

However, the endpoint for the index view defined below will be blog.index. Some of the authentication views referred to a plain index endpoint. app.add_url_rule() associates the endpoint name 'index' with the / url so that url_for('index') or url_for('blog.index') will both work, generating the same / URL either way.

In another application you might give the blog blueprint a url_prefix and define a separate index view in the application factory, similar to the hello view. Then the index and blog.index endpoints and URLs would be different.
Index

The index will show all of the posts, most recent first. A JOIN is used so that the author information from the user table is available in the result.
flaskr/blog.py

@bp.route('/')
def index():
    db = get_db()
    posts = db.execute(
        'SELECT p.id, title, body, created, author_id, username'
        ' FROM post p JOIN user u ON p.author_id = u.id'
        ' ORDER BY created DESC'
    ).fetchall()
    return render_template('blog/index.html', posts=posts)

flaskr/templates/blog/index.html

{% extends 'base.html' %}

{% block header %}
  <h1>{% block title %}Posts{% endblock %}</h1>
  {% if g.user %}
    <a class="action" href="{{ url_for('blog.create') }}">New</a>
  {% endif %}
{% endblock %}

{% block content %}
  {% for post in posts %}
    <article class="post">
      <header>
        <div>
          <h1>{{ post['title'] }}</h1>
          <div class="about">by {{ post['username'] }} on {{ post['created'].strftime('%Y-%m-%d') }}</div>
        </div>
        {% if g.user['id'] == post['author_id'] %}
          <a class="action" href="{{ url_for('blog.update', id=post['id']) }}">Edit</a>
        {% endif %}
      </header>
      <p class="body">{{ post['body'] }}</p>
    </article>
    {% if not loop.last %}
      <hr>
    {% endif %}
  {% endfor %}
{% endblock %}

When a user is logged in, the header block adds a link to the create view. When the user is the author of a post, they’ll see an “Edit” link to the update view for that post. loop.last is a special variable available inside Jinja for loops. It’s used to display a line after each post except the last one, to visually separate them.
Create

The create view works the same as the auth register view. Either the form is displayed, or the posted data is validated and the post is added to the database or an error is shown.

The login_required decorator you wrote earlier is used on the blog views. A user must be logged in to visit these views, otherwise they will be redirected to the login page.
flaskr/blog.py

@bp.route('/create', methods=('GET', 'POST'))
@login_required
def create():
    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']
        error = None

        if not title:
            error = 'Title is required.'

        if error is not None:
            flash(error)
        else:
            db = get_db()
            db.execute(
                'INSERT INTO post (title, body, author_id)'
                ' VALUES (?, ?, ?)',
                (title, body, g.user['id'])
            )
            db.commit()
            return redirect(url_for('blog.index'))

    return render_template('blog/create.html')

flaskr/templates/blog/create.html

{% extends 'base.html' %}

{% block header %}
  <h1>{% block title %}New Post{% endblock %}</h1>
{% endblock %}

{% block content %}
  <form method="post">
    <label for="title">Title</label>
    <input name="title" id="title" value="{{ request.form['title'] }}" required>
    <label for="body">Body</label>
    <textarea name="body" id="body">{{ request.form['body'] }}</textarea>
    <input type="submit" value="Save">
  </form>
{% endblock %}

Update

Both the update and delete views will need to fetch a post by id and check if the author matches the logged in user. To avoid duplicating code, you can write a function to get the post and call it from each view.
flaskr/blog.py

def get_post(id, check_author=True):
    post = get_db().execute(
        'SELECT p.id, title, body, created, author_id, username'
        ' FROM post p JOIN user u ON p.author_id = u.id'
        ' WHERE p.id = ?',
        (id,)
    ).fetchone()

    if post is None:
        abort(404, "Post id {0} doesn't exist.".format(id))

    if check_author and post['author_id'] != g.user['id']:
        abort(403)

    return post

abort() will raise a special exception that returns an HTTP status code. It takes an optional message to show with the error, otherwise a default message is used. 404 means “Not Found”, and 403 means “Forbidden”. (401 means “Unauthorized”, but you redirect to the login page instead of returning that status.)

The check_author argument is defined so that the function can be used to get a post without checking the author. This would be useful if you wrote a view to show an individual post on a page, where the user doesn’t matter because they’re not modifying the post.
flaskr/blog.py

@bp.route('/<int:id>/update', methods=('GET', 'POST'))
@login_required
def update(id):
    post = get_post(id)

    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']
        error = None

        if not title:
            error = 'Title is required.'

        if error is not None:
            flash(error)
        else:
            db = get_db()
            db.execute(
                'UPDATE post SET title = ?, body = ?'
                ' WHERE id = ?',
                (title, body, id)
            )
            db.commit()
            return redirect(url_for('blog.index'))

    return render_template('blog/update.html', post=post)

Unlike the views you’ve written so far, the update function takes an argument, id. That corresponds to the <int:id> in the route. A real URL will look like /1/update. Flask will capture the 1, ensure it’s an int, and pass it as the id argument. If you don’t specify int: and instead do <id>, it will be a string. To generate a URL to the update page, url_for() needs to be passed the id so it knows what to fill in: url_for('blog.update', id=post['id']). This is also in the index.html file above.

The create and update views look very similar. The main difference is that the update view uses a post object and an UPDATE query instead of an INSERT. With some clever refactoring, you could use one view and template for both actions, but for the tutorial it’s clearer to keep them separate.
flaskr/templates/blog/update.html

{% extends 'base.html' %}

{% block header %}
  <h1>{% block title %}Edit "{{ post['title'] }}"{% endblock %}</h1>
{% endblock %}

{% block content %}
  <form method="post">
    <label for="title">Title</label>
    <input name="title" id="title"
      value="{{ request.form['title'] or post['title'] }}" required>
    <label for="body">Body</label>
    <textarea name="body" id="body">{{ request.form['body'] or post['body'] }}</textarea>
    <input type="submit" value="Save">
  </form>
  <hr>
  <form action="{{ url_for('blog.delete', id=post['id']) }}" method="post">
    <input class="danger" type="submit" value="Delete" onclick="return confirm('Are you sure?');">
  </form>
{% endblock %}

This template has two forms. The first posts the edited data to the current page (/<id>/update). The other form contains only a button and specifies an action attribute that posts to the delete view instead. The button uses some JavaScript to show a confirmation dialog before submitting.

The pattern {{ request.form['title'] or post['title'] }} is used to choose what data appears in the form. When the form hasn’t been submitted, the original post data appears, but if invalid form data was posted you want to display that so the user can fix the error, so request.form is used instead. request is another variable that’s automatically available in templates.
Delete

The delete view doesn’t have its own template, the delete button is part of update.html and posts to the /<id>/delete URL. Since there is no template, it will only handle the POST method and then redirect to the index view.
flaskr/blog.py

@bp.route('/<int:id>/delete', methods=('POST',))
@login_required
def delete(id):
    get_post(id)
    db = get_db()
    db.execute('DELETE FROM post WHERE id = ?', (id,))
    db.commit()
    return redirect(url_for('blog.index'))

Congratulations, you’ve now finished writing your application! Take some time to try out everything in the browser. However, there’s still more to do before the project is complete.

Continue to Make the Project Installable.
Make the Project Installable

Making your project installable means that you can build a distribution file and install that in another environment, just like you installed Flask in your project’s environment. This makes deploying your project the same as installing any other library, so you’re using all the standard Python tools to manage everything.

Installing also comes with other benefits that might not be obvious from the tutorial or as a new Python user, including:

    Currently, Python and Flask understand how to use the flaskr package only because you’re running from your project’s directory. Installing means you can import it no matter where you run from.

    You can manage your project’s dependencies just like other packages do, so pip install yourproject.whl installs them.

    Test tools can isolate your test environment from your development environment.

Note

This is being introduced late in the tutorial, but in your future projects you should always start with this.
Describe the Project

The setup.py file describes your project and the files that belong to it.
setup.py

from setuptools import find_packages, setup

setup(
    name='flaskr',
    version='1.0.0',
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'flask',
    ],
)

packages tells Python what package directories (and the Python files they contain) to include. find_packages() finds these directories automatically so you don’t have to type them out. To include other files, such as the static and templates directories, include_package_data is set. Python needs another file named MANIFEST.in to tell what this other data is.
MANIFEST.in

include flaskr/schema.sql
graft flaskr/static
graft flaskr/templates
global-exclude *.pyc

This tells Python to copy everything in the static and templates directories, and the schema.sql file, but to exclude all bytecode files.

See the official packaging guide for another explanation of the files and options used.
Install the Project

Use pip to install your project in the virtual environment.

$ pip install -e .

This tells pip to find setup.py in the current directory and install it in editable or development mode. Editable mode means that as you make changes to your local code, you’ll only need to re-install if you change the metadata about the project, such as its dependencies.

You can observe that the project is now installed with pip list.

$ pip list

Package        Version   Location
-------------- --------- ----------------------------------
click          6.7
Flask          1.0
flaskr         1.0.0     /home/user/Projects/flask-tutorial
itsdangerous   0.24
Jinja2         2.10
MarkupSafe     1.0
pip            9.0.3
setuptools     39.0.1
Werkzeug       0.14.1
wheel          0.30.0

Nothing changes from how you’ve been running your project so far. FLASK_APP is still set to flaskr and flask run still runs the application, but you can call it from anywhere, not just the flask-tutorial directory.

Continue to Test Coverage.

Test Coverage

Writing unit tests for your application lets you check that the code you wrote works the way you expect. Flask provides a test client that simulates requests to the application and returns the response data.

You should test as much of your code as possible. Code in functions only runs when the function is called, and code in branches, such as if blocks, only runs when the condition is met. You want to make sure that each function is tested with data that covers each branch.

The closer you get to 100% coverage, the more comfortable you can be that making a change won’t unexpectedly change other behavior. However, 100% coverage doesn’t guarantee that your application doesn’t have bugs. In particular, it doesn’t test how the user interacts with the application in the browser. Despite this, test coverage is an important tool to use during development.

Note

This is being introduced late in the tutorial, but in your future projects you should test as you develop.

You’ll use pytest and coverage to test and measure your code. Install them both:

$ pip install pytest coverage

Setup and Fixtures

The test code is located in the tests directory. This directory is next to the flaskr package, not inside it. The tests/conftest.py file contains setup functions called fixtures that each test will use. Tests are in Python modules that start with test_, and each test function in those modules also starts with test_.

Each test will create a new temporary database file and populate some data that will be used in the tests. Write a SQL file to insert that data.
tests/data.sql

INSERT INTO user (username, password)
VALUES
  ('test', 'pbkdf2:sha256:50000$TCI4GzcX$0de171a4f4dac32e3364c7ddc7c14f3e2fa61f2d17574483f7ffbb431b4acb2f'),
  ('other', 'pbkdf2:sha256:50000$kJPKsz6N$d2d4784f1b030a9761f5ccaeeaca413f27f2ecb76d6168407af962ddce849f79');

INSERT INTO post (title, body, author_id, created)
VALUES
  ('test title', 'test' || x'0a' || 'body', 1, '2018-01-01 00:00:00');

The app fixture will call the factory and pass test_config to configure the application and database for testing instead of using your local development configuration.
tests/conftest.py

import os
import tempfile

import pytest
from flaskr import create_app
from flaskr.db import get_db, init_db

with open(os.path.join(os.path.dirname(__file__), 'data.sql'), 'rb') as f:
    _data_sql = f.read().decode('utf8')


@pytest.fixture
def app():
    db_fd, db_path = tempfile.mkstemp()

    app = create_app({
        'TESTING': True,
        'DATABASE': db_path,
    })

    with app.app_context():
        init_db()
        get_db().executescript(_data_sql)

    yield app

    os.close(db_fd)
    os.unlink(db_path)


@pytest.fixture
def client(app):
    return app.test_client()


@pytest.fixture
def runner(app):
    return app.test_cli_runner()

tempfile.mkstemp() creates and opens a temporary file, returning the file object and the path to it. The DATABASE path is overridden so it points to this temporary path instead of the instance folder. After setting the path, the database tables are created and the test data is inserted. After the test is over, the temporary file is closed and removed.

TESTING tells Flask that the app is in test mode. Flask changes some internal behavior so it’s easier to test, and other extensions can also use the flag to make testing them easier.

The client fixture calls app.test_client() with the application object created by the app fixture. Tests will use the client to make requests to the application without running the server.

The runner fixture is similar to client. app.test_cli_runner() creates a runner that can call the Click commands registered with the application.

Pytest uses fixtures by matching their function names with the names of arguments in the test functions. For example, the test_hello function you’ll write next takes a client argument. Pytest matches that with the client fixture function, calls it, and passes the returned value to the test function.
Factory

There’s not much to test about the factory itself. Most of the code will be executed for each test already, so if something fails the other tests will notice.

The only behavior that can change is passing test config. If config is not passed, there should be some default configuration, otherwise the configuration should be overridden.
tests/test_factory.py

from flaskr import create_app


def test_config():
    assert not create_app().testing
    assert create_app({'TESTING': True}).testing


def test_hello(client):
    response = client.get('/hello')
    assert response.data == b'Hello, World!'

You added the hello route as an example when writing the factory at the beginning of the tutorial. It returns “Hello, World!”, so the test checks that the response data matches.
Database

Within an application context, get_db should return the same connection each time it’s called. After the context, the connection should be closed.
tests/test_db.py

import sqlite3

import pytest
from flaskr.db import get_db


def test_get_close_db(app):
    with app.app_context():
        db = get_db()
        assert db is get_db()

    with pytest.raises(sqlite3.ProgrammingError) as e:
        db.execute('SELECT 1')

    assert 'closed' in str(e.value)

The init-db command should call the init_db function and output a message.
tests/test_db.py

def test_init_db_command(runner, monkeypatch):
    class Recorder(object):
        called = False

    def fake_init_db():
        Recorder.called = True

    monkeypatch.setattr('flaskr.db.init_db', fake_init_db)
    result = runner.invoke(args=['init-db'])
    assert 'Initialized' in result.output
    assert Recorder.called

This test uses Pytest’s monkeypatch fixture to replace the init_db function with one that records that it’s been called. The runner fixture you wrote above is used to call the init-db command by name.
Authentication

For most of the views, a user needs to be logged in. The easiest way to do this in tests is to make a POST request to the login view with the client. Rather than writing that out every time, you can write a class with methods to do that, and use a fixture to pass it the client for each test.
tests/conftest.py

class AuthActions(object):
    def __init__(self, client):
        self._client = client

    def login(self, username='test', password='test'):
        return self._client.post(
            '/auth/login',
            data={'username': username, 'password': password}
        )

    def logout(self):
        return self._client.get('/auth/logout')


@pytest.fixture
def auth(client):
    return AuthActions(client)

With the auth fixture, you can call auth.login() in a test to log in as the test user, which was inserted as part of the test data in the app fixture.

The register view should render successfully on GET. On POST with valid form data, it should redirect to the login URL and the user’s data should be in the database. Invalid data should display error messages.
tests/test_auth.py

import pytest
from flask import g, session
from flaskr.db import get_db


def test_register(client, app):
    assert client.get('/auth/register').status_code == 200
    response = client.post(
        '/auth/register', data={'username': 'a', 'password': 'a'}
    )
    assert 'http://localhost/auth/login' == response.headers['Location']

    with app.app_context():
        assert get_db().execute(
            "select * from user where username = 'a'",
        ).fetchone() is not None


@pytest.mark.parametrize(('username', 'password', 'message'), (
    ('', '', b'Username is required.'),
    ('a', '', b'Password is required.'),
    ('test', 'test', b'already registered'),
))
def test_register_validate_input(client, username, password, message):
    response = client.post(
        '/auth/register',
        data={'username': username, 'password': password}
    )
    assert message in response.data

client.get() makes a GET request and returns the Response object returned by Flask. Similarly, client.post() makes a POST request, converting the data dict into form data.

To test that the page renders successfully, a simple request is made and checked for a 200 OK status_code. If rendering failed, Flask would return a 500 Internal Server Error code.

headers will have a Location header with the login URL when the register view redirects to the login view.

data contains the body of the response as bytes. If you expect a certain value to render on the page, check that it’s in data. Bytes must be compared to bytes. If you want to compare Unicode text, use get_data(as_text=True) instead.

pytest.mark.parametrize tells Pytest to run the same test function with different arguments. You use it here to test different invalid input and error messages without writing the same code three times.

The tests for the login view are very similar to those for register. Rather than testing the data in the database, session should have user_id set after logging in.
tests/test_auth.py

def test_login(client, auth):
    assert client.get('/auth/login').status_code == 200
    response = auth.login()
    assert response.headers['Location'] == 'http://localhost/'

    with client:
        client.get('/')
        assert session['user_id'] == 1
        assert g.user['username'] == 'test'


@pytest.mark.parametrize(('username', 'password', 'message'), (
    ('a', 'test', b'Incorrect username.'),
    ('test', 'a', b'Incorrect password.'),
))
def test_login_validate_input(auth, username, password, message):
    response = auth.login(username, password)
    assert message in response.data

Using client in a with block allows accessing context variables such as session after the response is returned. Normally, accessing session outside of a request would raise an error.

Testing logout is the opposite of login. session should not contain user_id after logging out.
tests/test_auth.py

def test_logout(client, auth):
    auth.login()

    with client:
        auth.logout()
        assert 'user_id' not in session

Blog

All the blog views use the auth fixture you wrote earlier. Call auth.login() and subsequent requests from the client will be logged in as the test user.

The index view should display information about the post that was added with the test data. When logged in as the author, there should be a link to edit the post.

You can also test some more authentication behavior while testing the index view. When not logged in, each page shows links to log in or register. When logged in, there’s a link to log out.
tests/test_blog.py

import pytest
from flaskr.db import get_db


def test_index(client, auth):
    response = client.get('/')
    assert b"Log In" in response.data
    assert b"Register" in response.data

    auth.login()
    response = client.get('/')
    assert b'Log Out' in response.data
    assert b'test title' in response.data
    assert b'by test on 2018-01-01' in response.data
    assert b'test\nbody' in response.data
    assert b'href="/1/update"' in response.data

A user must be logged in to access the create, update, and delete views. The logged in user must be the author of the post to access update and delete, otherwise a 403 Forbidden status is returned. If a post with the given id doesn’t exist, update and delete should return 404 Not Found.
tests/test_blog.py

@pytest.mark.parametrize('path', (
    '/create',
    '/1/update',
    '/1/delete',
))
def test_login_required(client, path):
    response = client.post(path)
    assert response.headers['Location'] == 'http://localhost/auth/login'


def test_author_required(app, client, auth):
    # change the post author to another user
    with app.app_context():
        db = get_db()
        db.execute('UPDATE post SET author_id = 2 WHERE id = 1')
        db.commit()

    auth.login()
    # current user can't modify other user's post
    assert client.post('/1/update').status_code == 403
    assert client.post('/1/delete').status_code == 403
    # current user doesn't see edit link
    assert b'href="/1/update"' not in client.get('/').data


@pytest.mark.parametrize('path', (
    '/2/update',
    '/2/delete',
))
def test_exists_required(client, auth, path):
    auth.login()
    assert client.post(path).status_code == 404

The create and update views should render and return a 200 OK status for a GET request. When valid data is sent in a POST request, create should insert the new post data into the database, and update should modify the existing data. Both pages should show an error message on invalid data.
tests/test_blog.py

def test_create(client, auth, app):
    auth.login()
    assert client.get('/create').status_code == 200
    client.post('/create', data={'title': 'created', 'body': ''})

    with app.app_context():
        db = get_db()
        count = db.execute('SELECT COUNT(id) FROM post').fetchone()[0]
        assert count == 2


def test_update(client, auth, app):
    auth.login()
    assert client.get('/1/update').status_code == 200
    client.post('/1/update', data={'title': 'updated', 'body': ''})

    with app.app_context():
        db = get_db()
        post = db.execute('SELECT * FROM post WHERE id = 1').fetchone()
        assert post['title'] == 'updated'


@pytest.mark.parametrize('path', (
    '/create',
    '/1/update',
))
def test_create_update_validate(client, auth, path):
    auth.login()
    response = client.post(path, data={'title': '', 'body': ''})
    assert b'Title is required.' in response.data

The delete view should redirect to the index URL and the post should no longer exist in the database.
tests/test_blog.py

def test_delete(client, auth, app):
    auth.login()
    response = client.post('/1/delete')
    assert response.headers['Location'] == 'http://localhost/'

    with app.app_context():
        db = get_db()
        post = db.execute('SELECT * FROM post WHERE id = 1').fetchone()
        assert post is None

Running the Tests

Some extra configuration, which is not required but makes running tests with coverage less verbose, can be added to the project’s setup.cfg file.
setup.cfg

[tool:pytest]
testpaths = tests

[coverage:run]
branch = True
source =
    flaskr

To run the tests, use the pytest command. It will find and run all the test functions you’ve written.

$ pytest

========================= test session starts ==========================
platform linux -- Python 3.6.4, pytest-3.5.0, py-1.5.3, pluggy-0.6.0
rootdir: /home/user/Projects/flask-tutorial, inifile: setup.cfg
collected 23 items

tests/test_auth.py ........                                      [ 34%]
tests/test_blog.py ............                                  [ 86%]
tests/test_db.py ..                                              [ 95%]
tests/test_factory.py ..                                         [100%]

====================== 24 passed in 0.64 seconds =======================

If any tests fail, pytest will show the error that was raised. You can run pytest -v to get a list of each test function rather than dots.

To measure the code coverage of your tests, use the coverage command to run pytest instead of running it directly.

$ coverage run -m pytest

You can either view a simple coverage report in the terminal:

$ coverage report

Name                 Stmts   Miss Branch BrPart  Cover
------------------------------------------------------
flaskr/__init__.py      21      0      2      0   100%
flaskr/auth.py          54      0     22      0   100%
flaskr/blog.py          54      0     16      0   100%
flaskr/db.py            24      0      4      0   100%
------------------------------------------------------
TOTAL                  153      0     44      0   100%

An HTML report allows you to see which lines were covered in each file:

$ coverage html

This generates files in the htmlcov directory. Open htmlcov/index.html in your browser to see the report.

Continue to Deploy to Production.
Deploy to Production

This part of the tutorial assumes you have a server that you want to deploy your application to. It gives an overview of how to create the distribution file and install it, but won’t go into specifics about what server or software to use. You can set up a new environment on your development computer to try out the instructions below, but probably shouldn’t use it for hosting a real public application. See Deployment Options for a list of many different ways to host your application.
Build and Install

When you want to deploy your application elsewhere, you build a distribution file. The current standard for Python distribution is the wheel format, with the .whl extension. Make sure the wheel library is installed first:

$ pip install wheel

Running setup.py with Python gives you a command line tool to issue build-related commands. The bdist_wheel command will build a wheel distribution file.

$ python setup.py bdist_wheel

You can find the file in dist/flaskr-1.0.0-py3-none-any.whl. The file name is the name of the project, the version, and some tags about the file can install.

Copy this file to another machine, set up a new virtualenv, then install the file with pip.

$ pip install flaskr-1.0.0-py3-none-any.whl

Pip will install your project along with its dependencies.

Since this is a different machine, you need to run init-db again to create the database in the instance folder.

$ export FLASK_APP=flaskr
$ flask init-db

When Flask detects that it’s installed (not in editable mode), it uses a different directory for the instance folder. You can find it at venv/var/flaskr-instance instead.
Configure the Secret Key

In the beginning of the tutorial that you gave a default value for SECRET_KEY. This should be changed to some random bytes in production. Otherwise, attackers could use the public 'dev' key to modify the session cookie, or anything else that uses the secret key.

You can use the following command to output a random secret key:

$ python -c 'import os; print(os.urandom(16))'

b'_5#y2L"F4Q8z\n\xec]/'

Create the config.py file in the instance folder, which the factory will read from if it exists. Copy the generated value into it.
venv/var/flaskr-instance/config.py

SECRET_KEY = b'_5#y2L"F4Q8z\n\xec]/'

You can also set any other necessary configuration here, although SECRET_KEY is the only one needed for Flaskr.
Run with a Production Server

When running publicly rather than in development, you should not use the built-in development server (flask run). The development server is provided by Werkzeug for convenience, but is not designed to be particularly efficient, stable, or secure.

Instead, use a production WSGI server. For example, to use Waitress, first install it in the virtual environment:

$ pip install waitress

You need to tell Waitress about your application, but it doesn’t use FLASK_APP like flask run does. You need to tell it to import and call the application factory to get an application object.

$ waitress-serve --call 'flaskr:create_app'

Serving on http://0.0.0.0:8080

See Deployment Options for a list of many different ways to host your application. Waitress is just an example, chosen for the tutorial because it supports both Windows and Linux. There are many more WSGI servers and deployment options that you may choose for your project.

Continue to Keep Developing!.
Keep Developing!

You’ve learned about quite a few Flask and Python concepts throughout the tutorial. Go back and review the tutorial and compare your code with the steps you took to get there. Compare your project to the example project, which might look a bit different due to the step-by-step nature of the tutorial.

There’s a lot more to Flask than what you’ve seen so far. Even so, you’re now equipped to start developing your own web applications. Check out the Quickstart for an overview of what Flask can do, then dive into the docs to keep learning. Flask uses Jinja, Click, Werkzeug, and ItsDangerous behind the scenes, and they all have their own documentation too. You’ll also be interested in Extensions which make tasks like working with the database or validating form data easier and more powerful.

If you want to keep developing your Flaskr project, here are some ideas for what to try next:

    A detail view to show a single post. Click a post’s title to go to its page.

    Like / unlike a post.

    Comments.

    Tags. Clicking a tag shows all the posts with that tag.

    A search box that filters the index page by name.

    Paged display. Only show 5 posts per page.

    Upload an image to go along with a post.

    Format posts using Markdown.

    An RSS feed of new posts.

Have fun and make awesome applications!

This tutorial will walk you through creating a basic blog application called Flaskr. Users will be able to register, log in, create posts, and edit or delete their own posts. You will be able to package and install the application on other computers.

![screenshot]()


