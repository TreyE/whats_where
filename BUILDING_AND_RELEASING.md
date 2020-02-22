# Building and Releasing

This file will point you in the right direction if you just want to build a release or get one deployed.

## Configure Your Keys

**TODO: CORRECT THIS TO TALK ABOUT ENVIRONMENT VARIABLES**

Before doing any builds, for production or otherwise, make sure to edit the `config/prod.secret.exs` file.  It contains two settings where you need to provide secret keys.  These keys are used to encrypt the client side session and the JWT tokens for users.  The two strings you need to replace are specially marked.  Any sufficiently long base64 string of bytes should do, but in a pinch you can generate some values using `mix phx.gen.secret`.  While you should probably keep the values consistent over the application lifetime, the worst that can happen is the user will need to log back in after an application deployment.  Changing the keys doesn't cause any real damage - it just might annoy a user.

## Build and Release Commands

**TODO: Update to include CodeDeploy build commands**

There are a variety of commands available to create release packages:
1. `docker/docker_compile_release` - Cross-compile a stand-alone zip for Debian that you can deploy on your own Debian server.  Contains the application and a file describing how to configure the environment, database, and the environment variables you care about.  Use this when you don't want to deploy to a docker instance, but run it on your own CentOS7 server and host your own database.
2. `compile_release` - Build a release into the '_build' directory.  **This release will be targeted to the machine on which you did the building**.  You should really only use this to see if you can run the server locally and for release debugging.