# LibMediaProvider-1.0 [![Current Release](https://img.shields.io/github/release/calamath/LibMediaProvider-1.0.svg)](https://github.com/calamath/LibMediaProvider-1.0/releases) [![GitHub license](https://img.shields.io/github/license/calamath/LibMediaProvider-1.0.svg)](https://github.com/calamath/LibMediaProvider-1.0/blob/master/LICENSE)

LibMediaProvider is inspired by and borrows from LibSharedMedia-3.0, written for World of Warcraft.

This library facilitates the sharing of media (fonts, textures, etc) between addons. An addon can register media with LibMediaProvider, which then turns around and provides that media to any addon requesting media of that type.


## Things To Know

    - The "None" option for borders/backgrounds was removed, as ESO displays a white default texture if no file path is provided. Addons should handle hiding borders/backgrounds on their own through the alpha channel.
    - ESO currently does not support addon custom sounds to the game. Some sounds from the default UI have been provided as choices for your addons to use.
    - Label:SetFont("font") may be used with more than just a pre-defined font from the default UI. It may also take a string that is a combination of a file path, font size, and font style.
    - Ex: label:SetFont("MyAddon/Font/path.ttf|18|soft-shadow-thin")
    - There is currently only one statusbar texture in the game. If you wish to have access to more, they must be provided and registered by an addon.
    - Currently supported media types: background, border, font, statusbar, sound

## API Documentation

**:Register(mediatype, key, data)**

    Registers a new handle of given type.

    Arguments

        mediatype
        string - the type of the data, eg. font or statusbar

        key
        string - the handle to get the data from the lib

        data
        string - the data to associate with the handle; normaly a filename

    Returns

        boolean - false if data for the given mediatype-key pair already existes, true else

**:Fetch(mediatype, key)**

    Fetches the data for the given handle and type.

    Arguments

        mediatype
        string - the type of the data, eg. font or statusbar

        key
        string - the handle to get the data from the lib

    Returns

        string or nil - the data for the given handle or nil

**:IsValid(mediatype [, key])**

    Checks if the given type (and handle) is valid.

    Arguments

        mediatype
        string - the type of the data, eg. font or statusbar

        [key]
        string - the handle of the data

    Returns

        boolean - true if the type (and handle) is valid

**:HashTable(mediatype)**

    Gets a hash table {data -> handle} to eg. iterate over.

    Arguments

        mediatype
        string - the type of the data, eg. font or statusbar

    Returns

        table - hash table for the given type

**:List(mediatype)**

    Gets a sorted list of handles.

    Arguments

        mediatype
        string - the type of the data, eg. font or statusbar

    Returns

        table - list of handles for the given type

**:GetDefault(mediatype)**

    Returns the default return value for nonexistant handles.

    Arguments

        mediatype
        string - the type of the data, eg. font or statusbar

    Returns

        string or nil - default return value for nonexistant handles for the given type

**:SetDefault(type, handle)**

    Sets a default return value for nonexistant handles. Won't replace an already set default.

    Arguments

        type
        string - the type of the data, eg. font or statusbar

        handle
        string - the handle of the data

    Returns
    none

## Callback

**LibMediaProvider_Registered**

    fires when a new handle was successfully registered

    Argumentss

        name
        "LibSharedMedia_Registered"

        mediatype
        the type of the new handle

        key
        the name of the handle

## Predefined Data:
Media from the default UI of the 5 main types is already pre-registered with the library.