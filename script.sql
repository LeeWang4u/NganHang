USE [master]
GO
/****** Object:  Database [NGANHANG]    Script Date: 6/29/2024 12:46:47 AM ******/
CREATE DATABASE [NGANHANG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NGANHANG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HIDRO1\MSSQL\DATA\NGANHANG.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NGANHANG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HIDRO1\MSSQL\DATA\NGANHANG_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [NGANHANG] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NGANHANG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NGANHANG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NGANHANG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NGANHANG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NGANHANG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NGANHANG] SET ARITHABORT OFF 
GO
ALTER DATABASE [NGANHANG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NGANHANG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NGANHANG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NGANHANG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NGANHANG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NGANHANG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NGANHANG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NGANHANG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NGANHANG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NGANHANG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NGANHANG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NGANHANG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NGANHANG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NGANHANG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NGANHANG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NGANHANG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NGANHANG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NGANHANG] SET RECOVERY FULL 
GO
ALTER DATABASE [NGANHANG] SET  MULTI_USER 
GO
ALTER DATABASE [NGANHANG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NGANHANG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NGANHANG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NGANHANG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NGANHANG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NGANHANG] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NGANHANG', N'ON'
GO
ALTER DATABASE [NGANHANG] SET QUERY_STORE = ON
GO
ALTER DATABASE [NGANHANG] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [NGANHANG]
GO
/****** Object:  User [HTKN]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE USER [HTKN] FOR LOGIN [HTKN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [MSmerge_PAL_role]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE ROLE [MSmerge_PAL_role]
GO
/****** Object:  DatabaseRole [MSmerge_C0B252CBF4B14640B31B4A1EFCAD07A7]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE ROLE [MSmerge_C0B252CBF4B14640B31B4A1EFCAD07A7]
GO
/****** Object:  DatabaseRole [MSmerge_4E2120CAE63D4F8C955CBEBBF1D1475F]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE ROLE [MSmerge_4E2120CAE63D4F8C955CBEBBF1D1475F]
GO
/****** Object:  DatabaseRole [MSmerge_3B8FE1830D55401CAE97EB5602D13614]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE ROLE [MSmerge_3B8FE1830D55401CAE97EB5602D13614]
GO
ALTER ROLE [db_owner] ADD MEMBER [HTKN]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_C0B252CBF4B14640B31B4A1EFCAD07A7]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_4E2120CAE63D4F8C955CBEBBF1D1475F]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_3B8FE1830D55401CAE97EB5602D13614]
GO
/****** Object:  Schema [MSmerge_PAL_role]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE SCHEMA [MSmerge_PAL_role]
GO
/****** Object:  View [dbo].[Get_Subscribes]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Get_Subscribes]
AS
SELECT TENCN=PUBS.description, TENSERVER=subscriber_server
 FROM sysmergepublications  PUBS, sysmergesubscriptions SUBS
 WHERE PUBS.pubid = SUBS.pubid AND  publisher <> subscriber_server
 and PUBS.description like '%chi nhánh%'
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[MACN] [nchar](10) NOT NULL,
	[TENCN] [nvarchar](100) NOT NULL,
	[DIACHI] [nvarchar](100) NOT NULL,
	[SoDT] [nvarchar](15) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[MACN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_ChiNhanh] UNIQUE NONCLUSTERED 
(
	[TENCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GD_CHUYENTIEN]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GD_CHUYENTIEN](
	[MAGD] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SOTK_CHUYEN] [nchar](9) NOT NULL,
	[NGAYGD] [datetime] NOT NULL,
	[SOTIEN] [money] NOT NULL,
	[SOTK_NHAN] [nchar](9) NOT NULL,
	[MANV] [nchar](10) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_GD_CHUYENTIEN] PRIMARY KEY CLUSTERED 
(
	[MAGD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GD_GOIRUT]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GD_GOIRUT](
	[MAGD] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SOTK] [nchar](9) NOT NULL,
	[LOAIGD] [nchar](2) NOT NULL,
	[NGAYGD] [datetime] NOT NULL,
	[SOTIEN] [money] NOT NULL,
	[MANV] [nchar](10) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_GD_GOIRUT] PRIMARY KEY CLUSTERED 
(
	[MAGD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[CMND] [nchar](10) NOT NULL,
	[HO] [nvarchar](50) NOT NULL,
	[TEN] [nvarchar](10) NOT NULL,
	[DIACHI] [nvarchar](100) NULL,
	[PHAI] [nvarchar](3) NULL,
	[NGAYCAP] [date] NOT NULL,
	[SODT] [nvarchar](15) NOT NULL,
	[MACN] [nchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MANV] [nchar](10) NOT NULL,
	[HO] [nvarchar](40) NOT NULL,
	[TEN] [nvarchar](10) NOT NULL,
	[CMND] [nchar](10) NOT NULL,
	[DIACHI] [nvarchar](100) NULL,
	[PHAI] [nvarchar](3) NOT NULL,
	[SODT] [nvarchar](15) NOT NULL,
	[MACN] [nchar](10) NULL,
	[TrangThaiXoa] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_NhanVien] UNIQUE NONCLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[SOTK] [nchar](9) NOT NULL,
	[CMND] [nchar](10) NOT NULL,
	[SODU] [money] NULL,
	[MACN] [nchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[NGAYCAP] [date] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[SOTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_901578250]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_901578250] ON [dbo].[ChiNhanh]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_933578364]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_933578364] ON [dbo].[GD_CHUYENTIEN]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_965578478]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_965578478] ON [dbo].[GD_GOIRUT]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_997578592]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_997578592] ON [dbo].[KhachHang]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_1029578706]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_1029578706] ON [dbo].[NhanVien]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_1077578877]    Script Date: 6/29/2024 12:46:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_1077578877] ON [dbo].[TaiKhoan]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiNhanh] ADD  CONSTRAINT [MSmerge_df_rowguid_743ED90CA7024FDA8E2B8C04BCCA45B4]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN] ADD  CONSTRAINT [DF_GD_CHUYENTIEN_NGAYGD]  DEFAULT (getdate()) FOR [NGAYGD]
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN] ADD  CONSTRAINT [MSmerge_df_rowguid_96767244BEAB4993864BE7FA8BE02D64]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[GD_GOIRUT] ADD  CONSTRAINT [DF_GD_GOIRUT_NGAYGD]  DEFAULT (getdate()) FOR [NGAYGD]
GO
ALTER TABLE [dbo].[GD_GOIRUT] ADD  CONSTRAINT [DF_GD_GOIRUT_SOTIEN]  DEFAULT ((100000)) FOR [SOTIEN]
GO
ALTER TABLE [dbo].[GD_GOIRUT] ADD  CONSTRAINT [MSmerge_df_rowguid_8C51D4D095214192B384EA8A60922E9D]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_KhachHang_PHAI]  DEFAULT ('Nam') FOR [PHAI]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [MSmerge_df_rowguid_FA32DDAC1046426EA61E779D7EF02100]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_NhanVien_PHAI]  DEFAULT (N'Nam') FOR [PHAI]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_NhanVien_TrangThaiXoa]  DEFAULT ((0)) FOR [TrangThaiXoa]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [MSmerge_df_rowguid_1B52ACDD89434F3B9701010618727B2B]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((0)) FOR [SODU]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [MSmerge_df_rowguid_3D6FE48CEE2E4C52B8C2982B4616111C]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN]  WITH CHECK ADD  CONSTRAINT [FK_GD_CHUYENTIEN_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN] CHECK CONSTRAINT [FK_GD_CHUYENTIEN_NhanVien]
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN]  WITH CHECK ADD  CONSTRAINT [FK_GD_CHUYENTIEN_TaiKhoan] FOREIGN KEY([SOTK_CHUYEN])
REFERENCES [dbo].[TaiKhoan] ([SOTK])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN] CHECK CONSTRAINT [FK_GD_CHUYENTIEN_TaiKhoan]
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN]  WITH CHECK ADD  CONSTRAINT [FK_GD_CHUYENTIEN_TaiKhoan1] FOREIGN KEY([SOTK_NHAN])
REFERENCES [dbo].[TaiKhoan] ([SOTK])
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN] CHECK CONSTRAINT [FK_GD_CHUYENTIEN_TaiKhoan1]
GO
ALTER TABLE [dbo].[GD_GOIRUT]  WITH CHECK ADD  CONSTRAINT [FK_GD_GOIRUT_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GD_GOIRUT] CHECK CONSTRAINT [FK_GD_GOIRUT_NhanVien]
GO
ALTER TABLE [dbo].[GD_GOIRUT]  WITH CHECK ADD  CONSTRAINT [FK_GD_GOIRUT_TaiKhoan] FOREIGN KEY([SOTK])
REFERENCES [dbo].[TaiKhoan] ([SOTK])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GD_GOIRUT] CHECK CONSTRAINT [FK_GD_GOIRUT_TaiKhoan]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ChiNhanh] FOREIGN KEY([MACN])
REFERENCES [dbo].[ChiNhanh] ([MACN])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_ChiNhanh]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChiNhanh] FOREIGN KEY([MACN])
REFERENCES [dbo].[ChiNhanh] ([MACN])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChiNhanh]
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN]  WITH CHECK ADD  CONSTRAINT [CK_GD_CHUYENTIEN] CHECK  (([SOTIEN]>(0)))
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN] CHECK CONSTRAINT [CK_GD_CHUYENTIEN]
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_014EF147_EF2C_4D27_857E_0C28677175C1] CHECK NOT FOR REPLICATION (([MAGD]>=(1) AND [MAGD]<=(1001) OR [MAGD]>(1001) AND [MAGD]<=(2001)))
GO
ALTER TABLE [dbo].[GD_CHUYENTIEN] CHECK CONSTRAINT [repl_identity_range_014EF147_EF2C_4D27_857E_0C28677175C1]
GO
ALTER TABLE [dbo].[GD_GOIRUT]  WITH CHECK ADD  CONSTRAINT [CK_LOAIGD] CHECK  (([LOAIGD]='RT' OR [LOAIGD]='GT'))
GO
ALTER TABLE [dbo].[GD_GOIRUT] CHECK CONSTRAINT [CK_LOAIGD]
GO
ALTER TABLE [dbo].[GD_GOIRUT]  WITH CHECK ADD  CONSTRAINT [CK_SOTIEN] CHECK  (([SOTIEN]>=(100000)))
GO
ALTER TABLE [dbo].[GD_GOIRUT] CHECK CONSTRAINT [CK_SOTIEN]
GO
ALTER TABLE [dbo].[GD_GOIRUT]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_B1F66565_290B_40A2_BD97_763D8FAF1227] CHECK NOT FOR REPLICATION (([MAGD]>=(1) AND [MAGD]<=(1001) OR [MAGD]>(1001) AND [MAGD]<=(2001)))
GO
ALTER TABLE [dbo].[GD_GOIRUT] CHECK CONSTRAINT [repl_identity_range_B1F66565_290B_40A2_BD97_763D8FAF1227]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CK_KhachHang] CHECK  (([PHAI]='Nam' OR [PHAI]=N'Nữ'))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CK_KhachHang]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_NhanVien] CHECK  (([PHAI]='Nam' OR [PHAI]=N'Nữ'))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_NhanVien]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [CK_SODU] CHECK  (([SODU]>=(0)))
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [CK_SODU]
GO
/****** Object:  StoredProcedure [dbo].[DSSV]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DSSV] @ten VARCHAR(100), @tenserver NVARCHAR(100) OUTPUT

AS
SELECT  @tenserver= SUBS.subscriber_server 
                                FROM sysmergepublications pubs
                                INNER JOIN sysmergesubscriptions SUBS ON PUBS.pubid = SUBS.pubid
                                WHERE publisher <> subscriber_server AND pubs.name = @ten
GO
/****** Object:  StoredProcedure [dbo].[Num2Text_SP]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Num2Text_SP]
    @Number int,
    @TextResult nvarchar(4000) OUTPUT
AS 
BEGIN 
    DECLARE @sNumber nvarchar(4000)
    DECLARE @Return nvarchar(4000)
    DECLARE @mLen int
    DECLARE @i int

    DECLARE @mDigit int
    DECLARE @mGroup int
    DECLARE @mTemp nvarchar(4000)
    DECLARE @mNumText nvarchar(4000)

    SELECT @sNumber = LTRIM(STR(@Number))
    SELECT @mLen = Len(@sNumber)

    SELECT @i = 1
    SELECT @mTemp = ''

    WHILE @i <= @mLen
    BEGIN
        SELECT @mDigit = SUBSTRING(@sNumber, @i, 1)

        IF @mDigit = 0 
            SELECT @mNumText = N'không'
        ELSE
        BEGIN
            IF @mDigit = 1 
                SELECT @mNumText = N'một'
            ELSE IF @mDigit = 2 
                SELECT @mNumText = N'hai'
            ELSE IF @mDigit = 3 
                SELECT @mNumText = N'ba'
            ELSE IF @mDigit = 4 
                SELECT @mNumText = N'bốn'
            ELSE IF @mDigit = 5 
                SELECT @mNumText = N'năm'
            ELSE IF @mDigit = 6 
                SELECT @mNumText = N'sáu'
            ELSE IF @mDigit = 7 
                SELECT @mNumText = N'bảy'
            ELSE IF @mDigit = 8 
                SELECT @mNumText = N'tám'
            ELSE IF @mDigit = 9 
                SELECT @mNumText = N'chín'
        END

        SELECT @mTemp = @mTemp + ' ' + @mNumText

        IF (@mLen = @i) BREAK

        SELECT @mGroup = (@mLen - @i) % 9

        IF @mGroup = 0
        BEGIN
            SELECT @mTemp = @mTemp + N' tỷ'

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3
        END 
        ELSE IF @mGroup = 6
        BEGIN
            SELECT @mTemp = @mTemp + N' triệu'

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3
        END
        ELSE IF @mGroup = 3
        BEGIN
            SELECT @mTemp = @mTemp + N' nghìn'

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3
        END
        ELSE
        BEGIN
            SELECT @mGroup = (@mLen - @i) % 3

            IF @mGroup = 2	
                SELECT @mTemp = @mTemp + N' trăm'
            ELSE IF @mGroup = 1
                SELECT @mTemp = @mTemp + N' mươi'	
        END

        SELECT @i = @i + 1
    END

    --'Loại bỏ trường hợp x00
    SELECT @mTemp = Replace(@mTemp, N'không mươi không', '')

    --'Loại bỏ trường hợp 00x
    SELECT @mTemp = Replace(@mTemp, N'không mươi ', N'linh ')

    --'Loại bỏ trường hợp x0, x>=2
    SELECT @mTemp = Replace(@mTemp, N'mươi không', N'mươi')

    --'Fix trường hợp 10
    SELECT @mTemp = Replace(@mTemp, N'một mươi', N'mười')

    --'Fix trường hợp x4, x>=2
    SELECT @mTemp = Replace(@mTemp, N'mươi bốn', N'mươi tư')

    --'Fix trường hợp x04 
    SELECT @mTemp = Replace(@mTemp, N'linh bốn', N'linh tư')

    --'Fix trường hợp x5, x>=2
    SELECT @mTemp = Replace(@mTemp, N'mươi năm', N'mươi nhăm')

    --'Fix trường hợp x1, x>=2
    SELECT @mTemp = Replace(@mTemp, N'mươi một', N'mươi mốt')

    --'Fix trường hợp x15
    SELECT @mTemp = Replace(@mTemp, N'mười năm', N'mười lăm')

    --'Bỏ ký tự space
    SELECT @mTemp = LTrim(@mTemp)

    --'Ucase ký tự đầu tiên
    SELECT @Return = UPPER(Left(@mTemp, 1)) + SUBSTRING(@mTemp, 2, 4000)

    SET @TextResult = @Return
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Check_CMND_MoTK]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Check_CMND_MoTK]
    @cmnd NCHAR(10),
    @maChiNhanh NCHAR(10),
    @exists BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the customer has an account in the specified branch in the local database
    IF EXISTS (SELECT SOTK FROM TaiKhoan WHERE CMND = @cmnd AND MACN = @maChiNhanh)
    BEGIN
        SET @exists = 1;
    END
    -- Check if the customer has an account in the specified branch in the linked database
    ELSE IF EXISTS (SELECT SOTK FROM LINK0.NGANHANG.DBO.TaiKhoan WHERE CMND = @cmnd AND MACN = @maChiNhanh)
    BEGIN
        SET @exists = 1;
    END
    ELSE
    BEGIN
        SET @exists = 0
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CHUYENCHINHANH_NV]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CHUYENCHINHANH_NV] 
    @MANV nchar(10), 
    @MANVC nchar(10),
    @MACN nchar(10),
    @CMND nchar(10),
    @CMND0 nchar(10),
	@TENSERVER VARCHAR(100)--,
   -- @LinkServer nchar (20)
AS
DECLARE @LGNAME VARCHAR(50)
DECLARE @USERNAME VARCHAR(50)
declare  @LinkServer nchar (20)
DECLARE @Result NVARCHAR(100)
DECLARE @sql NVARCHAR(MAX);
SET XACT_ABORT ON;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN
    BEGIN DISTRIBUTED TRAN
		
		--DECLARE @ten VARCHAR(100) = 'NGANHANG_TANDINH';
		-- TIM LINK SERVER

-- Thực hiện stored procedure trên linked server và lấy kết quả vào @Result
EXEC LINK0.NGANHANG.dbo.DSSV @TENSERVER, @Result OUTPUT;

-- Kiểm tra xem @Result có giá trị không
IF @Result IS NOT NULL
BEGIN
    -- Nếu @Result có giá trị, thực hiện câu truy vấn SELECT
    BEGIN TRY
        SELECT @LinkServer = s.name  
        FROM sys.servers AS s 
        WHERE s.product LIKE '%' + @Result + '%';

        -- Kiểm tra xem có kết quả từ câu truy vấn SELECT không
        IF @LinkServer IS NULL
        BEGIN
            -- Nếu không có kết quả, in ra thông báo "raieror" và kết thúc
            RAISERROR('KHONG TIM THAY SERVER CHI NHANH !!!', 16, 1) -- Thông báo khi không tìm thấy kết quả
            RETURN; -- Kết thúc stored procedure
        END
    END TRY
    BEGIN CATCH
        -- Xử lý ngoại lệ khi không thể thực hiện câu lệnh SELECT trên linked server
        RAISERROR('LOI TIM SERVER !!!', 16, 1)
        RETURN; -- Thoát khỏi stored procedure
    END CATCH
END
ELSE
BEGIN
    -- Nếu @Result là NULL, thông báo "raieror" và kết thúc
    RAISERROR('KHONG TIM THAY CHI NHANH !!!', 16, 1) -- Thông báo khi không tìm thấy kết quả
    RETURN; -- Kết thúc stored procedure
END



    SET @sql = '
        IF EXISTS(SELECT * FROM ' + @LinkServer + '.NganHang.dbo.NhanVien WHERE CMND  = @CMND0)
        BEGIN
            UPDATE ' + @LinkServer + '.NganHang.dbo.NhanVien
            SET TrangThaiXoa = 0, CMND = @CMND
            WHERE CMND  = @CMND0;
        END
        ELSE
        BEGIN
            INSERT INTO ' + @LinkServer + '.NganHang.dbo.NhanVien (MANV, HO, TEN, CMND,  DIACHI, PHAI, SODT, MACN, TRANGTHAIXOA)
            SELECT MANV = @MANVC, HO, TEN, CMND = @CMND,  DIACHI, PHAI, SODT, MACN = @MACN, TRANGTHAIXOA
            FROM dbo.NhanVien
            WHERE MANV = @MANV;
        END';

    EXEC sp_executesql @sql, 
                       N'@MANVC NCHAR(10), @MACN NCHAR(10), @CMND NCHAR(10), @MANV NCHAR(10), @CMND0 NCHAR(10)', 
                       @MANVC, @MACN, @CMND, @MANV, @CMND0;
					   

    IF EXISTS(SELECT 1 FROM NhanVien
              WHERE NhanVien.MANV = @MANV AND				
              (EXISTS(SELECT 1 FROM GD_GOIRUT WHERE GD_GOIRUT.MANV = NhanVien.MANV) 
               OR EXISTS(SELECT MAGD FROM GD_CHUYENTIEN WHERE GD_CHUYENTIEN.MANV = NhanVien.MANV)))
    BEGIN 
        UPDATE dbo.NhanVien
        SET TrangThaiXoa = 1, CMND = @CMND0
        WHERE MANV = @MANV;
    END
    ELSE
    BEGIN
        DELETE FROM dbo.NhanVien WHERE MANV = @MANV;
    END

    COMMIT TRAN;

    IF EXISTS(SELECT SUSER_SNAME(sid) FROM sys.sysusers WHERE name = CAST(@MANV AS NVARCHAR))
    BEGIN
        SET @LGNAME = CAST((SELECT SUSER_SNAME(sid) FROM sys.sysusers WHERE name = CAST(@MANV AS NVARCHAR)) AS VARCHAR(50))
        SET @USERNAME = CAST(@MANV AS VARCHAR(50))
        EXEC SP_DROPUSER @USERNAME;
        EXEC SP_DROPLOGIN  @LGNAME;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CHUYENTIEN]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CHUYENTIEN] (@STKGUI nChar(9), @STKNHAN nChar(9), @TIEN MONEY,@MANV NCHAR(10))
AS
SET XACT_ABORT ON	--NEU OFF THI SQL SE BO QUA LENH GAY LOI VA CHAY TIEP
BEGIN
	--KIEM TRA STK_GUI VA STK_NHAN CO TON TAI TRONG DB HAY KHONG, SAU DO THI KIEM TRA SO DU NGUOI GUI.
	IF ( EXISTS( SELECT SOTK FROM TaiKhoan WHERE SOTK=@STKNHAN ) AND 
			EXISTS( SELECT SOTK FROM TaiKhoan WHERE SOTK=@STKGUI) )
		BEGIN
			DECLARE @SODU_NGUOICHUYEN MONEY
			SELECT @SODU_NGUOICHUYEN = SODU FROM TaiKhoan WHERE @STKGUI = SOTK

			IF @SODU_NGUOICHUYEN < @TIEN
				RAISERROR('SO DU KHONG DU !!!', 16, 1)
			ELSE
				BEGIN
					BEGIN TRANSACTION
					BEGIN TRY
						UPDATE TaiKhoan
						SET SODU -= @TIEN
						WHERE @STKGUI = SOTK

						UPDATE TaiKhoan
						SET SODU += @TIEN
						WHERE @STKNHAN = SOTK

						INSERT INTO GD_CHUYENTIEN(SOTK_CHUYEN,NGAYGD,SOTIEN,SOTK_NHAN,MANV) 
							VALUES (@STKGUI,GETDATE(),@TIEN,@STKNHAN,@MANV)

						COMMIT
					END TRY
					
					BEGIN CATCH		-- một số trường hợp bất ngờ có thể xảy ra gây ra lỗi
						ROLLBACK	-- ví dụ như mất điện khi đang cộng trừ tiền trong tài khoản.
						DECLARE @ERRORMESSAGE VARCHAR(2000)
						SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
						RAISERROR(@ERRORMESSAGE, 16, 1)
					END CATCH
				END
		END
	ELSE
		RAISERROR('SO TAI KHOAN KHONG TON TAI !!!', 16, 1)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_create_account]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_create_account]
    @USERNAME NCHAR(10),
    @LGNAME NVARCHAR(50),
    @PASS NVARCHAR(50),
    @ROLE NVARCHAR(50)  -- thêm tham số ROLE
AS
BEGIN
    SET XACT_ABORT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Kiểm tra NhanVien
        DECLARE @cknv INT;
        SELECT @cknv = COUNT(*) FROM NhanVien WHERE MANV = @USERNAME;
        IF @cknv = 0
            RAISERROR('Mã nhân viên không tồn tại hoặc không thuộc chi nhánh này', 16, 1);

        DECLARE @sql NVARCHAR(MAX);

        -- Tạo login
        SET @sql = 'CREATE LOGIN ' + QUOTENAME(@LGNAME) + ' WITH PASSWORD = ' + QUOTENAME(@PASS, '''');
        EXEC sp_executesql @sql;

        -- Tạo user
        SET @sql = 'CREATE USER ' + QUOTENAME(@USERNAME) + ' FOR LOGIN ' + QUOTENAME(@LGNAME);
        EXEC sp_executesql @sql;

        -- Thay đổi role
        SET @sql = 'ALTER ROLE ' + QUOTENAME(@ROLE) + ' ADD MEMBER ' + QUOTENAME(@USERNAME);
        EXEC sp_executesql @sql;

        -- Thay đổi role hệ thống
        SET @sql = 'ALTER SERVER ROLE securityadmin ADD MEMBER ' + QUOTENAME(@LGNAME);
        EXEC sp_executesql @sql;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_GUIRUT]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SP_GUIRUT] (@STK	NCHAR(9), @TIEN MONEY, @LOAIGD NCHAR(2),@MANV NCHAR(10))
AS
SET XACT_ABORT ON		-- NEU OFF THI SQL SE BO QUA LENH GAY LOI.
BEGIN TRANSACTION		-- Nếu chỉ SP chỉ có một lệnh UPDATE thì ta không cần sử dụng giao tác vì nó là giao tác tự động.
	BEGIN TRY			-- Nhưng SP này ta có 2 lệnh là UPDATE và INSERT.
		IF EXISTS(SELECT SOTK FROM TaiKhoan WHERE SOTK=@STK)	-- Kiểm tra stk có tồn tại hay không, sau đó xét xem nó là 'RT' hay 'GT'
			BEGIN
				DECLARE @SODU MONEY
				SELECT @SODU=SODU FROM TaiKhoan WHERE @STK=SOTK

				IF @LOAIGD = 'GT'
					BEGIN
						UPDATE TaiKhoan
						SET SODU += @TIEN
						WHERE @STK = SOTK

						INSERT INTO GD_GOIRUT(SOTK,LOAIGD,NGAYGD,SOTIEN,MANV) 
							VALUES(@STK,@LOAIGD,GETDATE(),@TIEN,@MANV)
					END

	
				ELSE IF @LOAIGD = 'RT'
					BEGIN
						IF @SODU < @TIEN
							RAISERROR('SO DU KHONG DU !!!', 16, 1)
						ELSE
							BEGIN
								UPDATE TaiKhoan
								SET SODU -= @TIEN
								WHERE @STK = SOTK

								INSERT INTO GD_GOIRUT(SOTK,LOAIGD,NGAYGD,SOTIEN,MANV) 
									VALUES(@STK,@LOAIGD,GETDATE(),@TIEN,@MANV)
							END
					END
			END
		ELSE
			RAISERROR('SO TAI KHOAN KHONG TON TAI !!!', 16, 1)
		
		COMMIT
	END TRY
	
BEGIN CATCH
	ROLLBACK
	DECLARE @ERRORMESSAGE VARCHAR(2000)
	SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
	RAISERROR(@ERRORMESSAGE, 16, 1)
END CATCH


GO
/****** Object:  StoredProcedure [dbo].[SP_KiemTraCMNDNhanVien]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_KiemTraCMNDNhanVien]
	@X NCHAR(10)
AS
BEGIN
	DECLARE @ktnv INT
	SELECT @ktnv = COUNT(*) FROM NhanVien WHERE CMND=@X

	IF @ktnv != 0
	BEGIN
		SELECT CAST(1 AS BIT)
		RETURN 
	END
		

	SELECT @ktnv = COUNT(*) FROM LINK1.NGANHANG.dbo.NhanVien WHERE CMND=@X

	IF @ktnv = 0
	BEGIN
		SELECT CAST(0 AS BIT)
		RETURN 
	END

	SELECT CAST(1 AS BIT)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_KiemtraKH]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_KiemtraKH]
  @X NCHAR(10)
AS
BEGIN
  DECLARE @ktnv INT
  SELECT @ktnv = COUNT(*) FROM KhachHang WHERE CMND=@X

  IF @ktnv != 0
  BEGIN
    SELECT CAST(1 AS BIT)
    RETURN 
  END
    

  SELECT @ktnv = COUNT(*) FROM LINK1.NGANHANG.dbo.KhachHang WHERE CMND=@X

  IF @ktnv = 0
  BEGIN
    SELECT CAST(0 AS BIT)
    RETURN 
  END

  SELECT CAST(1 AS BIT)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_kiemtraNV]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SP_kiemtraNV]
	@X NCHAR(10)
AS
BEGIN
	DECLARE @ktnv INT
	SELECT @ktnv = COUNT(*) FROM NhanVien WHERE MANV=@X

	IF @ktnv != 0
	BEGIN
		SELECT CAST(1 AS BIT)
		RETURN 
	END
		

	SELECT @ktnv = COUNT(*) FROM LINK1.NGANHANG.dbo.NhanVien WHERE MANV=@X

	IF @ktnv = 0
	BEGIN
		SELECT CAST(0 AS BIT)
		RETURN 
	END

	SELECT CAST(1 AS BIT)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_KiemTraSTK]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KiemTraSTK]
	@STK NCHAR(9)
AS
BEGIN
IF  EXISTS( SELECT SOTK FROM TaiKhoan WHERE SOTK=@STK )
BEGIN
SELECT (kh.HO + ' ' + kh.TEN) AS [HOTEN], SODU FROM TaiKhoan
JOIN LINK2.NGANHANG.dbo.KhachHang KH ON TaiKhoan.CMND = KH.CMND
WHERE SOTK = @STK
END
ELSE
RAISERROR('SO TAI KHOAN KHONG TON TAI !!!', 16, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_DS_CHI_NHANH]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LAY_DS_CHI_NHANH]
	@MACN NVARCHAR(20)
AS
BEGIN
	SELECT CN.MACN, CN.TENCN,CN.DIACHI, CN.SoDT FROM LINK0.NGANHANG.DBO.CHINHANH CN
	WHERE CN.MACN <>  @MACN
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Lay_Thong_Tin_KH_Tu_Login]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Lay_Thong_Tin_KH_Tu_Login] @TENLOGIN NVARCHAR(20)
AS
BEGIN
	DECLARE @UID INT
	DECLARE @CMND nchar(10)

	SELECT @UID = UID, @CMND = NAME  FROM SYS.sysusers
		WHERE SID = SUSER_SID(@TENLOGIN)

	

	SELECT  
		 CMND = @CMND, HOVATEN = (SELECT (HO + ' ' + TEN) FROM KHACHHANG WHERE @CMND = CMND),
		NHOM = NAME FROM SYS.SYSUSERS 
			WHERE UID = (SELECT GROUPUID FROM SYS.SYSMEMBERS WHERE MEMBERUID = @UID)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Lay_Thong_Tin_NV_Tu_Login]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Lay_Thong_Tin_NV_Tu_Login] @TENLOGIN NVARCHAR(20)
AS
BEGIN
	DECLARE @UID INT
	DECLARE @MANV nchar(10)

	SELECT @UID = UID, @MANV = NAME  FROM SYS.sysusers
		WHERE SID = SUSER_SID(@TENLOGIN)

	

	SELECT  
		 MANV = @MANV, HOVATEN = (SELECT (HO + ' ' + TEN) FROM NHANVIEN WHERE @MANV = MANV),
		NHOM = NAME FROM SYS.SYSUSERS 
			WHERE UID = (SELECT GROUPUID FROM SYS.SYSMEMBERS WHERE MEMBERUID = @UID)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Lay_Thong_Tin_Tu_Login]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Lay_Thong_Tin_Tu_Login] @TENLOGIN NVARCHAR(20), @Role  NVARCHAR(20)
AS
BEGIN
	DECLARE @UID INT
	DECLARE @MANV NCHAR(10)
	DECLARE @CMND nchar(10)
	IF @Role = 'KHACHHANG'
		BEGIN
		SELECT @UID = UID, @CMND = NAME  FROM SYS.sysusers
			WHERE SID = SUSER_SID(@TENLOGIN)
		IF EXISTS (SELECT 1 FROM SYS.SYSUSERS 
				WHERE UID = (SELECT GROUPUID FROM SYS.SYSMEMBERS WHERE MEMBERUID = @UID) AND (NAME = 'KHACHHANG'))
			BEGIN
				SELECT  
				CMND = @CMND, HOVATEN = (SELECT (HO + ' ' + TEN) FROM KHACHHANG WHERE @CMND = CMND),
				NHOM = NAME FROM SYS.SYSUSERS 
				WHERE UID = (SELECT GROUPUID FROM SYS.SYSMEMBERS WHERE MEMBERUID = @UID)
			END
		ELSE
			BEGIN
				RAISERROR (N'Khách hàng không tồn tại', 16, 1)
			END

		SELECT  
			CMND = @CMND, HOVATEN = (SELECT (HO + ' ' + TEN) FROM KHACHHANG WHERE @CMND = CMND),
			NHOM = NAME FROM SYS.SYSUSERS 
			WHERE UID = (SELECT GROUPUID FROM SYS.SYSMEMBERS WHERE MEMBERUID = @UID)
		END
	ELSE
		BEGIN
				SELECT @UID = UID, @MANV = NAME  FROM SYS.sysusers
			WHERE SID = SUSER_SID(@TENLOGIN)

		DECLARE @HOVATEN NVARCHAR(50)
		SELECT @HOVATEN = (HO + ' ' + TEN) FROM NHANVIEN WHERE @MANV = MANV

		IF @HOVATEN IS NULL
			BEGIN
				RAISERROR (N'Nhân viên không tồn tại', 16, 1)
			END
		IF EXISTS (SELECT 1 FROM SYS.SYSUSERS 
		WHERE UID = (SELECT GROUPUID FROM SYS.SYSMEMBERS WHERE MEMBERUID = @UID) AND (NAME = 'NGANHANG' OR NAME = 'CHINHANH'))
			BEGIN
				SELECT MANV = @MANV,
				HOVATEN = @HOVATEN,
				NHOM = NAME
				FROM SYS.SYSUSERS 
				WHERE UID = (SELECT GROUPUID FROM SYS.SYSMEMBERS WHERE MEMBERUID = @UID) AND (NAME = 'NGANHANG' OR NAME = 'CHINHANH')
			END
		ELSE
			BEGIN
				RAISERROR (N'Khách hàng không tồn tại', 16, 1)
			END
			
		
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LietKe_Tai_Khoan]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LietKe_Tai_Khoan] @dateFrom AS DATE, @dateTo AS DATE, @Loai VARCHAR(3), @MACN NCHAR(10)
AS
BEGIN
IF EXISTS (SELECT MACN FROM LINK2.NGANHANG.dbo.KhachHang WHERE MACN = @MACN)
	BEGIN
			IF (@Loai = 'T')--TẤT CẢ CHI NHÁNH
			BEGIN
				SELECT TK.SOTK,KH.HO +' ' + KH.TEN AS HOTEN,TK.CMND,TK.MACN,TK.NGAYCAP
				FROM LINK2.NGANHANG.dbo.KhachHang AS KH,
				(SELECT SOTK,CMND,MACN,NGAYCAP FROM TaiKhoan WHERE NGAYCAP BETWEEN @dateFrom AND @dateTo) AS TK 
				WHERE KH.CMND = TK.CMND	
				ORDER BY NGAYCAP
			END
			ELSE IF (@Loai = 'C')--CHI NHÁNH HIỆN TẠI
			BEGIN
				SELECT TK.SOTK,KH.HO +' ' + KH.TEN AS HOTEN,TK.CMND,TK.MACN,TK.NGAYCAP
				FROM LINK2.NGANHANG.dbo.KhachHang AS KH,
				(SELECT SOTK,CMND,MACN,NGAYCAP FROM TaiKhoan WHERE NGAYCAP BETWEEN @dateFrom AND @dateTo AND MACN = @MACN) AS TK 
				WHERE KH.CMND = TK.CMND
				ORDER BY NGAYCAP
			END
	END
ELSE
	BEGIN
			IF (@Loai = 'T')--TẤT CẢ CHI NHÁNH
			BEGIN
				SELECT TK.SOTK,KH.HO +' ' + KH.TEN AS HOTEN,TK.CMND,TK.MACN,TK.NGAYCAP
				FROM LINK0.NGANHANG.dbo.KhachHang AS KH,
				(SELECT SOTK,CMND,MACN,NGAYCAP FROM LINK0.NGANHANG.dbo.TaiKhoan WHERE NGAYCAP BETWEEN @dateFrom AND @dateTo) AS TK 
				WHERE KH.CMND = TK.CMND	
				ORDER BY NGAYCAP
			END
			ELSE IF (@Loai = 'C')--CHI NHÁNH HIỆN TẠI
			BEGIN
				SELECT TK.SOTK,KH.HO +' ' + KH.TEN AS HOTEN,TK.CMND,TK.MACN,TK.NGAYCAP
				FROM LINK0.NGANHANG.dbo.KhachHang AS KH,
				(SELECT SOTK,CMND,MACN,NGAYCAP FROM LINK0.NGANHANG.dbo.TaiKhoan WHERE NGAYCAP BETWEEN @dateFrom AND @dateTo AND MACN = @MACN) AS TK 
				WHERE KH.CMND = TK.CMND
				ORDER BY NGAYCAP
			END
	END
END
--
GO
/****** Object:  StoredProcedure [dbo].[SP_LietKeKhachHang]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_LietKeKhachHang]
    @LOAI VARCHAR(1),
    @MACN NCHAR(10)
AS
BEGIN
    IF (@LOAI = 'T')
    BEGIN
        SELECT CMND, HO + ' ' + TEN AS HOTEN, DIACHI, SODT, NGAYCAP, MACN
        FROM LINK2.NGANHANG.DBO.KHACHHANG
        ORDER BY TEN, HO;  -- Sắp xếp theo tên khách hàng, sau đó là họ nếu tên trùng
    END
    ELSE IF (@LOAI = 'C')
    BEGIN
        SELECT CMND, HO + ' ' + TEN AS HOTEN, DIACHI, SODT, NGAYCAP, MACN
        FROM LINK2.NGANHANG.DBO.KHACHHANG
        WHERE MACN = @MACN
        ORDER BY TEN, HO;  -- Sắp xếp theo tên khách hàng, sau đó là họ nếu tên trùng
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MaxMANV]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MaxMANV]
@test INT
AS
BEGIN
	SELECT MAX(manv) AS MANV
FROM LINK0.NGANHANG.dbo.NhanVien;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MoTK_checkSTK]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_MoTK_checkSTK]
    @sotk CHAR(10),
    @exists BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT SOTK FROM TaiKhoan WHERE SOTK = @sotk)
    BEGIN
        SET @exists = 1;
    END
    ELSE IF EXISTS (SELECT SOTK FROM LINK0.NGANHANG.DBO.TaiKhoan WHERE SOTK = @sotk)
    BEGIN
        SET @exists = 1;
    END
    ELSE
    BEGIN
        SET @exists = 0;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Num2Text]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Num2Text]
    @Number int
AS 
BEGIN 
    DECLARE @sNumber nvarchar(4000)
    DECLARE @Return nvarchar(4000)
    DECLARE @mLen int
    DECLARE @i int

    DECLARE @mDigit int
    DECLARE @mGroup int
    DECLARE @mTemp nvarchar(4000)
    DECLARE @mNumText nvarchar(4000)

    SELECT @sNumber = LTRIM(STR(@Number))
    SELECT @mLen = Len(@sNumber)

    SELECT @i = 1
    SELECT @mTemp = ''

    WHILE @i <= @mLen
    BEGIN
        SELECT @mDigit = SUBSTRING(@sNumber, @i, 1)

        IF @mDigit = 0 
            SELECT @mNumText = N'không'
        ELSE
        BEGIN
            IF @mDigit = 1 
                SELECT @mNumText = N'một'
            ELSE IF @mDigit = 2 
                SELECT @mNumText = N'hai'
            ELSE IF @mDigit = 3 
                SELECT @mNumText = N'ba'
            ELSE IF @mDigit = 4 
                SELECT @mNumText = N'bốn'
            ELSE IF @mDigit = 5 
                SELECT @mNumText = N'năm'
            ELSE IF @mDigit = 6 
                SELECT @mNumText = N'sáu'
            ELSE IF @mDigit = 7 
                SELECT @mNumText = N'bảy'
            ELSE IF @mDigit = 8 
                SELECT @mNumText = N'tám'
            ELSE IF @mDigit = 9 
                SELECT @mNumText = N'chín'
        END

        SELECT @mTemp = @mTemp + ' ' + @mNumText

        IF (@mLen = @i) BREAK

        SELECT @mGroup = (@mLen - @i) % 9

        IF @mGroup = 0
        BEGIN
            SELECT @mTemp = @mTemp + N' tỷ'

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3
        END 
        ELSE IF @mGroup = 6
        BEGIN
            SELECT @mTemp = @mTemp + N' triệu'

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3
        END
        ELSE IF @mGroup = 3
        BEGIN
            SELECT @mTemp = @mTemp + N' nghìn'

            IF SUBSTRING(@sNumber, @i + 1, 3) = N'000' 
                SELECT @i = @i + 3
        END
        ELSE
        BEGIN
            SELECT @mGroup = (@mLen - @i) % 3

            IF @mGroup = 2	
                SELECT @mTemp = @mTemp + N' trăm'
            ELSE IF @mGroup = 1
                SELECT @mTemp = @mTemp + N' mươi'	
        END

        SELECT @i = @i + 1
    END

    --'Loại bỏ trường hợp x00
    SELECT @mTemp = Replace(@mTemp, N'không mươi không', '')

    --'Loại bỏ trường hợp 00x
    SELECT @mTemp = Replace(@mTemp, N'không mươi ', N'linh ')

    --'Loại bỏ trường hợp x0, x>=2
    SELECT @mTemp = Replace(@mTemp, N'mươi không', N'mươi')

    --'Fix trường hợp 10
    SELECT @mTemp = Replace(@mTemp, N'một mươi', N'mười')

    --'Fix trường hợp x4, x>=2
    SELECT @mTemp = Replace(@mTemp, N'mươi bốn', N'mươi tư')

    --'Fix trường hợp x04 
    SELECT @mTemp = Replace(@mTemp, N'linh bốn', N'linh tư')

    --'Fix trường hợp x5, x>=2
    SELECT @mTemp = Replace(@mTemp, N'mươi năm', N'mươi nhăm')

    --'Fix trường hợp x1, x>=2
    SELECT @mTemp = Replace(@mTemp, N'mươi một', N'mươi mốt')

    --'Fix trường hợp x15
    SELECT @mTemp = Replace(@mTemp, N'mười năm', N'mười lăm')

    --'Bỏ ký tự space
    SELECT @mTemp = LTrim(@mTemp)

    --'Ucase ký tự đầu tiên
    SELECT @Return = UPPER(Left(@mTemp, 1)) + SUBSTRING(@mTemp, 2, 4000)

    SELECT @Return AS SOTIEN
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Sao_Ke_Tai_Khoan_Ngan_Hang]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Sao_Ke_Tai_Khoan_Ngan_Hang] @SOTK_SAOKE NCHAR(9), @dateFrom AS DATE, @dateTo AS DATE
AS
BEGIN
--the temporary tables can be read by the calling application(xtra report)
    SET NOCOUNT ON;  
    IF 1=0 BEGIN  
        SET FMTONLY OFF  
    END  

	CREATE TABLE #GD_Temp(SODUDAU money,NGAYGD DATETIME,LOAIGD nchar(10),SOTIEN money,SODUSAU money)

	DECLARE @CrsrVar CURSOR,  @SOTK nchar(9), @SOTIEN money, @SODUDAU money,  
	@SODUSAU money, @SOTK_NHAN nchar(9),  @SOTK_CHUYEN nchar(9),@SODUSAU_TK_NHAN money, @LOAIGD nchar(10),@NGAYGD DATETIME

	SET @CrsrVar=CURSOR KEYSET FOR 

	SELECT GR.SOTIEN,GR.LOAIGD,GR.NGAYGD FROM GD_GOIRUT AS GR
	WHERE GR.SOTK = @SOTK_SAOKE
	AND NGAYGD BETWEEN @dateFrom AND @dateTo	

	UNION ALL

	SELECT CT.SOTIEN,CT.SOTK_NHAN,CT.NGAYGD FROM GD_CHUYENTIEN AS CT
	WHERE CT.SOTK_CHUYEN = @SOTK_SAOKE
	AND NGAYGD BETWEEN @dateFrom AND @dateTo

	UNION ALL 

	SELECT CT_Nhan.SOTIEN,CT_Nhan.SOTK_NHAN,CT_Nhan.NGAYGD FROM GD_CHUYENTIEN AS CT_Nhan
	WHERE SOTK_NHAN =@SOTK_SAOKE
	AND NGAYGD BETWEEN @dateFrom AND @dateTo	
	ORDER BY NGAYGD DESC

	OPEN @CrsrVar
	FETCH NEXT FROM @CrsrVar INTO @SOTIEN,@LOAIGD,@NGAYGD
	SELECT @SODUSAU = SODU FROM dbo.TaiKhoan WHERE SOTK = @SOTK_SAOKE
	WHILE(@@FETCH_STATUS <>-1)
	BEGIN		
		IF @LOAIGD = N'GT'
			BEGIN		
				SET @SODUDAU = @SODUSAU - @SOTIEN
				INSERT INTO #GD_Temp Values(@SODUDAU,@NGAYGD,@LOAIGD,@SOTIEN,@SODUSAU) 
			END
		ELSE IF @LOAIGD = N'RT'
			BEGIN
				SET @SODUDAU = @SODUSAU  + @SOTIEN
				INSERT INTO #GD_Temp Values(@SODUDAU,@NGAYGD,@LOAIGD,@SOTIEN,@SODUSAU) 
			END
		ELSE IF @LOAIGD = @SOTK_SAOKE
			BEGIN				
					SET @LOAIGD ='NT'
					SET @SODUDAU = @SODUSAU - @SOTIEN
					INSERT INTO #GD_Temp Values(@SODUDAU,@NGAYGD,@LOAIGD,@SOTIEN,@SODUSAU) 
				END
		ELSE 
			BEGIN				
				SET @LOAIGD ='CT'
				SET @SODUDAU = @SODUSAU + @SOTIEN
				INSERT INTO #GD_Temp Values(@SODUDAU,@NGAYGD,@LOAIGD,@SOTIEN,@SODUSAU) 
			END
		SET @SODUSAU = @SODUDAU
		FETCH NEXT FROM @CrsrVar INTO @SOTIEN,@LOAIGD,@NGAYGD
	END
	SELECT * FROM #GD_Temp
	ORDER BY NGAYGD 
	CLOSE @CrsrVar 
	DEALLOCATE @CrsrVar
END

--
GO
/****** Object:  StoredProcedure [dbo].[sp_tao_login_khach_hang]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_tao_login_khach_hang]
    @cmnd NCHAR(10),
    @pass NVARCHAR(50)
AS
BEGIN
    SET XACT_ABORT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Tạo login
        DECLARE @login NVARCHAR(50) = @cmnd;
        DECLARE @user NVARCHAR(50) = @cmnd;
        DECLARE @sql NVARCHAR(MAX);

        SET @sql = 'CREATE LOGIN ' + QUOTENAME(@login) + ' WITH PASSWORD = ' + QUOTENAME(@pass, '''');
        EXEC sp_executesql @sql;

        -- Tạo user
        SET @sql = 'CREATE USER ' + QUOTENAME(@user) + ' FOR LOGIN ' + QUOTENAME(@login);
        EXEC sp_executesql @sql;

        -- Chỉ gán quyền xem sao kê
        SET @sql = 'GRANT SELECT ON SCHEMA::dbo TO ' + QUOTENAME(@user);  -- Chỉ gán quyền select cho schema dbo
        EXEC sp_executesql @sql;

        -- Thêm login vào role KHACHHANG
        SET @sql = 'ALTER ROLE KHACHHANG ADD MEMBER ' + QUOTENAME(@user);
        EXEC sp_executesql @sql;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_tao_tai_khoan_khach_hang]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_tao_tai_khoan_khach_hang]
    @stk NCHAR(9),
    @cmnd NCHAR(10),
    @maChiNhanh NCHAR(10),
	@sodu money,
	@ngaycap date,
    @exists INT OUTPUT
AS
BEGIN
    SET XACT_ABORT ON; -- Tự động rollback khi có lỗi xảy ra
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Kiểm tra sự tồn tại của tài khoản
        SELECT @exists = COUNT(*)
        FROM TaiKhoan
        WHERE SOTK = @stk;

        IF @exists > 0
        BEGIN
            SET @exists = 1; -- Tài khoản đã tồn tại
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Kiểm tra sự tồn tại của khách hàng bằng CMND
        SELECT @exists = COUNT(*)
        FROM LINK2.NGANHANG.DBO.KhachHang
        WHERE CMND = @cmnd;

        IF @exists = 0
        BEGIN
            SET @exists = 2; -- Không tìm thấy khách hàng
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Kiểm tra xem khách hàng đã mở tài khoản tại chi nhánh hiện tại chưa
        SELECT @exists = COUNT(*)
        FROM TaiKhoan
        WHERE CMND = @cmnd AND MACN = @maChiNhanh;

        IF @exists > 0
        BEGIN
            SET @exists = 3; -- Khách hàng đã mở tài khoản tại chi nhánh này
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Thực hiện thêm tài khoản mới
        INSERT INTO TaiKhoan (SOTK, CMND, SODU, MACN,NGAYCAP)
        VALUES (@stk, @cmnd, @sodu, @maChiNhanh, @ngaycap);

        SET @exists = 0; -- Tạo tài khoản thành công

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION; -- Rollback nếu có lỗi

        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState); -- Ném lỗi ra ngoài
        RETURN;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_tao_tai_khoan_nhan_vien]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_tao_tai_khoan_nhan_vien]
     
    @USERNAME VARCHAR(50), @LGNAME VARCHAR(50), @PASS VARCHAR(50), @ROLE VARCHAR(50)     
AS
  DECLARE @RET INT
  EXEC @RET= SP_ADDLOGIN @LGNAME, @PASS, 'NGANHANG'
  IF (@RET =1)  -- LOGIN NAME BI TRUNG
  BEGIN
     RAISERROR ('Login name bị trùng', 16,1)
	 RETURN
  END 
  EXEC @RET= SP_GRANTDBACCESS @LGNAME, @USERNAME
  IF (@RET =1)  -- USER  NAME BI TRUNG
  BEGIN
       EXEC SP_DROPLOGIN @LGNAME
       RAISERROR ('Nhân viên dã có login name', 16,2)
       RETURN
  END
  EXEC sp_addrolemember @ROLE, @USERNAME
  IF @ROLE = 'ADMIN'
  BEGIN
      EXEC sp_addsrvrolemember @LGNAME, 'SecurityAdmin'
      EXEC sp_addsrvrolemember @LGNAME, 'DBCREATOR'
	  EXEC sp_addsrvrolemember @LGNAME, 'ProcessAdmin'
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Thong_Tin_KH]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Thong_Tin_KH] 
    @SOTK NVARCHAR(9)
AS
BEGIN
    DECLARE @CMND NCHAR(10)
    -- Kiểm tra tài khoản trong bảng TaiKhoan cục bộ
    IF EXISTS (SELECT SOTK FROM TaiKhoan WHERE SOTK = @SOTK)
    BEGIN
        SET @CMND = (SELECT TOP 1 CMND FROM TaiKhoan WHERE SOTK = @SOTK)
    END
    -- Kiểm tra tài khoản trong bảng TaiKhoan của máy chủ liên kết
    ELSE IF EXISTS (SELECT SOTK FROM LINK0.NGANHANG.DBO.TaiKhoan WHERE SOTK = @SOTK)
    BEGIN
        SET @CMND = (SELECT CMND FROM LINK0.NGANHANG.DBO.TaiKhoan WHERE SOTK = @SOTK)
    END
    -- Nếu không tồn tại tài khoản
    ELSE
    BEGIN
        RAISERROR(N'KHÔNG TỒN TẠI TÀI KHOẢN CẦN SAO KÊ', 16, 1);
        RETURN;
    END

    -- Truy xuất thông tin khách hàng từ bảng KhachHang và TaiKhoan cục bộ
    IF EXISTS (SELECT CMND FROM KhachHang WHERE CMND = @CMND)
    BEGIN
        SELECT 
            KH.HO + ' ' + KH.TEN + ' - ' + TK.SOTK AS HOTEN,
            KH.CMND,
            TK.SOTK
        FROM 
            KhachHang KH
        JOIN 
            TaiKhoan TK ON KH.CMND = TK.CMND
        WHERE 
            KH.CMND = @CMND AND TK.SOTK = @SOTK
    END
    -- Truy xuất thông tin khách hàng từ bảng KhachHang và TaiKhoan của máy chủ liên kết
    ELSE IF EXISTS (SELECT CMND FROM LINK2.NGANHANG.DBO.KhachHang WHERE CMND = @CMND )
    BEGIN
        SELECT 
            KH.HO + ' ' + KH.TEN + ' - ' + TK.SOTK AS HOTEN,
            KH.CMND,
            TK.SOTK
        FROM 
            LINK2.NGANHANG.DBO.KhachHang KH
        JOIN 
            TaiKhoan TK ON KH.CMND = TK.CMND
        WHERE 
            KH.CMND = @CMND AND TK.SOTK = @SOTK
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIMCN_CNV]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TIMCN_CNV] 
AS
BEGIN
SELECT MACN, TENCN, DIACHI, SoDT FROM LINK0.NGANHANG.dbo.CHINHANH AS CN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimNV]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimNV]
	@X NCHAR(10)
AS
BEGIN
	IF EXISTS(SELECT MANV FROM dbo.NhanVien WHERE dbo.NhanVien.MANV = @X)
		RETURN 1; 
	ELSE IF EXISTS(SELECT MANV FROM LINK1.NGANHANG.dbo.NhanVien AS NV WHERE NV.MANV = @X)
		RETURN 1; 
	ELSE 
		RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_xoa_tai_khoan_nhan_vien]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_xoa_tai_khoan_nhan_vien]
	@manv NCHAR(10)
AS
BEGIN
	DECLARE @loginname NVARCHAR(30)

	-- Find login name  by @manv
	SELECT @loginname = L.name FROM sys.sysusers U
	INNER JOIN sys.syslogins L ON U.sid = L.sid
	WHERE U.name = @manv

	EXEC sp_revokedbaccess @manv
	EXEC sp_droplogin @loginname
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XoaLogin]    Script Date: 6/29/2024 12:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_XoaLogin](
  @loginame AS NCHAR(50),
  @username AS NCHAR(50)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = @username)
    BEGIN
			EXEC sp_droplogin @loginame; 
        EXEC sp_dropuser @username;
		
    END
--EXEC sp_dropuser @username;
--EXEC sp_droplogin @loginame;  
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'‘GT’ : gởi tiền vào TK , ‘RT’ : rút tiền khỏi TK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GD_GOIRUT', @level2type=N'COLUMN',@level2name=N'LOAIGD'
GO
USE [master]
GO
ALTER DATABASE [NGANHANG] SET  READ_WRITE 
GO
