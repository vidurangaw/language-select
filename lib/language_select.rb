# CountrySelect
module ActionView
  module Helpers
    module FormOptionsHelper

      #Read language json file
      language_file_path = File.expand_path("../languages.json", __FILE__)      
      language_file = File.read(language_file_path)
      language_hash = JSON.parse(language_file)    

      LANGUAGES = language_hash unless const_defined?("LANGUAGES")

      # Return select and option tags for the given object and method, using language_options_for_select to generate the list of option tags.
      def language_select(object, method, priority_languages = nil, specific_languages = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_language_select_tag(priority_languages, specific_languages, options, html_options)
      end

      # Returns a string of option tags for standered languages in the world. 
      # You can also supply an array of languages as 'specific_languages', so that only they will be listed intead of the long list of languages. 
      # You can also supply an array of languages as 'priority_languages', so that they will be listed above the rest of the (long) list.  

      def language_options_for_select(specific = nil, priority_languages = nil, specific_languages = nil)
        language_options = ""

        # Adds the priority languages
        if priority_languages   
          priority_languages_hash = Hash[ LANGUAGES.select{|k, _| priority_languages.include?(k)} ]       
          language_options += options_for_select(priority_languages_hash, specific)
          language_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
          specific=nil if priority_languages.include?(specific)
        end

        if specific_languages
          # Adds the languages specified in the tag
          specific_languages_hash = Hash[ LANGUAGES.select{|k, _| priority_languages.include?(k)} ]  
          language_options += options_for_select(specific_languages_hash, specific)        
        else
          # Adds all the languages in the languages.json file
          language_options += options_for_select(LANGUAGES, specific)    
        end     

        language_options = language_options.html_safe if language_options.respond_to?(:html_safe)
        return language_options
      end
    end
    
    class InstanceTag
      def to_language_select_tag(priority_languages, specific_languages, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            language_options_for_select(value, priority_languages, specific_languages),
            options, value
          ), html_options
        )
      end
    end
    
    class FormBuilder
      def language_select(method, priority_languages = nil, specific_languages = nil, options = {}, html_options = {})
        @template.language_select(@object_name, method, priority_languages, specific_languages, options.merge(:object => @object), html_options)
      end
    end
  end
end