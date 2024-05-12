
namespace NGANHANG
{
    partial class frmChuyenChiNhanh
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.panelControl1 = new DevExpress.XtraEditors.PanelControl();
            this.panelControl2 = new DevExpress.XtraEditors.PanelControl();
            this.chiNhanhGridControl = new DevExpress.XtraGrid.GridControl();
            this.chiNhanhBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dS = new NGANHANG.DS();
            this.gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.chiNhanhTableAdapter = new NGANHANG.DSTableAdapters.ChiNhanhTableAdapter();
            this.tableAdapterManager = new NGANHANG.DSTableAdapters.TableAdapterManager();
            this.txbMaNv = new System.Windows.Forms.TextBox();
            this.txbHoTen = new System.Windows.Forms.TextBox();
            this.txbMaCN = new System.Windows.Forms.TextBox();
            this.txbMaNVMoi = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnChuyen = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).BeginInit();
            this.panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).BeginInit();
            this.panelControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.chiNhanhGridControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.chiNhanhBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // panelControl1
            // 
            this.panelControl1.Controls.Add(this.btnChuyen);
            this.panelControl1.Controls.Add(this.label4);
            this.panelControl1.Controls.Add(this.label3);
            this.panelControl1.Controls.Add(this.label2);
            this.panelControl1.Controls.Add(this.label1);
            this.panelControl1.Controls.Add(this.txbMaNVMoi);
            this.panelControl1.Controls.Add(this.txbMaCN);
            this.panelControl1.Controls.Add(this.txbHoTen);
            this.panelControl1.Controls.Add(this.txbMaNv);
            this.panelControl1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panelControl1.Location = new System.Drawing.Point(0, 218);
            this.panelControl1.Name = "panelControl1";
            this.panelControl1.Size = new System.Drawing.Size(915, 235);
            this.panelControl1.TabIndex = 0;
            // 
            // panelControl2
            // 
            this.panelControl2.Controls.Add(this.chiNhanhGridControl);
            this.panelControl2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelControl2.Location = new System.Drawing.Point(0, 0);
            this.panelControl2.Name = "panelControl2";
            this.panelControl2.Size = new System.Drawing.Size(915, 218);
            this.panelControl2.TabIndex = 1;
            // 
            // chiNhanhGridControl
            // 
            this.chiNhanhGridControl.DataSource = this.chiNhanhBindingSource;
            this.chiNhanhGridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chiNhanhGridControl.Location = new System.Drawing.Point(2, 2);
            this.chiNhanhGridControl.MainView = this.gridView1;
            this.chiNhanhGridControl.Name = "chiNhanhGridControl";
            this.chiNhanhGridControl.Size = new System.Drawing.Size(911, 214);
            this.chiNhanhGridControl.TabIndex = 0;
            this.chiNhanhGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gridView1});
            // 
            // chiNhanhBindingSource
            // 
            this.chiNhanhBindingSource.DataMember = "ChiNhanh";
            this.chiNhanhBindingSource.DataSource = this.dS;
            // 
            // dS
            // 
            this.dS.DataSetName = "DS";
            this.dS.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // gridView1
            // 
            this.gridView1.GridControl = this.chiNhanhGridControl;
            this.gridView1.Name = "gridView1";
            // 
            // chiNhanhTableAdapter
            // 
            this.chiNhanhTableAdapter.ClearBeforeFill = true;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.ChiNhanhTableAdapter = this.chiNhanhTableAdapter;
            this.tableAdapterManager.GD_CHUYENTIENTableAdapter = null;
            this.tableAdapterManager.GD_GOIRUTTableAdapter = null;
            this.tableAdapterManager.KhachHangTableAdapter = null;
            this.tableAdapterManager.NhanVienTableAdapter = null;
            this.tableAdapterManager.TaiKhoanTableAdapter = null;
            this.tableAdapterManager.UpdateOrder = NGANHANG.DSTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            // 
            // txbMaNv
            // 
            this.txbMaNv.Font = new System.Drawing.Font("Tahoma", 12F);
            this.txbMaNv.Location = new System.Drawing.Point(187, 45);
            this.txbMaNv.Name = "txbMaNv";
            this.txbMaNv.Size = new System.Drawing.Size(189, 32);
            this.txbMaNv.TabIndex = 0;
            // 
            // txbHoTen
            // 
            this.txbHoTen.Font = new System.Drawing.Font("Tahoma", 12F);
            this.txbHoTen.Location = new System.Drawing.Point(123, 112);
            this.txbHoTen.Name = "txbHoTen";
            this.txbHoTen.Size = new System.Drawing.Size(253, 32);
            this.txbHoTen.TabIndex = 1;
            // 
            // txbMaCN
            // 
            this.txbMaCN.Font = new System.Drawing.Font("Tahoma", 12F);
            this.txbMaCN.Location = new System.Drawing.Point(187, 173);
            this.txbMaCN.Name = "txbMaCN";
            this.txbMaCN.Size = new System.Drawing.Size(189, 32);
            this.txbMaCN.TabIndex = 2;
            // 
            // txbMaNVMoi
            // 
            this.txbMaNVMoi.Font = new System.Drawing.Font("Tahoma", 12F);
            this.txbMaNVMoi.Location = new System.Drawing.Point(780, 104);
            this.txbMaNVMoi.Name = "txbMaNVMoi";
            this.txbMaNVMoi.Size = new System.Drawing.Size(100, 32);
            this.txbMaNVMoi.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Tahoma", 12F);
            this.label1.Location = new System.Drawing.Point(35, 45);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(140, 24);
            this.label1.TabIndex = 4;
            this.label1.Text = "Mã Nhân Viên:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Tahoma", 12F);
            this.label2.Location = new System.Drawing.Point(35, 172);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(140, 24);
            this.label2.TabIndex = 5;
            this.label2.Text = "Mã Chi Nhánh:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Tahoma", 12F);
            this.label3.Location = new System.Drawing.Point(35, 111);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(82, 24);
            this.label3.TabIndex = 6;
            this.label3.Text = "Họ Tên:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Tahoma", 12F);
            this.label4.Location = new System.Drawing.Point(597, 103);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(177, 24);
            this.label4.TabIndex = 7;
            this.label4.Text = "Mã Nhân Viên Mới:";
            // 
            // btnChuyen
            // 
            this.btnChuyen.Font = new System.Drawing.Font("Tahoma", 14F);
            this.btnChuyen.Location = new System.Drawing.Point(421, 95);
            this.btnChuyen.Name = "btnChuyen";
            this.btnChuyen.Size = new System.Drawing.Size(154, 55);
            this.btnChuyen.TabIndex = 8;
            this.btnChuyen.Text = "Chuyển";
            this.btnChuyen.UseVisualStyleBackColor = true;
            this.btnChuyen.Click += new System.EventHandler(this.btnChuyen_Click);
            // 
            // frmChuyenChiNhanh
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(915, 453);
            this.Controls.Add(this.panelControl2);
            this.Controls.Add(this.panelControl1);
            this.Name = "frmChuyenChiNhanh";
            this.Text = "Chuyển Chi Nhánh";
            this.Load += new System.EventHandler(this.frmChyuenChiNhanh_Load);
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).EndInit();
            this.panelControl1.ResumeLayout(false);
            this.panelControl1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).EndInit();
            this.panelControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.chiNhanhGridControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.chiNhanhBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DS dS;
        private System.Windows.Forms.BindingSource chiNhanhBindingSource;
        private DSTableAdapters.ChiNhanhTableAdapter chiNhanhTableAdapter;
        private DSTableAdapters.TableAdapterManager tableAdapterManager;
        private DevExpress.XtraGrid.GridControl chiNhanhGridControl;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private System.Windows.Forms.Button btnChuyen;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txbMaNVMoi;
        private System.Windows.Forms.TextBox txbMaCN;
        private System.Windows.Forms.TextBox txbHoTen;
        private System.Windows.Forms.TextBox txbMaNv;
    }
}