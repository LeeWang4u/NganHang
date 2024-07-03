using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using DevExpress.XtraReports.UI;

namespace NGANHANG
{
    public partial class xrpt_SaoKeTaiKhoanNganHang : DevExpress.XtraReports.UI.XtraReport
    {
        public xrpt_SaoKeTaiKhoanNganHang()
        {
            
        }
        public xrpt_SaoKeTaiKhoanNganHang(string sotk, DateTime dateFrom, DateTime dateTo)
        {
            InitializeComponent();
            this.sqlDataSource1.Connection.ConnectionString = Program.connstr;
            this.sqlDataSource1.Queries[0].Parameters[0].Value = sotk;
            this.sqlDataSource1.Queries[0].Parameters[1].Value = dateFrom;
            this.sqlDataSource1.Queries[0].Parameters[2].Value = dateTo;
            this.sqlDataSource1.Fill();
        }
    }
}
