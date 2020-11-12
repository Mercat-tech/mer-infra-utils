# Mercat Infrastructure Utils

This is a lot of tools by make the life in the servers more beautiful.
## Installation
Download the repo:

    git clone https://github.com/Drakefsi/mer-infra-utils.git
After, install ruby 2.6 or greater and run:

    bundle install
Rename the file *config.yml.example* to *config.yml* and complete the information inside.

## access
This utils permit to access from bastion server to specific server into the private VPC.
**Usage:** 

    bundle exec access.rb [server-alias] [identity_file]

> *server-alias*: Is the alias specified in config.yml
> 
> *identity_file*: Selects a file from which the identity (private key) for public key authentication is read. The default is ~/.ssh/id_dsa, ~/.ssh/id_ecdsa, ~/.ssh/id_ed25519 and ~/.ssh/id_rsa


