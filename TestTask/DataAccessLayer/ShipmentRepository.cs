using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestTask.Models;

namespace TestTask.DataAccessLayer
{
    public class ShipmentRepository : IShipmentRepository
    {
        public List<string> NumbericRequiredColumns { get; } = new List<string>() { "Quantity", "Sum" };
        private readonly string connectionString;

        public ShipmentRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public List<string> GetHeaderNames()
        {
            return new ShipmentDto().GetType().GetProperties().Select(x => x.Name).ToList();
        }
            
        public List<ShipmentDto> GetShipments()
        {
            using (IDbConnection con = new SqlConnection(connectionString))
            {
                return con.Query<ShipmentDto>("SELECT * FROM Shipment").ToList();
            }
        }

        public List<ShipmentDto> GetShipmentsReport(List<string> columns)
        {
            if (columns.Count == 0) 
                return GetShipments();

            string selectString = "";
            string groupByString = "";

            foreach (var col in columns)
            {
                if (NumbericRequiredColumns.Contains(col))
                {
                    selectString += $"SUM({col}) AS {col},";
                }
                else
                {
                    selectString += $"{col},";
                    groupByString += $"{col},";
                }
            }

            selectString = selectString.Remove(selectString.Length - 1);
            string query = $"SELECT {selectString} FROM Shipment";

            if (!string.IsNullOrWhiteSpace(groupByString))
            {
                groupByString = groupByString.Remove(groupByString.Length - 1);
                query += $" GROUP BY {groupByString}";
            }

            using (IDbConnection con = new SqlConnection(connectionString))
            {
                return con.Query<ShipmentDto>(query).ToList();
            }
        }
    }
}
