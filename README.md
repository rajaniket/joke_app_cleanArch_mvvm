# JokeKeeper - Clean Architecture

## Overview

**JokeKeeper** is a mobile application that delivers a constant stream of geeky jokes to your device. It's built with a focus on clean architecture to ensure code quality and maintainability. Here's a quick rundown:

## Features

- **Real-time Jokes**: JokeKeeper fetches a fresh joke every minute from an open API source.

- **Continuous Updates**: New jokes are automatically added to the list, ensuring you're always entertained.

- **Tidiness**: The app maintains a maximum of 10 jokes to keep things neat and manageable.

- **Freshness**: As new jokes arrive, the oldest ones are gracefully replaced.

- **Persistence**: Even if you close the app, JokeKeeper remembers old jokes, so you don't miss out on any laughs.

## Preview

https://github.com/rajaniket/joke_app_cleanArch_mvvm/assets/40004815/5699642b-4070-4ddb-96d3-6e7b28426d92

## Development Approach

JokeKeeper follows the principles of clean architecture, making it easy to maintain and scale. We've adopted the BLoC (Business Logic Component) pattern for efficient state management.

## Tech Stack

- **Framework**: Flutter
- **State Management**: BLoC (Business Logic Component)

## Local Data Storage

We've implemented Hive for efficient local data storage. This ensures that you can access previously fetched jokes, even when you're offline.



