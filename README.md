# y_converter
This Ruby command line utility uses the yamlator.rb library published by @henrik at https://gist.github.com/henrik/293581.

It transforms a nested yaml file into a flat yaml file or the other way round.

This library is born from the frustrating process of dealing with large yaml locale files in a Ruby On Rails application.

One of the nice benefits of this conversion library is that it will also sort all your key alphabetically.

# Usage

## Nested to flat

To transform a nested yaml file to a flat format, use:

    y_converter.rb flat -f </path/to/your_file.yml>

The flat yml file will be saved in the same location as

    path/to/your_file.flat.yml


## Flat to nested

To transform a flat yaml file to a nested format, use:

    y_converter.rb nested -f </path/to/your_file.yml>

The nested yml file will be saved in the same location as

    path/to/your_file.nested.yml

In all cases, your original file will not be touched.

# What is a nested or flat yaml file?

## Nested yaml file

This is the default format used in Rails applications for translation files.

It looks like this:

    fr:
      actions:
        create: Créer
        edit: Modifier
        destroy: Suprrimer


## Flat yaml file

This format is much easier to work with when you need to add keys or locate an existing one.

It looks like this:

    fr.actions.create: Créer
    fr.actions.edit: Modifier
    fr.actions.destroy: Supprimer


# License
This library is licensed under an MIT license.

# Todo

* Simplify the workflow of switching from nested to flat to nested
* Making this a lot more robust than what it currently is
* Detect if a file is in a nested or flat format and do not attemps to flatten an already flat yaml file