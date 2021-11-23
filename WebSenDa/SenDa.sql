USE [SenDa]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[IDDonHang] [int] NOT NULL,
	[IDSanPham] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[IDDonHang] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[IDKhachHang] [int] NOT NULL,
	[IDSanPham] [int] NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[Hinh] [varchar](max) NULL,
	[Hinh1] [varchar](max) NULL,
	[Hinh2] [varchar](max) NULL,
	[NgayDanhGia] [date] NOT NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[IDKhachHang] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaChi]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaChi](
	[IDDiaChi] [int] NOT NULL,
	[IDKhachHang] [int] NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DiaChi_1] PRIMARY KEY CLUSTERED 
(
	[IDDiaChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[IDDonHang] [int] NOT NULL,
	[IDKhachHang] [int] NOT NULL,
	[DiaChi] [int] NOT NULL,
	[TrangThai] [int] NULL,
	[NgayDat] [date] NOT NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[IDDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[IDKhachHang] [int] NOT NULL,
	[IDLoaiTaiKhoan] [int] NOT NULL,
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[SoDienThoai] [varchar](20) NOT NULL,
	[CMND] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DiemTichLuy] [int] NULL,
	[AnhDaiDien] [varchar](max) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[IDKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[IDSanPham] [int] NOT NULL,
	[GiaBan] [decimal](18, 3) NOT NULL,
	[SoLuongTon] [int] NOT NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[IDKhuyenMai] [int] NOT NULL,
	[GiaTriKhuyenMai] [int] NOT NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[IDKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiChauCay]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiChauCay](
	[IDLoaiChauCay] [int] NOT NULL,
	[TenLoaiChauCay] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiChauCay] PRIMARY KEY CLUSTERED 
(
	[IDLoaiChauCay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiGiaThe]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiGiaThe](
	[IDLoaiGiaThe] [int] NOT NULL,
	[TenLoaiGiaThe] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiGiaThe] PRIMARY KEY CLUSTERED 
(
	[IDLoaiGiaThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[IDLoaiSanPham] [int] NOT NULL,
	[TenLoaiSanPham] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[IDLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSenDa]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSenDa](
	[IDLoaiSenDa] [int] NOT NULL,
	[TenLoaiSenDa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiSenDa] PRIMARY KEY CLUSTERED 
(
	[IDLoaiSenDa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTaiKhoan]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiKhoan](
	[IDLoaiTaiKhoan] [int] NOT NULL,
	[TenLoaiTaiKhoan] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[IDLoaiTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[IDNhanVien] [int] NOT NULL,
	[IDLoaiTaiKhoan] [int] NOT NULL,
	[IDQuyen] [int] NOT NULL,
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[TenNhanVien] [nvarchar](50) NOT NULL,
	[SoDienThoai] [varchar](20) NOT NULL,
	[CMND] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[AnhDaiDien] [varchar](max) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[IDNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhapKho]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhapKho](
	[IDSanPham] [int] NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[GiaNhap] [decimal](18, 3) NOT NULL,
	[SoLuongNhap] [int] NOT NULL,
 CONSTRAINT [PK_NhapKho] PRIMARY KEY CLUSTERED 
(
	[IDSanPham] ASC,
	[NgayNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[IDQuyen] [int] NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/11/2021 11:26:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[IDSanPham] [int] NOT NULL,
	[IDLoaiSanPham] [int] NOT NULL,
	[IDLoaiSenDa] [int] NULL,
	[IDLoaiChauCay] [int] NULL,
	[IDLoaiGiaThe] [int] NULL,
	[IDKhuyenMai] [int] NOT NULL,
	[TenSanPham] [nvarchar](60) NOT NULL,
	[Hinh] [varchar](max) NULL,
	[Hinh1] [varchar](max) NULL,
	[Hinh2] [varchar](max) NULL,
	[Hinh3] [varchar](max) NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[DanhGia] ([IDKhachHang], [IDSanPham], [NoiDung], [Hinh], [Hinh1], [Hinh2], [NgayDanhGia]) VALUES (1, 8, N'Cây rất đẹp nha mn. Sẽ ủng hộ shop dài dài', N'~/Content/img/217040598_210673544296104_6257389476807170346_n.jpg', N'~/Content/img/217040598_210673544296104_6257389476807170346_n.jpg', N'~/Content/img/217040598_210673544296104_6257389476807170346_n.jpg', CAST(N'2020-07-12' AS Date))
GO
INSERT [dbo].[KhachHang] ([IDKhachHang], [IDLoaiTaiKhoan], [TenTaiKhoan], [MatKhau], [TenKhachHang], [SoDienThoai], [CMND], [Email], [DiemTichLuy], [AnhDaiDien]) VALUES (1, 3, N'longcongduoi', N'123', N'Bùi Hoàng Long', N'0378687344', N'123123123', N'hoanglong29032000@gmail.con', 30, N'~/Content/img/239983755_513212333409423_3072406451765634563_n.png')
GO
INSERT [dbo].[Kho] ([IDSanPham], [GiaBan], [SoLuongTon]) VALUES (1, CAST(20.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[Kho] ([IDSanPham], [GiaBan], [SoLuongTon]) VALUES (2, CAST(15.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[Kho] ([IDSanPham], [GiaBan], [SoLuongTon]) VALUES (3, CAST(25.000 AS Decimal(18, 3)), 16)
GO
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [GiaTriKhuyenMai]) VALUES (1, 0)
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [GiaTriKhuyenMai]) VALUES (2, 10)
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [GiaTriKhuyenMai]) VALUES (3, 20)
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [GiaTriKhuyenMai]) VALUES (4, 30)
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [GiaTriKhuyenMai]) VALUES (5, 40)
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [GiaTriKhuyenMai]) VALUES (6, 50)
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [GiaTriKhuyenMai]) VALUES (7, 60)
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [GiaTriKhuyenMai]) VALUES (8, 70)
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [GiaTriKhuyenMai]) VALUES (9, 80)
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [GiaTriKhuyenMai]) VALUES (10, 90)
GO
INSERT [dbo].[LoaiChauCay] ([IDLoaiChauCay], [TenLoaiChauCay]) VALUES (1, N'Đất nung')
INSERT [dbo].[LoaiChauCay] ([IDLoaiChauCay], [TenLoaiChauCay]) VALUES (2, N'Nhựa')
GO
INSERT [dbo].[LoaiGiaThe] ([IDLoaiGiaThe], [TenLoaiGiaThe]) VALUES (1, N'Đất trồng')
INSERT [dbo].[LoaiGiaThe] ([IDLoaiGiaThe], [TenLoaiGiaThe]) VALUES (2, N'Phân bón')
INSERT [dbo].[LoaiGiaThe] ([IDLoaiGiaThe], [TenLoaiGiaThe]) VALUES (3, N'Đá-Sỉ than')
GO
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (1, N'Sen đá')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (2, N'Chậu trồng cây')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (3, N'Giá thể')
GO
INSERT [dbo].[LoaiSenDa] ([IDLoaiSenDa], [TenLoaiSenDa]) VALUES (1, N'Liên đài')
INSERT [dbo].[LoaiSenDa] ([IDLoaiSenDa], [TenLoaiSenDa]) VALUES (2, N'Thân cao')
INSERT [dbo].[LoaiSenDa] ([IDLoaiSenDa], [TenLoaiSenDa]) VALUES (3, N'Hawarthia')
INSERT [dbo].[LoaiSenDa] ([IDLoaiSenDa], [TenLoaiSenDa]) VALUES (4, N'Sedum')
GO
INSERT [dbo].[LoaiTaiKhoan] ([IDLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (1, N'Quản lý')
INSERT [dbo].[LoaiTaiKhoan] ([IDLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (2, N'Nhân viên')
INSERT [dbo].[LoaiTaiKhoan] ([IDLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (3, N'Khách')
GO
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (1, N'Admin')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (2, N'Quản lý kho')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (3, N'Quản lý bán hàng')
GO
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (1, 1, 3, NULL, NULL, 1, N'Sen đá nhật nguyệt_Size bầu', N'~/Content/img/nhatnguyet.jpg', N'~/Content/img/nhatnguyet.jpg', N'~/Content/img/nhatnguyet.jpg', N'~/Content/img/nhatnguyet.jpg', N'📮 Cam kết cây đẹp như ảnh.
🖼 Lỗi 1 đổi 1 
🌵 Cây xuất xứ Đà Lạt, đã thuần khí hậu, tự nhiên, không kích thuốc, siêu khoẻ đẹp.

Khi mới mua sen về bạn hãy làm theo các bước sau đây:
1. Đối với sen đá và xương rồng bạn giũ sạch đất cũ tỉa hết rễ nhỏ, rễ to tỉa còn 2-3cm( trừ 1 số loại như sedum,aeonium, thài lài,sam... cây thân cỏ thì có thể trồng luôn) sau đó phơi cây ở chỗ sáng nhẹ,mát mẻ,thoáng gió tầm 3 ngày cho khô vết cắt.

2. Sau khi phơi bạn chuẩn bị giá thể và chậu để trồng cây
   • Chậu: bạn có thể dùng bất cứ loại chậu nào nếu không có lỗ thoát nước thì bạn tưới sẽ ít hơn thường chút là được 😁
   • Giá thể (đất trồng): bạn có thể trộn theo công thức: 2 xỉ than, 1 phân bò,1 trấu hun hoặc 2 pumice, 1 peatmoss,1 trùn quế, 0,5 perlite, 
hoặc 1 mùn dừa, 1 perlite, 1 purmie.
Ngoài ra các b có thể dùng các loại đất trồng mua sẵn hoặc mix theo công thức chuẩn. 
Bạn nên mua thì tốt hơn vì thành phần trộn khá phức tạp.

3. Sau khi trồng cây vào chậu thì các b nên chỉnh sao cho cây cân đối vừa với chậu, các b có thể rải mặt bằng sỏi, aka, kanuma, nham thạch để chậu cây sạch và đẹp hơn. Không nên để lá cây bị vùi xuống đất và không nén đất cho chặt sau khi trồng
👉 Sau đây mình sẽ hướng dẫn bạn chăm sóc cây sau khi trồng:
   • Cây mới trồng bạn nên để sau 3 ngày hãy tưới nước trừ 1 số loại như sedum, sam, thài lài...có thể tưới luôn, bạn để ý đất trồng khi nào giá thể khô hết thì hãy tưới lại. 
   • Khi tưới thì nhớ tưới ướt hết phần giá thể đừng chỉ tưới bề mặt và không để nước đọng ở cây.
   • khi cây mới trồng không nên để nắng trực tiếp, bạn nên để ở chỗ có ánh sáng nhẹ 1 tuần khi cây bén rễ trở lại tưới nước r hãy đưa ra chỗ nhiều nắng hơn. 
   • Các bạn nên đưa từ từ để cây thích nghi vs nắng tốt hơn tránh cháy nắng.

Cây cần rất nhiều ánh sáng mặt trời, thoáng gió, mát mẻ nhưng không chịu đc nắng gắt 🌞
Nước tưới 4-5 ngày 1 lần tuỳ độ ẩm đất💧
cây không ưa nước nhiều, ngày mưa phùn độ ẩm cao có thể cả tuần không tưới, tưới lúc chiều mát, không tưới lúc trưa hay sáng
Tưới gốc không đc để nước đọng ở lá sẽ thối, nếu để trời mưa thì thổi hết nước đọng ở lá
Cây chỉ nên ngắm không nên sờ sịt nhiều 🌊
Cây đi đường k có sáng nên màu sắc sẽ chuyển xanh, để cây lên màu các bạn để cây cằn tưới ít, tầm 1 tuần tưới đẫm nước r lại nhừng tưới, cho ra chỗ mát mẻ và nhiều sáng mặt trời')
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (2, 1, 4, NULL, NULL, 3, N'Sedum nho tím_Size bầu', N'~/Content/img/sedumnhotim.jpg', N'~/Content/img/sedumnhotim.jpg', N'~/Content/img/sedumnhotim.jpg', N'~/Content/img/sedumnhotim.jpg', N'📮 Cam kết cây đẹp như ảnh.
🖼 Lỗi 1 đổi 1 
🌵 Cây xuất xứ Đà Lạt, đã thuần khí hậu, tự nhiên, không kích thuốc, siêu khoẻ đẹp.

Khi mới mua sen về bạn hãy làm theo các bước sau đây:
1. Đối với sen đá và xương rồng bạn giũ sạch đất cũ tỉa hết rễ nhỏ, rễ to tỉa còn 2-3cm( trừ 1 số loại như sedum,aeonium, thài lài,sam... cây thân cỏ thì có thể trồng luôn) sau đó phơi cây ở chỗ sáng nhẹ,mát mẻ,thoáng gió tầm 3 ngày cho khô vết cắt.

2. Sau khi phơi bạn chuẩn bị giá thể và chậu để trồng cây
   • Chậu: bạn có thể dùng bất cứ loại chậu nào nếu không có lỗ thoát nước thì bạn tưới sẽ ít hơn thường chút là được 😁
   • Giá thể (đất trồng): bạn có thể trộn theo công thức: 2 xỉ than, 1 phân bò,1 trấu hun hoặc 2 pumice, 1 peatmoss,1 trùn quế, 0,5 perlite, 
hoặc 1 mùn dừa, 1 perlite, 1 purmie.
Ngoài ra các b có thể dùng các loại đất trồng mua sẵn hoặc mix theo công thức chuẩn. 
Bạn nên mua thì tốt hơn vì thành phần trộn khá phức tạp.

3. Sau khi trồng cây vào chậu thì các b nên chỉnh sao cho cây cân đối vừa với chậu, các b có thể rải mặt bằng sỏi, aka, kanuma, nham thạch để chậu cây sạch và đẹp hơn. Không nên để lá cây bị vùi xuống đất và không nén đất cho chặt sau khi trồng
👉 Sau đây mình sẽ hướng dẫn bạn chăm sóc cây sau khi trồng:
   • Cây mới trồng bạn nên để sau 3 ngày hãy tưới nước trừ 1 số loại như sedum, sam, thài lài...có thể tưới luôn, bạn để ý đất trồng khi nào giá thể khô hết thì hãy tưới lại. 
   • Khi tưới thì nhớ tưới ướt hết phần giá thể đừng chỉ tưới bề mặt và không để nước đọng ở cây.
   • khi cây mới trồng không nên để nắng trực tiếp, bạn nên để ở chỗ có ánh sáng nhẹ 1 tuần khi cây bén rễ trở lại tưới nước r hãy đưa ra chỗ nhiều nắng hơn. 
   • Các bạn nên đưa từ từ để cây thích nghi vs nắng tốt hơn tránh cháy nắng.

Cây cần rất nhiều ánh sáng mặt trời, thoáng gió, mát mẻ nhưng không chịu đc nắng gắt 🌞
Nước tưới 4-5 ngày 1 lần tuỳ độ ẩm đất💧
cây không ưa nước nhiều, ngày mưa phùn độ ẩm cao có thể cả tuần không tưới, tưới lúc chiều mát, không tưới lúc trưa hay sáng
Tưới gốc không đc để nước đọng ở lá sẽ thối, nếu để trời mưa thì thổi hết nước đọng ở lá
Cây chỉ nên ngắm không nên sờ sịt nhiều 🌊
Cây đi đường k có sáng nên màu sắc sẽ chuyển xanh, để cây lên màu các bạn để cây cằn tưới ít, tầm 1 tuần tưới đẫm nước r lại nhừng tưới, cho ra chỗ mát mẻ và nhiều sáng mặt trời')
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (3, 2, NULL, 1, NULL, 1, N'Chậu đất nung hình trứng_6x10cm', N'~/Content/img/chau-dat-nung-trung-hoa-tiet.jpg', N'~/Content/img/chau-dat-nung-trung-hoa-tiet.jpg', N'~/Content/img/chau-dat-nung-trung-hoa-tiet.jpg', N'~/Content/img/chau-dat-nung-trung-hoa-tiet.jpg', N'❤️Phù hợp trồng các loại sen đá siêu xinh ❤️
Chất liệu đất nung')
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (4, 3, NULL, NULL, 1, 3, N'Đất trồng sen đá Soil Mix_1kg', N'~/Content/img/ffdb85a979df9c80342a819715f46be9.jpg', N'~/Content/img/soilmix.jpg', N'~/Content/img/soilmix.jpg', N'~/Content/img/soilmix.jpg', N'Đất tơi sốp, thoáng khí, hàm lượng dinh dưỡng cao.')
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (5, 2, NULL, 1, NULL, 1, N'Chậu đất nung hình trụ_7-12cm', N'~/Content/img/images(7).jpg', N'~/Content/img/images(6).jpg', N'~/Content/img/images(6).jpg', N'~/Content/img/images(6).jpg', N'❤️Phù hợp trồng các loại sen đá siêu xinh ❤️
Chất liệu đất nung')
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (6, 3, NULL, NULL, 3, 2, N'Hạt đất nung_500g', N'~/Content/img/a5d7e6897ef4f83f32e799ab5398a004.jpg', N'~/Content/img/a5d7e6897ef4f83f32e799ab5398a004.jpg', N'~/Content/img/a5d7e6897ef4f83f32e799ab5398a004.jpg', N'~/Content/img/a5d7e6897ef4f83f32e799ab5398a004.jpg', N'Đất tơi sốp, thoáng khí, hàm lượng dinh dưỡng cao.')
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (7, 1, 1, NULL, NULL, 2, N'Sen đá đế vương đỏ_Size trung', N'~/Content/img/devuongdo.jpg', N'~/Content/img/devuongdo1.jpg', N'~/Content/img/devuongdo2.jpg', N'~/Content/img/devuongdo3.jpg', N'📮 Cam kết cây đẹp như ảnh.
🖼 Lỗi 1 đổi 1 
🌵 Cây xuất xứ Đà Lạt, đã thuần khí hậu, tự nhiên, không kích thuốc, siêu khoẻ đẹp.

Khi mới mua sen về bạn hãy làm theo các bước sau đây:
1. Đối với sen đá và xương rồng bạn giũ sạch đất cũ tỉa hết rễ nhỏ, rễ to tỉa còn 2-3cm( trừ 1 số loại như sedum,aeonium, thài lài,sam... cây thân cỏ thì có thể trồng luôn) sau đó phơi cây ở chỗ sáng nhẹ,mát mẻ,thoáng gió tầm 3 ngày cho khô vết cắt.

2. Sau khi phơi bạn chuẩn bị giá thể và chậu để trồng cây
   • Chậu: bạn có thể dùng bất cứ loại chậu nào nếu không có lỗ thoát nước thì bạn tưới sẽ ít hơn thường chút là được 😁
   • Giá thể (đất trồng): bạn có thể trộn theo công thức: 2 xỉ than, 1 phân bò,1 trấu hun hoặc 2 pumice, 1 peatmoss,1 trùn quế, 0,5 perlite, 
hoặc 1 mùn dừa, 1 perlite, 1 purmie.
Ngoài ra các b có thể dùng các loại đất trồng mua sẵn hoặc mix theo công thức chuẩn. 
Bạn nên mua thì tốt hơn vì thành phần trộn khá phức tạp.

3. Sau khi trồng cây vào chậu thì các b nên chỉnh sao cho cây cân đối vừa với chậu, các b có thể rải mặt bằng sỏi, aka, kanuma, nham thạch để chậu cây sạch và đẹp hơn. Không nên để lá cây bị vùi xuống đất và không nén đất cho chặt sau khi trồng
👉 Sau đây mình sẽ hướng dẫn bạn chăm sóc cây sau khi trồng:
   • Cây mới trồng bạn nên để sau 3 ngày hãy tưới nước trừ 1 số loại như sedum, sam, thài lài...có thể tưới luôn, bạn để ý đất trồng khi nào giá thể khô hết thì hãy tưới lại. 
   • Khi tưới thì nhớ tưới ướt hết phần giá thể đừng chỉ tưới bề mặt và không để nước đọng ở cây.
   • khi cây mới trồng không nên để nắng trực tiếp, bạn nên để ở chỗ có ánh sáng nhẹ 1 tuần khi cây bén rễ trở lại tưới nước r hãy đưa ra chỗ nhiều nắng hơn. 
   • Các bạn nên đưa từ từ để cây thích nghi vs nắng tốt hơn tránh cháy nắng.

Cây cần rất nhiều ánh sáng mặt trời, thoáng gió, mát mẻ nhưng không chịu đc nắng gắt 🌞
Nước tưới 4-5 ngày 1 lần tuỳ độ ẩm đất💧
cây không ưa nước nhiều, ngày mưa phùn độ ẩm cao có thể cả tuần không tưới, tưới lúc chiều mát, không tưới lúc trưa hay sáng
Tưới gốc không đc để nước đọng ở lá sẽ thối, nếu để trời mưa thì thổi hết nước đọng ở lá
Cây chỉ nên ngắm không nên sờ sịt nhiều 🌊
Cây đi đường k có sáng nên màu sắc sẽ chuyển xanh, để cây lên màu các bạn để cây cằn tưới ít, tầm 1 tuần tưới đẫm nước r lại nhừng tưới, cho ra chỗ mát mẻ và nhiều sáng mặt trời')
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (8, 1, 2, NULL, NULL, 2, N'Sen đá chuỗi ngọc đứng_Size bầu', N'~/Content/img/chuoingocdung.jpg', N'~/Content/img/chuoingocdung1.jpg', N'~/Content/img/chuoingocdung2.jpg', N'~/Content/img/chuoingocdung3.jpg', N'📮 Cam kết cây đẹp như ảnh.
🖼 Lỗi 1 đổi 1 
🌵 Cây xuất xứ Đà Lạt, đã thuần khí hậu, tự nhiên, không kích thuốc, siêu khoẻ đẹp.

Khi mới mua sen về bạn hãy làm theo các bước sau đây:
1. Đối với sen đá và xương rồng bạn giũ sạch đất cũ tỉa hết rễ nhỏ, rễ to tỉa còn 2-3cm( trừ 1 số loại như sedum,aeonium, thài lài,sam... cây thân cỏ thì có thể trồng luôn) sau đó phơi cây ở chỗ sáng nhẹ,mát mẻ,thoáng gió tầm 3 ngày cho khô vết cắt.

2. Sau khi phơi bạn chuẩn bị giá thể và chậu để trồng cây
   • Chậu: bạn có thể dùng bất cứ loại chậu nào nếu không có lỗ thoát nước thì bạn tưới sẽ ít hơn thường chút là được 😁
   • Giá thể (đất trồng): bạn có thể trộn theo công thức: 2 xỉ than, 1 phân bò,1 trấu hun hoặc 2 pumice, 1 peatmoss,1 trùn quế, 0,5 perlite, 
hoặc 1 mùn dừa, 1 perlite, 1 purmie.
Ngoài ra các b có thể dùng các loại đất trồng mua sẵn hoặc mix theo công thức chuẩn. 
Bạn nên mua thì tốt hơn vì thành phần trộn khá phức tạp.

3. Sau khi trồng cây vào chậu thì các b nên chỉnh sao cho cây cân đối vừa với chậu, các b có thể rải mặt bằng sỏi, aka, kanuma, nham thạch để chậu cây sạch và đẹp hơn. Không nên để lá cây bị vùi xuống đất và không nén đất cho chặt sau khi trồng
👉 Sau đây mình sẽ hướng dẫn bạn chăm sóc cây sau khi trồng:
   • Cây mới trồng bạn nên để sau 3 ngày hãy tưới nước trừ 1 số loại như sedum, sam, thài lài...có thể tưới luôn, bạn để ý đất trồng khi nào giá thể khô hết thì hãy tưới lại. 
   • Khi tưới thì nhớ tưới ướt hết phần giá thể đừng chỉ tưới bề mặt và không để nước đọng ở cây.
   • khi cây mới trồng không nên để nắng trực tiếp, bạn nên để ở chỗ có ánh sáng nhẹ 1 tuần khi cây bén rễ trở lại tưới nước r hãy đưa ra chỗ nhiều nắng hơn. 
   • Các bạn nên đưa từ từ để cây thích nghi vs nắng tốt hơn tránh cháy nắng.

Cây cần rất nhiều ánh sáng mặt trời, thoáng gió, mát mẻ nhưng không chịu đc nắng gắt 🌞
Nước tưới 4-5 ngày 1 lần tuỳ độ ẩm đất💧
cây không ưa nước nhiều, ngày mưa phùn độ ẩm cao có thể cả tuần không tưới, tưới lúc chiều mát, không tưới lúc trưa hay sáng
Tưới gốc không đc để nước đọng ở lá sẽ thối, nếu để trời mưa thì thổi hết nước đọng ở lá
Cây chỉ nên ngắm không nên sờ sịt nhiều 🌊
Cây đi đường k có sáng nên màu sắc sẽ chuyển xanh, để cây lên màu các bạn để cây cằn tưới ít, tầm 1 tuần tưới đẫm nước r lại nhừng tưới, cho ra chỗ mát mẻ và nhiều sáng mặt trời')
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (9, 2, NULL, 1, NULL, 1, N'Chậu đất nung họa tiết sọc_8x12cm', N'~/Content/img/images(4).jpg', N'~/Content/img/images(4).jpg', N'~/Content/img/images(3).jpg', N'~/Content/img/images(3).jpg', N'❤️Phù hợp trồng các loại sen đá siêu xinh ❤️
Chất liệu đất nung')
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (10, 3, NULL, NULL, 3, 3, N'Xỉ than tổ ong_500g', N'~/Content/img/xi-than-to-ong-3ats0q0ia5h2x42iriadca.jpg', N'3ats0q0ia5h2x42iriadca.jpg', N'3ats0q0ia5h2x42iriadca.jpg', N'3ats0q0ia5h2x42iriadca.jpg', N'Đất tơi sốp, thoáng khí, hàm lượng dinh dưỡng cao.')
INSERT [dbo].[SanPham] ([IDSanPham], [IDLoaiSanPham], [IDLoaiSenDa], [IDLoaiChauCay], [IDLoaiGiaThe], [IDKhuyenMai], [TenSanPham], [Hinh], [Hinh1], [Hinh2], [Hinh3], [MoTa]) VALUES (11, 3, NULL, NULL, 3, 3, N'Đá perlite trộn giá thể_250g', N'~/Content/img/61154f4fe98d258efb8edb8b43c889b9_tn.jpg', N'~/Content/img/61154f4fe98d258efb8edb8b43c889b9_tn.jpg', N'~/Content/img/61154f4fe98d258efb8edb8b43c889b9_tn.jpg', N'~/Content/img/61154f4fe98d258efb8edb8b43c889b9_tn.jpg', N'Đất tơi sốp, thoáng khí, hàm lượng dinh dưỡng cao.')
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([IDDonHang])
REFERENCES [dbo].[DonHang] ([IDDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_KhachHang]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_SanPham]
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD  CONSTRAINT [FK_DiaChi_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
GO
ALTER TABLE [dbo].[DiaChi] CHECK CONSTRAINT [FK_DiaChi_KhachHang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_LoaiTaiKhoan] FOREIGN KEY([IDLoaiTaiKhoan])
REFERENCES [dbo].[LoaiTaiKhoan] ([IDLoaiTaiKhoan])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_LoaiTaiKhoan]
GO
ALTER TABLE [dbo].[Kho]  WITH CHECK ADD  CONSTRAINT [FK_Kho_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_Kho_SanPham]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_LoaiTaiKhoan] FOREIGN KEY([IDLoaiTaiKhoan])
REFERENCES [dbo].[LoaiTaiKhoan] ([IDLoaiTaiKhoan])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_LoaiTaiKhoan]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_Quyen] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[Quyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_Quyen]
GO
ALTER TABLE [dbo].[NhapKho]  WITH CHECK ADD  CONSTRAINT [FK_NhapKho_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[NhapKho] CHECK CONSTRAINT [FK_NhapKho_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_KhuyenMai] FOREIGN KEY([IDKhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([IDKhuyenMai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_KhuyenMai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiChauCay] FOREIGN KEY([IDLoaiChauCay])
REFERENCES [dbo].[LoaiChauCay] ([IDLoaiChauCay])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiChauCay]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiGiaThe] FOREIGN KEY([IDLoaiGiaThe])
REFERENCES [dbo].[LoaiGiaThe] ([IDLoaiGiaThe])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiGiaThe]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([IDLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([IDLoaiSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSenDa] FOREIGN KEY([IDLoaiSenDa])
REFERENCES [dbo].[LoaiSenDa] ([IDLoaiSenDa])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSenDa]
GO
