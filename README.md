# Minecraft Java Server


## Building

To build, run this single command:
```
user@machine:~$ docker buildx bake -f bake.hcl
```

## Running

To run, you'll start the stack and then authorize the onedrive container to sync to your drive.

```
user@machine:~$ docker compose up -d
user@machine:~$ docker exec -it minecraft_server-onedrive-1 onedrive
```

You'll then be prompted to enter a url in your browser to authorize onedrive like so:
```
Configuring Global Azure AD Endpoints
Authorize this app visiting:

https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=d50ca740-c83f-4d1b-b616-12c519384f0c&scope=Files.ReadWrite%20Files.ReadWrite.All%20Sites.ReadWrite.All%20offline_access&response_type=code&prompt=login&redirect_uri=https://login.microsoftonline.com/common/oauth2/nativeclient

Enter the response uri: 
```

Put the link in your browser, then authenticate. After authenticating, paste the url you get afterwards into the prompt. Then you're done and you'll see the following:
```
Application has been successfully authorised, however no additional command switches were provided.

Please use 'onedrive --help' for further assistance in regards to running this application.
```

## Playing

With this setup, you can play your server with `<your ip>:25565`.

## Backing up

Authentication was done to let you back up your world as needed. Just run the following script to push your server settings and world as a `.zip` to your OneDrive:
```
user@machine:~$ ./backup.sh
```

Then your server will be zipped and put on your OneDrive!

## Stopping

To stop the server, use the following command to stop the stack:
```
user@machine:~$ docker compose down
```