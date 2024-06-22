
namespace NGANHANG
{
    partial class frmCCN
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
            this.dS = new NGANHANG.DS();
            this.sP_TIMCN_CNVBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.sP_TIMCN_CNVTableAdapter = new NGANHANG.DSTableAdapters.SP_TIMCN_CNVTableAdapter();
            this.tableAdapterManager = new NGANHANG.DSTableAdapters.TableAdapterManager();
            this.sP_TIMCN_CNVGridControl = new DevExpress.XtraGrid.GridControl();
            this.gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.panelControl2 = new DevExpress.XtraEditors.PanelControl();
            this.btnChuyen = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txbMaCN = new System.Windows.Forms.TextBox();
            this.txbHoTen = new System.Windows.Forms.TextBox();
            this.txbMaNv = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).BeginInit();
            this.panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sP_TIMCN_CNVBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sP_TIMCN_CNVGridControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).BeginInit();
            this.panelControl2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panelControl1
            // 
            this.panelControl1.Controls.Add(this.sP_TIMCN_CNVGridControl);
            this.panelControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelControl1.Location = new System.Drawing.Point(0, 0);
            this.panelControl1.Name = "panelControl1";
            this.panelControl1.Size = new System.Drawing.Size(1101, 490);
            this.panelControl1.TabIndex = 0;
            // 
            // dS
            // 
            this.dS.DataSetName = "DS";
            this.dS.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // sP_TIMCN_CNVBindingSource
            // 
            this.sP_TIMCN_CNVBindingSource.DataMember = "SP_TIMCN_CNV";
            this.sP_TIMCN_CNVBindingSource.DataSource = this.dS;
            // 
            // sP_TIMCN_CNVTableAdapter
            // 
            this.sP_TIMCN_CNVTableAdapter.ClearBeforeFill = true;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.ChiNhanhTableAdapter = null;
            this.tableAdapterManager.Connection = null;
            this.tableAdapterManager.GD_CHUYENTIENTableAdapter = null;
            this.tableAdapterManager.GD_GOIRUTTableAdapter = null;
            this.tableAdapterManager.KhachHangTableAdapter = null;
            this.tableAdapterManager.NhanVienTableAdapter = null;
            this.tableAdapterManager.TaiKhoanTableAdapter = null;
            this.tableAdapterManager.UpdateOrder = NGANHANG.DSTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            // 
            // sP_TIMCN_CNVGridControl
            // 
            this.sP_TIMCN_CNVGridControl.DataSource = this.sP_TIMCN_CNVBindingSource;
            this.sP_TIMCN_CNVGridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sP_TIMCN_CNVGridControl.Location = new System.Drawing.Point(2, 2);
            this.sP_TIMCN_CNVGridControl.MainView = this.gridView1;
            this.sP_TIMCN_CNVGridControl.Name = "sP_TIMCN_CNVGridControl";
            this.sP_TIMCN_CNVGridControl.Size = new System.Drawing.Size(1097, 486);
            this.sP_TIMCN_CNVGridControl.TabIndex = 0;
            this.sP_TIMCN_CNVGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gridView1});
            // 
            // gridView1
            // 
            this.gridView1.GridControl = this.sP_TIMCN_CNVGridControl;
            this.gridView1.Name = "gridView1";
            // 
            // panelControl2
            // 
            this.panelControl2.Controls.Add(this.btnChuyen);
            this.panelControl2.Controls.Add(this.label3);
            this.panelControl2.Controls.Add(this.label2);
            this.panelControl2.Controls.Add(this.label1);
            this.panelControl2.Controls.Add(this.txbMaCN);
            this.panelControl2.Controls.Add(this.txbHoTen);
            this.panelControl2.Controls.Add(this.txbMaNv);
            this.panelControl2.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panelControl2.Location = new System.Drawing.Point(0, 255);
            this.panelControl2.Name = "panelControl2";
            this.panelControl2.Size = new System.Drawing.Size(1101, 235);
            this.panelControl2.TabIndex = 1;
            // 
            // btnChuyen
            // 
            this.btnChuyen.Font = new System.Drawing.Font("Tahoma", 14F);
            this.btnChuyen.Location = new System.Drawing.Point(497, 76);
            this.btnChuyen.Margin = new System.Windows.Forms.Padding(4);
            this.btnChuyen.Name = "btnChuyen";
            this.btnChuyen.Size = new System.Drawing.Size(198, 65);
            this.btnChuyen.TabIndex = 17;
            this.btnChuyen.Text = "Chuyển";
            this.btnChuyen.UseVisualStyleBackColor = true;
            this.btnChuyen.Click += new System.EventHandler(this.btnChuyen_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Tahoma", 12F);
            this.label3.Location = new System.Drawing.Point(1, 96);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(98, 29);
            this.label3.TabIndex = 15;
            this.label3.Text = "Họ Tên:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Tahoma", 12F);
            this.label2.Location = new System.Drawing.Point(1, 167);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(169, 29);
            this.label2.TabIndex = 14;
            this.label2.Text = "Mã Chi Nhánh:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Tahoma", 12F);
            this.label1.Location = new System.Drawing.Point(1, 16);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(169, 29);
            this.label1.TabIndex = 13;
            this.label1.Text = "Mã Nhân Viên:";
            // 
            // txbMaCN
            // 
            this.txbMaCN.Font = new System.Drawing.Font("Tahoma", 12F);
            this.txbMaCN.Location = new System.Drawing.Point(196, 168);
            this.txbMaCN.Margin = new System.Windows.Forms.Padding(4);
            this.txbMaCN.Name = "txbMaCN";
            this.txbMaCN.Size = new System.Drawing.Size(242, 36);
            this.txbMaCN.TabIndex = 11;
            // 
            // txbHoTen
            // 
            this.txbHoTen.Font = new System.Drawing.Font("Tahoma", 12F);
            this.txbHoTen.Location = new System.Drawing.Point(114, 96);
            this.txbHoTen.Margin = new System.Windows.Forms.Padding(4);
            this.txbHoTen.Name = "txbHoTen";
            this.txbHoTen.Size = new System.Drawing.Size(324, 36);
            this.txbHoTen.TabIndex = 10;
            // 
            // txbMaNv
            // 
            this.txbMaNv.Font = new System.Drawing.Font("Tahoma", 12F);
            this.txbMaNv.Location = new System.Drawing.Point(196, 16);
            this.txbMaNv.Margin = new System.Windows.Forms.Padding(4);
            this.txbMaNv.Name = "txbMaNv";
            this.txbMaNv.Size = new System.Drawing.Size(242, 36);
            this.txbMaNv.TabIndex = 9;
            // 
            // frmCCN
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 19F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1101, 490);
            this.Controls.Add(this.panelControl2);
            this.Controls.Add(this.panelControl1);
            this.Name = "frmCCN";
            this.Text = "frmCCN";
            this.Load += new System.EventHandler(this.frmCCN_Load);
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).EndInit();
            this.panelControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sP_TIMCN_CNVBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sP_TIMCN_CNVGridControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).EndInit();
            this.panelControl2.ResumeLayout(false);
            this.panelControl2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DS dS;
        private System.Windows.Forms.BindingSource sP_TIMCN_CNVBindingSource;
        private DSTableAdapters.SP_TIMCN_CNVTableAdapter sP_TIMCN_CNVTableAdapter;
        private DSTableAdapters.TableAdapterManager tableAdapterManager;
        private DevExpress.XtraGrid.GridControl sP_TIMCN_CNVGridControl;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private System.Windows.Forms.Button btnChuyen;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txbMaCN;
        private System.Windows.Forms.TextBox txbHoTen;
        private System.Windows.Forms.TextBox txbMaNv;
    }
}