#!/usr/bin/env python3
"""
MySQL Database Creation Script for ALX Book Store
This script creates the alx_book_store database in MySQL server.
"""

import mysql.connector
from mysql.connector import Error


def create_database(host='localhost', user='root', password=''):
    """
    Creates the alx_book_store database in MySQL server
    
    Args:
        host (str): MySQL host address
        user (str): MySQL username
        password (str): MySQL password
    """
    connection = None
    try:
        # Connect to MySQL server without specifying a database
        connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password
        )
        
        if connection.is_connected():
            # Create a cursor object
            cursor = connection.cursor()
            
            # Create database if it doesn't exist
            create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"
            
            # Execute the query
            cursor.execute(create_db_query)
            
            # Print success message
            print("Database 'alx_book_store' created successfully!")
            
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    
    finally:
        # Close database connection
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")


def main():
    """Main function to execute the database creation"""
    # You can modify these credentials as needed
    host = 'localhost'
    user = 'root'
    password = ''  # Set your MySQL password here
    
    create_database(host, user, password)


if __name__ == "__main__":
    main()