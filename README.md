
 ## Run it
It is a Flask application so in order to run it you can install all requirements and then run the `app.py`.
To install all requirements simply run `pip3 install -r requirements.txt` and then `python3 app.py`.

Or if you prefer you can also run it through docker or docker compose.

 #### Run it through Docker

**Build with**
~~~~
docker build -t vampi_docker:latest .
~~~~
 **and Run** *(remove the -d if you want to see the output in your terminal)*
 ~~~~
docker run -d -p 5000:5000 vampi_docker:latest
 ~~~~

[Note: if you run Docker on newer versions of the MacOS, use `-p 5001:5000` to avoid conflicting with the AirPlay Receiver service. Alternatively, you could disable the AirPlay Receiver service in your System Preferences -> Sharing settings.]

  #### Run it through Docker Compose
`docker-compose` contains two instances, one instance with the secure configuration on port 5001 and another with insecure on port 5002:
~~~~
docker-compose up -d
~~~~

## Customizing token timeout and vulnerable environment or not
If you would like to alter the timeout of the token created after login or if you want to change the environment **not** to be vulnerable then you can use a few ways depending how you run the application.

 - If you run it like normal with `python3 app.py` then all you have to do is edit the `alive` and `vuln` variables defined in the `app.py` itself. The `alive` variable is measured in seconds, so if you put `100`, then the token expires after 100 seconds. The `vuln` variable is like boolean, if you set it to `1` then the application is vulnerable, and if you set it to `0` the application is not vulnerable.
 - If you run it through Docker, then you must either pass environment variables to the `docker run` command or edit the `Dockerfile` and rebuild. 
   - Docker run example: `docker run -d -e vulnerable=0 -e tokentimetolive=300 -p 5000:5000 vampire_docker:latest`
     - One nice feature to running it this way is you can startup a 2nd container with `vulnerable=1` on a different port and flip easily between the two.

   - In the Dockerfile you will find two environment variables being set, the `ENV vulnerable=1` and the `ENV tokentimetolive=60`. Feel free to change it before running the docker build command.

python app.py 2>&1 | tee console.log