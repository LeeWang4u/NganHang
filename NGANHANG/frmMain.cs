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
    }
}
