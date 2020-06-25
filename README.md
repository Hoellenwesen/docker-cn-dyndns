# docker-dyndns-cn
This docker image provides a DynDNS changer using the CoreNetworks API.

### Quickstart
```
docker run -d -e API_USER='username' -e API_PASS='password' -e ZONE='example.com' -e SUB1='subdomain' sweyer/docker-dyndns-cn:latest
```

### Environment parameters
- API_USER (**required**)
- API_PASS (**required**)
- ZONE (**required**)
- SUB1 (**required**)
- SUB2 (optional)
- SUB3 (optional)
- SUB4 (optional)
#### API user and password
To use this DynDNS changer you need a domain at [Core-Networks](https://www.core-networks.de) and you have to create an API user and password for their DNS API.
#### Zone and subdomain
The ZONE is your registered domain (e.g. example.com) and `SUB1 - SUB4` are the subdomains you want to redirect (e.g. games). DO NOT include the base domain in the SUB variables!
Currently it is pssible to define four subdomains, because it is required in my environment. If you need more fell free to Fork the project on GitHub or send me a message so i can modify the container. 

**The container will not start without the API_USER, API_PASS, ZONE and SUB1 variables.**
### Using Docker Compose
Instead of remembering and typing long chains of parameters and docker options you can create a docker-compose.yml file. Simply run the command `docker-compose up` to bring up the container and then use the command `docker-compose down` to stop and get rid of the container.
### Example
Save this example in a file named `docker-compose.yml`
```
version: '3.3'
services:
  docker-dyndns-cn:
    image: 'sweyer/docker-dyndns-cn:latest'
    container-name: 'dyndns-changer'
    restart: always
    environment:
      - API_USER='username'
      - API_PASS='password'
      - ZONE='example.com'
      - SUB1='subdomain'
```