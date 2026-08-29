using System;
using Npgsql;

class Program
{
    static void Main()
    {
        // Connection details for the local PostgreSQL database
        string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=YOUR_PASSWORD;Database=saa_flight_booking";

        try
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("Connection to the database was successful.");
                Console.WriteLine();

                string query = "SELECT PassengerID, FirstName, LastName, Email, PhoneNumber FROM Passengers ORDER BY PassengerID;";

                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                using (NpgsqlDataReader reader = command.ExecuteReader())
                {
                    Console.WriteLine("Passenger List:");
                    Console.WriteLine("----------------");

                    while (reader.Read())
                    {
                        int id = reader.GetInt32(0);
                        string firstName = reader.GetString(1);
                        string lastName = reader.GetString(2);
                        string email = reader.GetString(3);
                        string phone = reader.GetString(4);

                        Console.WriteLine($"ID: {id} | Name: {firstName} {lastName} | Email: {email} | Phone: {phone}");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Simple error handling so the app doesn't crash without explanation
            Console.WriteLine("Something went wrong connecting to the database:");
            Console.WriteLine(ex.Message);
        }

        Console.WriteLine();
        Console.WriteLine("Press any key to exit...");
        Console.ReadKey();
    }
}
