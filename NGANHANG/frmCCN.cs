using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace NGANHANG
{
    public partial class frmCCN : DevExpress.XtraEditors.XtraForm
    {
        private String maNV;
        private String cmnd;
        private String maCN;
        private String hoten;
        private String cmnd0;
        private String MaNVC;

        public frmCCN(String maNV, String cmnd, String maCN, String hoTen, String MaNVC)
        {
            this.maNV = maNV;
            this.cmnd = cmnd;
            this.maCN = maCN;
            this.hoten = hoTen;
            this.MaNVC = MaNVC;
            InitializeComponent();
        }

        private void frmCCN_Load(object sender, EventArgs e)
        {
            dS.EnforceConstraints = false;
             this.sP_TIMCN_CNVTableAdapter.Connection.ConnectionString = Program.connstr;
            // TODO: This line of code loads data into the 'dS.SP_TIMCN_CNV' table. You can move, or remove it, as needed.
            this.sP_TIMCN_CNVTableAdapter.Fill(this.dS.SP_TIMCN_CNV);

            txbMaNv.Text = maNV;
            txbHoTen.Text = hoten;
            txbMaCN.Text = maCN;
          //  txbMaNVMoi.Text = MaNVC;

            txbMaNv.Enabled = txbHoTen.Enabled = txbMaCN.Enabled = false;// = txbMaNVMoi.Enabled 
            gridView1.OptionsBehavior.Editable = false;
        }

        private void btnChuyen_Click(object sender, EventArgs e)
        {
            cmnd0 = cmnd.Trim() + "0";
            String MACN = ((DataRowView)sP_TIMCN_CNVBindingSource[sP_TIMCN_CNVBindingSource.Position])["MACN"].ToString();
            if (maCN == MACN)
            {
                MessageBox.Show("Nhân viên đang ở chi nhánh  " + MACN + ". Chọn chi nhánh khác", "Thông báo", MessageBoxButtons.OK);
            }
            else
            {
                String tenServer = "NGANHANG_";
                tenServer = tenServer + MACN.Trim();
                if (MessageBox.Show("Xác nhận chuyển nhân viên sang chi nhánh " + MACN, "Xác nhận",
               MessageBoxButtons.OKCancel) == DialogResult.OK)
                {
                    try
                    {
                        string strLenh = "EXEC [SP_CHUYENCHINHANH_NV] '" + maNV + "', '" + MaNVC + "', '" + MACN + "', '" + cmnd + "', '" + cmnd0 + "', '" + tenServer + "'";
                        Program.ExecSqlDataReader(strLenh);

                        if (MessageBox.Show("Chuyển thành công nhân viên từ chi nhánh " + maCN + " sang chi nhánh " + MACN, "OK",
                MessageBoxButtons.OKCancel) == DialogResult.OK)
                        {
                            this.Close();
                        }

                    }
                    catch (Exception ex)
                    {

                        MessageBox.Show("Lỗi: " + ex.Message, "", MessageBoxButtons.OK);
                        return;
                    }
                }
                //  MessageBox.Show("Xác nhận chuyển nhân viên sang chi nhánh " + MACN, "Thông báo", MessageBoxButtons.OK);
            }
        }
    }
}