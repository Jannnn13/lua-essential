# **Essential Library**

The **Essential Library** (v1.0) is a collection of useful functions designed to simplify Lua programming. It provides tools for logging, colored terminal output, user interaction, time control, and more. The library is lightweight, easy to use, and ideal for small to medium-sized Lua projects.

---

## **Installation**
1. Download the file `essential.lua` by running this command:
   ```bash
   curl -o essential.lua https://raw.githubusercontent.com/Jannnn13/lua-essential/main/essential.lua
   ```

2. Move the file to your projects folder.
3. Add the following line to your Lua script to use the library:
   ```lua
   local et = require("essential")
   ```

---

## **Features**
### **1. Logging**
- Write formatted log messages to the console or a file.
- Supports different log types: `info`, `warn`, `error`.
- Example:
  ```lua
  et.log("info", "This is an informational message.")
  et.log("warn", "This is a warning.")
  et.log("error", "This is an error.")
  ```

- If you set `et.log_file`, it will not only print in the terminal but also write in the file you defined.
- Example:
  ```lua
  et.log_file = "myapp.log"
  et.log("info", "This will be written to 'myapp.log'. ")
### **2. Colored Output**
- Print colored text to the terminal to highlight important information.
- Supported colors: `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`.
- Example:
  ```lua
  et.cprint("This is a red message", "red")
  et.cprint("This is a green message", "green")
  ```

### **3. User Interaction**
- **Yes/No Prompts**:
  ```lua
  if et.yesno("Do you want to continue?") then
      print("User said yes!")
  else
      print("User said no!")
  end
  ```
- **User Input**:
  ```lua
  local name = et.input("What is your name?")
  print("Hello, " .. name .. "!")
  ```

### **4. Terminal Control**
- **Clear the screen**:
  ```lua
  et.clear()
  ```
- **Set the terminal title**:
  ```lua
  et.set_title("My Lua Application")
  ```

### **5. Time Control**
- **Wait for a specific duration**:
  ```lua
  et.wait(2) -- Waits for 2 seconds
  ```
- **Typewriter effect for text output**:
  ```lua
  et.typewriter("Hello, world!", 0.1)
  ```

### **6. Random Functions**
- **Generate random boolean values**:
  ```lua
  if et.random.boolean() then
      print("Random boolean returned true")
  else
      print("Random boolean returned false")
  end
  ```

### **7. Pause**
- Wait for the user to press a key:
  ```lua
  et.pause("Press any key to continue...")
  ```

---

## **Example**
Here is a short example demonstrating some of the library's features:

```lua
local et = require("essential")

et.set_title("Essential Library Demo")
et.clear()

et.cprint("Welcome to the Essential Library Demo!", "cyan")
et.wait(1)

if et.yesno("Do you want to see a typewriter effect?") then
    et.typewriter("This is a typewriter effect!", 0.1)
end

local name = et.input("What is your name?")
et.cprint("Hello, " .. name .. "!", "green")

et.pause("Press any key to exit...")
```

---

## **Why Essential?**
- **Simplicity**: The library is easy to understand and use.
- **Flexibility**: It provides a variety of functions useful in many projects.
- **No Dependencies**: The library uses only standard Lua functions and requires no external libraries.

---

## **License**
The Essential Library is released under the MIT License. It can be freely used, modified, and distributed. See the `LICENSE` file for more details.
