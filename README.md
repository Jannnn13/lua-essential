# **Essential Library**

The **Essential Library** is a collection of useful functions designed to simplify Lua programming. It provides tools for logging, colored terminal output, user interaction, time control, and more. The library is lightweight, easy to use, and ideal for small to medium-sized Lua projects.

---

## **Installation**
1. Download the file essential.lua and save it in your project folder, e.g., in the libs directory.
2. Add the following line to your Lua script to use the library:
   ```lua
   local et = require("libs/essential")
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
