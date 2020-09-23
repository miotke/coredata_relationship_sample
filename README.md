# CoreData Relationship Sample

This is a sample project and "test playground" for core data relationships for a different project. This code is by no means "production ready" and was quickly slapped together to show the problem I'm having with core data relationships.

## Overview

There are two core data entities, `Computer` & `Componenet`, each computer can have multiple components therefore there's a `to-many` relationship between `Computer` and `Component`.

## Problem 

Whenever a new component is added, all saved computers receive the new component. What should be happening is just one computer, the computer that is "focused" by the TabView, should be receiving the component. 

# Screenshot 

<p align="center">
  <img src="screenshot.png">
</p>