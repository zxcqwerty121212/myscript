import tkinter as tk
from tkinter import messagebox
from tkinter import PhotoImage

# Функция, которая будет вызываться при нажатии на кнопки
def on_button_click(action):
    if action == "load_delta":
        messagebox.showinfo("Action", "Загрузка дельта-чита...")
        # Здесь будет логика для загрузки дельта-чита
    elif action == "apply_delta":
        messagebox.showinfo("Action", "Применение дельта-чита...")
        # Здесь будет логика для применения дельта-чита

# Функция для сворачивания и разворачивания окна
def toggle_window():
    if root.state() == "normal":
        root.iconify()  # Свернуть окно
    else:
        root.deiconify()  # Развернуть окно

# Основное окно приложения
root = tk.Tk()
root.title("Delta Cheat GUI")
root.geometry("400x300")

# Устанавливаем иконку с котиком
try:
    cat_icon = PhotoImage(file="cat_icon.png")  # Путь к изображению котика
    root.iconphoto(True, cat_icon)
except Exception as e:
    print("Ошибка загрузки иконки:", e)

# Кнопка для загрузки дельта-чита
load_button = tk.Button(root, text="Загрузить дельта-чит", command=lambda: on_button_click("load_delta"))
load_button.pack(pady=20)

# Кнопка для применения дельта-чита
apply_button = tk.Button(root, text="Применить дельта-чит", command=lambda: on_button_click("apply_delta"))
apply_button.pack(pady=20)

# Кнопка для сворачивания/разворачивания
toggle_button = tk.Button(root, text="🦑 Кликни на котика!", command=toggle_window)
toggle_button.pack(pady=20)

# Сделаем окно более стильным
root.configure(bg="#2a2a2a")  # Темный фон
load_button.config(bg="#ff6347", fg="white", font=("Arial", 12))  # Красная кнопка
apply_button.config(bg="#32cd32", fg="white", font=("Arial", 12))  # Зеленая кнопка
toggle_button.config(bg="#ffdd00", fg="black", font=("Arial", 12, "bold"))  # Желтая кнопка

# Запуск основного цикла приложения
root.mainloop()
