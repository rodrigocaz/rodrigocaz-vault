import csv
import tkinter as tk
from tkinter import messagebox

class Product:
    def __init__(self, product_id, product_name, category, price, stock):
        self.product_id = product_id
        self.product_name = product_name
        self.category = category
        self.price = price
        self.stock = stock

    def __str__(self):
        return f'{self.product_name} (ID: {self.product_id}) - ${self.price} (Stock: {self.stock})'


class ShoppingCart:
    def __init__(self):
        self.items = []

    def add_product(self, product, quantity):
        if product.stock >= quantity:
            self.items.append((product, quantity))
            product.stock -= quantity
            return True
        else:
            return False

    def view_cart(self):
        return self.items

    def total_price(self):
        return sum(product.price * quantity for product, quantity in self.items)

class User:
    @staticmethod
    def load_users_from_csv(file_path):
        users = {}  # Initialize the dictionary
        with open(file_path, 'r', newline='') as file:
            reader = csv.DictReader(file)
            for row in reader:
                # Store only username and password
                users[row["Username"]] = row['Password']  # Assuming 'Password' is the header for passwords
        return users


class MMagoods:
    def __init__(self, root):
        self.root = root
        self.root.title("MMA Goods")

        # Load users from the CSV file
        self.users = User.load_users_from_csv("usuarios_ecommerce.csv")  # Update the path as needed
        self.current_user = None

        self.create_login_frame()

    def create_login_frame(self):
        self.login_frame = tk.Frame(self.root)
        self.login_frame.pack(padx=10, pady=10)  # Add padding for better layout

        self.username_label = tk.Label(self.login_frame, text="Username:")
        self.username_label.grid(row=0, column=0, sticky=tk.W)  # Align to the west (left)
        self.username_entry = tk.Entry(self.login_frame)
        self.username_entry.grid(row=0, column=1)

        self.password_label = tk.Label(self.login_frame, text="Password:")
        self.password_label.grid(row=1, column=0, sticky=tk.W)  # Align to the west (left)
        self.password_entry = tk.Entry(self.login_frame, show="*")
        self.password_entry.grid(row=1, column=1)

        self.login_button = tk.Button(self.login_frame, text="Login", command=self.login)
        self.login_button.grid(row=2, column=0, columnspan=2, pady=10)  # Add padding for better layout

    def login(self):
        username = self.username_entry.get()
        password = self.password_entry.get()

        if username in self.users:
            if password == self.users[username]:  # Check password against stored password
                self.current_user = username  # Store the current user
                messagebox.showinfo("Login Success", f"Welcome, {username}!")
                self.login_frame.destroy()
                self.main_menu()
            else:
                messagebox.showerror("Login Error", "Incorrect password")
        else:
            messagebox.showerror("Login Error", "Username not found")

    def main_menu(self):
        main_menu_frame = tk.Frame(self.root)
        main_menu_frame.pack(padx=10, pady=10)  # Add padding for better layout

        tk.Label(main_menu_frame, text="Main Menu").pack()
        tk.Button(main_menu_frame, text="View Products", command=self.view_products).pack()
        tk.Button(main_menu_frame, text="Logout", command=self.logout).pack()

    def view_products(self):
        # Implement product viewing functionality
        pass

    def logout(self):
        self.current_user = None
        self.create_login_frame()  # Recreate the login frame


if __name__ == "__main__":
    root = tk.Tk()
    app = MMagoods(root)
    root.mainloop()