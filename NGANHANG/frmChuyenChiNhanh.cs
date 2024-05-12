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
using System.Data.SqlClient;

namespace NGANHANG
{
    public partial class frmChuyenChiNhanh : DevExpress.XtraEditors.XtraForm
    {
        private  String maNV;
        private  String cmnd;
        private  String maCN;
        private String hoten;
        private String cmnd0;
        private String MaNVC;

        private SqlDataReader checkMaNV;
        public frmChuyenChiNhanh(String maNV, String cmnd, String maCN, String hoTen, String MaNVC)
        {
            this.maNV = maNV;
            this.cmnd = cmnd;
            this.maCN = maCN;
            this.hoten = hoTen;
            this.MaNVC = MaNVC;
            InitializeComponent();
        }

        private void chiNhanhBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.chiNhanhBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void chiNhanhBindingNavigatorSaveItem_Click_1(object sender, EventArgs e)
        {
            this.Validate();
            this.chiNhanhBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void frmChyuenChiNhanh_Load(object sender, EventArgs e)
        {
            dS.EnforceConstraints = false;
           // this.chiNhanhTableAdapter.Connection.ConnectionString = Program.connstr;
            // TODO: This line of code loads data into the 'dS.ChiNhanh' table. You can move, or remove it, as needed.
            this.chiNhanhTableAdapter.Fill(this.dS.ChiNhanh);

            txbMaNv.Text = maNV;
            txbHoTen.Text = hoten;
            txbMaCN.Text = maCN;
            txbMaNVMoi.Text = MaNVC;

            txbMaNv.Enabled = txbHoTen.Enabled = txbMaCN.Enabled = txbMaNVMoi.Enabled = false;

            
        }

        private void btnChuyen_Click(object sender, EventArgs e)
        {
            cmnd0 = cmnd.Trim() + "0";
            String MACN = ((DataRowView)chiNhanhBindingSource[chiNhanhBindingSource.Position])["MACN"].ToString();
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

                        if (MessageBox.Show("Chuyển thành công nhân viên từ chi nhánh " + maCN + " sang chi nhánh "+ MACN , "OK",
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