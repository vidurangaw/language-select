# Language Select

Ruby gem to populate language select dropdown list

Provides a simple helper to get an HTML select list of languages.  The list of countries comes from the ISO ISO 639-1 standard (http://www.w3schools.com/tags/ref_language_codes.asp).  


## Installation

Install as a gem using

    gem install language-select

Or put the following in your Gemfile

    gem 'language-select'

## Example

Simple use supplying model and attribute as parameters:

    form.language_select("language", nil, nil)

Supplying priority countries to be placed at the top of the list:

    country_select("language", [ "English", "Spaish", "French" ], nil)

Supplying specific countries to be showm at the list instead of all the languages:

    country_select("language", nil, [ "English", "Spaish", "French" ])
    
    
    
Copyright (c) 2014 Viduranga Wijesooriya, released under the MIT license
