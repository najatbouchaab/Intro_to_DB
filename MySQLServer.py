#!/usr/bin/python3
"""
A simple Python script to create a MySQL database 'alx_book_store'.
If the database already exists, the script will not fail.
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL Server (update user/password if needed)
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='your_password'  # 🔹 Replace with your MySQL root password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Ensure proper cleanup
        if connection.is_connected():
            cursor.close()
            connection.close()
            # print("MySQL connection closed.")  # optional message

if __name__ == "__main__":
    create_database()
