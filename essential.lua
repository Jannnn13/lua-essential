-- Essential Library
-- Copyright (c) 2025 Jannnn13
-- Licensed under the MIT License. See LICENSE file for details.

-- This library is a collection of essential functions for Lua programming.
-- It includes functions for logging, color printing, waiting, random boolean generation,
-- user input, and more. The library is designed to be easy to use and can be included in any Lua project.

-- You can use this library by putting it in your project folder and put this line in your code:
-- local et = require("essential")

local et = {} -- Create a table to hold the library functions and variables
et.random = {} -- Table to hold random functions
et.fun = {} -- Table to hold fun functions
et.base64 = {} -- Table to hold base64 functions
et.fs = {} -- Table to hold filesystem functions
et.log_file = nil -- Log file path, set to nil by default
et.version = 1.2 -- Version of the library

et.colors = { -- ANSI color codes
    red = "\27[31m",
    green = "\27[32m",
    yellow = "\27[33m",
    blue = "\27[34m",
    magenta = "\27[35m",
    cyan = "\27[36m",
    white = "\27[37m",
    reset = "\27[0m"
}

et.log_begin = { -- Log message prefixes with colors
    error = "[" .. et.colors.red .."ERROR".. et.colors.reset .. "]: ",
    warn = "[" .. et.colors.yellow .."WARNING".. et.colors.reset .. "]: ",
    info = "[" .. et.colors.green .."INFO".. et.colors.reset .. "]: "
}

et.log_begin_nocolor = { -- Log message prefixes without colors
    error = "[ERROR]: ",
    warn = "[WARNING]: ",
    info = "[INFO]: "
}

function et.log(type, text) -- Logging function
    local log_message -- Initialize log message variable

    if type == "warn" then -- Check if type is "warn"
        log_message = et.log_begin.warn .. text -- Set log message to warning format
    elseif type == "info" then -- Check if type is "info"
        log_message = et.log_begin.info .. text -- Set log message to info format
    elseif type == "error" then -- Check if type is "error"
        log_message = et.log_begin.error .. text -- Set log message to error format
    else
        return -- If type is not recognized, do nothing
    end

    print(log_message) -- Print the log message

    if et.log_file then -- Check if log_file is defined
        local log_file, err = io.open(et.log_file, "a") -- Open the log file in append mode
        if not log_file then -- Check if the file opened successfully
            et.cprint("Failed to open log file: " .. (err or "unknown error"), "red") -- Print error message
            return -- If file opening failed, do nothing
        end

        local timestamp = os.date("[%Y-%m-%d %H:%M:%S] ") --Sets the timestamp, Format: [YYYY-MM-DD HH:MM:SS]

        if type == "warn" then -- Check if type is "warn"
            log_file:write(timestamp .. et.log_begin_nocolor.warn .. text .. "\n") -- Write warning message to log file
        elseif type == "info" then -- Check if type is "info"
            log_file:write(timestamp .. et.log_begin_nocolor.info .. text .. "\n") -- Write info message to log file
        elseif type == "error" then -- Check if type is "error"
            log_file:write(timestamp .. et.log_begin_nocolor.error .. text .. "\n") -- Write error message to log file
        end

        log_file:close() -- Close the log file
    end
end

function et.cprint(text, color) -- Color print function
    print((et.colors[color] or et.colors.white) .. text .. et.colors.reset) -- Prints the text in the specified color
end

function et.wait(seconds) -- Wait function
    local start = os.clock() -- Get the current time
    while os.clock() - start < seconds do -- Loop until the specified time has passed
        -- Do nothing, just wait
    end
end

function et.random.boolean() -- Random boolean function
    return math.random(2) == 2 -- Returns true or false randomly
end

function et.yesno(question) -- Yes/No question function
    if not question then return end -- Check if question is defined

    while true do -- Infinite loop until a valid answer is given
        print("[" .. et.colors.green .. "Y" .. et.colors.reset .. et.colors.red .. "/" .. "n" .. et.colors.reset .. "] " .. question) -- Print the question
        io.write("> ") -- Print the prompt

        local answer = io.read():lower() -- Read the answer and convert it to lowercase
        if answer == "y" or answer == "" then -- Check if the answer is "y" or empty
            return true -- Returns true
        elseif answer == "n" then -- Check if the answer is "n"
            return false --Returns false
        else -- If the answer is neither "y" nor "n"
            et.cprint("Invalid Answer! Please enter Y or N.", "red") -- Print an error message
        end
    end
end

function et.clear() -- Clear the console function
    io.write("\27[2J\27[H") -- ANSI escape code to clear the console
end

function et.set_title(title) -- Set console title function
    io.write("\27]0;" .. title .. "\7") -- ANSI escape code to set console title
end

function et.typewriter(text, delay) -- Typewriter effect function
    for i = 1, #text do -- Loop through each character in the text
        io.write(text:sub(i, i)) -- Print the character
        io.flush() -- Flush the output
        et.wait(delay or 0.05) -- Wait for the specified delay
    end
    print() -- Print a newline after the text
end

function et.input(text) -- Get user input function
    if text then -- Checks if text is defined
        print(text) -- If yes, print the text
    end
    io.write("> ") -- Print the prompt
    local input = io.read() -- Activate the input
    return input -- Return the input
end

function et.pause(message) -- Pause function
    message = message or "Press enter to continue..." -- Default message
    io.write(message) --Prints the message
    io.flush() -- Flushes the output
    local _ = io.read() -- Waits for user input
end

function et.timer(func, ...) -- Timer function
    local start_time = os.clock() -- Start timer
    func(...) -- Call the function
    local end_time = os.clock() -- End timer
    return end_time - start_time -- Return elapsed time
end

function et.random.token(length) -- Random token generation function
    length = length or 16 -- Default length is 16 if not specified
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" -- Define the character set
    local token = "" -- Initialize the token variable

    for i = 1, length do
        local random_index = math.random(1, #charset) --  Generate a random index
        token = token .. charset:sub(random_index, random_index) -- Append the character at the random index to the token
    end

    return token -- Return the generated token
end

function et.fun.rickroll() -- Rickroll function
    et.cprint("Never gonna give you up!", "red")
    et.wait(1.5)
    et.cprint("Never gonna let you down!", "red")
    et.wait(1.5)
    et.cprint("Never gonna run around and desert you!", "red")
    et.wait(2)
    et.cprint("Never gonna make you cry!", "red")
    et.wait(1.5)
    et.cprint("Never gonna say goodbye!", "red")
    et.wait(1.5)
    et.cprint("Never gonna tell a lie and hurt you!", "red")
    et.wait(2)
end

function et.fun.insult() -- Insult function
    local insults = { -- List of insults
        "You're as useful as a screen door on a submarine.",
        "I'd agree with you, but then we'd both be wrong.",
        "You're not stupid; you just have bad luck when it comes to thinking.",
        "If I wanted to hear from an idiot, I'd watch reality TV.",
        "You're proof that even evolution makes mistakes.",
        "I'm not saying you're ugly, but if I had a face like yours, I'd sue my parents.",
        "You're like a software update. Whenever I see you, I think, 'Not now.'",
        "I'd call you a tool, but that implies you're actually useful.",
        "You're the reason God created the middle finger.",
        "You're like a cloud. When you disappear, it's a beautiful day.",
        "I'd explain it to you, but I left my English-to-Dingbat dictionary at home.",
        "You're the reason they put instructions on shampoo bottles.",
        "You're like a software bug. You just keep popping up when I least expect it.",
        "If ignorance is bliss, you must be the happiest person on the planet.",
        "You're like a broken pencil. Pointless.",
        "I'd call you a joke, but that would imply you're funny.",
        "If you look into a mirror and see a face that makes you cringe, congratulations! You're looking at yourself.",
        "You're so fat, you're the reason they invented double doors.",
        "Avatar: The Last Chairbender",
        "You're a tool to clean closed slides.",
        "You have something on your third chin.",
        "You're the reason I have a headache.",
        "You're like a Wi-Fi signal—weak and unreliable.",
        "You're proof that even copy-paste can fail.",
        "You're like a typo in a critical piece of code—annoying and hard to fix.",
        "You're the human equivalent of a 404 error.",
        "You're like a deprecated function—nobody uses you anymore.",
        "You're the reason why Ctrl+Z exists.",
        "You're like a semicolon in Python—completely unnecessary.",
        "You're the kind of person who debugs by adding more bugs.",
        "You're like a printer—always out of ink when needed.",
        "You're the reason why rubber duck debugging was invented.",
        "You're like a corrupted save file—completely useless.",
        "You're like a pop-up ad—nobody wants you around.",
        "You're the reason why people use ad blockers.",
        "You're like a CAPTCHA—annoying and hard to understand.",
        "You're like a memory leak—slowly draining everyone's patience.",
        "You're like a broken keyboard—nothing you say makes sense.",
        "You're like a null pointer—completely pointless.",
        "You're like a syntax error—always in the wrong place at the wrong time.",
        "You're like a blue screen of death—nobody wants to deal with you.",
        "You're like a spam email—unwanted and ignored.",
        "You're like a virus—spreading negativity wherever you go.",
        "You're like a deprecated API—nobody wants to deal with you anymore.",
        "You're like a bug in production—nobody knows how you got here.",
        "You're like a slow internet connection—frustrating and useless.",
        "You're like a missing semicolon—breaking everything around you.",
        "You're like a bad commit—everyone regrets your existence.",
        "You're like a hardcoded value—impossible to work with."
    }
    return insults[math.random(#insults)] -- Return a random insult
end

function et.fun.uwuify(text) -- UWUify function
    local uwu_text = text:gsub("r", "w"):gsub("l", "w") -- Replace 'r' and 'l' with 'w'
    uwu_text = uwu_text:gsub("ove", "uv") -- Replace 'ove' with 'uv'
    uwu_text = uwu_text:gsub("!", " UwU!") -- Add UwU to the end of exclamations
    return uwu_text -- Return the UWUified text
end

function et.base64.decode(data) -- Base64 decode function
    local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/" -- Base64 character set
    data = data:gsub("%s", "") -- Remove whitespace
    local decoded = "" -- Initialize decoded variable

    -- Check for padding
    local padding = data:match("=+$") or ""
    data = data:gsub("=+$", "")

    for i = 1, #data, 4 do
        local a = charset:find(data:sub(i, i)) or 0
        local b = charset:find(data:sub(i + 1, i + 1)) or 0
        local c = charset:find(data:sub(i + 2, i + 2)) or 0
        local d = charset:find(data:sub(i + 3, i + 3)) or 0

        local n = ((a - 1) << 18) +
                  ((b - 1) << 12) +
                  ((c - 1) << 6) +
                  (d - 1)

        decoded = decoded ..
            string.char((n >> 16) & 0xFF) ..
            string.char((n >> 8) & 0xFF) ..
            string.char(n & 0xFF)
    end

    -- Remove padding bytes
    if padding == "=" then
        decoded = decoded:sub(1, -2)
    elseif padding == "==" then
        decoded = decoded:sub(1, -3)
    end

    return decoded
end

function et.base64.encode(data) -- Base64 encode function
    local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/" -- Base64 character set
    local encoded = "" -- Initialize encoded variable
    local padding = ""

    -- Add padding if necessary
    if #data % 3 == 1 then
        data = data .. "\0\0"
        padding = "=="
    elseif #data % 3 == 2 then
        data = data .. "\0"
        padding = "="
    end

    for i = 1, #data, 3 do
        local a, b, c = data:byte(i, i + 2) -- Get the bytes of the chunk
        local n = (a or 0) << 16 | (b or 0) << 8 | (c or 0) -- Combine the bytes into a 24-bit number

        encoded = encoded ..
            charset:sub((n >> 18 & 0x3F) + 1, (n >> 18 & 0x3F) + 1) ..
            charset:sub((n >> 12 & 0x3F) + 1, (n >> 12 & 0x3F) + 1) ..
            charset:sub((n >> 6 & 0x3F) + 1, (n >> 6 & 0x3F) + 1) ..
            charset:sub((n & 0x3F) + 1, (n & 0x3F) + 1)
    end

    return encoded:sub(1, #encoded - #padding) .. padding -- Add padding at the end
end

et.fs.exists = function(path) -- File existence check function
    local file = io.open(path, "r") -- Try to open the file in read mode
    if file then -- If the file exists
        file:close() -- Close the file
        return true -- Return true
    else
        return false -- Return false if the file does not exist
    end
end

et.fs.read = function(path) -- File read function
    local file = io.open(path, "r") -- Try to open the file in read mode
    if file then -- If the file exists
        local content = file:read("*a") -- Read the entire content of the file
        file:close() -- Close the file
        return content -- Return the content
    else
        return nil -- Return nil if the file does not exist
    end
end

et.fs.write = function(path, content) -- File write function
    local file = io.open(path, "w") -- Try to open the file in write mode
    if file then -- If the file exists
        file:write(content) -- Write the content to the file
        file:close() -- Close the file
        return true -- Return true
    else
        return false -- Return false if the file does not exist
    end
end

et.fs.newline = function(path) -- File newline function
    local file = io.open(path, "a") -- Try to open the file in append mode
    if file then -- If the file exists
        file:write("\n") -- Write a newline to the file
        file:close() -- Close the file
        return true -- Return true
    else
        return false -- Return false if the file does not exist
    end
end

et.fs.addline = function(path, line) -- File add line function
    local file = io.open(path, "a") -- Try to open the file in append mode
    if file then -- If the file exists
        file:write("\n" .. line) -- Write the line to the file
        file:close() -- Close the file
        return true -- Return true
    else
        return false -- Return false if the file does not exist
    end
end

et.fs.delete = function(path) -- File delete function
    local success, err = os.remove(path) -- Try to remove the file
    if not success then -- If the file does not exist
        et.cprint("Failed to delete file: " .. (err or "unknown error"), "red") -- Print error message
        return false -- Return false
    end
    return true -- Return true if the file was deleted successfully
end

et.fs.rename = function(old_path, new_path) -- File rename function
    local success, err = os.rename(old_path, new_path) -- Try to rename the file
    if not success then -- If the file does not exist
        et.cprint("Failed to rename file: " .. (err or "unknown error"), "red") -- Print error message
        return false -- Return false
    end
    return true -- Return true if the file was renamed successfully
end

et.fs.copy = function(source, destination) -- File copy function
    local err -- Initialize error variable
    local source_file = io.open(source, "rb") -- Try to open the source file in binary mode
    if not source_file then -- If the source file does not exist
        et.cprint("Failed to open source file: " .. (err or "unknown error"), "red") -- Print error message
        return false -- Return false
    end

    local destination_file = io.open(destination, "wb") -- Try to open the destination file in binary mode
    if not destination_file then -- If the destination file does not exist
        et.cprint("Failed to open destination file: " .. (err or "unknown error"), "red") -- Print error message
        source_file:close() -- Close the source file
        return false -- Return false
    end

    local content = source_file:read("*a") -- Read the entire content of the source file
    destination_file:write(content) -- Write the content to the destination file

    source_file:close() -- Close the source file
    destination_file:close() -- Close the destination file

    return true -- Return true if the file was copied successfully
end

et.fs.move = function(source, destination) -- File move function
    local success = et.fs.copy(source, destination) -- Copy the file
    if not success then -- If the copy failed
        return false -- Return false
    end

    local deleted = et.fs.delete(source) -- Delete the source file
    if not deleted then -- If the delete failed
        return false -- Return false
    end

    return true -- Return true if the file was moved successfully
end

et.fs.type = function(path) -- File type function
    local err -- Initialize error variable
    local file = io.open(path, "r") -- Try to open the file in read mode
    if not file then -- If the file does not exist
        et.cprint("Failed to open file: " .. (err or "unknown error"), "red") -- Print error message
        return nil -- Return nil
    end

    local content = file:read("*a") -- Read the entire content of the file
    file:close() -- Close the file

    if content:match("^#!") then -- Check if the file is a script
        return "script" -- Return script type
    else
        return "text" -- Return text type
    end
end

et.fs.mkdir = function(path) -- Directory creation function
    local success, err = os.execute("mkdir " .. path) -- Try to create the directory
    if not success then -- If the directory creation failed
        et.cprint("Failed to create directory: " .. (err or "unknown error"), "red") -- Print error message
        return false -- Return false
    end
    return true -- Return true if the directory was created successfully
end



return et -- Return the essential library
