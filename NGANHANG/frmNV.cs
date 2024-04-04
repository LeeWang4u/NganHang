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
using System.Text.RegularExpressions;

namespace NGANHANG
{
    public partial class frmNV : DevExpress.XtraEditors.XtraForm
    {

        int vitri = 0;
        string macn = "";   //Dùng cho btnThem.
        int check_Luu_HieuChinh = 0;    // Nếu chọn btnThem thì ta gán = 1, nếu btnHieuChinh thì ta gán = 2. Mục đích là để biết ta chọn btnThem hay không để chạy SP kiểm tra mã nv bị trùng.
        private SqlDataReader checkMaNV;

        private bool kiemTraDuLieuDauVao()
        {
            /*kiem tra txtMANV*/
            if (txtMaNV.Text == "")
            {
                MessageBox.Show("Không bỏ trống mã nhân viên", "Thông báo", MessageBoxButtons.OK);
                txtMaNV.Focus();
                return false;
            }


            if (Regex.IsMatch(txtMaNV.Text, @"^[a-zA-Z0-9]+$") == false)
            {   
                MessageBox.Show("Mã nhân viên chỉ chấp nhận số và chữ cái", "Thông báo", MessageBoxButtons.OK);
                txtMaNV.Text = Regex.Replace(txtMaNV.Text, @"\s+", "");
                txtMaNV.Focus();
                return false;
            }
            /*kiem tra txtHO*/
            if (txtHo.Text == "")
            {
                MessageBox.Show("Không bỏ trống họ và tên", "Thông báo", MessageBoxButtons.OK);
                txtHo.Focus();
                return false;
            }
            //"^[0-9A-Za-z ]+$"
            if (Regex.IsMatch(txtHo.Text, @"^[A-Za-z ]+$") == false)
            {
                MessageBox.Show("Họ của người chỉ có chữ cái và khoảng trắng", "Thông báo", MessageBoxButtons.OK);
                txtHo.Focus();
                return false;
            }
            if (txtHo.Text.Length > 40)
            {
                MessageBox.Show("Họ không thể lớn hơn 40 kí tự", "Thông báo", MessageBoxButtons.OK);
                txtHo.Focus();
                return false;
            }
            /*kiem tra txtTEN*/
            if (txtTen.Text == "")
            {
                MessageBox.Show("Không bỏ trống họ và tên", "Thông báo", MessageBoxButtons.OK);
                txtTen.Focus();
                return false;
            }

            if (Regex.IsMatch(txtTen.Text, @"^[a-zA-Z ]+$") == false)
            {
                MessageBox.Show("Tên người chỉ có chữ cái và khoảng trắng", "Thông báo", MessageBoxButtons.OK);
                txtTen.Focus();
                return false;
            }

            if (txtTen.Text.Length > 40)
            {
                MessageBox.Show("Tên không thể lớn hơn 40 kí tự", "Thông báo", MessageBoxButtons.OK);
                txtTen.Focus();
                return false;
            }
            /*kiem tra txtDIACHI*/
            if (txtDiaChi.Text == "")
            {
                MessageBox.Show("Không bỏ trống địa chỉ", "Thông báo", MessageBoxButtons.OK);
                txtDiaChi.Focus();
                return false;
            }

            if (Regex.IsMatch(txtDiaChi.Text, @"^[a-zA-Z0-9, ]+$") == false)
            {
                MessageBox.Show("Địa chỉ chỉ chấp nhận chữ cái, số và khoảng trắng", "Thông báo", MessageBoxButtons.OK);
                txtDiaChi.Focus();
                return false;
            }

            if (txtDiaChi.Text.Length > 100)
            {
                MessageBox.Show("Không bỏ trống địa chỉ", "Thông báo", MessageBoxButtons.OK);
                txtDiaChi.Focus();
                return false;
            }

            if (Regex.IsMatch(txtCMND.Text, @"^[0-9]+$") == false)
            {
                MessageBox.Show("CMND chỉ nhận số", "Thông báo", MessageBoxButtons.OK);
                txtCMND.Focus();
                return false;
            }

            if (Regex.IsMatch(txtSDT.Text, @"^[0-9]+$") == false)
            {
                MessageBox.Show("SDT chỉ nhận số", "Thông báo", MessageBoxButtons.OK);
                txtSDT.Focus();
                return false;
            }


            return true;
        }


        public frmNV()
        {
            InitializeComponent();
        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

       

        private void frmNV_Load(object sender, EventArgs e)
        {
            DS.EnforceConstraints = false; // bỏ kiểm tra khóa ngoại STK.
            // TODO: This line of code loads data into the 'dS.NhanVien' table. You can move, or remove it, as needed.
            this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;    // gán thông tin đăng nhập vào các Adapter tương ứng để fill lấy thông tin đúng với thông tin đăng nhập.
            // TODO: This line of code loads data into the 'dS.NhanVien' table. You can move, or remove it, as needed.
            this.nhanVienTableAdapter.Fill(this.DS.NhanVien);

            macn = ((DataRowView)bdsNhanVien[0])["MACN"].ToString();
            cmbChiNhanh.DataSource = Program.bds_dspm;  //sao chép dspm đã load ở form đăng nhập.
            cmbChiNhanh.DisplayMember = "TENCN";
            cmbChiNhanh.ValueMember = "TENSERVER";
            cmbChiNhanh.SelectedIndex = Program.mChinhanh;
            if (Program.mGroup == "NGANHANG")
            {
                cmbChiNhanh.Enabled = true;
               // btnThem.Enabled = btnHieuChinh.Enabled = btnLuu.Enabled = btnXoa.Enabled = btnPhucHoi.Enabled = false;
            }
            else
            {
                cmbChiNhanh.Enabled = false;
              //  btnThem.Enabled = btnHieuChinh.Enabled = btnLuu.Enabled = btnXoa.Enabled = btnPhucHoi.Enabled = true;
            }

        }

        private void nhanVienBindingNavigator_RefreshItems(object sender, EventArgs e)
        {

        }

        private void pHAIComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void panelControl1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            txtMaNV.Enabled = true; // Vì khi ta hiệu chỉnh thì không cho phép sửa mã -> nên ta khóa bên Hiệu Chỉnh -> Qua Thêm thì ta phải mở ra lại.
            vitri = bdsNhanVien.Position; //Giữ lại vị trí nhân viên mà chúng ta đang đứng -> dùng trong phục hồi và thêm.
            panelControl3.Enabled = true;
            bdsNhanVien.AddNew();
            txtChiNhanh.Text = macn;
            txtChiNhanh.Enabled = false;
            cmbGioiTinh.Items.Add("Nam");
            cmbGioiTinh.Items.Add("Nữ");
            btnThem.Enabled = btnHieuChinh.Enabled = btnXoa.Enabled = btnTaiLai.Enabled = btnThoat.Enabled= btnChuyenChiNhanh.Enabled = false;
            btnLuu.Enabled = btnPhucHoi.Enabled = true;
            gcNhanVien.Enabled = false;
            check_Luu_HieuChinh = 1;
        }

        private void btnLuu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            bool ketQua = kiemTraDuLieuDauVao();
            if (ketQua == false)
                return;

            if (check_Luu_HieuChinh == 1)    // Nếu chọn btn thêm thì ta chạy SP kiểm tra có trùng mã nv hay không.
            {
                string strLenh = "EXEC [SP_kiemtraNV] '" + txtMaNV.Text + "'";
           //     string strLenh = "DECLARE	@return_value int" +
             //                   "EXEC @return_value = [dbo].[sp_TimNV]" +
               //                        "  @X ='" + txtMaNV.Text + "'"+
                 //               "SELECT  'Return Value' = @return_value";
                try
                {
                    checkMaNV = Program.ExecSqlDataReader(strLenh);
                    checkMaNV.Read();
                    System.Console.WriteLine(checkMaNV.GetBoolean(0));
                    if (checkMaNV.GetBoolean(0))   //đã tồn tại cmnd trùng.
                    {
                        bdsNhanVien.CancelEdit();
                        MessageBox.Show("Mã nhân viên bị trùng.", "", MessageBoxButtons.OK);
                        txtMaNV.Focus();
                        checkMaNV.Close();
                        return;
                    }
                    else
                    {
                        bdsNhanVien.EndEdit();    // kết thúc quá trình tạo. -> Ghi vào trong bds.
                        bdsNhanVien.ResetCurrentItem();   //Đưa những thông tin đó lên lưới.
                        this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
                        this.nhanVienTableAdapter.Update(this.DS.NhanVien); // Update trên adapter có 3 nghĩa: vừa là insert, update, delete. Nó tùy vào tình huống cụ thể để đưa lệnh tương ứng.
                        MessageBox.Show("Thêm thành công!", "", MessageBoxButtons.OK);
                        checkMaNV.Close();
                    }
                }
                catch (Exception ex)
                {
                    checkMaNV.Close();
                    MessageBox.Show("Lỗi: " + ex.Message, "", MessageBoxButtons.OK);
                    return;
                }
            }
            else
            {
                try
                {
                    bdsNhanVien.EndEdit();    // kết thúc quá trình hiệu chỉnh. -> Ghi vào trong bds.
                    bdsNhanVien.ResetCurrentItem();   //Đưa những thông tin đó lên lưới.
                    this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.nhanVienTableAdapter.Update(this.DS.NhanVien); // Update trên adapter có 3 nghĩa: vừa là insert, update, delete. Nó tùy vào tình huống cụ thể để đưa lệnh tương ứng.
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi ghi nhân viên.\n" + ex.Message, "", MessageBoxButtons.OK);
                    return;
                }
            }

            gcNhanVien.Enabled = true;
            btnThem.Enabled = btnXoa.Enabled = btnHieuChinh.Enabled = btnTaiLai.Enabled = btnThoat.Enabled = true;
            btnLuu.Enabled = btnPhucHoi.Enabled = false;

            panelControl3.Enabled = false;

        }
    }
}