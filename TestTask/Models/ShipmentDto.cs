using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestTask.Models
{
    public class ShipmentDto
    {
        public DateTime Data { get; set; }
        public string Organization { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Manager { get; set; }
        public int Quantity { get; set; }
        public float Sum { get; set; }
    }
}
