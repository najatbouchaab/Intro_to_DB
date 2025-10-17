#!/usr/bin/python3
"""
A Python script that creates a MySQL database 'alx_book_store'.
If the database already exists, the script will not fail.
"""

import mysql.connector

def create_database():
    try:
        # Establish connection to MySQL server
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="your_password"  # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database (no SELECT or SHOW used)
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        # Handle connection or creation errors
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Ensure connection closes properly
        try:
            if connection.is_connected():
                cursor.close()
                connection.close()
        except NameError:
            pass  # in case connection was never established

if __name__ == "__main__":
    create_database()
