USE [Print_Management]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfirmEmails]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfirmEmails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ConfirmCode] [nvarchar](max) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ExpiryTime] [datetime2](7) NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ConfirmEmails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deliveries]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deliveries](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ShippingMethodId] [bigint] NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[DeliverId] [bigint] NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[DeliveryAddress] [nvarchar](max) NOT NULL,
	[EstimateDeliveryTime] [datetime2](7) NOT NULL,
	[ActualDeliveryTime] [datetime2](7) NULL,
	[DeliveryStatus] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Deliveries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designs]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[DesignerId] [bigint] NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[DesignTime] [datetime2](7) NOT NULL,
	[DesignStatus] [nvarchar](max) NOT NULL,
	[ApproverId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Designs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[IsSeen] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[RoleId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrintJobs]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrintJobs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DesignId] [bigint] NOT NULL,
	[PrintJobStatus] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PrintJobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](max) NOT NULL,
	[RequestDescriptionFromCustomer] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[ExpectedEndDate] [datetime2](7) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[ProjectStatus] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
	[ExpiryTime] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceForPrintJobs]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceForPrintJobs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourcePropertyDetailId] [bigint] NOT NULL,
	[PrintJobId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ResourceForPrintJobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceProperties]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceProperties](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourcePropertyName] [nvarchar](max) NOT NULL,
	[ResourceId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourcePropertyDetail]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourcePropertyDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PropertyId] [bigint] NOT NULL,
	[PropertyDetailName] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ResourcePropertyDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resources]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resources](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[ResourceType] [nvarchar](max) NOT NULL,
	[AvailableQuantity] [int] NOT NULL,
	[ResourceStatus] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleCode] [nvarchar](max) NULL,
	[RoleName] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingMethods]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingMethods](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ShippingMethodName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ShippingMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[NumberOfMember] [int] NULL,
	[CreateTime] [datetime2](7) NULL,
	[UpdateTime] [datetime2](7) NULL,
	[ManagerId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/20/2024 7:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[UpdateTime] [datetime2](7) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[TeamId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240730154407_v1', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240730160945_v1_1', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240731042742_v2', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240731043755_v1', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240731081624_v1_1', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240731084416_v1_2', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240731141252_v1_3', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240731171850_v1_4', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240801001003_v1_5', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240801004836_v1_6', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240801010158_v1_7', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241201002924_fixRPD', N'8.0.7')
GO
SET IDENTITY_INSERT [dbo].[ConfirmEmails] ON 

INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (1, N'QuocHung_638579766609933431', 1, CAST(N'2024-07-30T22:52:00.9934259' AS DateTime2), 1, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (2, N'QuocHung_638579768096807396', 2, CAST(N'2024-07-30T22:54:29.6807450' AS DateTime2), 1, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (3, N'QuocHung_638580708916688915', 2, CAST(N'2024-08-01T01:02:31.6689411' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (4, N'QuocHung_638580709486114811', 2, CAST(N'2024-08-01T01:03:28.6114884' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (5, N'QuocHung_638580760198165546', 3, CAST(N'2024-08-01T02:27:59.8165592' AS DateTime2), 1, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (6, N'Qua trinh in san pham da hoan thanh, xin vui long cho giao hang. Ma: 8/1/2024 2:54:11 AM', 2, CAST(N'2024-08-01T02:55:11.9336455' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (7, N'QuocHung_638580953946464562', 8, CAST(N'2024-08-01T07:50:54.6465308' AS DateTime2), 1, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (8, N'Your design has been approved.', 2, CAST(N'2024-08-01T11:14:24.3836253' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (9, N'Print job is completed and the project is fisnished. Code: 8/1/2024 11:21:20 AM', 2, CAST(N'2024-08-01T11:22:20.2569280' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (10, N'Product is delivered successfully.', 8, CAST(N'2024-08-01T11:59:28.5836151' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (11, N'Print job is completed and the project is fisnished. Code: 8/2/2024 12:16:01 AM', 2, CAST(N'2024-08-02T00:17:01.8898784' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (12, N'Product is delivered successfully.', 3, CAST(N'2024-08-02T00:23:56.8366917' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (13, N'Your design has been approved.', 2, CAST(N'2024-08-02T09:41:12.0145285' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (14, N'Print job is completed and the project is fisnished. Code: 8/2/2024 9:59:08 AM', 2, CAST(N'2024-08-02T10:00:08.8281938' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (15, N'Product is delivered successfully.', 8, CAST(N'2024-08-02T10:04:17.7405413' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (16, N'Product is delivered successfully.', 8, CAST(N'2024-08-02T10:07:19.6776138' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (17, N'Print job is completed and the project is fisnished. Code: 8/4/2024 4:32:23 PM', 2, CAST(N'2024-08-04T16:33:23.7556878' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (18, N'Product is delivered successfully.', 3, CAST(N'2024-08-04T16:38:57.9157765' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (20, N'Your design has been approved.', 2, CAST(N'2024-08-14T20:15:31.1739849' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (21, N'Print job is completed and the project is fisnished. Code: 8/14/2024 8:20:48 PM', 2, CAST(N'2024-08-14T20:21:48.1823420' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (22, N'Product is delivered successfully.', 2, CAST(N'2024-08-14T20:28:09.7950663' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (23, N'Product is delivered successfully.', 3, CAST(N'2024-08-14T20:28:12.5453884' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (24, N'Product is delivered successfully.', 2, CAST(N'2024-08-14T20:28:15.3009249' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (25, N'Product is delivered successfully.', 2, CAST(N'2024-08-14T21:07:07.9956802' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (26, N'Product is delivered successfully.', 3, CAST(N'2024-08-14T21:07:11.5381955' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (27, N'Product is delivered successfully.', 3, CAST(N'2024-08-14T21:07:14.8731611' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (29, N'Your design has been approved.', 2, CAST(N'2024-08-14T21:36:37.2734879' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (30, N'Print job is completed and the project is fisnished. Code: 8/14/2024 9:41:48 PM', 2, CAST(N'2024-08-14T21:42:48.5383827' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (31, N'Product is delivered successfully.', 2, CAST(N'2024-08-14T21:48:32.0507500' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (32, N'Product is delivered successfully.', 3, CAST(N'2024-08-14T21:48:34.8389896' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (33, N'Product is delivered successfully.', 2, CAST(N'2024-08-14T21:48:37.6461939' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (34, N'Your design has been approved.', 2, CAST(N'2024-08-15T11:15:33.7749666' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (35, N'Print job is completed and the project is fisnished. Code: 8/15/2024 11:18:40 AM', 2, CAST(N'2024-08-15T11:19:40.6973778' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (36, N'Product is delivered successfully.', 2, CAST(N'2024-08-15T11:24:11.7029946' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (37, N'Product is delivered successfully.', 3, CAST(N'2024-08-15T11:24:15.0306002' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (38, N'Product is delivered successfully.', 2, CAST(N'2024-08-15T11:24:17.7317613' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (39, N'Your design has been approved.', 2, CAST(N'2024-08-15T11:41:43.8660442' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (40, N'Print job is completed and the project is fisnished. Code: 8/15/2024 11:43:56 AM', 2, CAST(N'2024-08-15T11:44:56.4579422' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (41, N'Product is delivered successfully.', 2, CAST(N'2024-08-15T11:48:20.2748582' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (42, N'Product is delivered successfully.', 3, CAST(N'2024-08-15T11:48:23.1299345' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (43, N'Product is delivered successfully.', 2, CAST(N'2024-08-15T11:48:25.8424289' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (45, N'QH_638679429163489380', 14, CAST(N'2024-11-23T07:16:16.3489442' AS DateTime2), 1, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (46, N'Product is delivered successfully.', 2, CAST(N'2024-11-27T14:25:43.3068960' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (48, N'Product is delivered successfully.', 1, CAST(N'2024-11-27T14:25:48.3792096' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (49, N'Product is delivered successfully.', 2, CAST(N'2024-11-28T19:25:36.1317526' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (50, N'Product is delivered successfully.', 2, CAST(N'2024-11-28T19:25:38.2211568' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (52, N'Product is delivered successfully.', 2, CAST(N'2024-11-28T19:25:38.5803208' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (53, N'Product is delivered successfully.', 2, CAST(N'2024-11-28T19:25:38.7728894' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (55, N'Product is delivered successfully.', 1, CAST(N'2024-11-28T19:25:40.0629136' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (58, N'Product is delivered successfully.', 1, CAST(N'2024-11-28T19:25:42.5725430' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (59, N'Product is delivered successfully.', 1, CAST(N'2024-11-28T19:25:42.8373171' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (60, N'Product is delivered successfully.', 1, CAST(N'2024-11-28T19:25:43.3282847' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (61, N'Product is delivered successfully.', 2, CAST(N'2024-11-28T19:25:52.9271871' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (63, N'Product is delivered successfully.', 2, CAST(N'2024-11-28T19:25:56.2642814' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (64, N'Product is delivered successfully.', 2, CAST(N'2024-11-29T09:27:05.4689272' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (65, N'Product is delivered successfully.', 13, CAST(N'2024-11-29T09:27:08.4178488' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (66, N'Product is delivered successfully.', 1, CAST(N'2024-11-29T09:27:11.0594898' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (67, N'Product is delivered successfully.', 2, CAST(N'2024-11-29T09:27:11.4032971' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (68, N'Product is delivered successfully.', 13, CAST(N'2024-11-29T09:27:13.6756767' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (69, N'Product is delivered successfully.', 1, CAST(N'2024-11-29T09:27:15.5934535' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (70, N'Your design has been approved.', 8, CAST(N'2024-11-29T11:43:52.1771913' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (71, N'Your design has been approved.', 8, CAST(N'2024-11-30T05:22:39.1028937' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (72, N'Your design has been approved.', 8, CAST(N'2024-11-30T05:25:29.6719948' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (73, N'Your design has been approved.', 8, CAST(N'2024-12-01T10:31:32.3047802' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (74, N'Print job is completed and the project is fisnished. Code: 12/1/2024 10:42:04 AM', 3, CAST(N'2024-12-01T10:43:04.1302984' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (75, N'Print job is completed and the project is fisnished. Code: 12/1/2024 11:52:29 AM', 3, CAST(N'2024-12-01T11:53:29.3694791' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (76, N'Your design has been approved.', 8, CAST(N'2024-12-05T09:21:39.8302910' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (77, N'Print job is completed and the project is fisnished. Code: 12/5/2024 9:26:07 AM', 3, CAST(N'2024-12-05T09:27:07.9855499' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (78, N'Product is delivered successfully.', 3, CAST(N'2024-12-05T09:33:13.0417593' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (79, N'Product is delivered successfully.', 13, CAST(N'2024-12-05T09:33:16.5027358' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (80, N'Product is delivered successfully.', 3, CAST(N'2024-12-05T09:33:17.3096363' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (81, N'Product is delivered successfully.', 2, CAST(N'2024-12-05T09:33:19.3118574' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (82, N'Product is delivered successfully.', 13, CAST(N'2024-12-05T09:33:20.6858323' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (83, N'Product is delivered successfully.', 2, CAST(N'2024-12-05T09:33:23.4322629' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (84, N'Your design has been approved.', 8, CAST(N'2024-12-12T18:03:07.8764654' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (85, N'Print job is completed and the project is fisnished. Code: 12/12/2024 6:18:32 PM', 3, CAST(N'2024-12-12T18:19:32.3773201' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (86, N'Product is delivered successfully.', 3, CAST(N'2024-12-12T18:23:21.8344310' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (87, N'Product is delivered successfully.', 3, CAST(N'2024-12-12T18:23:23.7856623' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (88, N'Product is delivered successfully.', 13, CAST(N'2024-12-12T18:23:24.0477923' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (89, N'Product is delivered successfully.', 3, CAST(N'2024-12-12T18:23:24.3477382' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (90, N'Product is delivered successfully.', 3, CAST(N'2024-12-12T18:23:24.5292155' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (91, N'Product is delivered successfully.', 3, CAST(N'2024-12-12T18:23:24.6971400' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (92, N'Product is delivered successfully.', 13, CAST(N'2024-12-12T18:23:25.9272469' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (93, N'Product is delivered successfully.', 13, CAST(N'2024-12-12T18:23:26.1624895' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (94, N'Product is delivered successfully.', 3, CAST(N'2024-12-12T18:23:26.4618270' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (95, N'Product is delivered successfully.', 13, CAST(N'2024-12-12T18:23:26.9327135' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (96, N'Product is delivered successfully.', 2, CAST(N'2024-12-12T18:23:27.2015036' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (97, N'Product is delivered successfully.', 2, CAST(N'2024-12-12T18:23:27.9545499' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (98, N'Product is delivered successfully.', 13, CAST(N'2024-12-12T18:23:28.2513650' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (99, N'Product is delivered successfully.', 2, CAST(N'2024-12-12T18:23:28.4469412' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (100, N'Product is delivered successfully.', 13, CAST(N'2024-12-12T18:23:28.7939550' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (101, N'Product is delivered successfully.', 2, CAST(N'2024-12-12T18:23:29.7663101' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (102, N'Product is delivered successfully.', 3, CAST(N'2024-12-12T18:23:30.3353332' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (103, N'Product is delivered successfully.', 2, CAST(N'2024-12-12T18:23:30.6674436' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (104, N'Product is delivered successfully.', 3, CAST(N'2024-12-12T18:23:31.1336042' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (105, N'Product is delivered successfully.', 2, CAST(N'2024-12-12T18:23:32.6758300' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (106, N'Product is delivered successfully.', 13, CAST(N'2024-12-12T18:23:33.0881336' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (107, N'Product is delivered successfully.', 13, CAST(N'2024-12-12T18:23:34.1624621' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (108, N'Product is delivered successfully.', 2, CAST(N'2024-12-12T18:23:35.4569037' AS DateTime2), 0, 1)
GO
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (109, N'Product is delivered successfully.', 2, CAST(N'2024-12-12T18:23:36.4252018' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (110, N'Your design has been approved.', 8, CAST(N'2024-12-12T19:13:29.6071850' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (111, N'Print job is completed and the project is fisnished. Code: 12/12/2024 7:15:39 PM', 3, CAST(N'2024-12-12T19:16:39.4819895' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (112, N'Product is delivered successfully.', 3, CAST(N'2024-12-12T19:19:34.3113330' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (113, N'Product is delivered successfully.', 13, CAST(N'2024-12-12T19:19:35.9534654' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (114, N'Product is delivered successfully.', 1, CAST(N'2024-12-12T19:19:37.5207962' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (115, N'Your design has been approved.', 8, CAST(N'2024-12-16T07:25:47.6773940' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (116, N'Print job is completed and the project is fisnished. Code: 12/16/2024 7:36:19 AM', 3, CAST(N'2024-12-16T07:37:19.8887726' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (117, N'Product is delivered successfully.', 3, CAST(N'2024-12-16T07:46:23.2534108' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (118, N'Product is delivered successfully.', 13, CAST(N'2024-12-16T07:46:25.8117913' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (120, N'Product is delivered successfully.', 3, CAST(N'2024-12-16T07:46:41.1626816' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (121, N'Product is delivered successfully.', 13, CAST(N'2024-12-16T07:46:42.9322319' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (124, N'Your design has been approved.', 8, CAST(N'2024-12-16T09:39:39.9706307' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (125, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:03:42.3607835' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (126, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:03:58.8391290' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (127, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:04:27.6492516' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (128, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:04:29.6954227' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (129, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:05:55.7042598' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (130, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:06:12.2524134' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (131, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:06:16.9072584' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (132, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:10:05.2419701' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (133, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:10:36.8204706' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (134, N'Product is delivered successfully.', 13, CAST(N'2024-12-19T21:10:37.0464559' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (135, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:10:38.9784730' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (136, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:10:39.8808936' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (137, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:10:52.9881935' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (138, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:10:52.9881903' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (139, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:12:59.0230158' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (140, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:13:06.2282871' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (141, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:18:55.6239363' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (142, N'Product is delivered successfully.', 13, CAST(N'2024-12-19T21:18:58.6934936' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (143, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:19:01.6401877' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (144, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:28:23.5618524' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (145, N'Product is delivered successfully.', 13, CAST(N'2024-12-19T21:28:27.2450128' AS DateTime2), 0, 1)
INSERT [dbo].[ConfirmEmails] ([Id], [ConfirmCode], [UserId], [ExpiryTime], [IsConfirmed], [IsActive]) VALUES (146, N'Product is delivered successfully.', 3, CAST(N'2024-12-19T21:28:30.6159707' AS DateTime2), 0, 1)
SET IDENTITY_INSERT [dbo].[ConfirmEmails] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [FullName], [PhoneNumber], [Address], [Email], [IsActive]) VALUES (1, N'Khach A', N'0987654321', N'Hanoi', N'getmyklee@gmail.com', 1)
INSERT [dbo].[Customers] ([Id], [FullName], [PhoneNumber], [Address], [Email], [IsActive]) VALUES (2, N'Khach B', N'0989898989', N'Hanoi', N'killace272@gmail.com', 1)
INSERT [dbo].[Customers] ([Id], [FullName], [PhoneNumber], [Address], [Email], [IsActive]) VALUES (3, N'Khach C', N'0987654444', N'HaTinh', N'tqhung272@gmail.com', 1)
INSERT [dbo].[Customers] ([Id], [FullName], [PhoneNumber], [Address], [Email], [IsActive]) VALUES (4, N'Khach D', N'0987655555', N'HaNoi', N'aallucard272@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Deliveries] ON 

INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (3, 1, 1, 13, 2, N'Hanoi', CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-28T12:24:38.7610279' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (6, 1, 2, 13, 3, N'Hanoi', CAST(N'2024-08-02T04:53:38.7550000' AS DateTime2), CAST(N'2024-11-28T12:24:52.9133646' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (7, 2, 4, 13, 4, N'HaNoi', CAST(N'2024-08-08T17:20:31.2120000' AS DateTime2), CAST(N'2024-08-01T17:22:56.8137017' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (8, 1, 4, 13, 5, N'HaNoi', CAST(N'2024-08-03T03:00:47.6010000' AS DateTime2), CAST(N'2024-08-02T03:06:19.6301376' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (11, 1, 4, 13, 6, N'HaNoi', CAST(N'2024-08-07T09:34:36.3550000' AS DateTime2), CAST(N'2024-08-04T09:37:57.8435813' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (13, 1, 2, 13, 7, N'Hanoi', CAST(N'2024-08-15T13:23:16.4740000' AS DateTime2), CAST(N'2024-08-14T13:27:09.7702860' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (14, 1, 3, 14, 7, N'HaTinh', CAST(N'2024-08-15T14:04:36.1950000' AS DateTime2), CAST(N'2024-08-14T14:06:07.9694712' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (15, 1, 2, 13, 8, N'Hanoi', CAST(N'2024-08-15T14:43:54.3950000' AS DateTime2), CAST(N'2024-08-14T14:47:32.0149727' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (16, 1, 2, 13, 9, N'Hanoi', CAST(N'2024-08-16T04:20:24.4300000' AS DateTime2), CAST(N'2024-08-15T04:23:11.6841965' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (17, 1, 2, 13, 10, N'Hanoi', CAST(N'2024-08-16T04:45:25.7610000' AS DateTime2), CAST(N'2024-08-15T04:47:20.2512388' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (18, 1, 1, 13, 8, N'Hanoi', CAST(N'2024-12-27T07:07:23.5030000' AS DateTime2), NULL, N'Shipping', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (20, 1, 1, 13, 2, N'Hanoi', CAST(N'2024-12-02T02:25:07.0250000' AS DateTime2), CAST(N'2024-11-29T02:26:11.3966073' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (22, 1, 2, 13, 12, N'Hanoi', CAST(N'2024-12-07T02:29:00.0320000' AS DateTime2), CAST(N'2024-12-05T02:32:17.2690537' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (23, 1, 2, 13, 13, N'Hanoi', CAST(N'2024-12-12T11:21:26.0320000' AS DateTime2), CAST(N'2024-12-12T11:22:31.1254810' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (24, 1, 1, 13, 14, N'Hanoi', CAST(N'2024-12-13T12:17:02.8400000' AS DateTime2), CAST(N'2024-12-12T12:18:34.2841963' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (26, 2, 4, 8, 15, N'HaNoi', CAST(N'2024-12-23T00:37:21.9120000' AS DateTime2), CAST(N'2024-12-16T00:45:41.1411490' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (27, 2, 4, 8, 15, N'HaNoi', CAST(N'2024-12-23T00:37:21.9120000' AS DateTime2), CAST(N'2024-12-19T14:02:42.3005273' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (28, 1, 4, 13, 15, N'HaNoi', CAST(N'2024-12-17T00:47:04.8040000' AS DateTime2), CAST(N'2024-12-19T14:03:29.6836628' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (29, 1, 3, 14, 3, N'HaTinh', CAST(N'2024-12-20T14:04:37.7190000' AS DateTime2), CAST(N'2024-12-19T14:05:16.8973587' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (30, 1, 2, 13, 2, N'Hanoi', CAST(N'2024-12-20T14:08:56.3510000' AS DateTime2), CAST(N'2024-12-19T14:09:52.8192319' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (31, 1, 2, 13, 10, N'Hanoi', CAST(N'2024-12-21T14:11:48.6120000' AS DateTime2), CAST(N'2024-12-19T14:12:06.2018720' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (35, 2, 3, 14, 3, N'HaTinh', CAST(N'2024-12-25T14:21:28.6210000' AS DateTime2), NULL, N'Shipping', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (37, 2, 3, 14, 9, N'HaTinh', CAST(N'2024-12-24T14:27:14.6630000' AS DateTime2), CAST(N'2024-12-19T14:27:23.5022202' AS DateTime2), N'Delivered', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (41, 1, 4, 13, 12, N'HaNoi', CAST(N'2024-12-20T14:43:57.0940000' AS DateTime2), NULL, N'Shipping', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (42, 2, 3, 14, 14, N'HaTinh', CAST(N'2024-12-26T14:43:57.0940000' AS DateTime2), NULL, N'Shipping', 1)
INSERT [dbo].[Deliveries] ([Id], [ShippingMethodId], [CustomerId], [DeliverId], [ProjectId], [DeliveryAddress], [EstimateDeliveryTime], [ActualDeliveryTime], [DeliveryStatus], [IsActive]) VALUES (43, 1, 1, 13, 10, N'Hanoi', CAST(N'2024-12-20T14:46:48.3100000' AS DateTime2), NULL, N'Shipping', 1)
SET IDENTITY_INSERT [dbo].[Deliveries] OFF
GO
SET IDENTITY_INSERT [dbo].[Designs] ON 

INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (1, 2, 2, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2Fthietke1.jpg?alt=media&token=b1cf760c-e303-468d-96f3-98d9fb1706df', CAST(N'2024-07-31T05:29:40.6269235' AS DateTime2), N'1', 2, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (2, 3, 2, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2Fthietke1.jpg?alt=media&token=b1cf760c-e303-468d-96f3-98d9fb1706df', CAST(N'2024-07-31T08:38:25.0381780' AS DateTime2), N'Approved', 2, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (3, 4, 2, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2Fthietke1.jpg?alt=media&token=b1cf760c-e303-468d-96f3-98d9fb1706df', CAST(N'2024-08-01T04:12:30.8046528' AS DateTime2), N'Approved', 2, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (4, 5, 2, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2Fthietke1.jpg?alt=media&token=b1cf760c-e303-468d-96f3-98d9fb1706df', CAST(N'2024-08-02T02:38:38.8376838' AS DateTime2), N'Approved', 2, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (5, 7, 2, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2Fthietke1.jpg?alt=media&token=b1cf760c-e303-468d-96f3-98d9fb1706df', CAST(N'2024-08-14T13:13:16.4967140' AS DateTime2), N'Approved', 2, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (7, 9, 2, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2Fthietke1.jpg?alt=media&token=b1cf760c-e303-468d-96f3-98d9fb1706df', CAST(N'2024-08-15T04:13:52.4739067' AS DateTime2), N'Approved', 2, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (8, 10, 2, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2Fthietke1.jpg?alt=media&token=b1cf760c-e303-468d-96f3-98d9fb1706df', CAST(N'2024-08-15T04:39:53.5661960' AS DateTime2), N'Approved', 2, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (9, 4, 8, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2FScreenshot%20(34).png?alt=media&token=ea3e6529-09b0-4ad1-9c32-434d3cdc8b55', CAST(N'2024-11-28T20:52:09.3968124' AS DateTime2), N'Approved', 3, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (11, 1, 8, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2FScreenshot%20(34).png?alt=media&token=621616ae-38d9-4a7f-9d76-50c5618511a6', CAST(N'2024-11-29T22:24:06.2136480' AS DateTime2), N'Approved', 3, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (12, 11, 8, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2FScreenshot%20(34).png?alt=media&token=0efcdc2b-d775-4003-9d06-52d2888ce787', CAST(N'2024-12-01T03:29:44.6310166' AS DateTime2), N'Approved', 3, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (13, 12, 8, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2FScreenshot%20(34).png?alt=media&token=2ec7864a-316c-46b8-a655-457608995e84', CAST(N'2024-12-05T02:19:42.0428157' AS DateTime2), N'Approved', 3, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (14, 13, 8, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2FScreenshot%20(34).png?alt=media&token=e3e4173a-2f85-4413-ba3c-2f3636120516', CAST(N'2024-12-12T11:00:58.2080741' AS DateTime2), N'Approved', 3, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (15, 14, 8, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2Fthietke1.jpg?alt=media&token=b1cf760c-e303-468d-96f3-98d9fb1706df', CAST(N'2024-12-12T12:11:16.5847426' AS DateTime2), N'Approved', 3, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (16, 15, 8, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2FHoSoToeic.pdf?alt=media&token=b6191138-f2b5-4e85-afd5-4425891faec0', CAST(N'2024-12-16T00:23:58.4082068' AS DateTime2), N'Approved', 3, 1)
INSERT [dbo].[Designs] ([Id], [ProjectId], [DesignerId], [FilePath], [DesignTime], [DesignStatus], [ApproverId], [IsActive]) VALUES (17, 16, 8, N'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/designs%2FHoSoToeic.pdf?alt=media&token=28525556-8465-4c15-89c3-fbdae550a08c', CAST(N'2024-12-16T02:38:10.6717215' AS DateTime2), N'Approved', 3, 1)
SET IDENTITY_INSERT [dbo].[Designs] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (1, 2, N'Your design has been approved.', N'/projects/2/designs/1', CAST(N'2024-07-31T08:13:20.0187544' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (2, 2, N'Your design has been rejected.', N'/projects/3/designs/2', CAST(N'2024-07-31T08:46:05.8705466' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (3, 2, N'Your design has been approved.', N'/projects/3/designs/3', CAST(N'2024-08-01T04:13:24.3595996' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (4, 8, N'Product is delivered successfully.', N'...', CAST(N'2024-08-01T04:58:28.5693514' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (5, 3, N'Product is delivered successfully.', N'...', CAST(N'2024-08-01T17:22:56.8237806' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (6, 2, N'Your design has been approved.', N'/projects/5/designs/4', CAST(N'2024-08-02T02:40:11.9689170' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (7, 8, N'Product is delivered successfully.', N'...', CAST(N'2024-08-02T03:03:17.7294941' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (8, 8, N'Product is delivered successfully.', N'...', CAST(N'2024-08-02T03:06:19.6645835' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (9, 3, N'Product is delivered successfully.', N'...', CAST(N'2024-08-04T09:37:57.8693708' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (10, 2, N'Your design has been approved.', N'/projects/7/designs/5', CAST(N'2024-08-14T13:14:31.1434296' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (11, 8, N'Product is delivered successfully.', N'...', CAST(N'2024-08-14T13:27:09.7839712' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (12, 3, N'Product is delivered successfully.', N'...', CAST(N'2024-08-14T14:06:07.9822618' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (13, 2, N'Your design has been approved.', N'/projects/8/designs/6', CAST(N'2024-08-14T14:35:37.2576835' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (14, 8, N'Product is delivered successfully.', N'...', CAST(N'2024-08-14T14:47:32.0393874' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (15, 2, N'Your design has been approved.', N'/projects/9/designs/7', CAST(N'2024-08-15T04:14:33.7569322' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (16, 8, N'Product is delivered successfully.', N'...', CAST(N'2024-08-15T04:23:11.6980318' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (17, 2, N'Your design has been approved.', N'/projects/10/designs/8', CAST(N'2024-08-15T04:40:43.8228140' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (18, 8, N'Product is delivered successfully.', N'...', CAST(N'2024-08-15T04:47:20.2684438' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (19, 14, N'Product is delivered successfully.', N'...', CAST(N'2024-11-27T07:24:43.2733338' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (20, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-11-28T12:24:36.1184520' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (21, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-11-28T12:24:38.2177060' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (22, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-11-28T12:24:38.5767135' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (23, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-11-28T12:24:38.7684587' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (24, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-11-28T12:24:52.9221499' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (25, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-11-29T02:26:05.4560146' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (26, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-11-29T02:26:11.4007280' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (27, 8, N'Your design has been approved.', N'/projects/4/designs/9', CAST(N'2024-11-29T04:42:52.1713305' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (28, 8, N'Your design has been approved.', N'/projects/2/designs/10', CAST(N'2024-11-29T22:21:39.0444657' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (29, 8, N'Your design has been approved.', N'/projects/1/designs/11', CAST(N'2024-11-29T22:24:29.6636473' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (30, 8, N'Your design has been approved.', N'/projects/11/designs/12', CAST(N'2024-12-01T03:30:32.2850674' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (31, 8, N'Your design has been approved.', N'/projects/12/designs/13', CAST(N'2024-12-05T02:20:39.7901840' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (32, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-05T02:32:13.0294419' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (33, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-05T02:32:17.2865973' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (34, 8, N'Your design has been approved.', N'/projects/13/designs/14', CAST(N'2024-12-12T11:02:07.8602118' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (35, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-12T11:22:21.8300138' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (36, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-12T11:22:23.7833073' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (37, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-12T11:22:24.3448991' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (38, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-12T11:22:24.5269264' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (39, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-12T11:22:24.6942850' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (40, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-12T11:22:26.4589828' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (41, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-12T11:22:30.3316992' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (42, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-12T11:22:31.1300057' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (43, 8, N'Your design has been approved.', N'/projects/14/designs/15', CAST(N'2024-12-12T12:12:29.5979386' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (44, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-12T12:18:34.3044922' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (45, 8, N'Your design has been approved.', N'/projects/15/designs/16', CAST(N'2024-12-16T00:24:47.6385043' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (46, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-16T00:45:23.2130534' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (47, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-16T00:45:41.1559800' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (48, 8, N'Your design has been approved.', N'/projects/16/designs/17', CAST(N'2024-12-16T02:38:39.9371947' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (49, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:02:42.3405060' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (50, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:02:58.8344618' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (51, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:03:27.6451367' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (52, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:03:29.6912734' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (53, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:04:55.6999973' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (54, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:05:12.2478431' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (55, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:05:16.9035591' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (56, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:09:05.2381419' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (57, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:09:36.8172903' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (58, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:09:38.9747571' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (59, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:09:39.8773486' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (60, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:09:52.9271006' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (61, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:09:52.9271005' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (62, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:11:58.9878900' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (63, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:12:06.2182662' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (64, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:17:55.6147466' AS DateTime2), 0, 1)
INSERT [dbo].[Notifications] ([Id], [UserId], [Content], [Link], [CreateTime], [IsSeen], [IsActive]) VALUES (65, 13, N'Product is delivered successfully.', N'...', CAST(N'2024-12-19T14:27:23.5261972' AS DateTime2), 0, 1)
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (1, 1, 2, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (2, 1, 1, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (3, 2, 2, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (6, 3, 2, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (7, 3, 3, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (8, 8, 2, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (9, 8, 4, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (16, 13, 2, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (17, 14, 2, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (18, 13, 5, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (19, 14, 5, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (27, 2, 3, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (28, 2, 4, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (29, 2, 5, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (32, 14, 4, 1)
INSERT [dbo].[Permissions] ([Id], [UserId], [RoleId], [IsActive]) VALUES (33, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[PrintJobs] ON 

INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (1, 1, N'Completed', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (4, 3, N'Completed', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (5, 3, N'InProgress', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (6, 3, N'Completed', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (7, 4, N'Completed', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (8, 5, N'Completed', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (11, 8, N'Completed', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (13, 3, N'InProgress', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (14, 3, N'InProgress', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (15, 3, N'InProgress', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (16, 3, N'InProgress', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (17, 3, N'InProgress', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (18, 1, N'InProgress', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (19, 3, N'InProgress', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (20, 4, N'Completed', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (21, 12, N'Completed', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (22, 13, N'Completed', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (23, 14, N'Completed', 1)
INSERT [dbo].[PrintJobs] ([Id], [DesignId], [PrintJobStatus], [IsActive]) VALUES (25, 16, N'Completed', 1)
SET IDENTITY_INSERT [dbo].[PrintJobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (1, N'P1', N'Project 1', CAST(N'2024-07-30T16:06:16.8190000' AS DateTime2), 3, CAST(N'2024-07-30T16:06:16.8190000' AS DateTime2), 1, N'DangIn', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (2, N'P2', N'project 2', CAST(N'2024-07-30T16:12:57.9640000' AS DateTime2), 3, CAST(N'2024-08-30T16:12:57.9640000' AS DateTime2), 1, N'DangIn', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (3, N'P3', N'project 3', CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), 3, CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 2, N'DangThietKe', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (4, N'p4', N'project 4', CAST(N'2024-08-01T17:06:07.8440000' AS DateTime2), 3, CAST(N'2024-10-01T17:06:07.8440000' AS DateTime2), 4, N'DangIn', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (5, N'p5', N'project 5', CAST(N'2024-08-02T02:32:29.7090000' AS DateTime2), 3, CAST(N'2024-09-02T02:32:29.7090000' AS DateTime2), 4, N'DaHoanThanh', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (6, N'p6', N'project 6', CAST(N'2024-08-04T00:00:00.0000000' AS DateTime2), 3, CAST(N'2024-09-04T00:00:00.0000000' AS DateTime2), 4, N'DaHoanThanh', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (7, N'p7', N'project 7', CAST(N'2024-08-14T13:10:04.2780000' AS DateTime2), 3, CAST(N'2024-09-14T13:10:04.2780000' AS DateTime2), 2, N'DaHoanThanh', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (8, N'p8', N'project 8', CAST(N'2024-08-14T14:29:42.0660000' AS DateTime2), 3, CAST(N'2024-09-14T14:29:42.0660000' AS DateTime2), 2, N'DaHoanThanh', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (9, N'p9', N'project 9', CAST(N'2024-08-15T00:00:00.0000000' AS DateTime2), 3, CAST(N'2024-09-15T00:00:00.0000000' AS DateTime2), 2, N'DangThietKe', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (10, N'p10', N'p10', CAST(N'2024-08-15T04:38:00.6860000' AS DateTime2), 3, CAST(N'2024-09-15T04:38:00.6860000' AS DateTime2), 2, N'DaHoanThanh', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (11, N'P11', N'Proj11', CAST(N'2024-12-01T03:27:01.8190000' AS DateTime2), 3, CAST(N'2024-12-04T03:27:03.2900000' AS DateTime2), 2, N'DaHoanThanh', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (12, N'P12', N'Project 12', CAST(N'2024-12-05T02:14:15.2740000' AS DateTime2), 3, CAST(N'2024-12-25T02:14:16.3830000' AS DateTime2), 1, N'DaHoanThanh', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (13, N'p0', N'p0', CAST(N'2024-12-01T10:54:32.5370000' AS DateTime2), 3, CAST(N'2024-12-24T10:54:46.8260000' AS DateTime2), 2, N'DaHoanThanh', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (14, N'p14', N'Project 14', CAST(N'2024-12-12T12:08:30.4010000' AS DateTime2), 3, CAST(N'2024-12-19T12:08:33.8280000' AS DateTime2), 1, N'DaHoanThanh', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (15, N'p15', N'Project 15', CAST(N'2024-12-16T00:21:49.7130000' AS DateTime2), 3, CAST(N'2024-12-31T00:21:53.0010000' AS DateTime2), 4, N'DaHoanThanh', 1)
INSERT [dbo].[Projects] ([Id], [ProjectName], [RequestDescriptionFromCustomer], [StartDate], [EmployeeId], [ExpectedEndDate], [CustomerId], [ProjectStatus], [IsActive]) VALUES (16, N'p16', N'Project 16', CAST(N'2024-12-16T02:33:47.7960000' AS DateTime2), 3, CAST(N'2024-12-23T02:33:53.1500000' AS DateTime2), 4, N'DangIn', 1)
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshTokens] ON 

INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (1, 1, N'XSmPOJiGrWOGXMHJoM9FOlBD03BMcfnuTHZ426YZayezeLsgu5JtBxZPjutc7l8WgxzcnWHrz1bk/W/1XO2OIg==', CAST(N'2024-07-31T05:54:43.7603159' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (2, 2, N'25AQtmwVfcrfBeGf/nN4nBZDU4ePXvtF8fAqu26tRk25BsIDNdTJqC9Fe5U0xK3rLIw8+20sRrpk4qLVB0bwcg==', CAST(N'2024-07-31T06:05:59.9792957' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (3, 2, N'XX516L2HsBSeolz82XucE0IXya0gmTTwm3D5VFmZCDjJz5F7sNHi5pPzmiHvQ99cIqei2QMHGNU4GDFnZhZbZQ==', CAST(N'2024-07-31T06:12:40.1736420' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (4, 2, N'6rra6LpWLdL+IVr235LOK7u+bGHZH8D8sgQv4v14VQgoUImBUGQRR/wBX+CFDBmBhLtXXnwQ4hnNtYsKvPqZkw==', CAST(N'2024-07-31T19:28:12.3245760' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (5, 2, N'4o/QXmRkyignOcUWMrDNYLpPxMZZb8kzQ6UgQeXfYS20aa150H0VqDL1x4uQjQOic/gl7bnR5trV8WAxOnu+HA==', CAST(N'2024-07-31T20:18:07.5521195' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (6, 2, N'uH8enMmZ7Pf+TIhbqlczQ9caYCF3HV5hP+krZA4/BApSJderw7tneZ05Qh6RrD5tqnesD5IP1kVKc1yd668apA==', CAST(N'2024-07-31T20:21:16.5266660' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (7, 2, N'Mndw5in9eCGfRFdfU9ju5bjp1V/Ttvg2XwFXq0o6KR32krZxUP1OAaZF6nv6Ou2cPpAs/1YnraIORuWa7H20+Q==', CAST(N'2024-07-31T20:24:02.6904601' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (8, 2, N'511lHuVbvpPjpJZ+gR32yQPmiz3DgqKj1vl4UUjiHZN5++gmp74yZ8dX7Si3klAz8H5ET8QFr8RGSCH7bpBzBw==', CAST(N'2024-07-31T20:25:28.8359366' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (9, 2, N'arrdW9DHB3LrGhA5PI/OoypZlDzFl6uUnm4AOZJj/4OLtdm2kjmACx28yBt2uYfXRbg+PA5Jg30SBD9Ljxb4iA==', CAST(N'2024-07-31T20:30:49.8990312' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (10, 2, N'/AkQ6VNlUmrKeLI7fMrFwOFIfRG1Rz0QeuFIwkkPxrL6QGHBBaWjolNLohs8BOqZd4uPkxMiqJ7pVZYqqVBxeA==', CAST(N'2024-07-31T20:39:44.8276151' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (11, 2, N'RuJpcGkYECeuqp0EbQtixGfIaHVZFLIpyFUbuWzADD+lw3VB53PPqI/QP7jY9T+mspRDDAzEs/YSbkb0UHkVZw==', CAST(N'2024-07-31T21:44:41.5446971' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (12, 2, N'MWCCd5sr5lB4eCSKaq1QtQxXaTW75L4N0yHJ8yLYQV4kZCL8+nnu3rxoRtRkhGD2vBAsuYWwdD5UHs+lgJYuFg==', CAST(N'2024-07-31T21:51:09.6946590' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (13, 2, N'+ikS+cSR7lIAPxSW131RfsOioO5kBvEYzPfdKTZUe8ruCWrXOtZ/3Sjx2pjwuem+4azBMRRlm9VMdUJlxAQHmg==', CAST(N'2024-07-31T21:57:15.6443230' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (14, 2, N'zEW6lXMqqKQJLV7LCbXM5A6uH03Oy7fp5g0oZMBOxs0uorXaPvp0k0sBm5VZ4hoeNjmI2NfBwmEm3Ybj5Rr7DA==', CAST(N'2024-07-31T22:00:13.1517031' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (15, 2, N'AkoAV8NtOVaJfFlf+dqef/odHAnIEKotUoI151xVtR2xIBmAFB8v+Z0tP14NGDTayc2PVceyHhh2o4Upm2ZSzg==', CAST(N'2024-07-31T22:10:29.3503827' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (16, 2, N't7mii9tR32HiNVGmGWGUZlMdwGOaNN9XQKzMMyZRevxXturCyFc1CZyPsqmV1XaQUvBpgiG3va9uTligADbaFA==', CAST(N'2024-07-31T22:33:10.8465208' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (17, 2, N'XqpqqnVdybSX14PBKLucgqzDnbGS9ftQN3Ye2b9aXmcvPwb27pLLLE/ROJZTBCWmr4X75L42+01xPm15JarknA==', CAST(N'2024-07-31T22:36:33.8906359' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (18, 2, N'zyAV/uOFsClcRAqd7bxqHtoVXrT1zulJR3AftUjMBgByKcsMNeF+44jY3vrJpB/eiviQ6zem8EkBZsr3FPzSiw==', CAST(N'2024-07-31T22:45:03.0170964' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (19, 1, N'+5WyX48eUE1EqQLgCErPckQ8ZeWf3GOZa6M4h23dvmIIb0/Eta/CDxDtIDNajMBX596YW8kPfFb+nUvLTdyiIg==', CAST(N'2024-08-01T05:00:08.0440720' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (20, 1, N'Be22wxc8GLE42LX3F0d8mH2v7CT3ygRUa9bb4IDz3uj7DkJhRvcegem3ZJi9zIK/xvaPz5A28taQkfsKj2znqg==', CAST(N'2024-08-01T05:44:56.2256562' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (21, 1, N'ZH8f9a59SCL9Xw9+LzTr0P7tE9kd4DzjByDmP/gv1kzVMF/ZR6MXWq4EF0NCESpdczqrLRP9lT8cCt+eERIL0g==', CAST(N'2024-08-01T05:53:57.2039255' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (22, 1, N'wcpTfYjN5XqKZkLgGiu7tw+bwsYZhFIsXQlnrvQkHQ/TuI9mBlIjrA/wP5g6wd5EXU6qNQge/Hw0nQ3UfCPu0w==', CAST(N'2024-08-01T05:57:17.4853893' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (23, 1, N'oVM3baHtwTVx/YVw5DobEc96h+nwgol5QfrkV9LcFcpOTr0PWBxSlgCEVkzs+g2czvOxn/grIQHQjbddmp8law==', CAST(N'2024-08-01T06:48:11.6707877' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (24, 1, N'My75OZvnVbV4hB4VGjbwEi9nvoajoIFzLWI1qAVUuWs1LfyLz6emiERyBAzHMCR2vEa0x40nW/0pLU6Yudl7ng==', CAST(N'2024-08-01T06:52:28.0100034' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (25, 1, N'9KsKRCRe5pFo7W9I7Mb1EpYlAKzwRbZZx1XrcR++uTX6JEQGXFyErpwdK6ZDwERy6Wa0+Xbe24Hu7RJ45VqpDQ==', CAST(N'2024-08-01T07:09:17.0507105' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (26, 1, N'9i7mUYSE+Z7jgnNg3rOk3qCcNR2a+T7gzmD0Lf0Tr4GWPa/bO82MbXgnYmRgtFY27+zkSoL733J3DVfNbKhqvw==', CAST(N'2024-08-01T07:19:59.7601749' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (27, 1, N'd3KOLyO5waRxxsgSda5Twkl8lRSUQf20Jg9RH49yTeVYz07hgwOfgX+5QcEOj3+ywByyKZv4BLjLM4nOZ3a23A==', CAST(N'2024-08-01T07:26:05.4169176' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (28, 1, N'7jSKEeraeHTeCtIxW7Rxt/v8SUWYxez/cHEfVP6PBxpTKr8pWCQaFU6PcQrzNKJet4sScnD0658o+BxCgbzM8g==', CAST(N'2024-08-01T07:35:33.3250650' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (29, 1, N'Occkef31jBPiO7FQnziAvG3bWNdV7KT4UjH/YQVpfhEXmJgOvzO87V9XFbkG+XH1hKBKhtRiH5e6Hzu+x5j7xg==', CAST(N'2024-08-01T07:39:58.8196003' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (30, 2, N'SSr/33OVdRkf8T30Q0hwnjYut9XxiXSqibcjXMZj5gXAx7UBRessbvcef/zjk6J/E/X282XSI+pLAZu9Er46Xw==', CAST(N'2024-08-01T07:42:31.1785262' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (31, 1, N'Nokrhxs5InhdEtRcvF1fo5bnpkZ47sNa0I+E6NY8yIXV0nWSz4t3IW1dsM6E/vufRsaTKRSzdzzcZ+AdVsZwlA==', CAST(N'2024-08-01T07:45:23.4713078' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (32, 2, N'/P0rTUIf1xsrrf9BNJbl9XbBEQFK+/C2EQPIn+mPO9Q9WnLezqXcOhtm9Cz5cI63SK7usOCyCGRdKsPzz8iD7w==', CAST(N'2024-08-01T07:45:49.3702226' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (33, 2, N'NvlLSVkag0T0cr6y+xWgWeSYJPhcQmhY9SMjV/mDoT1CyNXqJer1iBrgsDmiCxRDASlBaaWhtG76Aa2Bd29alg==', CAST(N'2024-08-01T07:51:43.5744451' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (34, 1, N'sznSkNjsNYiHqOV9UGiJFmO3Wnqhnq42uhy6EC+U+yetUCGIq/dGcJ3RWZHQUfq3ue4h5rGMR2fESqJp7DRJLA==', CAST(N'2024-08-01T07:56:12.1526302' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (35, 2, N'1uTP0dns1zDFA/z+AJgOgPNuf0WVARp2yYRDkkKaiRo8S16EPzFaSiQZKfA17AChWJcUp6yLQ0L8qTWSMIgQ+w==', CAST(N'2024-08-01T08:01:07.4937581' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (36, 1, N'kjht12e8rMYu8UiExN2u8+grHVKALKTo+XsJMzEsHUi/9oE/3QQEWtvS5JdxnI1bJe1GgDgVpuKY4HPuU77+Pg==', CAST(N'2024-08-01T09:27:55.1726215' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (37, 1, N'sUrdIMscgdungm7VUmbTyvYob4R4Ammla6siYWhu1obl8LWarIRWFHMbeXj+ucYaS1r6R0ELWGElud/p/VH2tg==', CAST(N'2024-08-01T09:51:59.5399239' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (38, 1, N'/lpz5tSWFu93rjWUYO4kQBbV6YptQFtApuYrQbrE2B1Hsw2LY6hhiSeNHWO3/d2jlzJiSryUSDX8Cm6a4iBW4w==', CAST(N'2024-08-01T09:53:52.4999976' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (39, 1, N'hmo2/qZj1MmGlMGogu/QPoXxfmrD8UOlgD0Kit1jq7azSSlOASNJOah4Wp1M0h16zzUJSrcuSaAm6Ys5psXu2A==', CAST(N'2024-08-01T10:04:02.0718622' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (40, 1, N'PwNmk670DvUA4Vw2wkMb5L4ei0e11O1+QQtJd1LBDt/ZvElsOqazcY7erV3Y5pynLvWdAzXs7Wc82MqrdzrxyA==', CAST(N'2024-08-01T10:06:27.5468439' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (41, 1, N'u76BHCOUbGZcv2Oj6DoQCH9wHZ2Ysv6opwCyk8inh57cR2q9xGNGR3R3hLB2OzSqCA2r2kL5GdPyhDGlYHqYTg==', CAST(N'2024-08-01T14:17:38.4520677' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (42, 1, N'n4HZ93kcgcH0SSaoUqrW+kpw4LSGLEjo1exo1T/KJUVPHO2DKTyFZtTB5pQlkQJ5mtKRjWkDbNwRPQwuJFglcQ==', CAST(N'2024-08-01T14:50:38.7730835' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (43, 1, N'9zmF91GvSw7xEH31ugGn+0JDEj74iRK9r8uV7qDK78dgSj9hSjTFh5/cJZmTxMAkWetdKGog1apqWwIpZ4DlSg==', CAST(N'2024-08-01T15:03:39.0885498' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (44, 1, N'wO8Xt4gne7pl+ZpDTwe5A4BtetdpAkZQdJbftF4eOi4D334lseQ+hrQQBD7WEhf+KuUNDkYT2x39S9NfQ5DUEA==', CAST(N'2024-08-01T18:03:22.6616400' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (45, 1, N'OsfONCRSwiTRAEJB1CMceMMjWYLtAx+xUEYfl7xrLl4LdPXEcBUS59YJ5yV4npY/uC0xzaP+iTUGyJZlylBnZA==', CAST(N'2024-08-01T18:08:49.3373463' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (46, 2, N'sXuBPl2z/RGT8c+5MlsxLBwcnl89iHL9jDb/zaKlewlhXfxReuHjEvdQOEVWEZSepaQmSBZ5u8pSruiwkIBcpw==', CAST(N'2024-08-01T18:11:19.9091150' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (47, 1, N'96GyExPaB9hQom1KbDPuPZDYjdVTUsJr1jfaiy41E4aYIwLmFGb3E93Hl0XC1jeHCIDFV+Rf9nf+r8HEb1l7sw==', CAST(N'2024-08-01T18:17:39.0663187' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (48, 1, N'qgv5keQfIgoAnvK/buwRXxTaDJg4bOEAi+Hf3DZsXmEqYOLqYZeEdRrhVzs2c3mMCQoZuSgZ69gx6ZHKaonP5g==', CAST(N'2024-08-01T18:18:40.9914383' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (49, 1, N'zrUMgO3e/+rU0xwP7g0+vyubOiomDQ/fTHwGWjal2gDSpfKG81ROA1CGxBRyTbx7Iw+wvd1LgCv+tfvTtr9NAQ==', CAST(N'2024-08-01T18:43:39.9978547' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (50, 1, N'jPqbhUbP/KFw0c/A6rfcH/w9UZkljr0uUEML8phYci1UGQKTYGoglOhjX+9oEBISmyd73yOkPKuFxI4aR0dkug==', CAST(N'2024-08-01T18:53:16.1976687' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (51, 8, N'Iz9Xs0GjlVZ7gp5mjKhtdadDY+FWuG/sOKkChZPl3Z+y2m2XI5wRcqnNJdABUoSi3Kus4w6IpL4RUgCi/GGZ1A==', CAST(N'2024-08-01T18:54:58.1883026' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (52, 8, N'ZeIJ0tvsXVIY3yND1Um6rXHHgtDurw+hfPycjeNaZ/tYwRJKaOzFqsiQ4WKn9VVfXsIcBbryayMe7HIbsszcFw==', CAST(N'2024-08-01T18:58:07.4488180' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (53, 1, N'8348comWUD+RPYTBV9mbNN6JIS3XKFM2Cup38wVv7lt2bqKkdtevXkTp7YQKcqPf+b4+gnJSF9RLhwFC/6gJnw==', CAST(N'2024-08-02T06:46:36.9158912' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (54, 1, N'qLWgBKqRUIG3QBcAmSH/mKmAtg7IVRORz85PZIkIcGhqVkzpjGzA3zSskW5LqwW2jGzGx1H5L+Qp2piNmNux1Q==', CAST(N'2024-08-02T06:57:28.0283131' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (55, 2, N'dH2GBIeb95Kp3f+kTH2kFfkPBKrBIHFRa0ytoxOzJPeVnEY+G3LgCwAhBfHFifaMCVc9IKVCow6uQrpX5fDymA==', CAST(N'2024-08-02T07:06:55.5919626' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (56, 1, N'W9O6uaHbm6Ae7FBSf4LYD9skZmbsOMcQb1eAW+jJDHl6dphp77VYVK1hSZhxgSSF1c3izpjGHd0ZrkvtHstaQQ==', CAST(N'2024-08-02T07:13:58.4404068' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (57, 1, N'bfQJl5Q0ilxNA5TZzNrhmaWIMWZCNMnyXcgSulhqq4AE7fYgSqGuOspJzYlQmt6X8nBsRe6nM8Q3ssUYniTwYA==', CAST(N'2024-08-02T07:19:51.2467667' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (58, 3, N'j4MvGqswQ2iLWyWZOLFBLI59696alMmzYaDib8lv/eRzhL+heKvH8r/+06zpeC9/rPJsee9wKV9ugxGAgRjC7g==', CAST(N'2024-08-02T07:21:59.3090698' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (59, 2, N'I2sR1r9w0b7Q1ba/kiPQylnmYMSsLiRpG11nN0bQyvXa7HiCewIYDfg298+DCCkT5zqg6P+dJ6jJb4OUe/Wsyg==', CAST(N'2024-08-02T16:30:57.0826700' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (60, 1, N'2QOY/DTWWQG4TJI9TVPYx7o7KExtilaSJyyGG5FnbEYmZMzgqSjOt6M5qha0Z3vc9NTmKQERTyi6ckwBNJOvkA==', CAST(N'2024-08-02T16:34:58.0940083' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (61, 2, N'w6YMi/4zDwrRub0YADyPn4Aw3ByK/Gb4HXtzgpp8zanzSc+GSEO/AoLt6KTkE02Tb5Zkl36h5KiQW6N2O3/fsw==', CAST(N'2024-08-02T16:36:16.1170231' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (62, 2, N'PtOOg3/YUiOCNCRv2QU1nFGruSx+x033kyI/HS7CdDelr6KW0JwQ5Ft9XLRzqCBOXOjy8U+YcxSQ3i/MjNKnmw==', CAST(N'2024-08-02T16:36:21.3664695' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (63, 1, N'1cQ5pgOWcTsnfZCAi4rni3DbhrQMiCnevG160R61nIC59zhJ27XoCSVwYYpJNvuQDs6HtH8XVeEwl1m5WBFEyw==', CAST(N'2024-08-02T16:54:52.8289384' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (64, 8, N'6Oy4cDQXUA5U5EE48VGdLu5v3ESGbwI/DXe9DkB4GBVfgHGYMP2fdOjGqSIHac9ul59a2aJfY7WBN4glVS1G6A==', CAST(N'2024-08-02T17:02:37.1018959' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (65, 1, N'E99ZxPPIyk+RVYhAx3oEZCdaK/tmGMqH8uYkyF1NFIYxRk7rwyMVcFF/ltDWmmLG7WEMvpopYZfMYQbq4CVLfg==', CAST(N'2024-08-04T22:12:11.6152877' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (66, 2, N'Q14kKc6Ofzyf46+xQ9JQRHeofhzLnXtPHMFR47sBMmhD+mR/5TCnrmbG2QV6Wm/Zqz+HEjuRMIBaFhjlZBah/Q==', CAST(N'2024-08-04T22:56:19.0542460' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (67, 2, N'FS7LMUbQbCQ0DXJKjL3ps4N7Kd1V6xtGNHMV9U9DDF/UdhO6RDCH4pWLLZb/4zvR2hR1Yd8zcO2qMa1n81rG8A==', CAST(N'2024-08-04T23:00:23.9610270' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (68, 2, N'undsiqiso3KJ08+ty8A3G9FpAaAjIfpdzIEt2Q2cX89BYYYl0bkymBiFj4ris5g+/+BBtw131yI9Jv4spV1HNw==', CAST(N'2024-08-04T23:23:54.7682229' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (69, 2, N'a5Gq1eQNX/5E8wobWWRoCIyPm6rV6Kg+4SXUWYaLma8qr6gOjjsXpa1X+6LN3pmiVo/qJFdyTIVMUhKUe8RunQ==', CAST(N'2024-08-04T23:34:21.6626518' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (70, 3, N'8PUWUj2d5qLESsEg7j/ApQtghxDBGVIuEaq4X4I9fJA2TvRcQgmSGKsYiipjG6m0zNleZM91Fl6gX24U47ImDg==', CAST(N'2024-08-04T23:35:05.0570346' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (71, 1, N'cloz8pSKitIpufl1IxLIedBAUXkTX0ck35kTbMn/jSNuPhvDwUtDdWT3sqYx/s6HTaiSa/icbwTggqHPAggqvA==', CAST(N'2024-08-15T03:05:11.1869103' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (72, 2, N'nkMEjCeWxijpXYgNq8SGp6fwRvQvSbVfXGjA6nnY9DArwgBGjQ/5LDKi9eYEhfPz6R/cdWHYSHmrQdL+uw8aWg==', CAST(N'2024-08-15T03:09:26.7347260' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (73, 3, N'2VusoUiQbZZgkJez1EnURDrZWBFwNQs314cIH3mSjU0COVbxE59nB99uAZKWRkYYvUxvk4BheBo0tPyF+v6XCw==', CAST(N'2024-08-15T03:22:27.5195096' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (74, 8, N'lt0KwP4oqYEgV+47/SbWdsy5RE7XynwifYegF5B2dk/VR8795schMnpe+FBjHG4jRAoIcECnlkAl8ic4uhElCA==', CAST(N'2024-08-15T03:26:32.2003125' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (75, 3, N'hbPwlswfewUp8EhIO71ysevPzQRuUHLWG3sRdUzt4Z0nkqARmmLWy/UwvITnepqHsnxTsfcP5BxkN7fFLU1JDA==', CAST(N'2024-08-15T04:04:18.1943193' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (76, 1, N'Mqn08AhAPVS909q+/6ygJwmbuNoNTKX8kZFmJ4D81bgWAjn7iOM5xevY/aRYpzrtCwF3XbquRvAELjxlEfY62w==', CAST(N'2024-08-15T04:25:02.1244869' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (77, 2, N'uiy9pllmsuTKvDzgFnmszHnXobr25H+LBB3BnoVwHapw9CPNsg86Hdl11egptbuY4yJ3eBZPauCZm1+X07YSuA==', CAST(N'2024-08-15T04:28:57.8306911' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (78, 3, N'zZ7R6ZYDfRZoYppDPlw+cIFg/Yyrn3J0kXcuXfUasfHpguZrtIWW0+Sor694ZU3mk3ffHqqgdc5a0q8nxN0iaw==', CAST(N'2024-08-15T04:43:21.2695088' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (79, 8, N'sFLWVGqFeaagnQIk0O2nHgtoCRXm8aqukhkHG1VRSMoyanhYTSeN9W54BvydL80fzzn1xEx4gcB59OECps/SLQ==', CAST(N'2024-08-15T04:47:00.6515616' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (80, 1, N'ZVxxkS+NEovPOqKyoQ19SkKN1xryKxeqbjGkMpQqMhdQR3leld2BDHuzsLcUAKsYUCheT2l+LyVPvjRNjJfpiQ==', CAST(N'2024-08-15T18:07:13.7197059' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (81, 2, N'A1RImqfsjcU2GzFWbCSDYr51FfTWk3q/xrFeuDmZXGiM3hbUzwPrLmWa9FUz/RiBX3LWEazT9WC5fB5Z2iLmSw==', CAST(N'2024-08-15T18:10:51.1082557' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (82, 3, N'snGXDxlMi80ssQo7F+r7dAc70SEZK77v0bptVIvXBHWkM3wFaku6YeBTqYYOMQ0rsvlHuDPFFrGDWvwwFKO7OQ==', CAST(N'2024-08-15T18:20:02.6351154' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (83, 3, N'5BMjyabGnE/eMW58ASNkd+u2q9vmdwn+SeV3lyugeP4M52gv1/HtMOrEcDG7EsY21pmoPOzXvCzk3AtmgnvluA==', CAST(N'2024-08-15T18:21:30.4397337' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (84, 8, N'WfKoPRFGLCFgt6CYf1BIeH39aGQFrKVbRAuIlZLzxkdDUrN6wEGgMmIw68QiZm1I3ziFmac+KBk9ZUdTuZICaQ==', CAST(N'2024-08-15T18:22:44.3332677' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (85, 1, N'GrIvdjtW0JwPn417rMia1jt60PWoP0AnW/rcCJMJY4I8begq0KmJALNUANSHC8/vGC8ubru1gSrwFqmRE2RMLA==', CAST(N'2024-08-15T18:35:54.6237577' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (86, 2, N'HIFNYIIyLLqDDlL4RCKVeWnWe0dh3kpoDOAMIw1Jt4cJZ9UJYBqGC7eLFC/FxlAeUVWN8BY55LmwCzjiHr1Gkg==', CAST(N'2024-08-15T18:37:38.0069937' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (87, 3, N'S3Zx1bdRTcq7505gUjGR0yKlf5+0JNbG6mgJVknxEoX+G+xyScj25ZjLIfAMG5m8SLX8JCbxD9HkN7BedkSsrA==', CAST(N'2024-08-15T18:45:04.8249457' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (88, 8, N'04yQTUER2gI0Zz5Go7xAgL0dd3+h7GDHXn6pITKO2IlCGKYIj8Rq4QmoajfvaOquXKReZh2uli5YQ/nH1qGh2Q==', CAST(N'2024-08-15T18:46:41.1233483' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (89, 1, N'wCfPNTgeJIxTrv8b7HnveKqdhoxfgZOKrvk4REV98lF6ugL7atLhvhe1wAjQLQ/EBzjIz9ZepDvKSwfu/qI9KQ==', CAST(N'2024-10-24T15:36:27.0817030' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (91, 1, N'8GyrzQ6htuR5iBWXDKcZ//zsuK4oLyQOqBYnRJ3PWh/GUIXs3sYGwmnil+unFHbNzv6BtuY7LH4OwQQ+DhZcTw==', CAST(N'2024-10-24T16:23:18.9138886' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (92, 1, N'ima581ZW8by7rB4ko65DJRXL1dhaL0vTnf6JqD/LJ3wdq0/2s1IYKp4A1PRiZN9pdoOZ5PvadvMSByKwhDmfAw==', CAST(N'2024-11-19T06:12:00.3421671' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (93, 1, N'W0Eflnl+jMit7kcvJhyGiuoTRAl2Fz76V3JUO1VOMjZKfQv2BIr4Ttm7ANCHX7NHKmyIvfEDNMXnxP244m0sHg==', CAST(N'2024-11-20T03:13:19.7678384' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (94, 1, N'lRsJ1iZnkXkJpCyHRPsRuUoOlh6i9MIUr4POJbFgk8hohdB6VdTdkhIMKcdjle9L+R7tS+QlG8sNIjDH8b60MQ==', CAST(N'2024-11-20T03:14:31.0937244' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (95, 1, N'DBYsi17df+8fK3Rbr+dUj+1bpWEgco1gw3MzI11a6TPzqVsqqZPKiAEFvdqXAYHfmy8JW+nU9DUxDN5+rayN+A==', CAST(N'2024-11-20T03:15:36.5820980' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (96, 1, N'uPxw/uWvbY5xMHeV/EnMDYrPOIAMDmRcOsAQrVLffwYO+jiEVQDA58LIKT0LY8HhC9o1HoEsw7IzgBJPCDoEyg==', CAST(N'2024-11-23T13:57:51.5505314' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (97, 1, N'C0v/ETDKEza+wKOdkrtEq6j9jryqvDLaYQQjmPgSUnOC5rkOkqcyfZJmYzmw/xZYgQSjWmO8wnp3soZMFEYDgQ==', CAST(N'2024-11-23T14:16:03.0106336' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (98, 1, N'T42Bws7M+nNCQc9zshnU1LNKO++9uXyGlnmvHmQYhPuDTwfyKXA1GqPNpFEEOJECgN4YL3MZRJJ7CkcuTb3h4A==', CAST(N'2024-11-23T16:38:27.2908564' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (100, 1, N'W8s/+BPnA3M2liiZZpFtELOHyghWTwRtz/S4+IP6X/ctBf/kR/tqJbjFzQVxfmsqiHYf0qwLS0LxPqOfJdrzyg==', CAST(N'2024-11-25T06:49:55.1821989' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (103, 1, N'clR5QghmZ2UTDLFdMvd5HgjyCXF36s0Kk8wK49RPC0mFUkYK9lz2v2eRB8SO+OKWGGegLzQ/6xA29ocQ4G9UGQ==', CAST(N'2024-11-25T08:34:23.0921503' AS DateTime2), 1)
GO
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (104, 3, N'dpoHk0pcQno4Ezt0h/MnP/QhB23Vdc52e6XseufxzYIzE4CC/Ht6/HG07C2ovwPXeRnewdz01Aenep7hw0BRoA==', CAST(N'2024-11-25T08:54:55.3235887' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (105, 1, N'fUxA95X4o7CcNy6hsqeEAQ4tp+1QrX0x1Zbme/8hd5Ij2iyJd5W5kmNrv6wgGEoHHN2f9Hp3bi4IQE3ET3TTRQ==', CAST(N'2024-11-27T20:58:58.3756404' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (108, 13, N'OH3rlb/soeEDnWdSF6zKuRezjpyZ7xpfRtzXEvMrd3AQx5KyLT1ePQU7QpoG4KyLVqqGGensEdMsyE+F44Y6UA==', CAST(N'2024-11-27T21:05:33.8242221' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (109, 13, N'6evRgDbwLpH4Xf9rEKIjwotOnHasgMDsVdpkbDYrMn70gkCxpIL7FX+NNqJ1IuBn/D4+z+OmO64qQWhBAIxogA==', CAST(N'2024-11-27T21:06:49.8657553' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (114, 14, N'xExAE6qW/OlXpazC9njflzImK14MfFynccnVAXx5tDuRzmc/njnkQFPD/2ZB9O4rp+EzW3/4JtPgJnvNdd8k5g==', CAST(N'2024-11-27T21:20:34.0048812' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (118, 14, N'UPQ/aPOpqCmyCn28Fjg6f3TgdNGdYdRiH+nlCp6a4kNdkfYwVsiWEuyetf//vEsEFIbMRU1KFThfHsRxpbVwcQ==', CAST(N'2024-11-27T21:33:58.3163788' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (119, 14, N'8cT8DAOYejArhYwPFylyeijAy+ZqLK+XxRLhSE+tr9f6Th7lj/qXBt0MIugkYIwwdFKiFk1R4OmRD34llS0gRQ==', CAST(N'2024-11-27T21:34:22.9975873' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (120, 1, N'XBTnb6PHGN7UJOB6fY6kgwEzxUjeLCOBu3SKnfKujQt46VWu/fO/rqJ6UJMQHkpGTS3MrHOVAQKpdsnZCP99eQ==', CAST(N'2024-11-29T00:36:08.9513096' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (122, 3, N'GJAawH5pNv5mqodmKWXPTScbjQIP6GyMJnLixPmJVFJsa6jiqx9h4HtTUY62dvOE/FRuiSTNu1j7Id478vruWA==', CAST(N'2024-11-29T00:42:27.3850806' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (123, 1, N'Q1QW7PrJz9ssu754dniDX8grxp/9eqwMMuDgYP8sRc5X0/s2agpKrHzC0fJpMtYlZEitVkSTeWGpgI6vCowNsQ==', CAST(N'2024-11-29T02:18:46.6691601' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (124, 3, N'WgB9g71eH+nezi10uUk5VR/gIyUv25PJVuVv5XQcZktwDOEX09A1KuJp64bfXQ/WkxIi2I5Lvcv7FvGBBIl9Aw==', CAST(N'2024-11-29T02:19:55.9230935' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (126, 14, N'oIDsPl5mGRwiwFxJEFQrz9nBk7Id83v1QMgpOAbhEzz5rLhUdux3VgaISzSzqTkogw8DvYT+S175y7+U8Y9YOg==', CAST(N'2024-11-29T02:21:55.0098070' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (128, 2, N'qCYb2pR44ao4bYDA4BnOCHrjKhb539qd5FCdlm2qzzbv7h16H/kR5yJAjwM05PVs21ycfkFJia59aK4CL6r+1A==', CAST(N'2024-11-29T02:23:40.5015484' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (130, 13, N'X+cBT9TmgnBemlTLbJUCBC0wATAPaYVjmjnVb9oqnUbb+tXizLwlynLHgt1ezGeiNfs7+NUf9yKPHMwIktqaRg==', CAST(N'2024-11-29T02:24:08.8386186' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (131, 1, N'j+wfqkmIU/y0AgxTCTF6Tx/XnskqmyqOQ4nwNPVLIoqqR92RCLLmyA1NRJKp7oAQp+3Yzt32RQ/F8pRglUMepQ==', CAST(N'2024-11-29T10:49:48.5700600' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (132, 3, N'kxAX5ye8o74howaDSb2hjYNJaPpdcFkqXQM4yrDJS4qaAp7Dv4jg9kNMTQWwNHpgqJFdYDexJlRdYZ4qN1/gXw==', CAST(N'2024-11-29T10:50:39.2929482' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (133, 8, N'grUEO7lK0Tvk0wMVFllMBf17ix4YVkIInWudr5G4jJteC9GU+XcpFlbVaYS6eM8TuIsGBPXXdfOHjjExJa+gKg==', CAST(N'2024-11-29T10:51:25.2676589' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (134, 3, N'OJI97fypTG+/jQfFDez8pcxe8TJzImm/ZXnSon4wRLttDVyUJhuEuiOq9hac7NNG21Vd6CeiL3PqBi1CVfFL4g==', CAST(N'2024-11-29T10:52:56.4158935' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (135, 13, N'q0pqmvbPlyWHpVPvgaFztB4rRJOj/bfJm6IjG/iXP8qDY4hFVdfXIzK7w82pk4jQQaqelYFMc/C0B80YXr27Cw==', CAST(N'2024-11-29T10:55:18.1033549' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (136, 1, N'Fhey+bpjKoEbGqbGcCbQvykstMJ+vTULNoHiCyZTH2cBh4GPd1Jx6DqZSnjp7YURiLWZH3J6gbAje16b7RVcxA==', CAST(N'2024-11-29T16:08:00.2097634' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (137, 3, N'enrAWhmhb4hCsFrZ9W8Bd3tFNFvk+PJAOXMtgb0rCBG8JBlXOGqYz61HFzia/N1TsdOFYeCXzOposmENoSvH8A==', CAST(N'2024-11-29T16:13:32.9628608' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (138, 1, N'huPwTWDierpik6Yopk3oJr4HLgcKrM8Ne6ucZ9RfkfzcUBT4UlivGanlhypZj6mM59zqfdvUrL/PZXKHo3YPMQ==', CAST(N'2024-11-29T16:15:10.7481212' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (139, 3, N'enu2ukVCA2IjYcdD0JbzuJ1+GpIUWLhf4gfSKWJIFP0QKFnzX4ybLNQm0gBUVGnuWi/PxMOTHmYRSNdjVVmYyQ==', CAST(N'2024-11-29T16:18:33.5387072' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (140, 13, N'WesYY25u51iNbahx/vNImJ2vc3TgLkIa4DLLkHQbj32OTrKp10fP3UDp4/LEpPeELPAG9pzajSX7qCtwrUPShQ==', CAST(N'2024-11-29T16:20:52.0694723' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (141, 13, N'4f0yBIQZOvVU/YSWVjuAYGchmw/q6RwotbnEkEc9yf9Xfcd+h2ccMt7kheYNecJQ7Sb5FY8EzAGNpLocU9SHCQ==', CAST(N'2024-11-29T16:24:52.6026403' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (142, 1, N'qpwcSH0MgNLpX1QgpUJfhLqa5OX84O+GtoMMJwv69IvqQ5aacUVqiI3ChgZF7V6R5OFaAD3TlLcohBfVnTRrdg==', CAST(N'2024-11-29T18:18:10.8760115' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (143, 8, N'pwNaiU/r1q1gQ6HbQc4a9bTtP29i9aQAV1GZPh99Zf9TjDUTzaBJyz9PvMZam3isQx8G/a4E1kaaBCA4Cuf1Mg==', CAST(N'2024-11-29T18:20:35.4257082' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (144, 3, N'eQ3xOOTXRcdpOeVbZTwVnWsChKDuKD1BxoZbgYlEhUQQfsdYfovAUHCAaNHZt1EKOz/pP4RCtLpcba61tZl6XA==', CAST(N'2024-11-29T18:25:42.5425193' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (145, 1, N'4PbWxmeRWBgywJ7LObpiYhRsnlNAQ81XkySTiha5eWVAolAN3VhcDhiqlMYKu5mAhQgghnRJLh+1zPs16cQtuw==', CAST(N'2024-11-29T18:27:11.2256208' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (146, 3, N'NQnZhCwQZeBUwwSvykHnriauspHKKjocN6RiH3ejoeQdbo4MAuDdyM+olHSYauvupOJgxqly8t0goBc0xg1s1w==', CAST(N'2024-11-29T18:34:52.3521395' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (147, 1, N'ZxdbcsIDO42/JD2J6OqlDUWkxtF8TWy9xUifeTeJb1UYuB7hfpSgb9OIu+6N95BUefqUsYEdeeGHK6i721r3Ug==', CAST(N'2024-11-29T18:53:34.9304039' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (148, 3, N'SWaNXLcnFbCp3GWrAeGMOD1egNH7t8DkSttVZa8gqv21rMwlOehx9IO0FQlLSMU+cqPi5JPyyRDFIkaH/J4usw==', CAST(N'2024-11-29T19:01:16.6332756' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (149, 1, N'YbZ/nG3Uv6wFP2MTpDIhm9Oc6xyVxadrzAP+dkFAnKZkApQXo/Hk+08HLDrvN3icHyQpp9PvHJgxypx5GvKyxQ==', CAST(N'2024-11-29T19:02:22.3536523' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (150, 3, N'9bp/BFLa8W/bnLd4d+vnsd72oN+qD0BMC7n83agtR0ub3TxU/sWdNk0kReK4mIS2WfxBA9opPd5WE0glvRKOTw==', CAST(N'2024-11-29T19:03:19.4506133' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (151, 3, N'zaNPkhicgXPlgM7s5F6suhU5VLJIM1fPHgt/vLSkp3ZTB5Q91zLBeo+i9+hYGMjWUv/9+8qBS2xPoVxgVAZW1A==', CAST(N'2024-11-30T11:51:08.9020943' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (152, 3, N'8JS9FzxJb0WGoPJOhzmY/dWCrjoOSrsFzwvJy+EOx0D75pC772BM0lFNj34epLOuAI8AX2C8d5YZr10CD3QNKw==', CAST(N'2024-11-30T11:51:08.9021074' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (153, 8, N'bitZ8QL3ZEzeGUFm5f6Ttab+Tk7X45YFhYUf7UgoENoIVhx6LvRKszGCQv1e1TQMJRA80MBQ6A60V66Kt+o4cw==', CAST(N'2024-11-30T12:22:26.0183881' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (154, 3, N'IusDUBQaLVsCYx62AVbQ1hm9oh7HVleOY3t0k2vi7ATszYDkTYMlDAqT+uveaalP5Kdv+5tLNZX7OyWfLyjJjA==', CAST(N'2024-11-30T12:24:24.5229211' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (155, 1, N'VkII6KSToe3NwoV7MZCGQhYBdpYdUavpbIHktuvBa2QQ92r35dEVjJq8smz3G5kAVyS1xAk2A6cE9mc+fi90vw==', CAST(N'2024-11-30T12:49:50.9767386' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (156, 1, N'eVhwrbKKOxjADy7dAW0KUtB2QaJfAJwW71iTK8NtYy+qDTPPVikNrS6DJcT8r3cudESarxnR2IFNfxybho0MFQ==', CAST(N'2024-11-30T14:11:15.5255228' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (157, 3, N'Iy4YNj+JiOxURAW4nSEeRdLMAoZ1jeyZrU779P91IBfq3u1Fr6M1rPXJaPWx4+BFfGT5pHgPaJ5cE1xw400yeQ==', CAST(N'2024-11-30T14:12:07.9263013' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (158, 8, N'eW1wlco6/4p7W3Va1hyHlT0JU+rcVtO6suSRsUEvVK9Fiu+rTp1yy16sYFpIRwB+cBD3osWDxz5PXYfKzSnSEg==', CAST(N'2024-11-30T14:13:17.3275301' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (159, 13, N'vBaggDuUHv3pchASE54QIfMAz/17LKm7Vd+N5x6eGKriVScV7XEK5dGF3fH0nomNkpRnMRiWjONULG+skyTb1w==', CAST(N'2024-11-30T14:13:32.7695246' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (160, 3, N'Btya4K2HnVhn2dnUkgnFyKyjqYtWoWiyrOWLcicUOYyNl5MmON/vpUf02hzyt3lF1r/B6EhfdsrDpcNgp0NH5Q==', CAST(N'2024-12-01T11:16:11.5057238' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (161, 3, N't3wF1NPC+K3LBXGgCc7+y9n+xdKB4IRcnHdqrgOYI7ETzLWhKmMnGy1FewCyCYBjzvMiHfE4CwKk+QXsGCzeAQ==', CAST(N'2024-12-01T11:48:10.7885207' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (162, 3, N'GGKA7f30shfM9wNkmCzhaaNpBW/ZaCpllJh6gLac553DVMqkdIPg0OnSzx/K5ly/vP7oG8IV0aCEMRyMZj9K+Q==', CAST(N'2024-12-01T11:55:16.6222881' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (163, 1, N'tNR06SFFn2g5Y6E3k6Dr/B1j1CRx+iWAe3XRacvnouiKkZOARobZYQhWm2CFZsl3F3g7cEEYK84/DgMyJ/cp/g==', CAST(N'2024-12-01T12:06:16.4164264' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (164, 3, N'CdzkyNOsG/+zsNYzhD3VsiOnQx2fRfEqVcLnO/g/R3ugp3vVVUwbQMmgefxjh6rSEKJjlmQkgU8p25XJhxlvDA==', CAST(N'2024-12-01T12:07:08.7114271' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (165, 3, N'G/rOr2ECTpZN8x3B/OdtKxTHwDlU8BPSsm1VDZAmG7gPCL9FaJb2ZhbSElC7K6jypoVRtj9CsincEMa5lxN92w==', CAST(N'2024-12-01T12:12:01.2212015' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (166, 3, N'lXNDV6Ans4a5VbKLh64xAw9T9TFfuuEMqMbhdDMm7fHbH2emV463FVDMwDbOrtFAKVoO5lwrnmB12rb3x5Xg0w==', CAST(N'2024-12-01T12:12:01.2211173' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (167, 3, N'9Id4K+adrkxKwIwcoKaNzfbZpi9iGHzwLUrICuukyzTh8IiqMkfrMCGZH5epySGa6ev2C3ekvQewGTzhPhreig==', CAST(N'2024-12-01T12:12:01.2212160' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (168, 3, N'PILkvMyhCykFHeZdpO1rHusMj1rDZNuVeWdE7kLAmf5Dd63UrfcfafA3P27B8/sR3NKN2ga5DmTih3CJb8AFiQ==', CAST(N'2024-12-01T12:12:30.9542754' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (169, 3, N'sSP7PQ5CdhyXfaPTnwGvgY2DRTey49wu3MQXJ2M7df0HJqKfmUd8lCSQCaIyfeduZLTPj6Cwj1tZoytg2YdpJQ==', CAST(N'2024-12-01T13:23:29.4905227' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (170, 3, N'o1Y0hhWIg6BJy/iJTkNinsThvscFhWvji8HEdoPrCtzI0kbfKYE+LuFqyOIl3CnVcTg5R31GO5kW30A0b9uImg==', CAST(N'2024-12-01T13:50:00.2830491' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (171, 1, N'2Lnb8Jzbp6GYVHOeauan5O8exic3rnAyKPpolG2I0vHhg5r/YoQTrUycOiSW8wdM10sGiizgrxofQ+TtbiJw1w==', CAST(N'2024-12-01T13:50:43.2100549' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (172, 1, N'Mu6WNGbWJVADdbpu4bhA792BGIVKafGiSor6YZDmCdylNKX4Vp+f8XNwoGjCPS2GvbPYJvHD0FqHIuJTVIKjCA==', CAST(N'2024-12-01T14:15:56.5147225' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (173, 1, N'QwD1u1PBJzP/FT3hU9P/RKJj4zGq/f2Lidv5KYkkoKu3QaVu46Ii8k1wPTLe/RCwf5RX65vrColwWW9DvOyIjA==', CAST(N'2024-12-01T17:01:30.8242911' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (174, 3, N'bZh7TxK9lwnDzjb3DWHzZYeWXn4tT27eQhwCdxda+QoFrPmaVUb/akccA1M2pfQU7nDlw0bAMaVtUQleuOhRLg==', CAST(N'2024-12-01T17:01:53.9667380' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (175, 8, N'x2I2M/HPreE6Sxx886IrQApXSZDGFibMKSPBxYrbj67B1oXd7EtqFbdZtm8cn3ldOgz7lP17aKn8NNBTLUUqbQ==', CAST(N'2024-12-01T17:28:58.3254930' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (176, 3, N'TITROfBsbKbcC5Cq2Ohc+Q0CMfmr39aj4/9u5FGfl415NzU3300J429rnMU5G+ymWDCwSCyPL6VBzvD+oBJshw==', CAST(N'2024-12-01T17:30:19.0413859' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (177, 3, N'WlSzveNh5csMQ+gz8igtCsRRih/y89Ti+RNTqnXfjsd7cScfNslEtiGzmReL2fUzLouNjiEhHVKTHQ+uYji/ew==', CAST(N'2024-12-01T17:41:42.0173697' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (178, 3, N'Ng1XY3iSA6kfpgyi7DRoSzAnBkMkkdlNwISZZMPShByqsCrkbnUj5bZ3gtTP3eB+1GQGI/CaW1eOwasgqBvK6g==', CAST(N'2024-12-01T18:21:00.8914135' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (179, 3, N'+Lu7UjDJxE7t1POpO79SDNdOhrFSrBt7JVn+31pYLxbWH79e1qskzsbEwtD1pG/bl6zGoGNOwSHUKiqFZEIFhw==', CAST(N'2024-12-01T18:21:00.8914100' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (180, 3, N'+c1mdFFY/ZXfdH2D8GIP4Hgqra0PjrKhTbEYmxYp++wQB7KB5ifGQpocc1JRAyBJX9IT84jdHZpOz8sDysgyZQ==', CAST(N'2024-12-01T18:21:00.9419258' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (181, 3, N'iRCIRdfhRsWWUXO3+F6/8odeqb3KAKWwgumnkZNdyhZM2ougw5f6vVMKdjbC5J9qY7EwZlloi10Y0UJJD1D7fA==', CAST(N'2024-12-01T18:21:00.8914284' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (182, 3, N'vwlrluhesXuGU3IDVUH6yjaPq4GeaVgVfKa3OhCI9blGJu9fBqX41cU5uxk6paWBSvOjtjiWQwq8++1fYz+qQA==', CAST(N'2024-12-01T18:40:27.0464876' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (183, 3, N'reXGv6GX+5difK3L6xQYHeco3E/AQWeYVTPozZDcu06Y5naRh1BE5/D/aClDxgSG4XWUqSXETY6YCNp/Av+qjg==', CAST(N'2024-12-01T18:52:19.6600795' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (184, 1, N'Eu7U13VR79T96yr/BlCzEQmNK8aDEU0Psa2G5n20FJu6AYHKvVETkaoa8ANwF97n1mIZD461kqdQE7Nh0OoG1w==', CAST(N'2024-12-02T12:01:40.9751706' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (185, 3, N'Dq1gbvx85OY4/grSlthiMcar5BTWaTv/XR9yanF9WLtj7xMEa7k0t1adt0TaTjMWGJR+lzL+FfnV/SjW+v8hcw==', CAST(N'2024-12-02T12:31:48.6721594' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (186, 1, N'XaqYuzVCruPA/dftcFzaZIZ347UGgRi/+h7qO1NoDakJUVMOE7qs/5Z84Qy9ZYZeJNCU4n0Fx1EGQg0TtWoY3Q==', CAST(N'2024-12-02T12:32:05.9780260' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (187, 1, N'FgUNuLdaLrXsU9xhn3zEiW15ixSa8VVf7K2Kv1YJ5yFHGRsh+49zyHi8DqmDvPSDCQGmiFSdUKTuVlTa9kNDuA==', CAST(N'2024-12-02T13:35:42.0423008' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (188, 3, N'mZ1TfhcmuNMHVtOouE+54TQC7erZUT6B3NI3Iv4YCg1qOx+nKC5jRXY1HA+au3Yu9bZER3QO57V8uhDRJrwhzw==', CAST(N'2024-12-02T13:39:43.3176443' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (189, 8, N'IEvW1IXEC1zNPPBeFDxqa1KfHSyTZ3BzJzVAYFPAf4y8Oz9Vw/n+gt7suuwcJ7EQQAHCdIVmnI5emeOKu16zdQ==', CAST(N'2024-12-02T13:41:31.3263841' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (190, 13, N'45ojUIirurJZlueJqIxCgRqmThd6qAwcaP/d7EMsJaaebFDuuiJA8vt4AnT2YPJx2ind3IIoiFoRHCr5DJcBXw==', CAST(N'2024-12-02T13:41:49.8122888' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (191, 1, N'F/D6e4+eTkLqTp8Jwz9es42kTRxz4D1Bmnlqdi2Jb/UvjpIFdv/CxMATQvtGWz5p2StALXL+2zPHOBwwduNVDg==', CAST(N'2024-12-05T16:01:37.0654740' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (192, 8, N'PmsfaP7kp7Ki4xvIVi4fWUDjOB6ReZdQ2vyL0cLXatjHNygFeC84BwGyQYrEJcJCyqbEo2FWDLzF2PiB1qsAKA==', CAST(N'2024-12-05T16:05:58.3795468' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (193, 3, N'SX2oZvcCC9e6GUZZf1pqmMwUIfsy2pZAFC381xgqOmcw3/pnaDQ1/YREhkmAzqWKMS7Uzi86TKo6FDFxQoefig==', CAST(N'2024-12-05T16:08:26.1198941' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (194, 1, N'obUDLGAaU1ojIDRG+Af2V0qyoOHXIoYnLIIgVKEUVCDrnQxcbksjBIhghwN2zU/yXml3n66M2+ota1e1fWLAEg==', CAST(N'2024-12-05T16:09:13.2816407' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (195, 3, N'MkiaaavNZHXfpX3HlV899KO7qz90L14WMomc6fIplFKyjpkdoBStyODA1aEIy+nKXkuHxi7LfwWS8GR0M+AC8Q==', CAST(N'2024-12-05T16:13:32.7890997' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (196, 8, N'JCNKQXVCPC2wHH9Dapl28Z9s1+5KzDbmR6S+nysJCf7XexLIrOPmu9rPtc5BFjaMHFKYLNOvLqG5lPOtzeBANg==', CAST(N'2024-12-05T16:18:46.5468183' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (197, 3, N'5vmnSDJhWr0/ad9o1iZQHbgmv73H4HnJVmSBtzIGWxKJWNQijXsaSMXbPVagUqR0h9+GFq+7ij3PDSaTn5qvKw==', CAST(N'2024-12-05T16:20:18.5248308' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (198, 13, N'1uSZuDWt9UlWkfHCaoEGz8Fvdga+6EYI47qQMNXj5U+kIwyIWFVz71RXhk6oNW8wvoFA1pErFuhnMzdyyOfoSA==', CAST(N'2024-12-05T16:27:31.0726227' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (199, 1, N'jvLz2OIX/KIolND3iyr0JCMg9F3bpmSgjXYzCSOFBtiEW7WoaKlEeqA+VD7PAdaXeJjqjoWXxjkwCAvkZH1i6A==', CAST(N'2024-12-05T17:33:36.0124191' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (200, 3, N'ZUDi6uOp5Czm9rO/z4j79ZKEOlBV4s5QWHztW1YEkXfE+6RrA48um2TE8nAjG1wHN/sDvquTjwS1M290AFjmag==', CAST(N'2024-12-05T17:39:21.5654426' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (201, 8, N'D41ndvwT0JvuKf0lvErBB37PgDIu7nlIXhH4/pkboJD2pcEPiu02Miwqau38TWgBFH3csAVxLVTh0zgevWfUzg==', CAST(N'2024-12-05T17:41:36.8156026' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (202, 13, N'a70vwtZH7ijs2xSKGiOTBmtZTN3R2Tt8TWSfVVhXjlousf7ZlYbAyprLNZmMi7UXNkpYftp6KUMUDS+AsnlBnQ==', CAST(N'2024-12-05T17:42:54.2283589' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (203, 1, N'7J6nlYGE4RRnrnmubpjSoQ9b5UiU/HMkOHgKFHWien79Bt/te//DYObtYyqRJE1KeL1QQJePxqpnHtbzUxRKqQ==', CAST(N'2024-12-05T19:20:01.1941242' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (204, 3, N'Ze6klK+DOdn7eTORAHeXa9TOQ42iFfY+Us6uvi811bmny2n+M/pTgal5bkv+iJztva6cd89nrGeAxr/hMJ4kqw==', CAST(N'2024-12-05T19:27:12.0879795' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (205, 8, N'tqcSIa7+SE1dE/w2BLFCmhf+ONX7CH1ODR+BpPIEVoMrKUnIw23KmYAa/pxNOH8aEdi/R2FD4JV2ql4gDFlyeQ==', CAST(N'2024-12-05T19:37:41.5555204' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (206, 13, N'Ep4U3cMvmOs6LDksw3/oeEfVsEZqio7b5ACyhtpr4ii8iaxJ8+diLp6DE74tBRqOMZSZ/D++ZTL21wZWwTqtEw==', CAST(N'2024-12-05T19:38:57.9975279' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (207, 1, N'nCX2Mvw2J7gP0vXXIvah2bft2c8ABw9NKFVPQu9NwrOaurRSwOoe+m76TwJX5wE6kJHIil4+tbBASQFjfyVhXg==', CAST(N'2024-12-05T20:09:00.1798787' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (208, 3, N'rpIdCdrvALO0YEpJMfK7G/UyPdcRmhzZ7A2WOE3HHDlRwqOuI3WL22u1KVxq9594ACQyPPnykdDU2JDVskLtZw==', CAST(N'2024-12-05T20:10:42.8562710' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (209, 8, N'IR+O2hFwW6JgE8kR3ngaVEiDuamQvCBvjT43ZN1FVjZHhf7GYvX7Pe9xx5++vSbrHR5xgqFd45YO6XDTknO+/Q==', CAST(N'2024-12-05T20:17:08.1209683' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (210, 1, N'jwf+cD0k16YSe2HFV1zopxSEqvvElFD2Ry3BcXmpDiaAlSI/haTcUlDNS8LpprQ4aZnIx2rPRmmfONHYjQ0Jgw==', CAST(N'2024-12-08T03:28:26.1450835' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (211, 1, N'G7gJSgKbYoxsiRGKrbQsnegfixgOQp7+o+yBd2xJUqBaOkNSz52IEY35QuhonXJxgpJEbuIVDTIxvNqadXHIFQ==', CAST(N'2024-12-08T04:12:03.8156115' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (212, 1, N'IfEzSFHMdb39zD/XRrS8hgomGS0OeQdaKl282nLrtqW51uB845S2D3wMniD0k0imY/n6YF3yamadY+DPzLaTCA==', CAST(N'2024-12-08T04:38:23.2563500' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (213, 3, N'PMVZD5Lo4fpJkXFUDmSy9aEOp5qsXjFEY5vN/JjFRFUNhwJDW21DS62yqVtYBjDKAiQ444Xd7lOyFQmXr0y+6g==', CAST(N'2024-12-09T01:29:30.7078554' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (214, 3, N'Tovb+ZzNuPxpVaIdc+XUNsf66tEGIw2ICea5lYMwlrMNImZCYV6rLV579MvjGiiBedEHRjKIUpwp8u6qecp08g==', CAST(N'2024-12-09T01:29:30.7078405' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (215, 1, N'/7+5wLVO92Ow10KNWeCnEK6vxqyvkzgrFOg9EOd/fyQ7p/norjLlvS2Y6WvsAeQ2sJWPTV9dd5/ESaZTTrMmxA==', CAST(N'2024-12-13T00:46:43.4642548' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (216, 3, N'roWohmdZCrxE98pVTEMeGQfeWwL0u1zfijUCmV4bp48aSpXLHmqi1+AUwnnKlqFon5upWe8pgODezHMCQbfXuA==', CAST(N'2024-12-13T00:54:01.9312833' AS DateTime2), 1)
GO
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (217, 8, N'Su3nHqs1LAE3R1/Ak2KA4vfQ3BmBwJu8e+fBDknAmjkqTTzV2o+bWBOW1z2Q6JUWXFnbKf+Wr3W2d0dcu20dOg==', CAST(N'2024-12-13T00:59:47.9708150' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (218, 3, N'WBBY8HTA+87omSHEIRnjtKAQsp4r2fcuX1etXjf5941b1qsOuVNqFKgUUYqddFDEUc2uIf8mpVXMa/WL7N5XLg==', CAST(N'2024-12-13T01:01:52.3849659' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (219, 1, N'vSuJBSeR8iwQ37vY47VpmvL7qKJSvFMvZBHDvEDQVHJglOQU8lWx6IPNavf6gr939YdPwCt6lQ5QqBnrndzbUg==', CAST(N'2024-12-13T01:10:25.8719803' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (220, 3, N'W02dK7UttzTc+fy/QZuMw7kip1FFVl0K1nMn1osGWHIMAdf9Y7eRKHecD0hTPzJwGYd9yGRfJnqA2c2ZNOcOKQ==', CAST(N'2024-12-13T01:14:04.5301648' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (221, 13, N'dBtjta89gCjqRS5qu0OtrZjPYbatOcofT0G5p5hnVY8BNOAaz30vuDvd3FpxECBM7RFdL63q3Ae93dqdvEKqpA==', CAST(N'2024-12-13T01:19:26.6665074' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (222, 1, N'PEklwAaBh+yk9aayVw9Obw8BC4mFkEChKqAO7oi6yfHJ8eh12ys4G+i8AfBLiYr4HaznAQTv35st3Qi8BhEPBg==', CAST(N'2024-12-13T01:53:48.5927302' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (223, 13, N'le+z9rsKCUD+DbXe1Q42PUUG0eFIkTjW/87g1Dh+zomt67AK/DPpOhLRVCNwt4g3q5AsVi5CT4+nmCFEIOoJDw==', CAST(N'2024-12-13T02:02:53.6318501' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (224, 1, N'vsnZgNtTKDt4CfxfV3JTGcah4LJmoZJNqe4RJ6j1amONSrH4rG+U2AUoq9t9pQDobl4bDqQIc8Tv06KObQ4xbA==', CAST(N'2024-12-13T02:05:52.9296694' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (225, 3, N'QatcaczrVr2EWRdjqxgF7iIzUzaFL0JR91u0mtUSoPc+tImMGPk/bWkKYOFcTAAg33phSEEL6846T59zJJei8A==', CAST(N'2024-12-13T02:08:04.1119064' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (226, 8, N'FoQXqyXek9Y6x+IwQfy0qU+qHJ+QzdLflWrkeJvRP4Ly74BLGsMt6LECb3q99k9ejHzpfWieXB9SacOaXgwP9w==', CAST(N'2024-12-13T02:10:23.1987613' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (227, 3, N'NTAWP8qPJRLwq1Xcwvmzhxu9nTFpQS3Q7yhZZgy+dpHr2NEfzUw+9TYU3dULw6wwdXtf0ttVCtUnX4EiXtVCqg==', CAST(N'2024-12-13T02:12:14.9011232' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (228, 13, N'ez7ryf6tkRJdo4mIVMis2/REuRqyLN4xBDTsqCchXQAzZP0w8ZyEMZDNTlsWmYVuN4TE0lgLD8aSl0GLWQsllQ==', CAST(N'2024-12-13T02:16:19.9828429' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (229, 1, N'ZTN7XK4Fz3wEUJ20A5yRkPur0M8LnhfokmzwZjGOddx8178s1E/MGiDiTG23jWPlQpIlzSkYjFczXX0KYwJBKg==', CAST(N'2024-12-16T03:41:38.4126828' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (230, 1, N'Z+K4dNVLQ6ZNibdZFu+gyEk9oxhc6JRyrPKKXPg0578OavYp6lYh3psSXO3IsXSX/N2QEGkBSTh43vXeC9tWbA==', CAST(N'2024-12-16T04:15:57.5232773' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (231, 13, N'86rDnOexpxum+x6mB6vu5Pf21vDKEpc8vP4zCVLQzgYK229RwK+rPQZqQR+OqT2mffCkfWk2Y5oeXep6Ud12mA==', CAST(N'2024-12-16T04:16:32.1850076' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (232, 3, N'VnumY3TzDG3YR+AIx9ySshqUtq9wcM9NoWn75nHEUn26zeOFiv6HEnJq1jGRrl7MxWRwiazFjHnixN2JzkBNOw==', CAST(N'2024-12-16T04:22:15.1251570' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (233, 1, N'hpHY4Ul6Id18vocjhgRxVoEPenv5dNszoYmhJeri0EZWlyPoZsJPNxSAALwD/YdxXrzwPV62AtzpdQEwSy/AdA==', CAST(N'2024-12-16T04:25:45.5335695' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (234, 8, N'QgWlzhu9AK7Lbh9pE1KqeLzCaPW45kS5BGk7Fc7+GVAHc7wNYNH86jhhLTs8ea0c6cZ5Tj987Yi0jPQXpGom8Q==', CAST(N'2024-12-16T04:38:09.0381373' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (235, 3, N'fG/mHjren07R/EcelnFEz5jwP8yfXYL/AJr3VZ86Ph+3/pKDfKVA7w8u8TdNib+WHkSGcFwOb+AUqTbj2bEJjA==', CAST(N'2024-12-16T04:38:49.2065199' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (236, 1, N'wNgue/dsLpjh0cQ5RDdjRXMLXHyAKvGdnGH6LcCUAg9eklGZRt426dGZMWG7aH2p9g2eWIZ1QideRkLUmH5RPw==', CAST(N'2024-12-16T04:40:38.5398387' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (237, 8, N'ry1h0W7l2fnrNwVrJccMhtwz5D7+aOiXNDhX5k/j+v61gPlTaCwMFUCKIwHJFbKw1QGhwHdGZHiiVrfR/+hRRQ==', CAST(N'2024-12-16T04:40:50.4869031' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (238, 3, N'VhY60AzLRnn4DB709nCvUlUJOf4dCgIWVoE5jNx/qUPKub8S+ewbcmFsts3cAJMmAxL3+yNlQHW9E/P6gAChdQ==', CAST(N'2024-12-16T04:51:58.2275158' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (239, 3, N'5ilNGeOgIl37EDE45QPJqZMtgNQZJPczQgPfbYBd/pk0oq6RtVzKu4BBhbuRFSkMLaC91bm07vLASfB8h2yg5g==', CAST(N'2024-12-16T06:28:14.6269782' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (240, 3, N'yl19zB/Hm6+zVuBB5TynS4e67/yYRzMCM5CI6C2/LcUNZaBE3OevYD8pxPvx8wuZRGtxHfhB1QZjl/TWW3RNqw==', CAST(N'2024-12-16T08:11:15.2469598' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (241, 1, N'r/erYJH19HjV/XXoAYeyqowtzZTdHo3AQ41IIl5HBT4ZMp6L1122Lanc2HqsuBSv0/sMFeahgDtobfrNVX9WcQ==', CAST(N'2024-12-16T14:14:34.0667474' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (242, 3, N'O87HOHAFVYGNcrNWZWZbrlTM3OytUaVcfH6qRn2TFuosNlvm0R9JgZyAj8Q5xd+pFwkIAnaYX3U0MmN6ckLOCg==', CAST(N'2024-12-16T14:18:22.1601755' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (243, 1, N'XwYKw+3/dMRzE+p7wWwpFTjyNvldFS0C2PSv2oPkN6ycnwm1BkA0vHqeUJpLnPeEy5lzrg1403nsYL+gP4t1cQ==', CAST(N'2024-12-16T14:19:27.1028390' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (244, 3, N'ZwkRWHxxXb6RocFybdoH5kYJsdIrKvM2hN+SwbU3L3P0EuVXNrjCGxNNSemkF0k+NhOX4sbuLuSHsRrOI7x3qQ==', CAST(N'2024-12-16T14:21:31.0387757' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (245, 8, N'T9vrhozd1Kvb9A9jyuZ9NhI8p6q7uOcFGZuzDa91VzBghANq9/QSKSaqMwXQ4yL5C9F8j0H0iOjaZNThHfVrnA==', CAST(N'2024-12-16T14:22:52.0089857' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (246, 3, N'E7CQBzTS4gEsuG8pDQFGW21g9IzsSLVWCz0O5gdliWucCu/tDdyUYXUZrw3yXslkIKBibrtGVP7DSyEXFaVR5A==', CAST(N'2024-12-16T14:24:35.4864855' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (247, 13, N'DlyG1yIuqP8CUb7fI68wr9q5TcCmJai7fW5hJpuDa46Jkt8CQF3eUBhnRQ4Ot0sAB80Vo/cPVRgZKopuaPKtgg==', CAST(N'2024-12-16T14:37:05.3680836' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (248, 1, N'8OSKK15i9e7A+r0JzvfE2sXWEmoPYSst2RShABntAoTpdLE25Fk2bl08tu8u1+M9WPPmMjzBzAjUtT4QmimZFw==', CAST(N'2024-12-16T16:21:05.3578832' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (249, 1, N'xT8PTRvk3I7aK7ovqq7JR42Wwf13hv2vP58GXzxVZEjgtSIMmFlsJyhxHDzC9wTcdHCTxhZCPhfOxE0KKIA5+w==', CAST(N'2024-12-16T16:26:08.0169945' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (250, 3, N'14bYNYtWl9LG/w2h+SIqMVLZY9LdqDOwKFR9hDXVJ8gruaCr8HMDGPsMZBLAh94DlYNu0xKtPJaYrpDAy4xgQw==', CAST(N'2024-12-16T16:32:53.7589477' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (251, 8, N'YSwsriXq6JaWpYsPL58ODPguXHaES1DQLo/ivgSbij1zgMuFxiWNVZq9QDLyl+uWUAUIUBdMF2eWeunV+vc9cA==', CAST(N'2024-12-16T16:36:42.6010480' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (252, 3, N'KDpmf4ddCD9mwGbSqHjHrsUWdkqTUV3VotevtyKMnSpS+i3NbZpCnE0IQpQElPpxm0k4ez9C3KBMlZy95wE4fQ==', CAST(N'2024-12-16T16:38:34.0846371' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (253, 13, N'+9jcrXYsKC7AWQNnJDto3Yutd9PfBqleDFQxKt32KS6EcoVFqIHWV+v7k4InOrG2FVNXfi/F/91Q17AEoWeV1A==', CAST(N'2024-12-16T16:40:28.8028278' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (254, 1, N'ATjQjQxgNR3Ws9xxH67LECxSRxA/ozobp6xLP4jaZ1hNRTBszG+gL/4yTDj99vFgElwUIKzOIrOVDLxYMndLhg==', CAST(N'2024-12-17T23:09:26.7455888' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (255, 3, N'zQEy7Ao0SgitsOpouR3Z73bOtyLr/aSGlbRFzTyfoxiaVsCzcSn7khThX5HSYr4/AnjweTK3TliE+jc43ucTaQ==', CAST(N'2024-12-17T23:10:44.7630024' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (256, 13, N'+EzG597fFqKMXT9YcVLS2P3iFsBcKuwenlfJeaR+Xy4GL58Y+J60PChjo+UM9IosLv4WcWpExmsL36+hqvq6aQ==', CAST(N'2024-12-17T23:12:30.2687808' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (257, 1, N'mABP8tJ9t9d8l8GUg+Bv9U16YfMplxt6+PWa4oY+qIunpxIeKkVKrMhGwNFK70jah3SiXLiY6g6ZAPHjdJbQwg==', CAST(N'2024-12-18T21:04:26.5727625' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (258, 1, N'lcLo32604PXSKY8yjLjnsZoTZjktjX24/almntG06VfrDvlHY0HfSRQw0ZulM+Jvkb3P/+3oQhloHqE3ZfECBw==', CAST(N'2024-12-18T21:07:45.8531135' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (259, 1, N'BWj9Sh/sGw6JyNvfFgjnOvwW5gcYHgDq0graXXPPwKDQudPyWGXRPbAjPeBICsz+lpbl+F+ojaTwlM9AFgjbMw==', CAST(N'2024-12-18T21:12:52.7082695' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (260, 1, N'v7AMhog6/YGXaToes5tdIKHlJo4qQHBthdWi4ypK2drTodNOWUwGE+VkrWj9Cv1iXtiKLL/Hc3FHO81ezfgG0w==', CAST(N'2024-12-18T21:14:32.7103583' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (261, 1, N'GUgs4dFM6GdDRJPAhRd+Kwrlcoyv32ZIR2JDY2E5Tl8njauS9z0TmUZ6PJhKFl+KtjshORUTgFEPtDNA7hybkA==', CAST(N'2024-12-18T22:17:13.2973283' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (262, 1, N'zGPWb5I9CS6NmYuieQRal1SN8a0eCSKMNyIQHXdknnjlfAzOVyQQIYo5jU4B9R+Wwj6cyqKd50PTVc7ELu4OBw==', CAST(N'2024-12-18T23:22:31.4065048' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (263, 3, N'JkHK9KedJpUZLVdDW1NF/VsZ6Qa3Nm8wYex31+SFWmZO0vKYLFmYBUKja9UrAIHeJI0Ow6wcJtB54vDlK8Yv8Q==', CAST(N'2024-12-19T02:58:50.0135668' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (264, 3, N'gl3T/6NK2MP+y8aaSA3EB1VrNh9AqyDBioL7N/dfuARluCLVLZp6c9KrU0vljgYfcZ1WfeM9U9nmaguONJ5MFw==', CAST(N'2024-12-19T06:06:22.7821628' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (265, 1, N'2JBAQwqQ3t8CRDnbo7xxQNuRuepjYXW5YG/TS2rHMusVB44yAsmdLFySx1ellQIaunJCxqwag8cK/YTcDu58gQ==', CAST(N'2024-12-19T06:08:15.9302266' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (266, 3, N'3iEkzZBjOKhzBEkpNHRbzoi03yaVzwk/BHgulFI1ii2cx/xatFvSlQ5RI0ke7mHTYbQhiet4BaWWqr4Nc5vJmQ==', CAST(N'2024-12-19T06:27:05.8926753' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (267, 3, N'8+xXvRo3EjbAwm8TxmikSh7LNvwPhaAavaw/bOwRjSBxV4oBJlc97u7ntgdbwCraU+tkV/B80Qe1YCtpWrdfXQ==', CAST(N'2024-12-19T07:30:46.8307408' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (268, 1, N'mD/QUbVWN7BRSv23HHKybIZgZmGXRl+vUpOKLCTSZ1pEmWkuzOKLn93h9yge9WkOjMFJXM7/C6lcTNGIz01JtA==', CAST(N'2024-12-19T08:06:38.5778459' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (269, 8, N'5RdqwEjLaEAgD6SLzTcaPc5bYZniC0xVgHZlVzIelC9LK3uRmapaVzE0OcyAskQUjhOG92b90qy2SJJ5qFmB3w==', CAST(N'2024-12-20T01:54:39.7454493' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (270, 3, N'tpWJ0JUeAjwCbUeji8/GqygiL6KqAx+cG0jiThL6np9g/4ckc5MmoTcVBBf7GBuGktIF+jqYtc0+D74al3WKkA==', CAST(N'2024-12-20T01:56:33.3272278' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (271, 1, N'DmXGEo7y1zmBdl6xLSD/bHoTSMrpwyVv7eD9G5HxRc/RBxJbH3GIKvrsh/kGXKZo4TBB83vXampMEnXGM9tOaQ==', CAST(N'2024-12-20T01:58:24.2472839' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (272, 13, N'2a2vGTnOB5500QaJ3eAgRIglGnOM4w3Cd3Drk98pbnMJfBWVL08/WxJ0y9zUc36UgggC7S5/dy4wvDK8KCvbBA==', CAST(N'2024-12-20T03:56:55.8716369' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (273, 13, N'NvLw4JFDyqHH78fOlCkUm0l1NR+X6ElbpIDfIoSRNUzO+a5zBVbvGGPR88hbwMWud9PLeUD711HQ/opIPF08Pg==', CAST(N'2024-12-20T03:56:56.9456005' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (274, 1, N'KdtWb6U6gysqVY+b5LXAooRW5n7bo4yG3RNEcl85jmmlCqh9nuhZXYURci6ZQVnOiQE8YCyBin/ODLgd5972fw==', CAST(N'2024-12-20T03:57:16.0464261' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (275, 13, N'40UPSmMW5PatLpcZWl2Ph68h12D5bT7ydtnsVqFuLLlOl+ESIRY/YB86HRTJWlsOHmjTMWcEQUseDxp5wu/8IQ==', CAST(N'2024-12-20T04:02:11.4190584' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (276, 13, N'UIItNYIf5fwkjj1SfHP6ZuF9nUfPzmsctBFs2r5tP8umu3ax+G8EsjGQtdalcZCZJKLJ95sFrAIaBioHMk9v3A==', CAST(N'2024-12-20T04:03:56.3329866' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (277, 1, N'v/IwJ/w/hKdWz0Sn8xl7RDXSNx21Yis7PTf8zoOOTYZ0127GDzRmOvToFt+rRznHS2+gO9U3g5ssApmQKOtoqQ==', CAST(N'2024-12-20T05:18:55.7773331' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (278, 1, N'V82X1GgIA2V1b+tqPyUD+s/+yOGjvQcFWRuJTcjkpAKMMLOeMxL9Ljaa+CkQ6sLtJnIfkEgO34hSHCrYpKNwOg==', CAST(N'2024-12-20T05:18:55.7773205' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (279, 3, N'maB/SFonV4QmeImNvxlNgNaj+B6EX/3CHgBz3qy5m9hHRGGy57SM46nOUSAwrRNxAAZ2zxBrI0TusolO31vpBg==', CAST(N'2024-12-20T05:23:38.5132573' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (280, 1, N'61udKoqTqrIQ07OSIIGEE7MbfsDv4QoXStxjT+CBSql4rAKvqP7Z1Sq8WS2uSwvLacgYA+4UtXOC0fvaK0I1gA==', CAST(N'2024-12-20T05:23:47.3979925' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (281, 1, N'w9rfGG5YRAm72naCUZKWd85pnOfNiTr1cKuWc5Yrlc9Yj/5YMJNi7sNtmS7F6fD9bpjrYQf59LKFP5YCYjJf2A==', CAST(N'2024-12-20T07:15:11.4742950' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (282, 1, N'ToCYw9CDKpzlgDmC6PEQLQ7gTuzxHJwVFumHexFV1tGNutO3BunqLBD0w0jCxonXF+VjjETVYlfEyqGSd4UWaQ==', CAST(N'2024-12-20T07:51:36.4801255' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (283, 3, N'hvmi2CXBjrqtxV+AIh/k/tDBRnjwg4lauesmCqNBrPl5OPcGcIFpfrJvG7cTZeiMXsYqZ0o1WWYa8hAnE3qQ5g==', CAST(N'2024-12-20T08:36:14.9885625' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (284, 1, N'fE7fAZDJRML8726xflXHqI4RqsRUcsJhd+/GLrfiirPE+3lMA3Ht6kzQLQvW8/D7H53DApOZDiqH7ofvqd1S7A==', CAST(N'2024-12-20T08:43:40.4436651' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (285, 1, N'LVK30NASd1/xl8/lHvZHJwqC2Cehy1Ynj88G2/JDGoJrDodQ2PKoXh+ap9jw2ZlHvNbylAlOM6vUx7EjACHcFg==', CAST(N'2024-12-20T08:49:17.1535895' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (286, 1, N'uRpO5TRVGNGYY/CjJr8rmmLks3tzhJCcUEr3ESalgSz03wxHPjhWhZgc1k+0K2YB5Zp4rNEfK7ecPFuXh+LbyA==', CAST(N'2024-12-20T09:09:49.1276534' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (287, 1, N'aFNHh2ihSrn25Sr+IXOqGwvI+zgv4eDwWkvmn7cCfF5ADYIsmoaMyj/KDy7YIGMB7BlWrGFQOvQgizUlEuUSNg==', CAST(N'2024-12-20T09:34:22.1815173' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (288, 1, N'9HDcEye+yHncfMwpS1AttTm2FGSCIQLORhYDgUQ2bmKfk7S64mYnPEgVqXkAAFaON+/MPc5vEIHGKk7NKcrtHQ==', CAST(N'2024-12-20T09:39:35.4590626' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (289, 3, N'QsyM/jhIoHkZBcRjFRNPO3X9vB3bN50Z3dnWgQLwswlWq6j5OK0K5mxB00qJyd/YOv+0ZYU4S3jwstprpVbMJg==', CAST(N'2024-12-20T09:41:37.6035935' AS DateTime2), 1)
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryTime], [IsActive]) VALUES (290, 1, N'a3P/oedx+GvJZ5Cs+HbJm+t2r1NgpIZvuRJy8NwHo2qUh+cmpflnBarjUGnVlgnKTEJ8uC0XyOqNG2/FgRYVTQ==', CAST(N'2024-12-21T02:12:19.8267233' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[RefreshTokens] OFF
GO
SET IDENTITY_INSERT [dbo].[ResourceForPrintJobs] ON 

INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (1, 1, 1, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (2, 1, 4, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (3, 2, 5, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (4, 2, 6, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (5, 1, 7, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (6, 3, 5, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (7, 1, 8, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (10, 1, 11, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (11, 14, 18, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (12, 15, 21, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (13, 16, 22, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (14, 17, 22, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (20, 21, 25, 1)
INSERT [dbo].[ResourceForPrintJobs] ([Id], [ResourcePropertyDetailId], [PrintJobId], [IsActive]) VALUES (21, 22, 25, 1)
SET IDENTITY_INSERT [dbo].[ResourceForPrintJobs] OFF
GO
SET IDENTITY_INSERT [dbo].[ResourceProperties] ON 

INSERT [dbo].[ResourceProperties] ([Id], [ResourcePropertyName], [ResourceId], [Quantity], [IsActive]) VALUES (1, N'Giay A4 Trang', 1, 327, 1)
INSERT [dbo].[ResourceProperties] ([Id], [ResourcePropertyName], [ResourceId], [Quantity], [IsActive]) VALUES (3, N'Muc Do', 7, 5, 1)
INSERT [dbo].[ResourceProperties] ([Id], [ResourcePropertyName], [ResourceId], [Quantity], [IsActive]) VALUES (4, N'Muc Den', 7, 98, 1)
INSERT [dbo].[ResourceProperties] ([Id], [ResourcePropertyName], [ResourceId], [Quantity], [IsActive]) VALUES (5, N'Giay A3', 1, 250, 1)
INSERT [dbo].[ResourceProperties] ([Id], [ResourcePropertyName], [ResourceId], [Quantity], [IsActive]) VALUES (6, N'Giay A0', 1, 130, 1)
INSERT [dbo].[ResourceProperties] ([Id], [ResourcePropertyName], [ResourceId], [Quantity], [IsActive]) VALUES (7, N'Muc xanh', 7, 225, 1)
INSERT [dbo].[ResourceProperties] ([Id], [ResourcePropertyName], [ResourceId], [Quantity], [IsActive]) VALUES (9, N'Muc tim', 7, 100, 1)
SET IDENTITY_INSERT [dbo].[ResourceProperties] OFF
GO
SET IDENTITY_INSERT [dbo].[ResourcePropertyDetail] ON 

INSERT [dbo].[ResourcePropertyDetail] ([Id], [PropertyId], [PropertyDetailName], [Price], [Quantity], [IsActive]) VALUES (1, 1, N'Giay A4 trang', 500, 10, 1)
INSERT [dbo].[ResourcePropertyDetail] ([Id], [PropertyId], [PropertyDetailName], [Price], [Quantity], [IsActive]) VALUES (2, 3, N'May in cho project', 10000, 0, 1)
INSERT [dbo].[ResourcePropertyDetail] ([Id], [PropertyId], [PropertyDetailName], [Price], [Quantity], [IsActive]) VALUES (3, 4, N'Muc in cho project', 30000, 2, 1)
INSERT [dbo].[ResourcePropertyDetail] ([Id], [PropertyId], [PropertyDetailName], [Price], [Quantity], [IsActive]) VALUES (14, 1, N'Giay A4 cho project', 15, 20, 1)
INSERT [dbo].[ResourcePropertyDetail] ([Id], [PropertyId], [PropertyDetailName], [Price], [Quantity], [IsActive]) VALUES (15, 5, N'Giay A3 cho project 11', 15, 50, 1)
INSERT [dbo].[ResourcePropertyDetail] ([Id], [PropertyId], [PropertyDetailName], [Price], [Quantity], [IsActive]) VALUES (16, 6, N'Giay A0 cho du an 12', 15, 20, 1)
INSERT [dbo].[ResourcePropertyDetail] ([Id], [PropertyId], [PropertyDetailName], [Price], [Quantity], [IsActive]) VALUES (17, 3, N'Muc do cho du an 12', 10, 5, 1)
INSERT [dbo].[ResourcePropertyDetail] ([Id], [PropertyId], [PropertyDetailName], [Price], [Quantity], [IsActive]) VALUES (20, 7, N'Muc tim cho project 14', 15, 25, 1)
INSERT [dbo].[ResourcePropertyDetail] ([Id], [PropertyId], [PropertyDetailName], [Price], [Quantity], [IsActive]) VALUES (21, 1, N'Giay A4 cho project 15', 10, 3, 1)
INSERT [dbo].[ResourcePropertyDetail] ([Id], [PropertyId], [PropertyDetailName], [Price], [Quantity], [IsActive]) VALUES (22, 4, N'Muc den cho project 15', 15, 2, 1)
SET IDENTITY_INSERT [dbo].[ResourcePropertyDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Resources] ON 

INSERT [dbo].[Resources] ([Id], [ResourceName], [Image], [ResourceType], [AvailableQuantity], [ResourceStatus], [IsActive]) VALUES (1, N'Giay', N'D:/img/paperA4', N'Giay', 1787, N'SanSangSuDung', 1)
INSERT [dbo].[Resources] ([Id], [ResourceName], [Image], [ResourceType], [AvailableQuantity], [ResourceStatus], [IsActive]) VALUES (6, N'MayIn', N'img/mayin', N'MayIn', 100, N'SanSangSuDung', 1)
INSERT [dbo].[Resources] ([Id], [ResourceName], [Image], [ResourceType], [AvailableQuantity], [ResourceStatus], [IsActive]) VALUES (7, N'Muc', N'img/mucinden', N'Muc', 948, N'SanSangSuDung', 1)
INSERT [dbo].[Resources] ([Id], [ResourceName], [Image], [ResourceType], [AvailableQuantity], [ResourceStatus], [IsActive]) VALUES (10, N'MayIn2', N'', N'MayIn', 2, N'SanSangSuDung', 1)
SET IDENTITY_INSERT [dbo].[Resources] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleCode], [RoleName], [IsActive]) VALUES (1, N'Admin', N'Admin', 1)
INSERT [dbo].[Roles] ([Id], [RoleCode], [RoleName], [IsActive]) VALUES (2, N'User', N'User', 1)
INSERT [dbo].[Roles] ([Id], [RoleCode], [RoleName], [IsActive]) VALUES (3, N'Employee', N'Employee', 1)
INSERT [dbo].[Roles] ([Id], [RoleCode], [RoleName], [IsActive]) VALUES (4, N'Designer', N'Designer', 1)
INSERT [dbo].[Roles] ([Id], [RoleCode], [RoleName], [IsActive]) VALUES (5, N'Shipper', N'Shipper', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingMethods] ON 

INSERT [dbo].[ShippingMethods] ([Id], [ShippingMethodName], [IsActive]) VALUES (1, N'ChuyenPhatNhanh', 1)
INSERT [dbo].[ShippingMethods] ([Id], [ShippingMethodName], [IsActive]) VALUES (2, N'ChuyenPhatQuaBuuDien', 1)
SET IDENTITY_INSERT [dbo].[ShippingMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Name], [Description], [NumberOfMember], [CreateTime], [UpdateTime], [ManagerId], [IsActive]) VALUES (1, N'Design', N'Team design', 1, CAST(N'2024-07-30T22:56:29.7884030' AS DateTime2), CAST(N'2024-07-30T22:56:29.7884363' AS DateTime2), 2, 1)
INSERT [dbo].[Teams] ([Id], [Name], [Description], [NumberOfMember], [CreateTime], [UpdateTime], [ManagerId], [IsActive]) VALUES (2, N'Sales', N'Team sales', 2, CAST(N'2024-07-30T22:56:46.8673727' AS DateTime2), CAST(N'2024-07-30T22:56:46.8673745' AS DateTime2), 2, 1)
INSERT [dbo].[Teams] ([Id], [Name], [Description], [NumberOfMember], [CreateTime], [UpdateTime], [ManagerId], [IsActive]) VALUES (3, N'Shipping', N'Team shippers', 3, CAST(N'2024-08-01T02:30:09.0895522' AS DateTime2), CAST(N'2024-12-16T07:19:50.1219393' AS DateTime2), 13, 1)
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Password], [FullName], [DateOfBirth], [Avatar], [Email], [CreateTime], [UpdateTime], [PhoneNumber], [TeamId], [IsActive]) VALUES (1, N'admin', N'$2a$11$/ybfV7nk.oYKLkoFOViRmuKL2dRer71iVNL64/dD5Szd5lcRG.tgO', N'tqh', CAST(N'2000-07-30T15:50:06.1450000' AS DateTime2), N'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg', N'tqhung272@gmail.com', CAST(N'2024-07-30T22:51:00.5470541' AS DateTime2), NULL, N'0987654321', 1, 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FullName], [DateOfBirth], [Avatar], [Email], [CreateTime], [UpdateTime], [PhoneNumber], [TeamId], [IsActive]) VALUES (2, N'teamplayer', N'$2a$11$qsC4wR18hNI4.QpQQJTarOHj4D80xI7dJijPL/LmuykX4UN8p67x.', N'tqhung', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg', N'aallucard272@gmail.com', CAST(N'2024-07-30T22:53:29.4978626' AS DateTime2), CAST(N'2024-12-19T18:34:49.5659209' AS DateTime2), N'0987654322', 2, 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FullName], [DateOfBirth], [Avatar], [Email], [CreateTime], [UpdateTime], [PhoneNumber], [TeamId], [IsActive]) VALUES (3, N'employee', N'$2a$11$1RHc9kGMsAB4ucEc5ilmcufgrboJIVWDE3mZ9n5PlI1KeOKQJm4Cy', N'tqh', CAST(N'2002-07-31T19:25:49.9480000' AS DateTime2), N'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg', N'getmyklee@gmail.com', CAST(N'2024-08-01T02:26:59.5338593' AS DateTime2), NULL, N'0987654323', 2, 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FullName], [DateOfBirth], [Avatar], [Email], [CreateTime], [UpdateTime], [PhoneNumber], [TeamId], [IsActive]) VALUES (8, N'designer', N'$2a$11$pO1lLpxFs7hzELRbDwMKdODcLvTtghIuPWXvCLmifwQ7GJHmp04eO', N'tqh', CAST(N'2000-08-01T00:49:09.5200000' AS DateTime2), N'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg', N'mockdascreamingdog@gmail.com', CAST(N'2024-08-01T07:49:54.2121671' AS DateTime2), NULL, N'0987654324', 1, 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FullName], [DateOfBirth], [Avatar], [Email], [CreateTime], [UpdateTime], [PhoneNumber], [TeamId], [IsActive]) VALUES (13, N'shipper1', N'$2a$11$upz5Z99PvQKAsI45BScgPu5I0CTlJx4gzaiFugfx3wBLkte5DzaG6', N'tqh', CAST(N'2004-11-23T00:07:41.9240000' AS DateTime2), N'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg', N'gltdacc1@gmail.com', CAST(N'2024-11-23T07:08:44.8809188' AS DateTime2), NULL, N'0987698722', 3, 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FullName], [DateOfBirth], [Avatar], [Email], [CreateTime], [UpdateTime], [PhoneNumber], [TeamId], [IsActive]) VALUES (14, N'shipper2', N'$2a$11$9MlU219fZZNyIM0cx4FQZu6x.NGhDrUfgiGrI//YdYLKsu7ItYMCm', N'long', CAST(N'2004-11-23T00:13:54.6540000' AS DateTime2), N'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg', N'longs2e.x.o@gmail.com', CAST(N'2024-11-23T07:15:15.9197881' AS DateTime2), NULL, N'0987654786', 3, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Teams] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [ManagerId]
GO
ALTER TABLE [dbo].[ConfirmEmails]  WITH CHECK ADD  CONSTRAINT [FK_ConfirmEmails_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConfirmEmails] CHECK CONSTRAINT [FK_ConfirmEmails_Users_UserId]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_Projects_ProjectId]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_ShippingMethods_ShippingMethodId] FOREIGN KEY([ShippingMethodId])
REFERENCES [dbo].[ShippingMethods] ([Id])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_ShippingMethods_ShippingMethodId]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_Users_DeliverId] FOREIGN KEY([DeliverId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_Users_DeliverId]
GO
ALTER TABLE [dbo].[Designs]  WITH CHECK ADD  CONSTRAINT [FK_Designs_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Designs] CHECK CONSTRAINT [FK_Designs_Projects_ProjectId]
GO
ALTER TABLE [dbo].[Designs]  WITH CHECK ADD  CONSTRAINT [FK_Designs_Users_DesignerId] FOREIGN KEY([DesignerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Designs] CHECK CONSTRAINT [FK_Designs_Users_DesignerId]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Users_UserId]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Roles_RoleId]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Users_UserId]
GO
ALTER TABLE [dbo].[PrintJobs]  WITH CHECK ADD  CONSTRAINT [FK_PrintJobs_Designs_DesignId] FOREIGN KEY([DesignId])
REFERENCES [dbo].[Designs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrintJobs] CHECK CONSTRAINT [FK_PrintJobs_Designs_DesignId]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users_EmployeeId]
GO
ALTER TABLE [dbo].[RefreshTokens]  WITH CHECK ADD  CONSTRAINT [FK_RefreshTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshTokens] CHECK CONSTRAINT [FK_RefreshTokens_Users_UserId]
GO
ALTER TABLE [dbo].[ResourceForPrintJobs]  WITH CHECK ADD  CONSTRAINT [FK_ResourceForPrintJobs_PrintJobs_PrintJobId] FOREIGN KEY([PrintJobId])
REFERENCES [dbo].[PrintJobs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceForPrintJobs] CHECK CONSTRAINT [FK_ResourceForPrintJobs_PrintJobs_PrintJobId]
GO
ALTER TABLE [dbo].[ResourceForPrintJobs]  WITH CHECK ADD  CONSTRAINT [FK_ResourceForPrintJobs_ResourcePropertyDetail_ResourcePropertyDetailId] FOREIGN KEY([ResourcePropertyDetailId])
REFERENCES [dbo].[ResourcePropertyDetail] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceForPrintJobs] CHECK CONSTRAINT [FK_ResourceForPrintJobs_ResourcePropertyDetail_ResourcePropertyDetailId]
GO
ALTER TABLE [dbo].[ResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_ResourceProperties_Resources_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceProperties] CHECK CONSTRAINT [FK_ResourceProperties_Resources_ResourceId]
GO
ALTER TABLE [dbo].[ResourcePropertyDetail]  WITH CHECK ADD  CONSTRAINT [FK_ResourcePropertyDetail_ResourceProperties_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[ResourceProperties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourcePropertyDetail] CHECK CONSTRAINT [FK_ResourcePropertyDetail_ResourceProperties_PropertyId]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users_ManagerId] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users_ManagerId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Teams_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Teams_TeamId]
GO
