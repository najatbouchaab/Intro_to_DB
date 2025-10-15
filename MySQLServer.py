#!/usr/bin/python3
"""
A Python script that creates a MySQL database 'alx_book_store'.
If the database already exists, the script will not fail.
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Establish connection to MySQL server
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="your_password"  # Replace with your actual MySQL password
        )

        # Check if connection was successful
        if connection.is_connected():
            cursor = connection.cursor()
            # Create the database (no SELECT or SHOW statements used)
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        # Handle connection or execution errors
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Ensure proper cleanup
        try:
            if connection.is_connected():
                cursor.close()
                connection.close()
        except NameError:
            pass  # connection variable might not be defined if connection fails

if __name__ == "__main__":
    create_database()
