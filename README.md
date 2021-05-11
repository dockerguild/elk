# ELK Docker

## Search and replace

    <MY_REPOSITORY>         # URL of your GIT repository
    <MY_PROJECT_PATH>       # Path of your application

## Create new project

    git clone git@github.com:dockerguild/elk.git
    cd elk
    rm -fr .git
    git init
    git remote add origin <MY_REPOSITORY>

## Installation

    make install

## Usage

Start containers

    make start

Restart containers

    make restart

Down containers

    make down

Update containers

    make update

## Backup

**Before your must configure** `.make/filesystem` according to your use.

**You must also set up an external backup system !**

Dump containers files

    make filesystem/dump

Restore containers files

    make filesystem/restore
