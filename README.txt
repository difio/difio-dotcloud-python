This is a registration agent for monupco.com preconfigured for
Python applications on DotCloud.

It compiles a list of locally installed Python packages and
sends it to monupco.com.


Installing on your dotCloud application
----------------------------------------

Create an account at http://monupco.com

Add a dependency in your `requirements.txt` file

::

        echo monupco-dotcloud-python >> requirements.txt

Enable the registration script in your postinstall hook. **Note:**
If you are using an "approot" your `postinstall` script should be in the 
directory pointed by the “approot” directive of your `dotcloud.yml`.
For more information about `postinstall` turn to 
http://docs.dotcloud.com/guides/postinstall/.

If a file named `postinstall` doesn't already exist, create it and add the following:

::

        #!/bin/sh
        /home/dotcloud/env/bin/monupco-dotcloud-python

Make `postinstall` executable

::

        chmod a+x postinstall

Commit your changes (if using git):

::

        git add .
        git commit -m "enable monupco registration"

Configure your Monupco userID. You can get it from https://monupco-otb.rhcloud.com/profiles/mine/.

::

        dotcloud var set <app name> MONUPCO_USER_ID=UserID

Generate a unique identifier for this application and save the value as environmental variable.

::
        dotcloud var set <app name> MONUPCO_UUID=`uuidgen`

Then push your application to dotCloud

::

        dotcloud push <app name>

If everything goes well you should see something like:

::

        19:55:10 [www.0] Running postinstall script...
        19:55:13 [www.0] response:200
        19:55:13 [www.0] Monupco: Success, registered/updated application with id 10

That's it, you can now check your application statistics at
http://monupco.com
