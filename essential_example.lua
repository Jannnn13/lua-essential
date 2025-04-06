local success, et = pcall(require, "essential")

if not success then
    print("Could not require Essential")
    os.exit(1)
end

et.set_title("Essential Test")

et.log_file = "logtest.et"
et.log("info", "This is an info message")
et.log("warn", "This is a warning message")
et.log("error", "This is an error message")
et.log("debug", "This is a debug message") -- This should not log anything

if et.yesno("Do you want to continue?") then
    et.log("info", "Continuing...")
else
    et.log("info", "Exiting...")
    os.exit()
end

et.pause()
et.cprint("This is a test message", "green")
et.wait(2)
et.cprint("This message will appear after a 2-second wait", "yellow")

et.typewriter("This is a typewriter effect message", 0.08)
et.typewriter("This is a typewriter effect message with a different speed", 0.05)
et.typewriter("This is a typewriter effect message with a different speed", 0.1)
et.typewriter("This is a typewriter effect message with a different speed", 0.2)

for i = 1, 5 do
    if et.random.boolean() then
        et.log("info", "Random boolean returned true")
    else
        et.log("info", "Random boolean returned false")
    end    
end

et.wait(2)

local input = et.input("Enter something: ")
if input then
    et.log("info", "You entered: " .. input)
else
    et.log("info", "No input provided")
end
et.wait(2)
et.clear()

et.cprint("This is a test message", "green")
et.cprint("This is a test message", "red")
et.cprint("This is a test message", "yellow")
et.cprint("This is a test message", "blue")
et.cprint("This is a test message", "magenta")
et.cprint("This is a test message", "cyan")
et.cprint("This is a test message", "white")
et.cprint("This is a test message", "black")

et.pause()
et.clear()

--rickroll
et.cprint("Never gonna give you up", "red")
et.wait(1.5)
et.cprint("Never gonna let you down", "green")
et.wait(1.5)
et.cprint("Never gonna run around and desert you", "blue")
et.wait(2)
et.cprint("Never gonna make you cry", "yellow")
et.wait(1.5)
et.cprint("Never gonna say goodbye", "magenta")
et.wait(1.5)
et.cprint("Never gonna tell a lie and hurt you", "cyan")
et.wait(2)

et.cprint("Never gonna give you up", "red")
et.wait(1.5)
et.cprint("Never gonna let you down", "green")
et.wait(1.5)
et.cprint("Never gonna run around and desert you", "blue")
et.wait(2)
et.cprint("Never gonna make you cry", "yellow")
et.wait(1.5)
et.cprint("Never gonna say goodbye", "magenta")
et.wait(1.5)
et.cprint("Never gonna tell a lie and hurt you", "cyan")
et.wait(2)

et.cprint("Never gonna give you up", "red")
et.wait(1.5)
et.cprint("Never gonna let you down", "green")
et.wait(1.5)
et.cprint("Never gonna run around and desert you", "blue")
et.wait(2)
et.cprint("Never gonna make you cry", "yellow")
et.wait(1.5)
et.cprint("Never gonna say goodbye", "magenta")
et.wait(1.5)
et.cprint("Never gonna tell a lie and hurt you", "cyan")
et.wait(2)