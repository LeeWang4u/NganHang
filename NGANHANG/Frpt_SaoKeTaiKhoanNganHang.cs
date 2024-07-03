using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraReports.UI; 

namespace NGANHANG
{
    public partial class Frpt_SaoKeTaiKhoanNganHang : Form
    {
        public Frpt_SaoKeTaiKhoanNganHang()
        {
            InitializeComponent();
        }

        private void btnPreview_Click(object sender, EventArgs e)
        {
            if (batdau.DateTime > DateTime.Now || batdau.Text.Trim() == "")
            {
                MessageBox.Show("Ngày bắt đầu trống hoặc mốc thời gian là trước hiện tại", "", MessageBoxButtons.OK);
                batdau.Focus();
                return;
            }
            if (ketthuc.DateTime > DateTime.Now || ketthuc.Text.Trim() == "")
            {
                MessageBox.Show("Ngày kết thúc trống hoặc mốc thời gian là trước hiện tại", "", MessageBoxButtons.OK);
                ketthuc.Focus();
                return;
            }
            xrpt_SaoKeTaiKhoanNganHang rpt = new xrpt_SaoKeTaiKhoanNganHang(SoTK.Text, batdau.DateTime, ketthuc.DateTime);
            rpt.labelTieuDe.Text = "SAO KE TAI KHOAN " + SoTK.Text.ToUpper() + " TU NGAY " + batdau.Text.ToUpper() + " DEN NGAY " + ketthuc.Text.ToUpper();
            ReportPrintTool print = new ReportPrintTool(rpt);
            print.ShowPreviewDialog();
        }
    }
}
