using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace NGANHANG
{
    public partial class frmMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private Form CheckExists(Type ftype)
        {
            foreach (Form f in this.MdiChildren)
                if (f.GetType() == ftype)
                    return f;   //nếu frmMain đã tồn tại thì trả về f, không thì trả về null.
            return null;
        }

        public void HienThiMenu()
        {
            MaNV.Text = "Mã NV: " + Program.username;
            HoTen.Text = "; Họ tên: " + Program.mHoten;
            Nhom.Text = "; Nhóm: " + Program.mGroup;

        }

            private void frmMain_Load(object sender, EventArgs e)
        {
            MaNV.Text = "Mã NV: " + Program.username;
            HoTen.Text = "; Họ tên: " + Program.mHoten;
            Nhom.Text = "; Nhóm: " + Program.mGroup;

        }

        private void btnNhanVien_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(frmNV));
            if (frm != null) frm.Activate();
            else
            {
                frmNV f = new frmNV();
                f.MdiParent = this;
                f.Show();
            }
        }

        private void btnGuiRutTien_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(frmGiaoDich));
            if (frm != null) frm.Activate();
            else
            {
                frmGiaoDich f = new frmGiaoDich();
                f.MdiParent = this;
                f.Show();
            }
        }

        private void btnTaoTKNV_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(frmTaoTKNV));
            if (frm != null) frm.Activate();
            else
            {
                frmTaoTKNV f = new frmTaoTKNV();
                f.MdiParent = this;
                f.Show();
            }
        }

        // btn dangxuat
        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                Program.servername = "";
                Program.username = "";
                Program.mlogin = "";
                Program.password = "";
                Program.mloginDN = "";
                Program.passwordDN = "";
                MaNV.Text = "MANV "; HoTen.Text = "HOTEN "; Nhom.Text = "NHOM";
                if (Program.conn.State == ConnectionState.Open) Program.conn.Close();   //Nếu đang mở kết nối thì ta đóng lại.

                Form[] childArray = this.MdiChildren;   //Đóng hết tất cả form con đang mở.
                foreach (Form childForm in childArray)
                {
                    childForm.Close();
                }

                Form f = this.CheckExists(typeof(frmDangNhap));
                if (f != null)
                {
                    f.Activate();
                }
                else
                {
                    frmDangNhap form = new frmDangNhap();
                    //form.MdiParent = this;
                   // Program.frmChinh.Close();
                    form.ShowDialog();
                    this.Close();
                }
                //rib_BaoCao.Visible = rib_DanhMuc.Visible = rib_NghiepVu.Visible = false;
               
              //  MessageBox.Show("Đăng xuất thành công.", "", MessageBoxButtons.OK);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
            return;
        }

        private void btnDangNhap_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }
    }
}
