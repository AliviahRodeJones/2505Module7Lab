using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using Microsoft.Data.Sqlite;

public class ProductsModel : PageModel
{
    public List<Product> Products { get; set; }
    // An attrubute of the ProductsModel class. An empty list of products. 

    public void OnGet() // Runs when the app starts
    {
        Products = new List<Product>();
        // New empty list of products. 
        string connectionString = "Data Source=../northwind.db;Mode=ReadOnly";
        // stored connection string for the datasource. 

        using (SqliteConnection connection = new SqliteConnection(connectionString))
        // Creates an sqlite connection
        {
            connection.Open();
            // Opens the connection to the database. 
            string sql = @"SELECT p.ProductName, c.CategoryName, p.UnitPrice
                           FROM Products p
                           JOIN Categories c ON p.CategoryID = c.CategoryID";
            // Stored sql string. Selects the productName, categoryname, and unitprice
            // after joining the category table on the products table

            using (SqliteCommand command = new SqliteCommand(sql, connection))
            {
                using (SqliteDataReader reader = command.ExecuteReader())
                // Uses the reader method 
                {
                    while (reader.Read())
                    // Loops while there are still lines in the database to read.
                    {
                        Products.Add(new Product
                        // Adds a new product to the Products list
                        {
                            ProductName = reader.GetString(0),
                            // Gets the first column in the database. 
                            CategoryName = reader.GetString(1),
                            // Gets the second column in the database
                            UnitPrice = (decimal)reader.GetDouble(2)
                            // Gets the third column in the database. 
                        });
                    }
                }
            }
        }
    }
}

public class Product
{
    public string ProductName { get; set; }
    public string CategoryName { get; set; }
    public decimal UnitPrice { get; set; }
}
// Class constructor for a Product. 
