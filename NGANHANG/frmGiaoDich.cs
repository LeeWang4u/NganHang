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
    public partial class frmGiaoDich : DevExpress.XtraEditors.XtraForm
    {
        int check = 2;
        string loaiGD = "";

        private SqlDataReader reader;

        public frmGiaoDich()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnKiemTra_Click(object sender, EventArgs e)
        {
            reader = Program.ExecSqlDataReader($"EXEC SP_KiemTraSTK '{txtSTKNhan.Text.Trim()}'");
            if (reader == null)
                return;

            reader.Read();
            txtHoTenNhan.Text = "Họ tên: " +(string)reader["HOTEN"] ;

            reader.Close();
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void panelControl3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnKT_Click(object sender, EventArgs e)
        {
            reader = Program.ExecSqlDataReader($"EXEC SP_KiemTraSTK '{txbSTK.Text.Trim()}'");
            if (reader == null)
                return;
            string hoTen  ="";
            string soDu = "";
            while (reader.Read())
            {
                hoTen = reader["HOTEN"].ToString();
                soDu = reader["SODU"].ToString();
 }

            // string yourString = reader["SODU"].ToString();
            //  reader.Read();
            // txtHoTen.Text = "Họ tên: " + (string)reader["HOTEN"] + " Số dư: " + yourString;
            txtHoTen.Text = "Họ tên: " + hoTen;
            txtSoDu.Text= " Số dư: " + soDu;
            panelControl2.Enabled = true;
            panelControl3.Enabled = true;
            reader.Close();
        }

        private void frmGiaoDich_Load(object sender, EventArgs e)
        {
            panelControl1.Enabled = true;
            panelControl2.Enabled = false;
            panelControl3.Enabled = false;

            if (Program.mGroup == "NGANHANG")
            {
                btnKT.Enabled = false;
                // btnThem.Enabled = btnHieuChinh.Enabled = btnLuu.Enabled = btnXoa.Enabled = btnPhucHoi.Enabled = false;
            }
            else
            {
                btnKT.Enabled = true;
                //  btnThem.Enabled = btnHieuChinh.Enabled = btnLuu.Enabled = btnXoa.Enabled = btnPhucHoi.Enabled = true;
            }

        }

        private void btnGuiTien_Click(object sender, EventArgs e)
        {
            if ( txtSoTien.Text.Trim() == "" )
            {    // hàm Trim để xóa khoảng trắng 2 bên.
                MessageBox.Show("Số tiền và loại giao dịch không được bỏ trống", "", MessageBoxButtons.OK);
                return;
            }

            
            loaiGD = "GT";

            string strLenh = "EXEC SP_GUIRUT '" + txbSTK.Text + "','" + txtSoTien.Text + "','" + loaiGD + "','" + Program.username + "'";
            //Debug.WriteLine(strLenh);
            check = Program.ExecSqlNonQuery(strLenh);

            if (check == 0) MessageBox.Show("Giao dịch thành công!!!", "", MessageBoxButtons.OK);
            loaiGD = "";
            check = 2;

        }

        private void btnRutTien_Click(object sender, EventArgs e)
        {
            if (txtSoTien.Text.Trim() == "")
            {    // hàm Trim để xóa khoảng trắng 2 bên.
                MessageBox.Show("Số tiền và loại giao dịch không được bỏ trống", "", MessageBoxButtons.OK);
                return;
            }


            loaiGD = "RT";

            string strLenh = "EXEC SP_GUIRUT '" + txbSTK.Text + "','" + txtSoTien.Text + "','" + loaiGD + "','" + Program.username + "'";
            //Debug.WriteLine(strLenh);
            check = Program.ExecSqlNonQuery(strLenh);

            if (check == 0) MessageBox.Show("Giao dịch thành công!!!", "", MessageBoxButtons.OK);
            loaiGD = "";
            check = 2;
        }

        private void btnXacNhan_Click(object sender, EventArgs e)
        {
            if (txbSTK.Text.Trim() == "" || txtSoTien.Text.Trim() == "" || txtSTKNhan.Text.Trim() == "")
            {    // hàm Trim để xóa khoảng trắng 2 bên.
                MessageBox.Show("Số tài khoản, số tiền không được bỏ trống!!", "", MessageBoxButtons.OK);
                return;
            }

            if (txbSTK.Text.Trim() == txtSTKNhan.Text.Trim())
            {
                MessageBox.Show("Số tài khoản chuyển và số tài khoản nhận không được trùng nhau!!", "", MessageBoxButtons.OK);
                return;
            }

            string strLenh = "EXEC SP_CHUYENTIEN '" + txbSTK.Text + "','" + txtSTKNhan.Text + "','" + txtSoTien.Text + "','" + Program.username + "'";
            //Debug.WriteLine(strLenh);
            check = Program.ExecSqlNonQuery(strLenh);
            if (check == 0) MessageBox.Show("Giao dịch thành công!!!", "", MessageBoxButtons.OK);
            check = 2;
        }
    }
}