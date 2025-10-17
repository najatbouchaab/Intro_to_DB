#!/usr/bin/python3
"""
A Python script that creates a MySQL database 'alx_book_store'.
If the database already exists, the script will not fail.
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    connection = None
    cursor = None
    try:
        # Establish connection to MySQL server
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password=""  # Empty password or replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database (no SELECT or SHOW used)
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        # Handle connection or creation errors
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Ensure connection closes properly
        if cursor is not None:
            cursor.close()
        if connection is not None and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_database()