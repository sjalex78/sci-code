# Sci_Poster_Generator <img src="/app/assets/image/logo.png" alt="drawing" width="300"/>
## General Info
An app for secondary school students studying science to generate printable scientific posters and research posters. The app will also enable student collaboration and for feedback from educators which will help students learn to create science posters and refine their final poster output.

## Table of contents
* [General Info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Development](#development)
* [Peculiarity For Development](#peculiarity-for-development)


## Technologies
Project is created with:
* Rails: 7

## Setup
## Architecture and models
<!-- Give a quick overview of the few core models and how they interact. -->
## Development
<!-- Describe how to get started with the project. Document employed 3rd party
services and how to use them, how to start a development server – just about
anything that a new developer needs to know. -->
## Peculiarity For Development
### Tailwind Build
tailwind was not configuring found that I needed to run the following command to have it render correctly for the html. Still not sure if this will have to happen everytime?

```command
rails tailwindcss:build
```

Running rspec
```command
bundle exec rspec spec\filename
````

Running with tailwind real time update to server
```command
bin/dev ```
