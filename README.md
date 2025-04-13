# Essential Library for Lua (v1.2)

**Essential** is a lightweight and easy-to-use library for Lua that provides a collection of useful functions to simplify common programming tasks. It includes features like logging, colored console output, user input handling, random utilities, and more. See the [Wiki](https://github.com/Jannnn13/lua-essential/wiki/Essential-Wiki)!

## Features

- **Logging**: Log messages with different levels (info, warning, error) and optional colored output.
- **Colored Console Output**: Print messages in various colors using ANSI escape codes.
- **User Input**: Handle yes/no prompts and general user input easily.
- **Random Utilities**: Generate random booleans and more.
- **Console Management**: Clear the console, set the console title, and create typewriter effects.
- **Timing Utilities**: Measure execution time and create delays.
- **File System Utilities**: Make changes to the filesystem.
- **Useless "Fun" functions**: Some stupid functions that are completly useless.

## Installation

1. Download the Essential library using this command:
```sh
curl -o essential.lua https://raw.githubusercontent.com/Jannnn13/lua-essential/main/essential.lua
```

2. Place the `essential.lua` file in your project directory.
3. Require the library in your Lua script:

```lua
local et = require("essential")
```

## Why should you use Essential?
- Essential is lightweight and completely written in Lua, requiring no external dependencies.
- It simplifies coding by providing ready-to-use functions for common tasks.
- You can include it directly in your project folder, and users of your project don't need to install Essential separately.
- Essential is easy to use and highly beginner-friendly.

## Example
Here's an example (you can find a bigger example in the [essential_example.lua](./essential_example.lua) file):
```lua
local et = require(essential)
et.clear()
et.log_file = "log_example.et"
et.log("info", "This is an informational message.")
et.log("warn", "This is a warning message.")
et.log("error", "This is an error message.")
et.wait(5)

if et.yesno("Do you like Lua?") then
    et.cprint("That's great!", "green")
else
    et.cprint("That's bad.", "red")
end

et.typewriter("This is a typewriter effect.", 0.08)
```

## Author
Created by **Jannnn13** in 2025 (04.05)

## License
This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

<img src="https://raw.githubusercontent.com/Jannnn13/Jannnn13/output/snake.svg" alt="Snake animation" />
