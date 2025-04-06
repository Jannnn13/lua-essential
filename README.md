# **Essential Library**

Die **Essential Library** ist eine Sammlung von nützlichen Funktionen, die das Arbeiten mit Lua erleichtern. Sie bietet Werkzeuge für Logging, farbige Terminalausgaben, Benutzerinteraktion, Zeitsteuerung und mehr. Die Library ist leichtgewichtig, einfach zu verwenden und ideal für kleine bis mittelgroße Lua-Projekte.

---

## **Funktionen**
### **1. Logging**
- Schreibe formatierte Log-Nachrichten in die Konsole oder eine Datei.
- Unterstützt verschiedene Log-Typen: `info`, `warn`, `error`.
- Beispiel:
  ```lua
  et.log("info", "This is an informational message.")
  et.log("warn", "This is a warning.")
  et.log("error", "This is an error.")
  ```

### **2. Farbausgabe**
- Gib farbigen Text im Terminal aus, um wichtige Informationen hervorzuheben.
- Unterstützte Farben: `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`.
- Beispiel:
  ```lua
  et.cprint("This is a red message", "red")
  et.cprint("This is a green message", "green")
  ```

### **3. Benutzerinteraktion**
- **Ja/Nein-Abfragen**:
  ```lua
  if et.yesno("Do you want to continue?") then
      print("User said yes!")
  else
      print("User said no!")
  end
  ```
- **Benutzereingabe**:
  ```lua
  local name = et.input("What is your name?")
  print("Hello, " .. name .. "!")
  ```

### **4. Terminalsteuerung**
- **Bildschirm löschen**:
  ```lua
  et.clear()
  ```
- **Terminaltitel setzen**:
  ```lua
  et.set_title("My Lua Application")
  ```

### **5. Zeitsteuerung**
- **Warten**:
  ```lua
  et.wait(2) -- Wartet 2 Sekunden
  ```
- **Textausgabe mit Schreibmaschineneffekt**:
  ```lua
  et.typewriter("Hello, world!", 0.1)
  ```

### **6. Zufallsfunktionen**
- **Zufällige Wahrheitswerte**:
  ```lua
  if et.random.boolean() then
      print("Random boolean returned true")
  else
      print("Random boolean returned false")
  end
  ```

### **7. Pause**
- Warte, bis der Benutzer eine Taste drückt:
  ```lua
  et.pause("Press any key to continue...")
  ```

---

## **Installation**
1. Lade die Datei essential.lua herunter und speichere sie in deinem Projektordner, z. B. im Verzeichnis libs.
2. Füge die folgende Zeile in dein Lua-Skript ein, um die Library zu verwenden:
   ```lua
   local et = require("libs/essential")
   ```

---

## **Beispiel**
Hier ist ein kurzes Beispiel, das einige Funktionen der Library demonstriert:

```lua
local et = require("libs/essential")

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

## **Warum Essential?**
- **Einfachheit**: Die Library ist leicht zu verstehen und zu verwenden.
- **Flexibilität**: Sie bietet eine Vielzahl von Funktionen, die in vielen Projekten nützlich sind.
- **Keine Abhängigkeiten**: Die Library verwendet nur Standard-Lua-Funktionen und benötigt keine externen Bibliotheken.

---

## **Lizenz**
Die Essential Library ist unter der MIT-Lizenz veröffentlicht. Sie kann frei verwendet, modifiziert und verteilt werden. Siehe die Datei `LICENSE` für weitere Details.

---

Diese Beschreibung kann als Grundlage für deine Dokumentation dienen. Du kannst sie nach Bedarf erweitern oder anpassen!
