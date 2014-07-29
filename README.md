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

    form.language_select("language", nil, nil, nil)

Supplying specific countries to be listed instead of all the languages:

    form.language_select("language", [ "English", "Spanish", "French" ], nil, nil)    

Supplying additional languages to be listed, additinally to the default list of languages:

    form.language_select("language", nil, [ "English", "Spanish", "French" ], nil)
    
Supplying priority languages to be listed at the top of the list:

    form.language_select("language", nil, nil [ "English", "Spanish", "French" ])
    

        
    
Copyright (c) 2014 Viduranga Wijesooriya, released under the MIT license
