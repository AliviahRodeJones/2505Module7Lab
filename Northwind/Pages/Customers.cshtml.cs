using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using Microsoft.Data.Sqlite;

public class CustomersModel : PageModel
{
    // Attribute of the customers model class
    // Attribute holds the list of customers from the database. 
    public List<Customer> Customers { get; set; }

    //OnGet method - a method that is automatically called when the webpage is loaded. 
    public void OnGet()
    {
        Customers = new List<Customer>();

        // connection string to connect to the database.
        string connectionString = "Data Source=../northwind.db;Mode=ReadOnly";

        // Using the connection string. 
        using(SqliteConnection connection = new SqliteConnection(connectionString))
        {
            connection.Open(); 
            // opens the connection

            string sql = "SELECT CustomerID, CompanyName, ContactName, Country FROM Customers";
            // sql statement

            // Executes the SQL statement against the database. 
            using (SqliteCommand command = new SqliteCommand(sql, connection))
            {
                //Creates a reader object
                using (SqliteDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Customers.Add(new Customer
                        {
                            // Populates new customer with results from the database table.
                            CustomerID = reader.GetString(0),
                            CompanyName = reader.GetString(1),
                            ContactName = reader.GetString(2),
                            Country = reader.GetString(3)
                        });
                        // Adds the columns
                    }
                    // Loops through the result set. 
                }
            }

        }
    }
}

// Blueprint for creating a new Customer object
public class Customer
{
    public string CustomerID { get; set; }
    public string CompanyName { get; set; }
    public string ContactName { get; set; }
    public string Country { get; set; }
} 
