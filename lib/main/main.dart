import 'package:flutter/material.dart';

import 'package:challenge/main/application.dart';
import 'package:challenge/di/app_module.dart';
import 'package:challenge/feature/viacep/route/viacep_route.dart';
import 'package:challenge/feature/viacep/ui/search/search_address_page.dart';

// Project Grow Coding Test Objective:
// ⁃ We want to create cards displaying user details using data from an API call that fetches random user data with each call.
// ⁃ After making these cards with vertical scrolling, we want to implement a horizontal scrolling functionality
// ⁃ Add bonus features if time permits.
// Notes: ⁃ Import whatever libraries you want
// ⁃ Don’t be afraid to look up syntax online
// - Google is your friend!
// Instructions: Prereq: Generate a starting project however you wish
// Step 1 (Create the cards) ⁃ Make 20 calls to the API below to get 20 Users. (This API generates random User data each call)
// ⁃ https://randomuser.me/api/ ⁃ Display 1 card per User from the API response
// ⁃ Populate each card with the User’s name, email, phone number, and picture.
// Step 2 (Add additional features to the cards) ⁃ Show User’s Date of Birth and ID, but use a reveal pattern so they have to toggle something to display these values.
// Step 3 (horizontal scrolling) ⁃ Implement a horizontal
// Step 4 (Add a route to a new page)
// ⁃ Create a route to an “Orders” page, this page should just show placeholder text.
// ⁃ Add a button on the user’s cards called “View orders”. This button should link to the “Orders” page. Bonus Tasks
// ⁃ Based on the user’s details, choose one of the 20 users and disable Orders page
// ⁃ Use observables to have the 20 individual random user calls returned as an array
// ⁃ Allow quick in-place editing of their email (no need to persist, just simple object value update)
// ⁃ Have a "view details" button that also shows address and when they registered
// ⁃ Get creative! Feel free to add even more to this project you think is cool.

void main() async {

  await AppModuleDI.inject();

  runApp(const MyApp());
}