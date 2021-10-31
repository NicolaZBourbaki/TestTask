using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestTask.Models;

namespace TestTask.DataAccessLayer
{
    public interface IShipmentRepository
    {
        List<string> NumbericRequiredColumns { get; }
        List<ShipmentDto> GetShipments();
        List<ShipmentDto> GetShipmentsReport(List<string> columns);
        List<string> GetHeaderNames();
    }
}
