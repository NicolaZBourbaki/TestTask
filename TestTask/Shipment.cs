using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;
using TestTask.DataAccessLayer;

namespace TestTask
{
   
    public partial class Shipment : Form
    {
        private readonly IShipmentRepository shipmentRepository;
        private List<CheckBox> columnCheckBoxes = new List<CheckBox>();

        public Shipment()
        {
            InitializeComponent();
            string connectionString = ConfigurationManager.ConnectionStrings["TestTaskDB"].ConnectionString;
            shipmentRepository = new ShipmentRepository(connectionString);
        }

        private void Shipment_Load(object sender, EventArgs e)
        {
            ShipmentDataGridView.DataSource = shipmentRepository.GetShipments();
            GenetateCheckBoxes();
        }

        private void GenetateCheckBoxes()
        {
            var requiredCheckBoxes = shipmentRepository.NumbericRequiredColumns;
            var columnHeaderNames = shipmentRepository.GetHeaderNames();
            for (int i = 0; i < columnHeaderNames.Count; i++)
            {
                var headerName = columnHeaderNames[i];
                var checkBox = new CheckBox();
                checkBox.Location = new Point(70 + 100 * i, 95);
                checkBox.Text = headerName;
                checkBox.AutoSize = true;
                checkBox.Name = $"checkBox{i + 1}";
                checkBox.Checked = requiredCheckBoxes.Contains(headerName);
                checkBox.Enabled = !requiredCheckBoxes.Contains(headerName);
                this.Controls.Add(checkBox);
                columnCheckBoxes.Add(checkBox);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ShipmentDataGridView.DataSource = shipmentRepository.GetShipmentsReport(columnCheckBoxes.Where(x => x.Checked).Select(x => x.Text).ToList());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ShipmentDataGridView.DataSource = shipmentRepository.GetShipments();
            foreach (CheckBox cb in columnCheckBoxes)
            {
                if (!shipmentRepository.NumbericRequiredColumns.Contains(cb.Text))
                    cb.Checked = false;
            }
        }
    }
}
