# n8n + Self-Certificate

## Prerequisites

### Prepare .env

Create `.env` and add content below:

```txt
# DOMAIN_NAME and SUBDOMAIN together determine where n8n will be reachable from
# The top level domain to serve from
DOMAIN_NAME=localhost

# The subdomain to serve from
SUBDOMAIN=n8n

# Optional timezone to set which gets used by Cron and other scheduling nodes
# New York is the default value if not set
GENERIC_TIMEZONE=Asia/Bangkok

# The email address to use for the TLS/SSL certificate creation
SSL_EMAIL=your@mail.com
```

### Set local domain name to `hosts` file

Set host name on local machine:

- For Windows OS — Go to `C:\Windows\System32\drivers\etc` and open `hosts` file with **Run as Administrator**.
- For Linux/mac OS — Open file `hosts` by `sudo nano /etc/hosts`.

then add:

```txt
127.0.0.1   n8n.localhost
```

Don't forget save it.

### Install `mkcert`

- Windows OS:

    Open PowerShell with **Run as Administrator** then install `mkcert`:

    ```ps1
    choco install mkcert
    ```

- Linux OS:

    Install `brew` on Linux:

    ```sh
    sudo apt install libnss3-tools
    ```

    then install `mkcert`:

    ```sh
    brew install mkcert
    ```

- macOS:

    Using `brew` install `mkcert`:

    ```sh
    brew install mkcert
    ```

Go to you project, I assume you download this repository into `./workspace`, let's create self-certificate:

```sh
# In ./workspace directory
mkcert -cert-file certs/localhost.crt -key-file certs/localhost.key n8n.localhost
```

You will see final directory structure look like this:

```txt
├───certs
|   ├───localhost.crt
|   └───localhost.key
├───n8n_data
├───.env
├───docker-compose.yml
└───traefik_dynamic.yml
```

## Usage

Stop all services if it's running:

```ps1
docker compose -f .\docker-compose.yml down -v
```

Start all services:

```ps1
docker compose -f .\docker-compose.yml up --build
```

Access via your browser `https://n8n.localhost:55443/`.

Enjoy!!!
