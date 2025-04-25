import tkinter as tk
import math
import numpy as np

class ScientificCalculator:
    def __init__(self, master):
        self.master = master
        master.title("Scientific Calculator")
        master.configure(bg="#f0f0f0")
        master.resizable(False, False)
        
        # Display
        self.display_frame = tk.Frame(master, bg="#f0f0f0")
        self.display_frame.pack(padx=10, pady=10)
        
        self.display = tk.Entry(self.display_frame, width=22, font=("Arial", 18), bd=5, 
                              justify=tk.RIGHT, bg="white")
        self.display.pack()
        self.display.insert(0, "0")
        self.display.config(state="readonly")
        
        # Create frames for buttons
        self.buttons_frame = tk.Frame(master, bg="#f0f0f0")
        self.buttons_frame.pack(padx=10, pady=5)
        
        # Variables
        self.current_input = "0"
        self.operation = ""
        self.first_number = 0
        self.result = 0

        # Create buttons
        self.create_buttons()
    
    def create_buttons(self):
        # Define button layout
        buttons = [
            ("sin", 1, 0, "#d1e0e0"), ("cos", 1, 1, "#d1e0e0"), ("tan", 1, 2, "#d1e0e0"), ("^", 1, 3, "#d1e0e0"), ("C", 1, 4, "#ff9999"),
            ("log", 2, 0, "#d1e0e0"), ("ln", 2, 1, "#d1e0e0"), ("(", 2, 2, "#d1e0e0"), (")", 2, 3, "#d1e0e0"), ("⌫", 2, 4, "#ff9999"),
            ("π", 3, 0, "#d1e0e0"), ("e", 3, 1, "#d1e0e0"), ("√", 3, 2, "#d1e0e0"), ("abs", 3, 3, "#d1e0e0"), ("÷", 3, 4, "#ffd699"),
            ("7", 4, 0, "white"), ("8", 4, 1, "white"), ("9", 4, 2, "white"), ("mod", 4, 3, "#d1e0e0"), ("×", 4, 4, "#ffd699"),
            ("4", 5, 0, "white"), ("5", 5, 1, "white"), ("6", 5, 2, "white"), ("!", 5, 3, "#d1e0e0"), ("-", 5, 4, "#ffd699"),
            ("1", 6, 0, "white"), ("2", 6, 1, "white"), ("3", 6, 2, "white"), ("EXP", 6, 3, "#d1e0e0"), ("+", 6, 4, "#ffd699"),
            ("0", 7, 0, "white"), ("+/-", 7, 1, "white"), (".", 7, 2, "white"), ("Ans", 7, 3, "#d1e0e0"), ("=", 7, 4, "#66b3ff")
        ]
        
        # Create buttons
        for (text, row, col, color) in buttons:
            button = tk.Button(
                self.buttons_frame,
                text=text,
                width=5,
                height=3,
                bg=color,
                font=("Arial", 10, "bold"),
                command=lambda t=text: self.button_click(t)
            )
            button.grid(row=row, column=col, padx=3, pady=3)
    
    def update_display(self):
        self.display.config(state="normal")
        self.display.delete(0, tk.END)
        self.display.insert(0, self.current_input)
        self.display.config(state="readonly")
    
    def button_click(self, button_text):
        if button_text == "C":
            self.current_input = "0"
            self.first_number = 0
            self.operation = ""
        
        elif button_text == "⌫":
            if len(self.current_input) > 1:
                self.current_input = self.current_input[:-1]
            else:
                self.current_input = "0"
        
        elif button_text == "=":
            try:
                # Handle special cases
                expression = self.current_input.replace("×", "*").replace("÷", "/").replace("π", str(math.pi)).replace("e", str(math.e))
                expression = expression.replace("^", "**").replace("mod", "%").replace("EXP", "*10**")
                
                # Replace trig functions
                if "sin(" in expression:
                    expression = expression.replace("sin(", "math.sin(")
                if "cos(" in expression:
                    expression = expression.replace("cos(", "math.cos(")
                if "tan(" in expression:
                    expression = expression.replace("tan(", "math.tan(")
                if "log(" in expression:
                    expression = expression.replace("log(", "math.log10(")
                if "ln(" in expression:
                    expression = expression.replace("ln(", "math.log(")
                if "√(" in expression:
                    expression = expression.replace("√(", "math.sqrt(")
                if "abs(" in expression:
                    expression = expression.replace("abs(", "abs(")
                
                # Handle factorial
                if "!" in expression:
                    parts = expression.split("!")
                    num = float(parts[0])
                    if num.is_integer() and num >= 0:
                        expression = str(math.factorial(int(num))) + "".join(parts[1:])
                
                self.result = eval(expression)
                self.current_input = str(self.result)
                if self.current_input.endswith(".0"):
                    self.current_input = self.current_input[:-2]
            except Exception as e:
                self.current_input = "Error"
        
        elif button_text in ["+", "-", "×", "÷", "^", "mod"]:
            self.current_input += button_text
        
        elif button_text in ["sin", "cos", "tan", "log", "ln", "√", "abs"]:
            if self.current_input == "0":
                self.current_input = f"{button_text}("
            else:
                self.current_input += f"{button_text}("
        
        elif button_text == "+/-":
            if self.current_input.startswith("-"):
                self.current_input = self.current_input[1:]
            else:
                self.current_input = "-" + self.current_input
        
        elif button_text == "π":
            if self.current_input == "0":
                self.current_input = "π"
            else:
                self.current_input += "π"
        
        elif button_text == "e":
            if self.current_input == "0":
                self.current_input = "e"
            else:
                self.current_input += "e"
        
        elif button_text == "Ans":
            if self.current_input == "0":
                self.current_input = str(self.result)
            else:
                self.current_input += str(self.result)
        
        elif button_text == "!":
            self.current_input += "!"
        
        elif button_text in ["(", ")"]:
            if self.current_input == "0":
                self.current_input = button_text
            else:
                self.current_input += button_text
        
        else:  # numbers and decimal point
            if self.current_input == "0" and button_text != ".":
                self.current_input = button_text
            else:
                self.current_input += button_text
        
        self.update_display()

# Main application
def main():
    root = tk.Tk()
    app = ScientificCalculator(root)
    root.mainloop()

if __name__ == "__main__":
    main()